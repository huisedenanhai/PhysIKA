#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "freeglut" for configuration "Debug"
set_property(TARGET freeglut APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(freeglut PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/freeglutd.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/freeglutd.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS freeglut )
list(APPEND _IMPORT_CHECK_FILES_FOR_freeglut "${_IMPORT_PREFIX}/lib/freeglutd.lib" "${_IMPORT_PREFIX}/bin/freeglutd.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
