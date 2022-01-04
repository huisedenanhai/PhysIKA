# Install script for directory: D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/PhysIKA/Common" TYPE FILE FILES
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/BCSR.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/DEFINE_TYPE.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/config.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/data_str_core.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/def.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/diag_BCSR.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/eigen_ext.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/error.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/framework.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/polar_decomposition.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/search_eigenvalues.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/spm_eig_jac.h"
    "D:/PhysIKA/Source/Dynamics/FiniteElementMethod/Source/Common/tensor.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Debug/ZJU_COREd.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/Release/ZJU_CORE.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/MinSizeRel/ZJU_CORE.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/PhysIKA/dev/lib/RelWithDebInfo/ZJU_CORE.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/ZJU_CORETargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/ZJU_CORETargets.cmake"
         "D:/PhysIKA/dev/Source/Dynamics/FiniteElementMethod/Source/Common/CMakeFiles/Export/share/PhysIKA/cmake/ZJU_CORETargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/ZJU_CORETargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake/ZJU_CORETargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/FiniteElementMethod/Source/Common/CMakeFiles/Export/share/PhysIKA/cmake/ZJU_CORETargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/FiniteElementMethod/Source/Common/CMakeFiles/Export/share/PhysIKA/cmake/ZJU_CORETargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/FiniteElementMethod/Source/Common/CMakeFiles/Export/share/PhysIKA/cmake/ZJU_CORETargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/FiniteElementMethod/Source/Common/CMakeFiles/Export/share/PhysIKA/cmake/ZJU_CORETargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/PhysIKA/cmake" TYPE FILE FILES "D:/PhysIKA/dev/Source/Dynamics/FiniteElementMethod/Source/Common/CMakeFiles/Export/share/PhysIKA/cmake/ZJU_CORETargets-release.cmake")
  endif()
endif()

