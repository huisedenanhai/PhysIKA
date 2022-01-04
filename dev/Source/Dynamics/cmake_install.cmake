# Install script for directory: D:/PhysIKA/Source/Dynamics

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/PaParticleSystem-2.2.1d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/PaParticleSystem-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/PaParticleSystem-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/PaParticleSystem-2.2.1.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/ParticleSystemTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/ParticleSystemTargets.cmake"
         "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/ParticleSystemTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/ParticleSystemTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/ParticleSystemTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/ParticleSystemTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/ParticleSystemTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/ParticleSystemTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/ParticleSystemTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/ParticleSystemTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Dynamics/ParticleSystem" TYPE FILE FILES
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/Attribute.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/BoundaryConstraint.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/CahnHilliard.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/DensityPBD.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/DensityPBDMesh.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/DensitySummationMesh.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ElasticityModule.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ElastoplasticityModule.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/FixedPoints.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/FractureModule.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/GranularModule.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/Helmholtz.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/HyperelasticityModule.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ImplicitViscosity.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/Kernel.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/MeshCollision.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/MultipleFluidModel.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/NeighborData.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/OneDimElasticityModule.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleElasticBody.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleElastoplasticBody.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleEmitter.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleEmitterRound.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleEmitterSquare.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleFluid.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleFluidFast.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleIntegrator.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleRod.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleSystem.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/ParticleWriter.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/Peridynamics.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/PositionBasedFluidModel.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/PositionBasedFluidModelMesh.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/RodCollision.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/SemiAnalyticalIncompressibilityModule.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/SemiAnalyticalIncompressibleFluidModel.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/SemiAnalyticalSFINode.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/SimpleDamping.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/SolidFluidInteraction.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/StaticBoundary.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/StaticMeshBoundary.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/SummationDensity.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/SurfaceTension.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/TriangularSurfaceMeshNode.h"
    "D:/PhysIKA/Source/Dynamics/ParticleSystem/VelocityConstraint.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/PaRigidBody-2.2.1d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/PaRigidBody-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/PaRigidBody-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/PaRigidBody-2.2.1.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/RigidBodyTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/RigidBodyTargets.cmake"
         "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/RigidBodyTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/RigidBodyTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/RigidBodyTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/RigidBodyTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/RigidBodyTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/RigidBodyTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/RigidBodyTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/RigidBodyTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Dynamics/RigidBody" TYPE FILE FILES
    "D:/PhysIKA/Source/Dynamics/RigidBody/ArticulatedBodyFDSolver.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/BoxAABB3d.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/BroadPhaseDetector.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/ContactInfo.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/CylindricalJoint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/FeatherstoneIntegrationModule.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/FixedJoint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/ForwardDynamicsSolver.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/FreeJoint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/HelicalJoint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/HostNeighborList.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/Inertia.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/InverseDynamicsSolver.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/Joint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/JointSpace.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/PlanarJoint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/PrismaticJoint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RKIntegrator.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RevoluteJoint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RigidBody.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RigidBody2.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RigidBodyRoot.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RigidCollisionBody.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RigidDebugInfoModule.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RigidState.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RigidTimeIntegrationModule.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/RigidUtil.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/SemiImplicitEuler.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/SpatialVector.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/SphericalJoint.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/State.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/SystemMotionState.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/SystemState.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/Transform3d.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/Transformation6d.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/TriangleMesh.h"
    "D:/PhysIKA/Source/Dynamics/RigidBody/urdf.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/PaHeightField-2.2.1d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/PaHeightField-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/PaHeightField-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/PaHeightField-2.2.1.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/HeightFieldTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/HeightFieldTargets.cmake"
         "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/HeightFieldTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/HeightFieldTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/HeightFieldTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/HeightFieldTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/HeightFieldTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/HeightFieldTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/HeightFieldTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/HeightFieldTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Dynamics/HeightField" TYPE FILE FILES
    "D:/PhysIKA/Source/Dynamics/HeightField/HeightFieldGrid.h"
    "D:/PhysIKA/Source/Dynamics/HeightField/HeightFieldMesh.h"
    "D:/PhysIKA/Source/Dynamics/HeightField/HeightFieldNode.h"
    "D:/PhysIKA/Source/Dynamics/HeightField/OceanPatch.h"
    "D:/PhysIKA/Source/Dynamics/HeightField/ShallowWaterEquationModel.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/PaEmbeddedMethod-2.2.1d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/PaEmbeddedMethod-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/PaEmbeddedMethod-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/PaEmbeddedMethod-2.2.1.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/EmbeddedMethodTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/EmbeddedMethodTargets.cmake"
         "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/EmbeddedMethodTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/EmbeddedMethodTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/EmbeddedMethodTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/EmbeddedMethodTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/EmbeddedMethodTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/EmbeddedMethodTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/EmbeddedMethodTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/EmbeddedMethodTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Dynamics/EmbeddedMethod" TYPE FILE FILES
    "D:/PhysIKA/Source/Dynamics/EmbeddedMethod/EmbeddedFiniteElement.h"
    "D:/PhysIKA/Source/Dynamics/EmbeddedMethod/EmbeddedIntegrator.h"
    "D:/PhysIKA/Source/Dynamics/EmbeddedMethod/EmbeddedMassSpring.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/PaFastMultiphaseSPH-2.2.1d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/PaFastMultiphaseSPH-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/PaFastMultiphaseSPH-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/PaFastMultiphaseSPH-2.2.1.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/FastMultiphaseSPHTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/FastMultiphaseSPHTargets.cmake"
         "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/FastMultiphaseSPHTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/FastMultiphaseSPHTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/FastMultiphaseSPHTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/FastMultiphaseSPHTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/FastMultiphaseSPHTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/FastMultiphaseSPHTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/FastMultiphaseSPHTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/FastMultiphaseSPHTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Dynamics/FastMultiphaseSPH" TYPE FILE FILES "D:/PhysIKA/Source/Dynamics/FastMultiphaseSPH/FastMultiphaseSPH.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/PaSand-2.2.1d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/PaSand-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/PaSand-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/PaSand-2.2.1.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/SandTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/SandTargets.cmake"
         "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/SandTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/SandTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/SandTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/SandTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/SandTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/SandTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/SandTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/CMakeFiles/Export/share/PhysIKA/cmake/SandTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Dynamics/Sand" TYPE FILE FILES
    "D:/PhysIKA/Source/Dynamics/Sand/HeightFieldDensitySolver.h"
    "D:/PhysIKA/Source/Dynamics/Sand/HeightFieldSandRigidInteraction.h"
    "D:/PhysIKA/Source/Dynamics/Sand/PBDSandRigidInteraction.h"
    "D:/PhysIKA/Source/Dynamics/Sand/PBDSandSolver.h"
    "D:/PhysIKA/Source/Dynamics/Sand/ParticleSandRigidInteraction.h"
    "D:/PhysIKA/Source/Dynamics/Sand/RigidSimulatorInteraface.h"
    "D:/PhysIKA/Source/Dynamics/Sand/SSESandSolver.h"
    "D:/PhysIKA/Source/Dynamics/Sand/SSEUtil.h"
    "D:/PhysIKA/Source/Dynamics/Sand/SandGrid.h"
    "D:/PhysIKA/Source/Dynamics/Sand/SandInteractionForceSolver.h"
    "D:/PhysIKA/Source/Dynamics/Sand/SandSimulator.h"
    "D:/PhysIKA/Source/Dynamics/Sand/SandSolverInterface.h"
    "D:/PhysIKA/Source/Dynamics/Sand/SandVisualPointSampleModule.h"
    "D:/PhysIKA/Source/Dynamics/Sand/SurfaceParticleSampler.h"
    "D:/PhysIKA/Source/Dynamics/Sand/helper_math.h"
    "D:/PhysIKA/Source/Dynamics/Sand/types.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("D:/PhysIKA/dev/Source/Dynamics/FiniteElementMethod/cmake_install.cmake")

endif()

