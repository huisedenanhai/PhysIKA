#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "embedded_elas_fem_pb" for configuration "Release"
set_property(TARGET embedded_elas_fem_pb APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(embedded_elas_fem_pb PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/embedded_elas_fem_pb.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS embedded_elas_fem_pb )
list(APPEND _IMPORT_CHECK_FILES_FOR_embedded_elas_fem_pb "${_IMPORT_PREFIX}/lib/embedded_elas_fem_pb.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
