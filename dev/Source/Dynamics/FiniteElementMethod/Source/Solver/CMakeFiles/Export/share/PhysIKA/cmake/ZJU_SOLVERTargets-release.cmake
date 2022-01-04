#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_SOLVER" for configuration "Release"
set_property(TARGET ZJU_SOLVER APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ZJU_SOLVER PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/ZJU_SOLVER.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_SOLVER )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_SOLVER "${_IMPORT_PREFIX}/lib/ZJU_SOLVER.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
