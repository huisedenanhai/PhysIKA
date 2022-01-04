#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Framework" for configuration "Debug"
set_property(TARGET Framework APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Framework PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CUDA;CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/PaFramework-2.2.1d.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS Framework )
list(APPEND _IMPORT_CHECK_FILES_FOR_Framework "${_IMPORT_PREFIX}/lib/PaFramework-2.2.1d.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
