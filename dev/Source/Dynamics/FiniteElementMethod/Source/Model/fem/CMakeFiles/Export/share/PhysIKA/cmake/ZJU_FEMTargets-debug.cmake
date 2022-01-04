#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_FEM" for configuration "Debug"
set_property(TARGET ZJU_FEM APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(ZJU_FEM PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/ZJU_FEMd.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_FEM )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_FEM "${_IMPORT_PREFIX}/lib/ZJU_FEMd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
