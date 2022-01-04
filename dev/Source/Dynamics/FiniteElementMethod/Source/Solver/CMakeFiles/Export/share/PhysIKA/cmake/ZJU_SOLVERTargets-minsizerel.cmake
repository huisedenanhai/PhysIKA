#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ZJU_SOLVER" for configuration "MinSizeRel"
set_property(TARGET ZJU_SOLVER APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(ZJU_SOLVER PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "CXX"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/ZJU_SOLVER.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ZJU_SOLVER )
list(APPEND _IMPORT_CHECK_FILES_FOR_ZJU_SOLVER "${_IMPORT_PREFIX}/lib/ZJU_SOLVER.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
