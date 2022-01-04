#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_LINEAR_SOLVER" for configuration "Debug"
set_property(TARGET ZJU_LINEAR_SOLVER APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(ZJU_LINEAR_SOLVER PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CUDA;CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/ZJU_LINEAR_SOLVERd.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_LINEAR_SOLVER )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_LINEAR_SOLVER "${_IMPORT_PREFIX}/lib/ZJU_LINEAR_SOLVERd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
