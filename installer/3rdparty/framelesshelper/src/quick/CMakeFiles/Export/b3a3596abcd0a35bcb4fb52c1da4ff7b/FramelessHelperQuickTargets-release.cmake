#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FramelessHelper::FramelessHelperQuick" for configuration "Release"
set_property(TARGET FramelessHelper::FramelessHelperQuick APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FramelessHelper::FramelessHelperQuick PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libFramelessHelperQuick64.a"
  )

list(APPEND _cmake_import_check_targets FramelessHelper::FramelessHelperQuick )
list(APPEND _cmake_import_check_files_for_FramelessHelper::FramelessHelperQuick "${_IMPORT_PREFIX}/lib/libFramelessHelperQuick64.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
