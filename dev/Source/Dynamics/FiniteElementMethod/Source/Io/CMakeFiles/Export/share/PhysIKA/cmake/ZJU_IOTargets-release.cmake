#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_IO" for configuration "Release"
set_property(TARGET ZJU_IO APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ZJU_IO PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/ZJU_IO.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_IO )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_IO "${_IMPORT_PREFIX}/lib/ZJU_IO.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
