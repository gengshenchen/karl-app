# Install script for directory: /Users/karl/work/karl-app/3rdparty/framelesshelper/src/core

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/karl/work/karl-app/installer/lib/libFramelessHelperCore64.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperCore64.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperCore64.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperCore64.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Core" TYPE FILE FILES
    "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/framelesshelper.version"
    "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/framelesshelper.config"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/framelesshelpercore_global.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/framelessmanager.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/utils.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/framelesshelper_qt.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/chromepalette.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/micamaterial.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/windowborderpainter.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Core/private" TYPE FILE FILES
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/framelessmanager_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/framelessconfig_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/sysapiloader_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/framelesshelpercore_global_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/versionnumber_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/scopeguard_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/chromepalette_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/micamaterial_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/private/windowborderpainter_p.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Core" TYPE FILE FILES
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/Global"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/FramelessManager"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/Utils"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/FramelessHelper_Qt"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/ChromePalette"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/MicaMaterial"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/core/../../include/FramelessHelper/Core/WindowBorderPainter"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperCoreTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperCoreTargets.cmake"
         "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/core/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperCoreTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperCoreTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperCoreTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper" TYPE FILE FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/core/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperCoreTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper" TYPE FILE FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/core/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperCoreTargets-release.cmake")
  endif()
endif()

