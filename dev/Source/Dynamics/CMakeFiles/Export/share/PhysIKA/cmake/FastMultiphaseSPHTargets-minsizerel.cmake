#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FastMultiphaseSPH" for configuration "MinSizeRel"
set_property(TARGET FastMultiphaseSPH APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(FastMultiphaseSPH PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "CUDA;CXX"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/PaFastMultiphaseSPH-2.2.1.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS FastMultiphaseSPH )
list(APPEND _IMPORT_CHECK_FILES_FOR_FastMultiphaseSPH "${_IMPORT_PREFIX}/lib/PaFastMultiphaseSPH-2.2.1.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
