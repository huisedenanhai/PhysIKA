#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "embedded_mass_spring_pb" for configuration "Debug"
set_property(TARGET embedded_mass_spring_pb APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(embedded_mass_spring_pb PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/embedded_mass_spring_pbd.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS embedded_mass_spring_pb )
list(APPEND _IMPORT_CHECK_FILES_FOR_embedded_mass_spring_pb "${_IMPORT_PREFIX}/lib/embedded_mass_spring_pbd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
