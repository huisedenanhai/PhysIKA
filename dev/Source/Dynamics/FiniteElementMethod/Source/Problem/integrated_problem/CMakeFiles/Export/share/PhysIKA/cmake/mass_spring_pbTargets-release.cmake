#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mass_spring_pb" for configuration "Release"
set_property(TARGET mass_spring_pb APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mass_spring_pb PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/mass_spring_pb.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS mass_spring_pb )
list(APPEND _IMPORT_CHECK_FILES_FOR_mass_spring_pb "${_IMPORT_PREFIX}/lib/mass_spring_pb.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
