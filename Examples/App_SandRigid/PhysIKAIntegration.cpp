#include "PhysIKAIntegration.h"
#include <vector>
#include <Dynamics/RigidBody/RigidUtil.h>
#include <Dynamics/RigidBody/PBDRigid/PBDSolverNode.h>
#include <Dynamics/RigidBody/Vehicle/MultiWheelCar.h>
#include <Dynamics/RigidBody/Vehicle/PBDCar.h>
#include <Dynamics/Sand/ParticleSandRigidInteraction.h>
#include <Dynamics/Sand/SandGrid.h>
#include <Dynamics/Sand/SandSimulator.h>
#include <Framework/Framework/SceneGraph.h>
#include "GUI/GlutGUI/GLApp.h"
#include "Dynamics/Sand/PBDSandSolver.h"
#include "Dynamics/Sand/PBDSandRigidInteraction.h"
#include "Dynamics/RigidBody/RigidUtil.h"
#include "Dynamics/HeightField/HeightFieldMesh.h"
#include "IO/Surface_Mesh_IO/ObjFileLoader.h"
#include "Dynamics\Sand\ParticleSandRigidInteraction.h"
#include "Dynamics/Sand/SandVisualPointSampleModule.h"
#include "IO/Image_IO/HeightFieldLoader.h"
#include "GUI/GlutGUI/GLApp.h"

#include "math.h"

#if PHYSIKA_INTEGRATION_INIT_RENDER > 0
#include <Rendering/RigidMeshRender.h>
#include <Rendering/PointRenderModule.h>
#endif

namespace VPE {
using namespace PhysIKA;

namespace {
Vector3f ToPhysIKA(const Vec3& v)
{
    return { v.x, v.y, v.z };
}

Quaternion<float> ToPhysIKA(const Quat& v)
{
    return { v.x, v.y, v.z, v.w };
}

Vec3 FromPhysIKA(const Vector3f& v)
{
    return { v[0], v[1], v[2] };
}

Quat FromPhysIKA(const Quaternion<float>& v)
{
    return { v.x(), v.y(), v.z(), v.w() };
}

template <typename T>
void GetRigidBodyGlobalPositionRotation(const T& rb, Vec3& pos, Quat& rot)
{
    auto position = rb->getGlobalR();
    auto rotation = rb->getGlobalQ();
    pos           = FromPhysIKA(position);
    rot           = FromPhysIKA(rotation);
}

bool ComputeBoundingBox(PhysIKA::Vector3f& center, PhysIKA::Vector3f& boxsize, const std::vector<PhysIKA::Vector3f>& vertices)
{
    if (vertices.size() <= 0)
        return false;

    boxsize                = PhysIKA::Vector3f();
    PhysIKA::Vector3f bmin = vertices[0];
    PhysIKA::Vector3f bmax = vertices[0];
    for (int i = 0; i < vertices.size(); ++i)
    {
        const PhysIKA::Vector3f& ver = vertices[i];
        bmin[0]                      = min(bmin[0], ver[0]);
        bmin[1]                      = min(bmin[1], ver[1]);
        bmin[2]                      = min(bmin[2], ver[2]);

        bmax[0] = max(bmax[0], ver[0]);
        bmax[1] = max(bmax[1], ver[1]);
        bmax[2] = max(bmax[2], ver[2]);
    }

    center  = (bmin + bmax) * 0.5;
    boxsize = bmax - bmin;
    return true;
}
}  // namespace

struct SandSimulationRegion::Impl
{  //impl
public:
    std::shared_ptr<PhysIKA::Node>         node;
    float                                  _sand_layer_thickness;
    float                                  _delta;
    double                                 _total_width_in_meter;  //setHeight
    double                                 _total_height_in_meter;
    float                                  chassisMass  = 1.0;  //need corrected
    int                                    newcarnumber = 0;
    std::vector<VPE::PhysIKACarCreateInfo> car_cache;

    //bianliang of create function
    std::shared_ptr<ParticleSandRigidInteraction>             root;
    std::shared_ptr<PhysIKA::PBDSolverNode>                   rigidSim;
    std::vector<shared_ptr<PhysIKA::PBDCar>>                  m_car;
    std::vector<shared_ptr<VPE::PhysIKACar>>                  m_PhysIKACar;  //
    std::shared_ptr<PhysIKA::SandInteractionForceSolver>      interactionSolver;
    std::shared_ptr<PhysIKA::RigidBody2<PhysIKA::DataType3f>> m_chassis;
    std::string                                               chassisFile = "";
    PhysIKA::Vector3f                                         chassisInertia;
    PhysIKA::Vector3f                                         carPosition;
    PhysIKA::Quaternion<float>                                carRotation;
    std::vector<PhysIKA::RigidBody2_ptr>                      m_rigids;
    std::shared_ptr<PhysIKA::PBDSandSolver>                   psandSolver;

#if PHYSIKA_INTEGRATION_INIT_RENDER > 0
    std::vector<std::shared_ptr<PhysIKA::RigidMeshRender>> m_rigidRenders;
#endif

    PhysIKA::SandGridInfo               sandinfo;
    PhysIKA::HostHeightField1d          landHeight;
    std::shared_ptr<PhysIKA::PBDSolver> rigidSolver;

    std::shared_ptr<PhysIKA::Node> GetRoot()  //rootParticleSandRigidInteraction
    {
        return root;
    }

    std::shared_ptr<VPE::PhysIKACar> GetCar(uint64_t car_handle)  //car_handle
    {
        if (car_handle < newcarnumber)
        {
            return m_PhysIKACar[car_handle];
        }
        return nullptr;
    }

    std::vector<VPE::Vec3> GetSandParticles()  ////VPE::Vec3*
    {
        auto&                          pos_d        = psandSolver->getParticlePosition3D();
        auto                           particle_num = pos_d.size();
        std::vector<PhysIKA::Vector3d> positions{};
        positions.resize(particle_num);
        cudaMemcpy(positions.data(), &pos_d[0], sizeof(PhysIKA::Vector3d) * particle_num, cudaMemcpyDeviceToHost);
        std::vector<VPE::Vec3> result{};
        result.reserve(particle_num);
        for (const auto& p : positions)
        {
            result.push_back(
                VPE::Vec3{ static_cast<float>(p[0]), static_cast<float>(p[1]), static_cast<float>(p[2]) });
        }

        return result;
    }

    void Init(const SandSimulationRegionCreateInfo& info);

    void AddSDF(const std::string& sdf_file, const Vec3& translate, int rigid_id)
    {
        PhysIKA::DistanceField3D<PhysIKA::DataType3f> sdf;
        sdf.loadSDF(sdf_file);
        sdf.scale(1.0f);
        sdf.translate(ToPhysIKA(translate));
        interactionSolver->addSDF(sdf, rigid_id);
    }
};

std::shared_ptr<PhysIKA::Node> SandSimulationRegion::GetRoot()
{
    return _impl->GetRoot();
}

std::shared_ptr<VPE::PhysIKACar> SandSimulationRegion::GetCar(uint64_t car_handle)
{
    return _impl->GetCar(car_handle);
}

std::vector<VPE::Vec3> SandSimulationRegion::GetSandParticles()
{
    return _impl->GetSandParticles();
}

std::shared_ptr<SandSimulationRegion> SandSimulationRegion::Create(const SandSimulationRegionCreateInfo& info)
{
    auto region = std::make_shared<SandSimulationRegion>();

    auto impl = region->_impl.get();
    impl->Init(info);
    return region;
}

SandSimulationRegion::~SandSimulationRegion() = default;
SandSimulationRegion::SandSimulationRegion()
{
    _impl = std::make_unique<Impl>();
}

struct VPE::PhysIKACar::Impl2
{
public:
    shared_ptr<PhysIKA::PBDCar> m_car;

    Vector3f wheelupDirection;     //z
    Vector3f wheelRightDirection;  // wheel right direction in car frame.

    void GetChassisPositionRotation(VPE::Vec3& pos, VPE::Quat& rot)
    {
        auto chassis = m_car->getChassis();
        GetRigidBodyGlobalPositionRotation(chassis, pos, rot);
    }

    void GetWheelPositionRotation(uint32_t wheel_index, Vec3& pos, Quat& rot)
    {
        auto wheel = m_car->getWheels(wheel_index);
        GetRigidBodyGlobalPositionRotation(wheel, pos, rot);
    }

    void SetChassisPositionRotation(const Vec3& pos, const Quat& rot)
    {
        m_car->carPosition[0] = pos.x;  //
        m_car->carPosition[1] = pos.y;
        m_car->carPosition[2] = pos.z;

        //
        ////carPosition

        double cos0_5 = rot.x;
        double sin0_5 = 1 - pow(cos0_5, 2);
        //
        double sin = 2 * cos0_5 * sin0_5;
        double cos = pow(cos0_5, 2) - pow(sin0_5, 2);
        //0
        Vec3 a;
        a.x = m_car->wheelRelPosition[0][0] - m_car->carPosition[0];
        a.y = 0;
        a.z = m_car->wheelRelPosition[0][2] - m_car->carPosition[2];
        //0
        double length = pow(pow(a.x, 2) + pow(a.z, 2), 0.5);
        double cos_   = a.x / length;
        double sin_   = pow(1 - pow(cos_, 2), 0.5);
        //
        double final_cos = cos_ * cos - sin_ * sin;
        double final_sin = cos_ * sin + sin_ * cos;

        m_car->wheelRelPosition[0][0] = length * final_cos;
        m_car->wheelRelPosition[0][2] = length * final_sin;

        //1
        //Vec3 a;
        a.x = m_car->wheelRelPosition[1][0] - m_car->carPosition[0];
        a.y = 0;
        a.z = m_car->wheelRelPosition[1][2] - m_car->carPosition[2];
        //0
        double length1 = pow(pow(a.x, 2) + pow(a.z, 2), 0.5);
        double cos_1   = a.x / length1;
        double sin_1   = pow(1 - pow(cos_, 2), 0.5);
        //
        double final_cos1 = cos_1 * cos - sin_1 * sin;
        double final_sin1 = cos_1 * sin + sin_1 * cos;

        m_car->wheelRelPosition[1][0] = length1 * final_cos1;
        m_car->wheelRelPosition[1][2] = length1 * final_sin1;

        //2
        //Vec3 a;
        a.x = m_car->wheelRelPosition[2][0] - m_car->carPosition[0];
        a.y = 0;
        a.z = m_car->wheelRelPosition[2][2] - m_car->carPosition[2];
        //0
        double length2 = pow(pow(a.x, 2) + pow(a.z, 2), 0.5);
        double cos_2   = a.x / length2;
        double sin_2   = pow(1 - pow(cos_2, 2), 0.5);
        //
        double final_cos2 = cos_2 * cos - sin_2 * sin;
        double final_sin2 = cos_2 * sin + sin_2 * cos;

        m_car->wheelRelPosition[2][0] = length2 * final_cos;
        m_car->wheelRelPosition[2][2] = length2 * final_sin;

        //3
        //Vec3 a;
        a.x = m_car->wheelRelPosition[3][0] - m_car->carPosition[0];
        a.y = 0;
        a.z = m_car->wheelRelPosition[3][2] - m_car->carPosition[2];
        //0
        double length3 = pow(pow(a.x, 2) + pow(a.z, 2), 0.5);
        double cos_3   = a.x / length3;
        double sin_3   = pow(1 - pow(cos_3, 2), 0.5);
        //
        double final_cos3 = cos_3 * cos - sin_3 * sin;
        double final_sin3 = cos_3 * sin + sin_3 * cos;

        m_car->wheelRelPosition[3][0] = length3 * final_cos3;
        m_car->wheelRelPosition[3][2] = length3 * final_sin3;
    }

    void SetWheelPositionRotation(uint32_t wheel_index, const Vec3& pos, const Quat& rot)
    {  //
        //set chassis height
        //TODO

        //
        m_car->wheelRelPosition[wheel_index][0] = pos.x - m_car->carPosition[0];
        m_car->wheelRelPosition[wheel_index][1] = pos.y - m_car->carPosition[1];
        m_car->wheelRelPosition[wheel_index][2] = pos.z - m_car->carPosition[2];

        //
    }

    void Go(PhysIKACarDirection dir)
    {
        switch (dir)
        {
            case VPE::PhysIKACarDirection::Forward:
                m_car->forward(0.016);
                break;
            case VPE::PhysIKACarDirection::Backward:
                m_car->backward(0.016);
                break;
            case VPE::PhysIKACarDirection::Left:
                m_car->goLeft(0.016);
                break;
            case VPE::PhysIKACarDirection::Right:
                m_car->goRight(0.016);
                break;
            default:
                break;
        }
    }
};

void VPE::PhysIKACar::GetChassisPositionRotation(VPE::Vec3& pos, VPE::Quat& rot)
{
    return _impl2->GetChassisPositionRotation(pos, rot);  //?with static will call error.
}

void VPE::PhysIKACar::GetWheelPositionRotation(uint32_t wheel_index, Vec3& pos, Quat& rot)
{
    return _impl2->GetWheelPositionRotation(wheel_index, pos, rot);  //?with static will call error.
}

void VPE::PhysIKACar::SetChassisPositionRotation(const Vec3& pos, const Quat& rot)
{
    return _impl2->SetChassisPositionRotation(pos, rot);  //?with static will call error.
}

void VPE::PhysIKACar::SetWheelPositionRotation(uint32_t wheel_index, const Vec3& pos, const Quat& rot)
{
    return _impl2->SetWheelPositionRotation(wheel_index, pos, rot);  //?with static will call error.
}

void VPE::PhysIKACar::Go(PhysIKACarDirection dir)
{
    return _impl2->Go(dir);
}

VPE::PhysIKACar::~PhysIKACar() = default;
VPE::PhysIKACar::PhysIKACar()
{
    _impl2 = std::make_unique<Impl2>();
}

inline void SandSimulationRegion::Impl::Init(const SandSimulationRegionCreateInfo& info)  //info
{
    //build
    sandinfo.nx               = info.height_resolution_x;
    sandinfo.ny               = info.height_resolution_y;
    sandinfo.griddl           = info.grid_physical_size;
    sandinfo.mu               = 0.7;
    sandinfo.drag             = 0.95;
    sandinfo.slide            = 10 * sandinfo.griddl;
    sandinfo.sandRho          = 1000.0;
    double sandParticleHeight = 0.05;

    landHeight.resize(sandinfo.nx, sandinfo.ny);
    landHeight.setSpace(sandinfo.griddl, sandinfo.griddl);
    landHeight.setOrigin(info.center.x, info.center.y, info.center.z);

    for (int j = 0; j < sandinfo.ny; ++j)
    {
        for (int i = 0; i < sandinfo.nx; ++i)
        {
            double aa        = info.height_data[j * sandinfo.nx + i];
            landHeight(i, j) = aa;
        }
    }

    car_cache = info.cars;

    // 1 Root node. Also the simulator.
    root = std::make_shared<ParticleSandRigidInteraction>();
    root->setActive(true);
    root->setDt(info.time_delta);

    root->varBouyancyFactor()->setValue(50);
    root->varDragFactor()->setValue(1.0);
    root->varCHorizontal()->setValue(1.);
    root->varCVertical()->setValue(2.);
    root->varCprobability()->setValue(100);

    // 2 Sand simulator.
    std::shared_ptr<PhysIKA::SandSimulator> sandSim = std::make_shared<PhysIKA::SandSimulator>();

    psandSolver = std::make_shared<PhysIKA::PBDSandSolver>();
    psandSolver->setSandGridInfo(sandinfo);
    // Always update position 3d, required by GetSandParticles()
    psandSolver->needPosition3D(true);
    sandSim->needForward(false);
    sandSim->setSandSolver(psandSolver);
    root->setSandSolver(psandSolver);
    root->addChild(sandSim);

    auto sandinitfun = [](PhysIKA::PBDSandSolver* solver) { solver->freeFlow(1); };
    psandSolver->setPostInitializeFun(std::bind(sandinitfun, std::placeholders::_1));
    psandSolver->setLand(landHeight);  //cy:bug  wkm:landHeight

    // TODO
    // 4 Land mesh.
    {
        auto landrigid = std::make_shared<PhysIKA::RigidBody2<PhysIKA::DataType3f>>("Land");
        root->addChild(landrigid);

        // Mesh triangles.
        auto triset = std::make_shared<PhysIKA::TriangleSet<PhysIKA::DataType3f>>();
        landrigid->setTopologyModule(triset);

        // Generate mesh.
        auto&                    hfland = psandSolver->getLand();
        PhysIKA::HeightFieldMesh hfmesh;
        hfmesh.generate(triset, hfland);

#if PHYSIKA_INTEGRATION_INIT_RENDER > 0
        // Mesh renderer.
        auto renderModule = std::make_shared<PhysIKA::RigidMeshRender>(landrigid->getTransformationFrame());
        renderModule->setColor(PhysIKA::Vector3f(210.0 / 255.0, 180.0 / 255.0, 140.0 / 255.0));
        landrigid->addVisualModule(renderModule);
#endif
    }

    // Sand height 5
    //std::vector<int>  humpBlock = { 31 - 10, 31 + 9, 31 - 8, 31 + 8 };
    //
    HostHeightField1d sandHeight;  //CPU//md
    sandHeight.resize(sandinfo.nx, sandinfo.ny);
    psandSolver->setHeight(sandHeight);

    // 6 Sand particles.

    std::vector<PhysIKA::ParticleType>    particleType;
    std::vector<double>                   particleMass;  //
    std::default_random_engine            e(31);         //,31
    std::uniform_real_distribution<float> u(-0.3, 0.3);  //u

    // 7 Sand plane.
    double spacing  = sandinfo.griddl / 2.0;                                      //
    double m0       = sandParticleHeight * sandinfo.sandRho * spacing * spacing;  //50*0.015^2
    double mb       = m0 * 5;
    double spacing2 = spacing;

    std::vector<PhysIKA::Vector3d> particlePos;
    //8
    for (int i = 0; i < sandinfo.nx; ++i)
    {
        for (int j = 0; j < sandinfo.ny; ++j)
        {
            PhysIKA::Vector3d centerij = landHeight.gridCenterPosition(i, j);  //
            for (int ii = 0; ii < 2; ++ii)
            {
                for (int jj = 0; jj < 2; ++jj)
                {
                    PhysIKA::Vector3d curp = centerij;  //
                    curp[0] -= sandinfo.griddl / 2.0;   //
                    curp[2] -= sandinfo.griddl / 2.0;
                    curp[0] += ii * spacing2 + spacing2 / 2.0 * (1.0 + u(e));  //
                    curp[2] += jj * spacing2 + spacing2 / 2.0 * (1.0 + u(e));
                    particlePos.push_back(curp);  //push_backvectorvector
                    particleType.push_back(PhysIKA::ParticleType::SAND);
                    particleMass.push_back(m0);  //vector
                }
            }
        }
    }

    std::vector<PhysIKA::Vector3d> particleVel(particlePos.size());
    psandSolver->setParticles(&particlePos[0], &particleVel[0], &particleMass[0], &particleType[0], particlePos.size(), sandinfo.sandRho, m0, sandinfo.griddl * 1.0, 0.85, sandParticleHeight * 0.5);
    //vectorsandinfo.nx0
    std::cout << "Particle number:   " << particlePos.size() << std::endl;

#if PHYSIKA_INTEGRATION_INIT_RENDER > 0
    // 10 Rendering module of simulator.
    auto pRenderModule = std::make_shared<PhysIKA::PointRenderModule>();
    pRenderModule->setSphereInstaceSize(sandinfo.griddl * 0.5);
    pRenderModule->setColor(PhysIKA::Vector3f(1.0f, 1.0f, 122.0f / 255.0f));
    sandSim->addVisualModule(pRenderModule);
#endif

    // 11 topology
    auto topology = std::make_shared<PhysIKA::PointSet<PhysIKA::DataType3f>>();
    sandSim->setTopologyModule(topology);
    topology->getPoints().resize(1);

#if PHYSIKA_INTEGRATION_INIT_RENDER > 0
    // 12 Render point sampler (module).
    auto psampler = std::make_shared<PhysIKA::ParticleSandRenderSampler>();
    psampler->Initialize(psandSolver);
    sandSim->addCustomModule(psampler);
#endif

    /// ------  Rigid ------------
    //13 PBD simulation
    rigidSim = std::make_shared<PhysIKA::PBDSolverNode>();
    rigidSim->getSolver()->setUseGPU(true);
    rigidSim->needForward(false);
    rigidSolver = rigidSim->getSolver();

    root->setRigidSolver(rigidSolver);
    root->addChild(rigidSim);

    //--------------------------------------------------------------------
    // Car.14

    interactionSolver = root->getInteractionSolver();  //ParticleSandRigidInteraction

    //16 m_car
    newcarnumber = car_cache.size();
    for (int u = 0; u < newcarnumber; u++)
    {
        double            scale1d = 1.;
        PhysIKA::Vector3d scale3d(scale1d, scale1d, scale1d);  //
        PhysIKA::Vector3f scale3f(scale1d, scale1d, scale1d);  //(1,1,1)//

        PhysIKA::Vector3f chassisCenter;  //000
        PhysIKA::Vector3f wheelCenter[4];
        PhysIKA::Vector3f chassisSize;
        PhysIKA::Vector3f wheelSize[4];

        std::shared_ptr<PhysIKA::TriangleSet<PhysIKA::DataType3f>> chassisTri;  //
        std::shared_ptr<PhysIKA::TriangleSet<PhysIKA::DataType3f>> wheelTri[4];

        // Load car mesh.15SDF
        {
            // Chassis mesh.
            PhysIKA::ObjFileLoader chassisLoader(car_cache[u].chassis.model_path);
            chassisTri = std::make_shared<PhysIKA::TriangleSet<PhysIKA::DataType3f>>();
            chassisTri->setPoints(chassisLoader.getVertexList());
            chassisTri->setTriangles(chassisLoader.getFaceList());
            ComputeBoundingBox(chassisCenter, chassisSize, chassisLoader.getVertexList());

            chassisTri->scale(scale3f);
            chassisTri->translate(-chassisCenter);

            for (int i = 0; i < 4; ++i)  //
            {
                string objfile(car_cache[u].wheels[i].model_path);
                string sdffile(car_cache[u].wheels[i].sdf_path);

                // Wheel mesh.
                PhysIKA::ObjFileLoader wheelLoader(objfile);
                wheelTri[i] = std::make_shared<PhysIKA::TriangleSet<PhysIKA::DataType3f>>();
                wheelTri[i]->setPoints(wheelLoader.getVertexList());
                wheelTri[i]->setTriangles(wheelLoader.getFaceList());
                ComputeBoundingBox(wheelCenter[i], wheelSize[i], wheelLoader.getVertexList());
                wheelTri[i]->scale(scale3f);
                wheelTri[i]->translate(-wheelCenter[i]);
            }
        }
        m_car.push_back(std::make_shared<PhysIKA::PBDCar>());
        m_PhysIKACar.push_back(std::make_shared<VPE::PhysIKACar>());
        m_PhysIKACar.back()->_impl2->m_car = m_car.back();

        // TODO over
        //newcarnumber
        rigidSim->addChild(m_car[u]);
        m_car[u]->m_rigidSolver = rigidSolver;

        m_car[u]->carPosition = ToPhysIKA(car_cache[u].car_position) + chassisCenter;  //
        for (int w = 0; w < 4; w++)
        {
            m_car[u]->wheelRelPosition[w] = ToPhysIKA(car_cache[u].wheels[w].translation) * scale1d + wheelCenter[w] - chassisCenter;
            m_car[u]->wheelRelRotation[w] = ToPhysIKA(car_cache[u].wheels[w].rotation);
        }

        m_car[u]->wheelupDirection    = PhysIKA::Vector3f(0, 0.25, 0);
        m_car[u]->wheelRightDirection = PhysIKA::Vector3f(1, 0, 0);

        m_car[u]->chassisMass    = car_cache[u].car_mass;                                                              //
        m_car[u]->chassisInertia = PhysIKA::RigidUtil::calculateCubeLocalInertia(m_car[u]->chassisMass, chassisSize);  //

        float wheelm = car_cache[u].wheel_mass;  //50

        PhysIKA::Vector3f wheelI  = PhysIKA::RigidUtil::calculateCylinderLocalInertia(wheelm,  //
                                                                                     (wheelSize[0][1] + wheelSize[0][2]) / 2.0,
                                                                                     wheelSize[0][0],
                                                                                     0);
        m_car[u]->wheelMass[0]    = wheelm;
        m_car[u]->wheelInertia[0] = wheelI;
        m_car[u]->wheelMass[1]    = wheelm;
        m_car[u]->wheelInertia[1] = wheelI;
        m_car[u]->wheelMass[2]    = wheelm;
        m_car[u]->wheelInertia[2] = wheelI;
        m_car[u]->wheelMass[3]    = wheelm;
        m_car[u]->wheelInertia[3] = wheelI;

        m_car[u]->steeringLowerBound = -0.5;
        m_car[u]->steeringUpperBound = 0.5;

        m_car[u]->forwardForceAcc = car_cache[u].forward_force;
        m_car[u]->maxVel          = car_cache[u].max_speed;

        // Build
        m_car[u]->build();

        // Add visualization module and topology module.
        m_car[u]->m_chassis->setTopologyModule(chassisTri);
#if PHYSIKA_INTEGRATION_INIT_RENDER > 0
        auto chassisRender = std::make_shared<PhysIKA::RigidMeshRender>(m_car[0]->m_chassis->getTransformationFrame());
        chassisRender->setColor(PhysIKA::Vector3f(0.8, std::rand() % 1000 / ( double )1000, 0.8));
        m_rigidRenders.push_back(chassisRender);
        m_car[u]->m_chassis->addVisualModule(chassisRender);
#endif
        AddSDF(car_cache[u].chassis.sdf_path, {}, m_car[u]->m_chassis->getId());

        // Bounding radius of chassis.
        float chassisRadius = chassisTri->computeBoundingRadius();
        m_car[u]->m_chassis->setRadius(chassisRadius);

        m_rigids.push_back(m_car[u]->m_chassis);

        for (int i = 0; i < 4; ++i)  //
        {
            m_car[u]->m_wheels[i]->setTopologyModule(wheelTri[i]);
#if PHYSIKA_INTEGRATION_INIT_RENDER > 0
            auto renderModule = std::make_shared<PhysIKA::RigidMeshRender>(m_car[u]->m_wheels[i]->getTransformationFrame());
            renderModule->setColor(PhysIKA::Vector3f(0.8, std::rand() % 1000 / ( double )1000, 0.8));
            m_car[u]->m_wheels[i]->addVisualModule(renderModule);
            m_rigidRenders.push_back(renderModule);
#endif
            AddSDF(car_cache[u].wheels[i].sdf_path, {}, m_car[u]->m_wheels[i]->getId());

            // Bounding radius of chassis.
            float wheelRadius = wheelTri[i]->computeBoundingRadius();
            m_car[u]->m_wheels[i]->setRadius(wheelRadius);

            m_rigids.push_back(m_car[u]->m_wheels[i]);
        }
    }
    interactionSolver->m_prigids = &(rigidSolver->getRigidBodys());  //TODO m_prigids
}

void SandSimulationRegion::AddSDF(const std::string& sdf_file, const Vec3& translate, int rigid_id)
{
    _impl->AddSDF(sdf_file, translate, rigid_id);
}
}  // namespace VPE