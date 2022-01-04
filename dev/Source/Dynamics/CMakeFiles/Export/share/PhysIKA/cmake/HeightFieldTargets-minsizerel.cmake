#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "HeightField" for configuration "MinSizeRel"
set_property(TARGET HeightField APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(HeightField PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "CUDA"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/PaHeightField-2.2.1.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS HeightField )
list(APPEND _IMPORT_CHECK_FILES_FOR_HeightField "${_IMPORT_PREFIX}/lib/PaHeightField-2.2.1.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
