#pragma once

#ifndef PHYSIKA_MultiHEIGHTFIELDPBDINTERACTIONMODULE_H
#define PHYSIKA_MultiHEIGHTFIELDPBDINTERACTIONMODULE_H

#include "Dynamics/RigidBody/PBDRigid/HeightFieldRigidDetectionModule.h"
#include "Dynamics/RigidBody/PBDRigid/BodyContactDetector.h"

#include <unordered_map>

#include <vector>
#include <memory>

namespace PhysIKA {
class MultiHeightFieldRigidDetectionModule : public CustomModule
{
public:
    MultiHeightFieldRigidDetectionModule()
    {
    }

    ~MultiHeightFieldRigidDetectionModule();

    void bindDetectionMethod(PBDSolver* solver)
    {
        solver->setNarrowDetectionFun(
            std::bind(&MultiHeightFieldRigidDetectionModule::contactDetection,
                      this,
                      std::placeholders::_1,
                      std::placeholders::_2));
    }

    void contactDetection(PBDSolver* solver, Real dt);

    //std::shared_ptr<OrientedBodyDetector> getRigidContactDetector() { return rigidContactDetector; }

protected:
    virtual bool initializeImpl() override;

public:
    std::vector<std::shared_ptr<HeightFieldRigidDetectionModule>> heightfieldRigidDetectors;

    std::shared_ptr<OrientedBodyDetector> rigidContactDetector;

private:
    DeviceDArray<ContactInfo<double>> m_contacts;
};
}  // namespace PhysIKA

#endif  // PHYSIKA_HEIGHTFIELDPBDINTERACTIONNODE_H