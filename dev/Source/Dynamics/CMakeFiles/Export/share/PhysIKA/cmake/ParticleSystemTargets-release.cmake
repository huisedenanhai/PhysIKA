#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ParticleSystem" for configuration "Release"
set_property(TARGET ParticleSystem APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ParticleSystem PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CUDA;CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/PaParticleSystem-2.2.1.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ParticleSystem )
list(APPEND _IMPORT_CHECK_FILES_FOR_ParticleSystem "${_IMPORT_PREFIX}/lib/PaParticleSystem-2.2.1.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
