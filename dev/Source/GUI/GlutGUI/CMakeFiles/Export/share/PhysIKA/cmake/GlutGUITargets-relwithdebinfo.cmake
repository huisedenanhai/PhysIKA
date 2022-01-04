#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "GlutGUI" for configuration "RelWithDebInfo"
set_property(TARGET GlutGUI APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(GlutGUI PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/PaGlutGUI-2.2.1.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS GlutGUI )
list(APPEND _IMPORT_CHECK_FILES_FOR_GlutGUI "${_IMPORT_PREFIX}/lib/PaGlutGUI-2.2.1.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
