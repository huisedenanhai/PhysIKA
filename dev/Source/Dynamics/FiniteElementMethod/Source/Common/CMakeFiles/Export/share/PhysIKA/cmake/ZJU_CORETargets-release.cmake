#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_CORE" for configuration "Release"
set_property(TARGET ZJU_CORE APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ZJU_CORE PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/ZJU_CORE.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_CORE )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_CORE "${_IMPORT_PREFIX}/lib/ZJU_CORE.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
