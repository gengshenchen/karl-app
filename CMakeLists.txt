cmake_minimum_required(VERSION 3.22.0)
include(cmake/policy.cmake)

# set PROJECT_NAME and version
project(karl-app LANGUAGES C CXX)
set(VERSION_MAJOR 1)
set(VERSION_MINOR 1)
set(VERSION_PATCH 1)

# set it after project
include(cmake/system.cmake)
include(GNUInstallDirs) # for unix and unix like

if(NOT DEFINED CMAKE_MODULE_PATH)
  set(CMAKE_MODULE_PATH "")
endif()

# set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/" "${CMAKE_MODULE_PATH}")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

if(NOT DEFINED CMAKE_INSTALL_LIBDIR)
  set(CMAKE_INSTALL_LIBDIR "lib")
endif()

if(NOT DEFINED CMAKE_INSTALL_BINDIR)
  set(CMAKE_INSTALL_BINDIR "bin")
endif()

if(NOT DEFINED CMAKE_INSTALL_INCLUDEDIR)
  set(CMAKE_INSTALL_INCLUDEDIR "include")
endif()

# if(NOT DEFINED CMAKE_BUILD_TYPE)
#   set(CMAKE_BUILD_TYPE "Release")
# endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin CACHE PATH "Single Directory for all Executables.") # in windows , it is also for dll.
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib CACHE PATH "Single Directory for all shared Libraries")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib CACHE PATH "Single Directory for all static archive")

message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_LIBDIR: ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_BINDIR: ${CMAKE_INSTALL_BINDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_INCLUDEDIR: ${CMAKE_INSTALL_INCLUDEDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")

#set linux install rpath
if(K_LINUX)
  # need to set before add_exec... add_lib...
  set(CMAKE_INSTALL_PREFIX "/opt/${PROJECT_NAME}")
  set(path_to_search "/opt/${PROJECT_NAME}/lib")
  set(CMAKE_SKIP_BUILD_RPATH FALSE)
  set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
  set(CMAKE_INSTALL_RPATH ${path_to_search})
  set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
  list(FIND CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES ${path_to_search} isSystemDir)

  if("${isSystemDir}" STREQUAL "-1")
    set(CMAKE_INSTALL_RPATH ${path_to_search})
  endif("${isSystemDir}" STREQUAL "-1")
endif(K_LINUX)

# set and find  Qt
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(QTDIR "" CACHE STRING "use custom Qt root dir, eg:/Users/karl/Downloads/qt-everywhere-src-5.15.5/out/")
if(QTDIR STREQUAL "")
    message(STATUS "Variable 'QTDIR' is not defined.")
else()
    message(STATUS "Variable 'QTDIR' is defined. Value: ${QTDIR}")
    set(CMAKE_PREFIX_PATH ${QTDIR} )
endif()
find_package(QT NAMES  Qt6  Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Widgets)
message(STATUS "Qt version : ${QT_VERSION_MAJOR} - ${QT_VERSION_MINOR}- ${QT_VERSION_PATCH}")
option(K_MACOS_UNIVERSAL  "make sure Qt version is universal or not" ON)
if(K_MACOS AND K_MACOS_UNIVERSAL)
    set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "" FORCE) #;x86_64
endif()

if(K_MACOS)
  set(CMAKE_OSX_DEPLOYMENT_TARGET "10.13" CACHE STRING "Minimum OS X deployment version")
  #info.list
  set(MACOSX_BUNDLE_BUNDLE_NAME "karl-app")
  set(MACOSX_BUNDLE_BUNDLE_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
  set(MACOSX_BUNDLE_SHORT_VERSION_STRING "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
  set(MACOSX_BUNDLE_BUNDLE_IDENTIFIER "com.example.karl-app")
  set(MACOSX_BUNDLE_GUI_IDENTIFIER "com.example.karl-app")
  set(MACOSX_BUNDLE_ICON_FILE app.icns)

  set(AppIcon ${CMAKE_CURRENT_SOURCE_DIR}/resources/icon/app.icns)
  set_source_files_properties(${AppIcon} PROPERTIES
       MACOSX_PACKAGE_LOCATION "Resources")
endif()

# It is best to add specific files
file(GLOB_RECURSE SOURCE_FILE src/*.cc src/*.cpp)
file(GLOB_RECURSE UI_FILE src/*.ui)
file(GLOB_RECURSE HEAD_FILE src/*.h)

# 动态 mathkarl EXCLUDE_FROM_ALL cpack时不将子项目install的内容打包一份
# 因为已经设置CMAKE_RUNTIME_OUTPUT_DIRECTORY 等目录，子项目的目标会生成在主项目设置的目录里
# linux need cmake install. if exclude ,not have submodule install
if(K_WINDOWS)
  add_subdirectory(dependency/mathdll EXCLUDE_FROM_ALL)
else()
  add_subdirectory(dependency/mathdll)
endif(K_WINDOWS)

set(EXTRA_LIBS ${EXTRA_LIBS} mathkarl)

# framelesshelper
# ubuntu need to download gtksudo apt install libgtk-3-0 libgtk-3-dev
# important! Must use Release and  dynamic link when build framelesshelper in ubuntu.
# static and debug will core dump in my vm.
# macOS 14 and arm64e ，need set FRAMELESSHELPER_BUILD_STATIC=ON if you are using unix makefile
if(K_WINDOWS)
  add_subdirectory(3rdparty/framelesshelper EXCLUDE_FROM_ALL)
elseif(K_MACOS)
  #set(FRAMELESSHELPER_BUILD_STATIC ON)
  add_subdirectory(3rdparty/framelesshelper)
else()
  add_subdirectory(3rdparty/framelesshelper)
endif()

set(EXTRA_LIBS ${EXTRA_LIBS} FramelessHelper::Core FramelessHelper::Widgets)

# static link materialui
add_subdirectory(3rdparty/qt-material-widgets)
set(EXTRA_LIBS ${EXTRA_LIBS} materialui)

# add app qrc
if(QT_VERSION_MAJOR GREATER 5)
qt_add_resources(QRC_FILES resources/${PROJECT_NAME}.qrc)
else()
qt5_add_resources(QRC_FILES resources/${PROJECT_NAME}.qrc)
endif()

message(STATUS "QRC_FILES: ${QRC_FILES}")
add_executable(${PROJECT_NAME} WIN32 MACOSX_BUNDLE
  ${HEAD_FILE} ${UI_FILE} ${SOURCE_FILE} ${QRC_FILES} ${AppIcon} )

target_include_directories(${PROJECT_NAME} PRIVATE
  ${PROJECT_SOURCE_DIR}/3rdparty/qt-material-widgets/components
  ${PROJECT_SOURCE_DIR}/3rdparty/framelesshelper/include/FramelessHelper
  ${PROJECT_SOURCE_DIR}/dependency/mathdll
)

if(K_WINDOWS)
  include(3rdparty/framelesshelper/cmake/utils.cmake)
  set(__rc_path "${PROJECT_BINARY_DIR}/${PROJECT_NAME}.rc")

  if(NOT EXISTS "${__rc_path}")
    generate_win32_rc_file(
      PATH "${__rc_path}"
      VERSION "${PROJECT_VERSION}"
      COMPANY "shengengchen"
      DESCRIPTION "karl app use frameless "
      COPYRIGHT "MIT License"
      PRODUCT "karl app"
      ICONS "resources/icon/app.ico"
    )
  endif()

  set(__manifest_path "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_BUILD_TYPE}/${PROJECT_NAME}.manifest")

  if(NOT EXISTS "${__manifest_path}")
    generate_win32_manifest_file(
      PATH "${__manifest_path}"
      ID "org.shengengchen.karl.app"
      VERSION "${PROJECT_VERSION}"
      VISTA_COMPAT
      WIN7_COMPAT
      WIN8_COMPAT
      WIN8_1_COMPAT
      WIN10_COMPAT
      WIN11_COMPAT
      XAML_ISLANDS_COMPAT
      UTF8_CODEPAGE
    )
  endif()

  target_sources(${PROJECT_NAME} PRIVATE
    "${__rc_path}"
    "${__manifest_path}"
  )
endif()

# link module
# option(use_dll "use for test" OFF)
message(STATUS "EXTRA_LIBS : ${EXTRA_LIBS}")

# message(STATUS "use_dll : ${use_dll}")
target_link_libraries(${PROJECT_NAME}
  PUBLIC
  ${EXTRA_LIBS}
  Qt${QT_VERSION_MAJOR}::Core
  Qt${QT_VERSION_MAJOR}::Gui
  Qt${QT_VERSION_MAJOR}::Widgets
  # $<$<BOOL:${use_dll}>:my_dll>
)

# cmake --install out  将out目录下安装(copy)到 ${PROJECT_BINARY_DIR}/installed
# TODO WINDEPLOYQT_DIR
if(K_WINDOWS)
  set(CMAKE_INSTALL_PREFIX ${PROJECT_BINARY_DIR}/installed)
  set(WINDEPLOYQT_DIR "C:/Qt/Qt5.14.2/5.14.2/msvc2017_64/bin")

  # exec windeployqt automatically when build install in VS
  install(CODE "execute_process(COMMAND ${WINDEPLOYQT_DIR}/windeployqt.exe 
				${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_BUILD_TYPE}/${PROJECT_NAME}.exe)")
  install(DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_BUILD_TYPE}/
    DESTINATION ./bin)
  include(InstallRequiredSystemLibraries)

elseif(K_LINUX) # linuxdeployqt need to hand-make
  set(INSTALL_TARGETS ${INSTALL_TARGETS} ${PROJECT_NAME})
  install(TARGETS ${INSTALL_TARGETS} EXPORT Karl-export
    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT lib
    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT lib
    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" COMPONENT bin
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}" COMPONENT dev
  )

  # #### Define the folder you want to delete submodule include
  set(folder_to_delete "${CMAKE_INSTALL_PREFIX}/include/")

  # Add a custom command to remove the folder after installation
  install(
    CODE "message(STATUS \"Removing folder: ${folder_to_delete}\")"
    CODE "file(REMOVE_RECURSE \"${folder_to_delete}\")"
  )
elseif(K_MACOS)
#message(STATUS "macos not use cmake --install")
#include(cmake/tools.cmake)
#find_deploy_qt_tool(qt_deploy_tool)
#message("qt_deploy_tool ${qt_deploy_tool}")
#add_custom_command(
#    TARGET ${PROJECT_NAME} POST_BUILD
#    COMMAND ${CMAKE_COMMAND} -E echo "Build process finished. Running shell command..."
#    COMMAND ${qt_deploy_tool} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.app -dmg
#    COMMENT "Running shell command after build"
#)
endif()


#cpack
if(K_WINDOWS)
  include(cmake/cpackwin.cmake)
elseif(K_LINUX)
  include(cmake/cpacklinux.cmake)
elseif(K_MACOS)
endif()
