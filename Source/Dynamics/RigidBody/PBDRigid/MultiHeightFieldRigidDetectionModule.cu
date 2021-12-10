#include "Dynamics/RigidBody/PBDRigid/MultiHeightFieldRigidDetectionModule.h"
#include "Framework/Framework/ModuleTopology.h"
#include <device_functions.h>

#include <iostream>

#include "thrust/reduce.h"
#include "thrust/execution_policy.h"
#include "thrust/device_vector.h"

#include "Dynamics/RigidBody/ContactInfo.h"
#include "MultiHeightFieldRigidDetectionModule.h"

namespace PhysIKA {
MultiHeightFieldRigidDetectionModule::~MultiHeightFieldRigidDetectionModule()
{
    m_contacts.release();
}

bool PhysIKA::MultiHeightFieldRigidDetectionModule::initializeImpl()
{
    if (rigidContactDetector)
    {
        rigidContactDetector->varThreshold()->setValue(0.0001);
        rigidContactDetector->varContacts()->setValue(DeviceDArray<ContactInfo<double>>());
    }

    return true;
}

void MultiHeightFieldRigidDetectionModule::contactDetection(PBDSolver* solver, Real dt)
{
    // Do contacts detection.
    int ncontacts = 0;
    for (int i = 0; i < heightfieldRigidDetectors.size(); ++i)
    {
        heightfieldRigidDetectors[i]->contactDetection(solver, dt);
        ncontacts += heightfieldRigidDetectors[i]->getContacts().size();
    }

    // Copy all contacts into one array.
    m_contacts.reserve(ncontacts);
    m_contacts.resize(0);
    int ntotal = 0;
    for (int i = 0; i < heightfieldRigidDetectors.size(); ++i)
    {
        auto& curContacts = heightfieldRigidDetectors[i]->getContacts();
        if (curContacts.size() > 0)
        {
            //cuSynchronize();

            // debug
            ntotal += curContacts.size();

            cuSafeCall(
                cudaMemcpy(m_contacts.begin() + m_contacts.size(), curContacts.begin(), sizeof(ContactInfo<double>) * curContacts.size(), cudaMemcpyDeviceToDevice));
            m_contacts.resize(m_contacts.size() + curContacts.size());
        }
    }

    // debug
    if (m_contacts.size() > 0)
    {
        HostDArray<ContactInfo<double>> hostContacts;
        hostContacts.resize(m_contacts.size());

        cuSafeCall(
            cudaMemcpy(hostContacts.begin(), m_contacts.begin(), sizeof(ContactInfo<double>) * m_contacts.size(), cudaMemcpyDeviceToHost));

        hostContacts.release();
    }

    // Detect contact points between rigid bodies.
    if (rigidContactDetector)
    //if(false)
    {
        rigidContactDetector->doCollision();

        auto& contactArr = rigidContactDetector->varContacts()->getValue();
        if (contactArr.size() > 0)
        {
            int nContacts = m_contacts.size();
            m_contacts.resize(nContacts + contactArr.size());
            cuSafeCall(cudaMemcpy(&(m_contacts[nContacts]), contactArr.begin(), sizeof(ContactInfo<double>) * contactArr.size(), cudaMemcpyDeviceToDevice));

            //m_nContacts += contactArr.size();
        }
    }

    solver->setContactJoints(m_contacts, m_contacts.size());
}

}  // namespace PhysIKA