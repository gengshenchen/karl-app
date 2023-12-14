# Install script for directory: /Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/org/wangwenx190/FramelessHelper" TYPE STATIC_LIBRARY FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/imports/org/wangwenx190/FramelessHelper/libFramelessHelperQuickplugin.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/org/wangwenx190/FramelessHelper/libFramelessHelperQuickplugin.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/org/wangwenx190/FramelessHelper/libFramelessHelperQuickplugin.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/qml/org/wangwenx190/FramelessHelper/libFramelessHelperQuickplugin.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/org/wangwenx190/FramelessHelper" TYPE FILE FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/imports/org/wangwenx190/FramelessHelper/qmldir")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/org/wangwenx190/FramelessHelper" TYPE FILE FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/imports/org/wangwenx190/FramelessHelper/plugins.qmltypes")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/karl/work/karl-app/installer/lib/libFramelessHelperQuick64.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperQuick64.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperQuick64.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperQuick64.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Quick" TYPE FILE FILES
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/framelesshelperquick_global.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/framelessquickmodule.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/framelessquickhelper.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/framelessquickutils.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/quickchromepalette.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/quickmicamaterial.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/quickwindowborder.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Quick/private" TYPE FILE FILES
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/framelessquickhelper_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/quickimageitem_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/quickstandardsystembutton_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/quickstandardtitlebar_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/framelessquickwindow_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/framelessquickwindow_p_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/framelessquickapplicationwindow_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/framelessquickapplicationwindow_p_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/quickmicamaterial_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/private/quickwindowborder_p.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Quick" TYPE FILE FILES
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/Global"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/FramelessQuickModule"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/FramelessQuickHelper"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/FramelessQuickUtils"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/QuickChromePalette"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/QuickMicaMaterial"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick/../../include/FramelessHelper/Quick/QuickWindowBorder"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperQuickTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperQuickTargets.cmake"
         "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperQuickTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperQuickTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperQuickTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper" TYPE FILE FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperQuickTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper" TYPE FILE FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperQuickTargets-release.cmake")
  endif()
endif()

