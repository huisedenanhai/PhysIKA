# Install script for directory: D:/PhysIKA/Source/Core

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/PaCore-2.2.1d.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/PaCore-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/PaCore-2.2.1.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/PaCore-2.2.1.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/CoreTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/CoreTargets.cmake"
         "D:/PhysIKA/dev/Source/Core/CMakeFiles/Export/share/PhysIKA/cmake/CoreTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/CoreTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/CoreTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Core/CMakeFiles/Export/share/PhysIKA/cmake/CoreTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Core/CMakeFiles/Export/share/PhysIKA/cmake/CoreTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Core/CMakeFiles/Export/share/PhysIKA/cmake/CoreTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Core/CMakeFiles/Export/share/PhysIKA/cmake/CoreTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Core/CMakeFiles/Export/share/PhysIKA/cmake/CoreTargets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core" TYPE FILE FILES
    "D:/PhysIKA/Source/Core/Complex.h"
    "D:/PhysIKA/Source/Core/DataTypes.h"
    "D:/PhysIKA/Source/Core/Interval.h"
    "D:/PhysIKA/Source/Core/Matrix.h"
    "D:/PhysIKA/Source/Core/Platform.h"
    "D:/PhysIKA/Source/Core/Typedef.h"
    "D:/PhysIKA/Source/Core/Utility.h"
    "D:/PhysIKA/Source/Core/Vector.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core/Algorithm" TYPE FILE FILES
    "D:/PhysIKA/Source/Core/Algorithm/MatrixFunc.h"
    "D:/PhysIKA/Source/Core/Algorithm/svd3_cuda.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core/Vector" TYPE FILE FILES
    "D:/PhysIKA/Source/Core/Vector/vector_2d.h"
    "D:/PhysIKA/Source/Core/Vector/vector_2d.inl"
    "D:/PhysIKA/Source/Core/Vector/vector_3d.h"
    "D:/PhysIKA/Source/Core/Vector/vector_3d.inl"
    "D:/PhysIKA/Source/Core/Vector/vector_4d.h"
    "D:/PhysIKA/Source/Core/Vector/vector_4d.inl"
    "D:/PhysIKA/Source/Core/Vector/vector_base.h"
    "D:/PhysIKA/Source/Core/Vector/vector_fixed.h"
    "D:/PhysIKA/Source/Core/Vector/vector_nd.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core/Matrix" TYPE FILE FILES
    "D:/PhysIKA/Source/Core/Matrix/matrix_2x2.h"
    "D:/PhysIKA/Source/Core/Matrix/matrix_2x2.inl"
    "D:/PhysIKA/Source/Core/Matrix/matrix_3x3.h"
    "D:/PhysIKA/Source/Core/Matrix/matrix_3x3.inl"
    "D:/PhysIKA/Source/Core/Matrix/matrix_4x4.h"
    "D:/PhysIKA/Source/Core/Matrix/matrix_4x4.inl"
    "D:/PhysIKA/Source/Core/Matrix/matrix_base.h"
    "D:/PhysIKA/Source/Core/Matrix/matrix_mxn.h"
    "D:/PhysIKA/Source/Core/Matrix/matrix_mxn.inl"
    "D:/PhysIKA/Source/Core/Matrix/square_matrix.h"
    "D:/PhysIKA/Source/Core/Matrix/transform.h"
    "D:/PhysIKA/Source/Core/Matrix/transform_2d.h"
    "D:/PhysIKA/Source/Core/Matrix/transform_3d.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core/Rigid" TYPE FILE FILES
    "D:/PhysIKA/Source/Core/Rigid/rigid.h"
    "D:/PhysIKA/Source/Core/Rigid/rigid_1d.h"
    "D:/PhysIKA/Source/Core/Rigid/rigid_2d.h"
    "D:/PhysIKA/Source/Core/Rigid/rigid_3d.h"
    "D:/PhysIKA/Source/Core/Rigid/rigid_base.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core/Array" TYPE FILE FILES
    "D:/PhysIKA/Source/Core/Array/Array.h"
    "D:/PhysIKA/Source/Core/Array/Array2D.h"
    "D:/PhysIKA/Source/Core/Array/Array3D.h"
    "D:/PhysIKA/Source/Core/Array/ArrayPitch2D.h"
    "D:/PhysIKA/Source/Core/Array/DynamicArray.h"
    "D:/PhysIKA/Source/Core/Array/MemoryManager.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core/Utility" TYPE FILE FILES
    "D:/PhysIKA/Source/Core/Utility/Arithmetic.h"
    "D:/PhysIKA/Source/Core/Utility/CTimer.h"
    "D:/PhysIKA/Source/Core/Utility/CudaRand.h"
    "D:/PhysIKA/Source/Core/Utility/ForEach.h"
    "D:/PhysIKA/Source/Core/Utility/Function1Pt.h"
    "D:/PhysIKA/Source/Core/Utility/Function2Pt.h"
    "D:/PhysIKA/Source/Core/Utility/Functional.h"
    "D:/PhysIKA/Source/Core/Utility/GTimer.h"
    "D:/PhysIKA/Source/Core/Utility/Reduction.h"
    "D:/PhysIKA/Source/Core/Utility/Scan.h"
    "D:/PhysIKA/Source/Core/Utility/SimpleMath.h"
    "D:/PhysIKA/Source/Core/Utility/cuda_helper_math.h"
    "D:/PhysIKA/Source/Core/Utility/cuda_utilities.h"
    "D:/PhysIKA/Source/Core/Utility/cxx11_support.h"
    "D:/PhysIKA/Source/Core/Utility/glm_helper.h"
    "D:/PhysIKA/Source/Core/Utility/glm_utilities.h"
    "D:/PhysIKA/Source/Core/Utility/math_utilities.h"
    "D:/PhysIKA/Source/Core/Utility/sharedmem.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core/Quaternion" TYPE FILE FILES
    "D:/PhysIKA/Source/Core/Quaternion/quaternion.h"
    "D:/PhysIKA/Source/Core/Quaternion/quaternion_.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Core" TYPE FILE FILES "D:/PhysIKA/Source/Core/Platform.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Extern/glm-0.9.9.7/" TYPE DIRECTORY FILES "D:/PhysIKA/Extern/glm-0.9.9.7/")
endif()

