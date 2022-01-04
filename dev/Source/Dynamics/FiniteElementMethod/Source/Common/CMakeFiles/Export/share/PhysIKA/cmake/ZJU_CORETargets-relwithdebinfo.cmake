#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_CORE" for configuration "RelWithDebInfo"
set_property(TARGET ZJU_CORE APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(ZJU_CORE PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/ZJU_CORE.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_CORE )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_CORE "${_IMPORT_PREFIX}/lib/ZJU_CORE.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
