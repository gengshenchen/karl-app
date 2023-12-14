# Install script for directory: /Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/karl/work/karl-app/installer/lib/libFramelessHelperWidgets64.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperWidgets64.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperWidgets64.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libFramelessHelperWidgets64.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Widgets" TYPE FILE FILES
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/framelesshelperwidgets_global.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/framelesswidgetshelper.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/standardsystembutton.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/standardtitlebar.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/framelessdialog.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/framelesswidget.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/framelessmainwindow.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Widgets/private" TYPE FILE FILES
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/private/framelesswidgetshelper_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/private/widgetssharedhelper_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/private/standardsystembutton_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/private/standardtitlebar_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/private/framelessdialog_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/private/framelesswidget_p.h"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/private/framelessmainwindow_p.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/FramelessHelper/Widgets" TYPE FILE FILES
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/Global"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/FramelessWidgetsHelper"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/StandardSystemButton"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/StandardTitleBar"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/FramelessDialog"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/FramelessWidget"
    "/Users/karl/work/karl-app/3rdparty/framelesshelper/src/widgets/../../include/FramelessHelper/Widgets/FramelessMainWindow"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperWidgetsTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperWidgetsTargets.cmake"
         "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/widgets/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperWidgetsTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperWidgetsTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper/FramelessHelperWidgetsTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper" TYPE FILE FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/widgets/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperWidgetsTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/FramelessHelper" TYPE FILE FILES "/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/widgets/CMakeFiles/Export/b3a3596abcd0a35bcb4fb52c1da4ff7b/FramelessHelperWidgetsTargets-release.cmake")
  endif()
endif()

