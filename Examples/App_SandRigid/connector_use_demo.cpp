#include "demoParticleSand2.h"

#include "sandRigidCommon.h"              //����ͷ�ļ�û�ӽ�����cy:ͷ�ļ�������Ҫ��ͬһ���ļ�����ſ���
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
#include "Dynamics/RigidBody/Vehicle/HeightFieldTerrainRigidInteractionNode.h"  //��ײ�ӵ�
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
            data[i * 256 + j] = 0.1;  //abs(i - 128) * 0.01f;
        }
    }

    VPE::SandSimulationRegionCreateInfo info;
    info.enable_rigid_simulation = false;
    info.center.y                = 100;
    info.center.x                = 2;
    info.center.z                = 2;
    info.grid_physical_size      = 0.32;//10.0/256,2.0/256
    info.sand_layer_thickness    = 0.02;
    info.time_delta              = 0.01;  //0.016���ǲ��Ǵ��ˣ�//0.016�����0.001С��������ճ
    info.height_data             = &data[0];
    info.height_resolution_x     = 128;
    info.height_resolution_y     = 128;

    //info.sand_solver_algorithm = VPE::SandSolverAlgorithm::Particle;

    VPE::PhysIKACarCreateInfo carobject;
    info.cars.push_back(carobject);
    info.cars[0].car_position.x = 0;
    info.cars[0].car_position.y = 0.5;
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
    rb_info.scale      = 1.0f;//0.15
    /*rb_info.shape_path = "../../Media/standard/standard_cube.obj";
    rb_info.sdf_path   = "../../Media/standard/standard_cube.sdf";*/
    rb_info.shape_path = "../../Media/standard/standard_sphere.obj";
    rb_info.sdf_path   = "../../Media/standard/standard_sphere.sdf";
	/*rb_info.shape_path = "../../Media/car2/wheel.obj";
	rb_info.sdf_path = "../../Media/car2/wheel.sdf";*/

    info.rigidbodies.push_back(rb_info);

    /*VPE::PhysIKARigidBodyCreateInfo sp_info{};
    sp_info.mass       = 1.0f;
    sp_info.scale      = 0.15f;
    sp_info.shape_path = "../../Media/standard/standard_sphere.obj";
    sp_info.sdf_path   = "../../Media/standard/standard_sphere.sdf";
    info.rigidbodies.push_back(sp_info);*/

    SceneGraph& scene = SceneGraph::getInstance();
    scene.setUpperBound(Vector3f(2, 10, 2));
    scene.setLowerBound(Vector3f(-10, -5, -10));
    m_region = VPE::SandSimulationRegion::Create(info);
    m_car    = m_region->GetCar(0);
    auto rb  = m_region->GetRigidBody(0);
    rb->SetGlobalPositionRotation({ 10+4, 1.0, 0 }, { 0, 0, 0, 1 });  //1,1,2

    class UpdateNode : public Node
    {
    public:
        std::shared_ptr<VPE::PhysIKACar>       car;
        std::shared_ptr<VPE::PhysIKARigidBody> rigidbody;

        float total_time{};

        void advance(float dt) override
        {  //���Ǳ������������ؾͻᵼ���ٶȹ��󣬾ͻ�ġ�break swe suppose.
            ////С��Ϊɶ���µ�����Ϊ�ǳ��Դ�������suspensionStrength��
            ////���Ǳ������ܲ��ܸ����ȥ��������һ�ס��͸�ԭʼ����һ��
            //���ױ���Ӧ�����㷨��������⡣�����ĵ��Է���1.�ٶȲ���̫��2.�������ɳ�Ӳ���̫����ֱ������ȥ����cube������ʱ���Ҫ�����Բ����
            //VPE::Vec3 last_pos{};
            //VPE::Quat last_quat{};
            ////VPE::Vec3 last_pos2{};
            //VPE::Quat last_quat2{};
            //         auto      chassis = car->GetChassisRigidBody();
            //         chassis->GetGlobalPositionRotation(last_pos, last_quat);
            ////rigidbody->GetGlobalPositionRotation(last_pos2, last_quat2);
            //         auto print_rb_xform = [](const char* name, auto rb) {
            //             VPE::Vec3 pos{};
            //             VPE::Quat quat{};
            //             rb->GetGlobalPositionRotation(pos, quat);
            //             printf("%s Pos { %f, %f, %f }, %s Quat { %f, %f, %f, %f }",
            //                    name,
            //                    pos.x,
            //                    pos.y,
            //                    pos.z,
            //                    name,
            //                    quat.x,
            //                    quat.y,
            //                    quat.z,
            //                    quat.w);
            //         };
            //printf("chassis P&Q: Pos { %f, %f, %f },  Quat { %f, %f, %f, %f }",
            //
            //	last_pos.x,
            //	last_pos.y,
            //	last_pos.z,
            //
            //	last_quat.x,
            //	last_quat.y,
            //	last_quat.z,
            //	last_quat.w);
            //         print_rb_xform("Chassis", chassis);
            //         print_rb_xform("Cube", rigidbody);
			//         total_time += dt;
            //cout<<total_time<<"\n";
            //if (last_pos.y < 0.75) {
            //	last_pos.y += 10*dt;
            //
            //}
            ////last_pos2.z= last_pos2.z + std::sin(total_time)/500;
            //         chassis->SetGlobalPositionRotation(last_pos, last_quat);
            ////rigidbody->SetGlobalPositionRotation(last_pos2, last_quat2);
            //         //rigidbody->SetGlobalPositionRotation(
            //             ////{ 0.5/*std::cos(total_time * 0.0000000001f* 0.0000000001f)*/, 0.5, 0.5/*std::sin(total_time * 0.001f)*/ },//old is *10
            //             ////{ 0, 0, 0, 0 }
            ////	last_pos, last_quat
            ////);//�ĳ��������黹�ڶ���

            VPE::Vec3 last_pos{};
            VPE::Quat last_quat{};
            auto      chassis = car->GetChassisRigidBody();
            chassis->GetGlobalPositionRotation(last_pos, last_quat);
            auto print_rb_xform = [](const char* name, auto rb) {
                VPE::Vec3 pos{};
                VPE::Quat quat{};
                rb->GetGlobalPositionRotation(pos, quat);
                printf("%s Pos { %f, %f, %f }, %s Quat { %f, %f, %f, %f }",
                       name,
                       pos.x,
                       pos.y,
                       pos.z,
                       name,
                       quat.x,
                       quat.y,
                       quat.z,
                       quat.w);
            };

            print_rb_xform("Chassis", chassis);
            print_rb_xform("Cube", rigidbody);

            total_time += dt;
            last_pos.y -= 10 * dt;
            chassis->SetGlobalPositionRotation(last_pos, last_quat);

            rigidbody->SetGlobalPositionRotation(

                //{ std::cos(total_time * 10.0f*10.0f)*10, /*0.25+*/ /*std::cos(total_time * 10.0f)+*/ 0.2f, std::sin(total_time * 10.0f*10.0f)*10 /*0*/ },
                //{ 0, 0, 0, 1 });

				{ std::cos(total_time * 10.0f*10.0f)*10+4, 1.0, 0 },	   { std::cos(total_time * 10.0f) , std::cos(total_time * 10.0f*10.0f) *10.0f, 0,1 });//���ٶȴ��˾ͻ��Զ����
        }
    };

    auto root          = m_region->GetRoot();
    auto updater       = std::make_shared<UpdateNode>();
    updater->car       = m_car;
    updater->rigidbody = rb;

    root->addChild(updater);

    scene.setRootNode(root);

	// Translate camera position
	auto& camera_ = this->activeCamera();
	//camera_.translate(Vector3f(0, 1.5, 3));
	//camera_.setEyePostion(Vector3f(1.5, 1.5, 6));
	Vector3f camPos(0, 1.5, 5);
	camera_.lookAt(camPos, Vector3f(0, 0, 0), Vector3f(0, 1, 0));

}
