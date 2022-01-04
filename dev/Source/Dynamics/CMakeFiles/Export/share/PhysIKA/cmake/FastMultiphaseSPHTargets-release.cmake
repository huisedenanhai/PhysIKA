#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FastMultiphaseSPH" for configuration "Release"
set_property(TARGET FastMultiphaseSPH APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FastMultiphaseSPH PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CUDA;CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/PaFastMultiphaseSPH-2.2.1.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS FastMultiphaseSPH )
list(APPEND _IMPORT_CHECK_FILES_FOR_FastMultiphaseSPH "${_IMPORT_PREFIX}/lib/PaFastMultiphaseSPH-2.2.1.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
