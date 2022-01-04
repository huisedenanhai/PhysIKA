#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "GlutGUI" for configuration "Debug"
set_property(TARGET GlutGUI APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(GlutGUI PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/PaGlutGUI-2.2.1d.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS GlutGUI )
list(APPEND _IMPORT_CHECK_FILES_FOR_GlutGUI "${_IMPORT_PREFIX}/lib/PaGlutGUI-2.2.1d.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
