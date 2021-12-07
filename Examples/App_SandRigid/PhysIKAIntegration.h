#pragma once

#include <memory>
#include <string>
#include <vector>
#include <random>
#include <iostream>

// Init PhysIKA render modules in viwo results in crash.
// Set PHYSIKA_INTEGRATION_INIT_RENDER to 0 disables render initialization
// Set PHYSIKA_INTEGRATION_INIT_RENDER to 1 to enable render initialization
#define PHYSIKA_INTEGRATION_INIT_RENDER 1

namespace PhysIKA {
class Node;
}

// DO NOT include ANY physIKA or ViWo headers in this file.
// The encoding of CUDA headers and ViWo files is different, which messes up everything.
namespace VPE {
// Bridge for primitive values
struct Vec3
{
    float x, y, z;
};

struct Quat
{
    float x, y, z, w;
};

enum class PhysIKACarType
{
    FourWheel,
    EightWheel
};

struct PhysIKACarComponent
{
    Vec3        translation{};
    Vec3        scale{ 1.0f, 1.0f, 1.0f };
    Quat        rotation{ 0.0f, 0.0f, 0.0f, 1.0f };
    std::string model_path{};
    std::string sdf_path{};
};

struct PhysIKACarCreateInfo
{
    PhysIKACarType type;

    Vec3                car_position;
    PhysIKACarComponent chassis;
    //Vec3 chassis_box_min{};
    //Vec3 chassis_box_max{};
    // Wheel translation and rotation is relative to chassis, scale absolute.
    PhysIKACarComponent wheels[4]{};
    float               wheel_cylinder_radius = 1;
    //float wheel_cylinder_height{};

    float    car_mass                = 1000.0;
    float    max_speed               = 20.0;
    float    forward_force           = 2000.0;
    float    steering_speed          = 1.0;
    float    steering_lower          = -0.5;
    float    steering_upper          = 0.5;
    float    wheel_mass              = 50.0;
    Vec3     up_dir                  = { 1, 0, 0 };
    Vec3     right_dir               = { 0, 1, 0 };
    float    suspension_length       = 0;
    float    suspension_strength     = 0;
    float    linear_damping          = 0.2f;
    float    angular_damping         = 0.2f;
    uint32_t chassis_collision_group = 0;
    uint32_t chassis_collision_mask  = {};
    uint32_t wheel_collision_group   = 0;
    uint32_t wheel_collision_mask    = {};
};

enum class PhysIKACarDirection
{
    Forward,
    Backward,
    Left,
    Right
};

class PhysIKACar
{
public:
    PhysIKACar();
    ~PhysIKACar();
    void GetChassisPositionRotation(Vec3& pos, Quat& rot);
    void GetWheelPositionRotation(uint32_t wheel_index, Vec3& pos, Quat& rot);

    void SetChassisPositionRotation(const Vec3& pos, const Quat& rot);
    void SetWheelPositionRotation(uint32_t wheel_index, const Vec3& pos, const Quat& rot);

    // Car controls
    void Go(PhysIKACarDirection dir);

    struct Impl2;

    std::unique_ptr<Impl2> _impl2{};
};

struct SandSimulationRegionCreateInfo
{
    float sand_layer_thickness;
    float time_delta;
    // ground height, index of data at (x, y) = height_data[y * resolution_x + x]
    const double*                          height_data;
    double                                 grid_physical_size;
    int                                    height_resolution_x;
    int                                    height_resolution_y;
    std::vector<VPE::PhysIKACarCreateInfo> cars{};
};

class SandSimulationRegion
{
public:
    SandSimulationRegion();
    std::shared_ptr<PhysIKA::Node>   GetRoot();
    std::shared_ptr<VPE::PhysIKACar> GetCar(uint64_t car_handle);
    std::vector<VPE::Vec3>           GetSandParticles();
    ~SandSimulationRegion();
    static std::shared_ptr<SandSimulationRegion> Create(const SandSimulationRegionCreateInfo& info);

    struct Impl;
    std::unique_ptr<Impl> _impl;
};

}  // namespace VPE