#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "glew" for configuration "Debug"
set_property(TARGET glew APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(glew PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/glew-1.10.0d.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/glew-1.10.0d.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS glew )
list(APPEND _IMPORT_CHECK_FILES_FOR_glew "${_IMPORT_PREFIX}/lib/glew-1.10.0d.lib" "${_IMPORT_PREFIX}/bin/glew-1.10.0d.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
