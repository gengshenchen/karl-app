cmake_minimum_required(VERSION 3.22.0)
if (POLICY CMP0065)
  # do not export symbols from executables
  # affects compiler checks in project(), so must be set before it
  cmake_policy(SET CMP0065 NEW)
endif()

#set PROJECT_NAME and version
project(karl-app)
set(VERSION_MAJOR 1)
set(VERSION_MINOR 1)
set(VERSION_PATCH 0)

#  CMAKE_SYSTEM_NAME 变量
message(STATUS "CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")
if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    message("This is macOS.")
    set(K_MACOS TRUE)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message("This is Windows.")
    set(K_WINDOWS TRUE)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message("This is Linux.")
    set(K_LINUX TRUE)
else()
    # other system
    message("---This is an unknown or unsupported operating system.")
endif()

include(GNUInstallDirs) #for unix and unix like
if (NOT DEFINED CMAKE_MODULE_PATH)
  set(CMAKE_MODULE_PATH "")
endif()
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake" "${CMAKE_MODULE_PATH}")

if (NOT DEFINED CMAKE_INSTALL_LIBDIR)
  set(CMAKE_INSTALL_LIBDIR "lib")
endif()
if (NOT DEFINED CMAKE_INSTALL_BINDIR)
  set(CMAKE_INSTALL_BINDIR "bin")
endif()
if (NOT DEFINED CMAKE_INSTALL_INCLUDEDIR)
  set(CMAKE_INSTALL_INCLUDEDIR "include")
endif()

if (POLICY CMP0054)
  # do not expand quoted arguments
  cmake_policy(SET CMP0054 NEW)
endif()
if (POLICY CMP0060)
  # link libraries by full path
  cmake_policy(SET CMP0060 NEW)
endif()
if (POLICY CMP0074)
  # use environment variables to find libraries
  cmake_policy(SET CMP0074 NEW)
endif()
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin 
CACHE PATH "Single Directory for all Executables.") # in windows , it is also for dll.  
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib
 CACHE PATH "Single Directory for all shared Libraries")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib 
CACHE PATH "Single Directory for all static archive")

message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_LIBDIR: ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_BINDIR: ${CMAKE_INSTALL_BINDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_INCLUDEDIR: ${CMAKE_INSTALL_INCLUDEDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")

if(K_LINUX)
  # need be seted before add_exec... add_lib...
  set (CMAKE_INSTALL_PREFIX "/opt/${PROJECT_NAME}")
  set (path_to_search  "/opt/${PROJECT_NAME}/lib")
  set(CMAKE_SKIP_BUILD_RPATH FALSE)
  set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
  set(CMAKE_INSTALL_RPATH ${path_to_search})
  set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
  list(FIND CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES ${path_to_search} isSystemDir)
  if("${isSystemDir}" STREQUAL "-1")
      set(CMAKE_INSTALL_RPATH ${path_to_search})
  endif("${isSystemDir}" STREQUAL "-1")
endif(K_LINUX)

#set and find  Qt 
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Widgets)

#It is best to add specific files
file(GLOB_RECURSE SOURCE_FILE src/*.cc src/*.cpp)
file(GLOB_RECURSE UI_FILE src/*.ui)
file(GLOB_RECURSE HEAD_FILE src/*.h)

#动态 mathkarl EXCLUDE_FROM_ALL cpack时不将子项目install的内容打包一份
#因为已经设置CMAKE_RUNTIME_OUTPUT_DIRECTORY 等目录，子项目的目标会生成在主项目设置的目录里
if(K_WINDOWS)
  add_subdirectory (dependency/mathdll EXCLUDE_FROM_ALL)
else()
  add_subdirectory (dependency/mathdll)
endif(K_WINDOWS)
set (EXTRA_LIBS ${EXTRA_LIBS} mathkarl)

# framelesshelper
# ubuntu need to download gtksudo apt install libgtk-3-0 libgtk-3-dev 
# important! Must use Release and  dynamic link in ubuntu. static and debug will core dump in my vm.
if(K_WINDOWS)
  add_subdirectory (3rdparty/framelesshelper EXCLUDE_FROM_ALL)
else()
  add_subdirectory (3rdparty/framelesshelper) 
  #linux need cmake install. if exclude ,not have submodule install
endif(K_WINDOWS)
set (EXTRA_LIBS ${EXTRA_LIBS} FramelessHelper::Core FramelessHelper::Widgets)

#static link materialui
add_subdirectory(3rdparty/qt-material-widgets)
set (EXTRA_LIBS ${EXTRA_LIBS} materialui)

#add app qrc  
qt5_add_resources(QRC_FILES resources/${PROJECT_NAME}.qrc)

add_executable(${PROJECT_NAME}  WIN32 MACOSX_BUNDLE 
${HEAD_FILE} ${UI_FILE} ${SOURCE_FILE} ${QRC_FILES})

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

#link module
message(STATUS "EXTRA_LIBS : ${EXTRA_LIBS}")
target_link_libraries(${PROJECT_NAME}
	PUBLIC
	${EXTRA_LIBS}
	Qt5::Core
	Qt5::Gui
	Qt5::Widgets
	)

#cmake --install out  将out目录下安装(copy)到 ${PROJECT_BINARY_DIR}/installed
#TODO WINDEPLOYQT_DIR
if (K_WINDOWS)
    set(CMAKE_INSTALL_PREFIX ${PROJECT_BINARY_DIR}/installed)
    set(WINDEPLOYQT_DIR "C:/Qt/Qt5.14.2/5.14.2/msvc2017_64/bin")
    #exec windeployqt automatically when build install in VS
    install(CODE "execute_process(COMMAND ${WINDEPLOYQT_DIR}/windeployqt.exe 
				${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_BUILD_TYPE}/${PROJECT_NAME}.exe)")
    install(DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${CMAKE_BUILD_TYPE}/
     DESTINATION ./bin)
    include (InstallRequiredSystemLibraries) 

elseif(K_LINUX) # linuxdeployqt need to hand-make
    set(INSTALL_TARGETS ${INSTALL_TARGETS} ${PROJECT_NAME})
    install(TARGETS ${INSTALL_TARGETS} EXPORT Karl-export
    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)
# #### Define the folder you want to delete submodule include 
set(folder_to_delete "${CMAKE_INSTALL_PREFIX}/include/")
# Add a custom command to remove the folder after installation
install(
    CODE "message(STATUS \"Removing folder: ${folder_to_delete}\")"
    CODE "file(REMOVE_RECURSE \"${folder_to_delete}\")"
)
endif()

#cmake
# 构建一个 CPack 安装包(cmake install的内容打成安装包,release版本),切换到out目录，命令行：cpack 
if (K_WINDOWS )
  if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CPACK_GENERATOR NSIS)
    set(CPACK_OUTPUT_FILE_PREFIX ${PROJECT_BINARY_DIR}/installer/)
    set(CPACK_PACKAGE_NAME "${PROJECT_NAME}-installer")
    set(CPACK_PACKAGE_VERSION_MAJOR ${VERSION_MAJOR})
    set(CPACK_PACKAGE_VERSION_MINOR ${VERSION_MINOR})
    set(CPACK_PACKAGE_VERSION_PATCH ${VERSION_PATCH})
    set(CPACK_PACKAGE_VENDOR  "My company")
    #set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
    set(CPACK_PACKAGE_INSTALL_DIRECTORY ${PROJECT_NAME})
    message(STATUS "CPack generators: ${CPACK_GENERATOR}")
    INCLUDE(CPack)
  endif()
endif(K_WINDOWS)
