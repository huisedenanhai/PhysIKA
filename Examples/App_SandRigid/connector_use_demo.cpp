#include "demoParticleSand2.h"

#include "sandRigidCommon.h"              //这俩头文件没加进来？cy:头文件物理上要在同一个文件夹里，才可以
#include "Dynamics/Sand/SandSimulator.h"  //
#include "Framework/Framework/SceneGraph.h"
#include "Rendering/PointRenderModule.h"
#include "Dynamics/Sand/PBDSandSolver.h"            //
#include "Dynamics/Sand/PBDSandRigidInteraction.h"  //
#include "Dynamics/RigidBody/PBDRigid/PBDSolverNode.h"
#include "Rendering/RigidMeshRender.h"
#include "Dynamics/RigidBody/RigidUtil.h"
#include "Dynamics/Sand/ParticleSandRigidInteraction.h"  //
#include "Dynamics/Sand/HeightFieldSandRigidInteraction.h"
#include "Dynamics/RigidBody/Vehicle/HeightFieldTerrainRigidInteractionNode.h"  //碰撞加的
#include "Dynamics/HeightField/HeightFieldMesh.h"
#include "IO/Surface_Mesh_IO/ObjFileLoader.h"
#include "Dynamics/RigidBody/PBDRigid/HeightFieldPBDInteractionNode.h"

#include "Dynamics/Sand/SandVisualPointSampleModule.h"
#include "IO/Image_IO/HeightFieldLoader.h"

#include "Core/Utility/Function1Pt.h"

#include <random>
#include <iostream>

#include "Dynamics/ParticleSystem/StaticBoundary.h"
#include "Dynamics/RigidBody/FreeJoint.h"
#include "Dynamics/RigidBody/RigidUtil.h"
#include "Dynamics/RigidBody/FixedJoint.h"
#include "Framework/Action/Action.h"
#include <string>
#include <functional>
#include <cmath>

#include "connector_use_demo.h"

using namespace std;

connector_use_demo* connector_use_demo::m_instance = 0;
void                connector_use_demo::createScene(const VPE::SandSimulationRegionCreateInfo& info)  //可能是这个问题：set和add把参数导进去了，但是create没有用之前的region对象。
{
    SceneGraph& scene = SceneGraph::getInstance();
    scene.setUpperBound(Vector3f(2, 10, 2));
    scene.setLowerBound(Vector3f(-10, -5, -10));
    m_region = VPE::SandSimulationRegion::Create(info);
    if (info.cars.size() > 0)
    {
        m_car = m_region->GetCar(0);  //这里获取到车的智能指针
    }

    class UpdateNode : public Node
    {
    public:
        std::shared_ptr<VPE::PhysIKACar> car;
        VPE::Vec3                        position{ 0, 0, 0 };
        VPE::Quat                        rotation{ 0, 0, 0, 1 };
        float                            total_time{};

        void advance(float dt) override
        {
            VPE::Vec3 last_pos{};
            VPE::Quat last_quat{};
            auto      chassis = car->GetChassisRigidBody();
            chassis->GetGlobalPositionRotation(last_pos, last_quat);

            printf("Last Pos { %f, %f, %f }, Last Quat { %f, %f, %f, %f }",
                   last_pos.x,
                   last_pos.y,
                   last_pos.z,
                   last_quat.x,
                   last_quat.y,
                   last_quat.z,
                   last_quat.w);

            total_time += dt;
            position.y = 1.0 + std::sin(total_time);
            chassis->SetGlobalPositionRotation(position, last_quat);
        }
    };

    auto root    = m_region->GetRoot();
    auto updater = std::make_shared<UpdateNode>();
    updater->car = m_car;

    root->addChild(updater);

    scene.setRootNode(root);
}
