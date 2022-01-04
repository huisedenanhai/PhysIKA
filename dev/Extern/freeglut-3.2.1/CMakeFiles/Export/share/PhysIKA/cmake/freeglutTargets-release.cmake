#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "freeglut" for configuration "Release"
set_property(TARGET freeglut APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(freeglut PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/freeglut.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/freeglut.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS freeglut )
list(APPEND _IMPORT_CHECK_FILES_FOR_freeglut "${_IMPORT_PREFIX}/lib/freeglut.lib" "${_IMPORT_PREFIX}/bin/freeglut.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
