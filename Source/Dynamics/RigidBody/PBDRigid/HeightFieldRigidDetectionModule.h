#pragma once

#ifndef PHYSIKA_HEIGHTFIELDPBDINTERACTIONMODULE_H
#define PHYSIKA_HEIGHTFIELDPBDINTERACTIONMODULE_H

#include "Framework/Topology/HeightField.h"
#include "Dynamics/HeightField/HeightFieldGrid.h"
#include "Dynamics/RigidBody/ContactInfo.h"
#include "Dynamics/RigidBody/PBDRigid/PBDSolver.h"

#include "Dynamics/RigidBody/PBDRigid/BodyContactDetector.h"
#include "Framework/Framework/ModuleCustom.h"

#include <unordered_map>

//#include <b>
#include <vector>
#include <memory>

namespace PhysIKA {
class HeightFieldRigidDetectionModule : public CustomModule
{
public:
    enum HFDETECTION
    {
        POINTVISE,
        FACEVISE
    };

    HeightFieldRigidDetectionModule()
    {
    }

    ~HeightFieldRigidDetectionModule();

    void bindDetectionMethod(PBDSolver* solver)
    {
        solver->setNarrowDetectionFun(
            std::bind(&HeightFieldRigidDetectionModule::contactDetection,
                      this,
                      std::placeholders::_1,
                      std::placeholders::_2));
    }

    void setSize(int nx, int ny);
    void setSize(int nx, int ny, float dx, float dy);

    const DeviceHeightField1d& getHeightField() const
    {
        return m_heightField;
    }
    DeviceHeightField1d& getHeightField()
    {
        return m_heightField;
    }

    void setDetectionMethod(HFDETECTION method)
    {
        detectionMethod = method;
    }

    //void setRigidDataDirty(bool datadirty = true) { m_rigidDataDirty = datadirty; }

    void contactDetection(PBDSolver* solver, Real dt);

    DeviceDArray<ContactInfo<double>>& getContacts()
    {
        return m_contacts;
    }

public:
    std::vector<RigidBody2_ptr> rigids;

private:
    int m_nx = 0, m_ny = 0;

    DeviceDArray<ContactInfo<double>> m_contacts;
    DeviceHeightField1d               m_heightField;

    DeviceArray<int> nContactsi;
    int              m_nContacts = 0;

    HFDETECTION detectionMethod;
};
}  // namespace PhysIKA

#endif  // PHYSIKA_HEIGHTFIELDPBDINTERACTIONNODE_H