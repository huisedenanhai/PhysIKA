# Install script for directory: D:/PhysIKA/Source/Framework

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/PaFramework-2.2.1d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/PaFramework-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/PaFramework-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/PaFramework-2.2.1.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/FrameworkTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/FrameworkTargets.cmake"
         "D:/PhysIKA/dev/Source/Framework/CMakeFiles/Export/share/PhysIKA/cmake/FrameworkTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/FrameworkTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/FrameworkTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Framework/CMakeFiles/Export/share/PhysIKA/cmake/FrameworkTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Framework/CMakeFiles/Export/share/PhysIKA/cmake/FrameworkTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Framework/CMakeFiles/Export/share/PhysIKA/cmake/FrameworkTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Framework/CMakeFiles/Export/share/PhysIKA/cmake/FrameworkTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Framework/CMakeFiles/Export/share/PhysIKA/cmake/FrameworkTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Framework" TYPE FILE FILES
    "D:/PhysIKA/Source/Framework/FieldTypes.h"
    "D:/PhysIKA/Source/Framework/Mapping.h"
    "D:/PhysIKA/Source/Framework/ModuleTypes.h"
    "D:/PhysIKA/Source/Framework/Topology.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Framework/Action" TYPE FILE FILES
    "D:/PhysIKA/Source/Framework/Action/ActAnimate.h"
    "D:/PhysIKA/Source/Framework/Action/ActDraw.h"
    "D:/PhysIKA/Source/Framework/Action/ActInit.h"
    "D:/PhysIKA/Source/Framework/Action/ActNodeInfo.h"
    "D:/PhysIKA/Source/Framework/Action/ActPostProcessing.h"
    "D:/PhysIKA/Source/Framework/Action/ActQueryTimeStep.h"
    "D:/PhysIKA/Source/Framework/Action/ActReset.h"
    "D:/PhysIKA/Source/Framework/Action/Action.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Framework/Collision" TYPE FILE FILES
    "D:/PhysIKA/Source/Framework/Collision/Collid.h"
    "D:/PhysIKA/Source/Framework/Collision/CollidableCube.h"
    "D:/PhysIKA/Source/Framework/Collision/CollidablePoints.h"
    "D:/PhysIKA/Source/Framework/Collision/CollidableSDF.h"
    "D:/PhysIKA/Source/Framework/Collision/CollidableTriangle.h"
    "D:/PhysIKA/Source/Framework/Collision/CollidableTriangleMesh.h"
    "D:/PhysIKA/Source/Framework/Collision/Collision.h"
    "D:/PhysIKA/Source/Framework/Collision/CollisionBVH.cuh"
    "D:/PhysIKA/Source/Framework/Collision/CollisionBVH.h"
    "D:/PhysIKA/Source/Framework/Collision/CollisionBox.cuh"
    "D:/PhysIKA/Source/Framework/Collision/CollisionDate.h"
    "D:/PhysIKA/Source/Framework/Collision/CollisionMesh.cuh"
    "D:/PhysIKA/Source/Framework/Collision/CollisionMesh.h"
    "D:/PhysIKA/Source/Framework/Collision/CollisionPair.cuh"
    "D:/PhysIKA/Source/Framework/Collision/CollisionPoints.h"
    "D:/PhysIKA/Source/Framework/Collision/CollisionSDF.h"
    "D:/PhysIKA/Source/Framework/Collision/CollisionTools.cuh"
    "D:/PhysIKA/Source/Framework/Collision/CollisionTri3f.cuh"
    "D:/PhysIKA/Source/Framework/Collision/CollisionTriContact.cuh"
    "D:/PhysIKA/Source/Framework/Collision/CollisionVec3.cuh"
    "D:/PhysIKA/Source/Framework/Collision/CollisionVec3.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Framework/Framework" TYPE FILE FILES
    "D:/PhysIKA/Source/Framework/Framework/Base.h"
    "D:/PhysIKA/Source/Framework/Framework/CollidableObject.h"
    "D:/PhysIKA/Source/Framework/Framework/CollisionModel.h"
    "D:/PhysIKA/Source/Framework/Framework/ControllerAnimation.h"
    "D:/PhysIKA/Source/Framework/Framework/ControllerRender.h"
    "D:/PhysIKA/Source/Framework/Framework/DeclareEnum.h"
    "D:/PhysIKA/Source/Framework/Framework/DeclareModuleField.h"
    "D:/PhysIKA/Source/Framework/Framework/DeclareNodeField.h"
    "D:/PhysIKA/Source/Framework/Framework/DeviceContext.h"
    "D:/PhysIKA/Source/Framework/Framework/Field.h"
    "D:/PhysIKA/Source/Framework/Framework/FieldArray.h"
    "D:/PhysIKA/Source/Framework/Framework/FieldVar.h"
    "D:/PhysIKA/Source/Framework/Framework/Gravity.h"
    "D:/PhysIKA/Source/Framework/Framework/Log.h"
    "D:/PhysIKA/Source/Framework/Framework/MechanicalState.h"
    "D:/PhysIKA/Source/Framework/Framework/Module.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleCompute.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleConstraint.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleController.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleCustom.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleForce.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleGeometry.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleIO.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleTopology.h"
    "D:/PhysIKA/Source/Framework/Framework/ModuleVisual.h"
    "D:/PhysIKA/Source/Framework/Framework/Node.h"
    "D:/PhysIKA/Source/Framework/Framework/NodeIterator.h"
    "D:/PhysIKA/Source/Framework/Framework/NodePort.h"
    "D:/PhysIKA/Source/Framework/Framework/NumericalIntegrator.h"
    "D:/PhysIKA/Source/Framework/Framework/NumericalModel.h"
    "D:/PhysIKA/Source/Framework/Framework/Object.h"
    "D:/PhysIKA/Source/Framework/Framework/SceneGraph.h"
    "D:/PhysIKA/Source/Framework/Framework/SceneLoaderFactory.h"
    "D:/PhysIKA/Source/Framework/Framework/SceneLoaderXML.h"
    "D:/PhysIKA/Source/Framework/Framework/TopologyMapping.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Framework/Mapping" TYPE FILE FILES
    "D:/PhysIKA/Source/Framework/Mapping/FrameToPointSet.h"
    "D:/PhysIKA/Source/Framework/Mapping/PointSetToPointSet.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Framework/Topology" TYPE FILE FILES
    "D:/PhysIKA/Source/Framework/Topology/DistanceField3D.h"
    "D:/PhysIKA/Source/Framework/Topology/EdgeSet.h"
    "D:/PhysIKA/Source/Framework/Topology/FieldNeighbor.h"
    "D:/PhysIKA/Source/Framework/Topology/Frame.h"
    "D:/PhysIKA/Source/Framework/Topology/GridHash.h"
    "D:/PhysIKA/Source/Framework/Topology/HeightField.h"
    "D:/PhysIKA/Source/Framework/Topology/NeighborList.h"
    "D:/PhysIKA/Source/Framework/Topology/NeighborQuery.h"
    "D:/PhysIKA/Source/Framework/Topology/PointSet.h"
    "D:/PhysIKA/Source/Framework/Topology/Primitive3D.h"
    "D:/PhysIKA/Source/Framework/Topology/Primitive3D.inl"
    "D:/PhysIKA/Source/Framework/Topology/PrimitiveSweep3D.h"
    "D:/PhysIKA/Source/Framework/Topology/PrimitiveSweep3D.inl"
    "D:/PhysIKA/Source/Framework/Topology/TriangleSet.h"
    "D:/PhysIKA/Source/Framework/Topology/UniformGrid.h"
    "D:/PhysIKA/Source/Framework/Topology/UnstructuredPointSet.h"
    )
endif()

