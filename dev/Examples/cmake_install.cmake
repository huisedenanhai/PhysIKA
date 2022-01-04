# Install script for directory: D:/PhysIKA/Examples

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/PhysIKA")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("D:/PhysIKA/dev/Examples/App_Barricades/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_CAE/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Cloth/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Collision/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_CollisionHybridHorizontal/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_CollisionHybridSixHorizontal/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_CollisionHybridSixVertical/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_CollisionHybridVertical/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Collision_example2/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_DrySand/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Elasticity/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_FiniteElement/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Fracture/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Hyperelasticity/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_MassSpring/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_MultiphaseSPH/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_MultipleFluid/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Plasticity/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Platform/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_QtGUI/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Rod/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_SFI/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_SFIHybrid/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_SFI_Fast/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_SFI_Tube/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_SWE/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_SandRigid/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_SingleFluid/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_SingleFluid_Fast/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Test/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_TestRigidbody/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_Viscoplasticity/cmake_install.cmake")
  include("D:/PhysIKA/dev/Examples/App_WetSand/cmake_install.cmake")

endif()

