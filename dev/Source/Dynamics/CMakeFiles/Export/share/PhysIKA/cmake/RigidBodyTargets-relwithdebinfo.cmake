#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "RigidBody" for configuration "RelWithDebInfo"
set_property(TARGET RigidBody APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(RigidBody PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CUDA;CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/PaRigidBody-2.2.1.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS RigidBody )
list(APPEND _IMPORT_CHECK_FILES_FOR_RigidBody "${_IMPORT_PREFIX}/lib/PaRigidBody-2.2.1.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
