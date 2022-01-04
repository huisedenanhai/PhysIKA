#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_CORE" for configuration "Debug"
set_property(TARGET ZJU_CORE APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(ZJU_CORE PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/ZJU_COREd.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_CORE )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_CORE "${_IMPORT_PREFIX}/lib/ZJU_COREd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
