#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_ENERGY" for configuration "Release"
set_property(TARGET ZJU_ENERGY APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ZJU_ENERGY PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/ZJU_ENERGY.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_ENERGY )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_ENERGY "${_IMPORT_PREFIX}/lib/ZJU_ENERGY.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
