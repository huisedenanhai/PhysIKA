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
void                connector_use_demo::createScene()
{
    double data[256 * 256] = {};
    for (int i = 0; i < 256; i++)
    {
        for (int j = 0; j < 256; j++)
        {
            data[i * 256 + j] = abs(i - 128) * 0.01f;
        }
    }

    VPE::SandSimulationRegionCreateInfo info;
    info.center.y             = 100;
    info.center.x             = 2;
    info.center.z             = 2;
    info.grid_physical_size   = 10.0 / 256;
    info.sand_layer_thickness = 0.02;
    info.time_delta           = 0.016;
    info.height_data          = &data[0];
    info.height_resolution_x  = 256;
    info.height_resolution_y  = 256;

    VPE::PhysIKACarCreateInfo carobject;
    info.cars.push_back(carobject);
    info.cars[0].car_position.x = 0;
    info.cars[0].car_position.y = 1;
    info.cars[0].car_position.z = 0;

    info.cars[0].chassis.translation.x = 0;
    info.cars[0].chassis.translation.y = 0;
    info.cars[0].chassis.translation.z = 0;
    info.cars[0].chassis.model_path    = "../../Media/car2/chassis_cube.obj";
    info.cars[0].chassis.sdf_path      = "../../Media/car2/chassis_cube.sdf";
    for (int i = 0; i < 4; i++)
    {
        info.cars[0].wheels[i].model_path = "../../Media/car2/wheel.obj";
        info.cars[0].wheels[i].sdf_path   = "../../Media/car2/wheel.sdf";
    }

    info.cars[0].wheels[0].translation.x = -0.3f;
    info.cars[0].wheels[0].translation.y = -0.2;
    info.cars[0].wheels[0].translation.z = -0.4f;

    info.cars[0].wheels[1].translation.x = +0.3f;
    info.cars[0].wheels[1].translation.y = -0.2;
    info.cars[0].wheels[1].translation.z = -0.4f;

    info.cars[0].wheels[2].translation.x = -0.3f;
    info.cars[0].wheels[2].translation.y = -0.2;
    info.cars[0].wheels[2].translation.z = 0.4f;

    info.cars[0].wheels[3].translation.x = +0.3f;
    info.cars[0].wheels[3].translation.y = -0.2;
    info.cars[0].wheels[3].translation.z = 0.4f;

    VPE::PhysIKARigidBodyCreateInfo rb_info{};
    rb_info.mass       = 1.0f;
    rb_info.scale      = 0.15f;
    rb_info.shape_path = "../../Media/standard/standard_cube.obj";
    rb_info.sdf_path   = "../../Media/standard/standard_cube.sdf";
    info.rigidbodies.push_back(rb_info);

    SceneGraph& scene = SceneGraph::getInstance();
    scene.setUpperBound(Vector3f(2, 10, 2));
    scene.setLowerBound(Vector3f(-10, -5, -10));
    m_region = VPE::SandSimulationRegion::Create(info);
    m_car    = m_region->GetCar(0);
    auto rb  = m_region->GetRigidBody(0);
    rb->SetGlobalPositionRotation({ 1, 1, 2 }, { 0, 0, 0, 1 });

    class UpdateNode : public Node
    {
    public:
        std::shared_ptr<VPE::PhysIKACar>       car;
        std::shared_ptr<VPE::PhysIKARigidBody> rigidbody;
        float                                  total_time{};

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
            last_pos.y = 1.0 + std::sin(total_time);
            chassis->SetGlobalPositionRotation(last_pos, last_quat);

            rigidbody->SetGlobalPositionRotation(
                { 1, std::sin(total_time * 10.0f) + 1.0f, 2.0f },
                { 0, 0, 0, 1 });
        }
    };

    auto root          = m_region->GetRoot();
    auto updater       = std::make_shared<UpdateNode>();
    updater->car       = m_car;
    updater->rigidbody = rb;

    root->addChild(updater);

    scene.setRootNode(root);
}
