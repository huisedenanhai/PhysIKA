#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "HeightField" for configuration "RelWithDebInfo"
set_property(TARGET HeightField APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(HeightField PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CUDA"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/PaHeightField-2.2.1.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS HeightField )
list(APPEND _IMPORT_CHECK_FILES_FOR_HeightField "${_IMPORT_PREFIX}/lib/PaHeightField-2.2.1.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
