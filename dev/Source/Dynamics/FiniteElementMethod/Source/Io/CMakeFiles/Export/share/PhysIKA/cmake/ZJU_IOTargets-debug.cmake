#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_IO" for configuration "Debug"
set_property(TARGET ZJU_IO APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(ZJU_IO PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/ZJU_IOd.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_IO )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_IO "${_IMPORT_PREFIX}/lib/ZJU_IOd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
