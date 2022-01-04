include(CMakeFindDependencyMacro)

set(PHYSIKA_PACKAGE_LIB_CMAKES  "CoreTargets.cmake;FrameworkTargets.cmake;IOTargets.cmake;RenderingTargets.cmake;ZJU_CORETargets.cmake;ZJU_FEMTargets.cmake;ms_hgTargets.cmake;ZJU_IOTargets.cmake;ZJU_GEOMETRYTargets.cmake;ZJU_ENERGYTargets.cmake;elas_fem_pbTargets.cmake;embedded_elas_fem_pbTargets.cmake;mass_spring_pbTargets.cmake;embedded_mass_spring_pbTargets.cmake;ZJU_LINEAR_SOLVERTargets.cmake;ZJU_SOLVERTargets.cmake;ParticleSystemTargets.cmake;RigidBodyTargets.cmake;HeightFieldTargets.cmake;EmbeddedMethodTargets.cmake;FastMultiphaseSPHTargets.cmake;SandTargets.cmake;GlutGUITargets.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/freeglutTargets.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/glewTargets.cmake")

# Add the targets file
foreach(LIB_CMAKE_NAME IN ITEMS ${PHYSIKA_PACKAGE_LIB_CMAKES})
    include("${CMAKE_CURRENT_LIST_DIR}/${LIB_CMAKE_NAME}")
endforeach()
