#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mass_spring_pb" for configuration "Debug"
set_property(TARGET mass_spring_pb APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(mass_spring_pb PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/mass_spring_pbd.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS mass_spring_pb )
list(APPEND _IMPORT_CHECK_FILES_FOR_mass_spring_pb "${_IMPORT_PREFIX}/lib/mass_spring_pbd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
