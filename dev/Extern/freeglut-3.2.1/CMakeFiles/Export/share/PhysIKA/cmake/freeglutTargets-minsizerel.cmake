#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "freeglut" for configuration "MinSizeRel"
set_property(TARGET freeglut APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(freeglut PROPERTIES
  IMPORTED_IMPLIB_MINSIZEREL "${_IMPORT_PREFIX}/lib/freeglut.lib"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/bin/freeglut.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS freeglut )
list(APPEND _IMPORT_CHECK_FILES_FOR_freeglut "${_IMPORT_PREFIX}/lib/freeglut.lib" "${_IMPORT_PREFIX}/bin/freeglut.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
