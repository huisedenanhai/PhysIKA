#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ms_hg" for configuration "RelWithDebInfo"
set_property(TARGET ms_hg APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(ms_hg PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/ms_hg.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ms_hg )
list(APPEND _IMPORT_CHECK_FILES_FOR_ms_hg "${_IMPORT_PREFIX}/lib/ms_hg.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
