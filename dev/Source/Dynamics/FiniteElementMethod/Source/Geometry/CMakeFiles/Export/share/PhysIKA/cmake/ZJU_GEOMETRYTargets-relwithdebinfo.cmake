#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_GEOMETRY" for configuration "RelWithDebInfo"
set_property(TARGET ZJU_GEOMETRY APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(ZJU_GEOMETRY PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/ZJU_GEOMETRY.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_GEOMETRY )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_GEOMETRY "${_IMPORT_PREFIX}/lib/ZJU_GEOMETRY.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
