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

# 检查 CMAKE_SYSTEM_NAME 变量
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
    # 其他操作系统
    message("---This is an unknown or unsupported operating system.")
    # 在其他平台上执行特定操作
endif()


include(GNUInstallDirs)
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_LIBDIR: ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_BINDIR: ${CMAKE_INSTALL_BINDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_INCLUDEDIR: ${CMAKE_INSTALL_INCLUDEDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")

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
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin CACHE PATH "Single Directory for all Executables.")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib CACHE PATH "Single Directory for all shared Libraries")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib CACHE PATH "Single Directory for all static archive")

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

#set Qt
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#find Qt
find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Widgets)

file(GLOB_RECURSE SOURCE_FILE src/*.cc src/*.cpp)
file(GLOB_RECURSE UI_FILE src/*.ui)
file(GLOB_RECURSE HEAD_FILE src/*.h)

#动态 mathkarl
add_subdirectory (dependency/mathdll)
set (EXTRA_LIBS ${EXTRA_LIBS} mathkarl)

#静态 framelesshelper
# ubuntu need to download gtksudo apt install libgtk-3-0 libgtk-3-dev 
# import! must use Release in ubuntu.
add_subdirectory(3rdparty/framelesshelper)
set (EXTRA_LIBS ${EXTRA_LIBS} FramelessHelper::Core FramelessHelper::Widgets)

#静态 materialui
add_subdirectory(3rdparty/qt-material-widgets)
set (EXTRA_LIBS ${EXTRA_LIBS} materialui)

#添加app资源 
qt5_add_resources(QRC_FILES resources/${PROJECT_NAME}.qrc)

add_executable(${PROJECT_NAME}  WIN32 MACOSX_BUNDLE 
${HEAD_FILE} ${UI_FILE} ${SOURCE_FILE} ${QRC_FILES})

#[[
#------将动态dll copy到exe的路径。
message(STATUS "build type: ${CMAKE_BUILD_TYPE}")
message(STATUS "bin dir :${CMAKE_BINARY_DIR}")
if(NOT CMAKE_BUILD_TYPE)
set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Build type (default Debug)" FORCE)
message(STATUS "build type: ${CMAKE_BUILD_TYPE}")
endif()
# 设置DLL文件的源路径
set(DLL_SOURCE_PATH ${CMAKE_BINARY_DIR}/dependency/mathdll/${CMAKE_BUILD_TYPE}/mathkarl.dll)
# 设置DLL文件的目标路径（构建目录）
set(DLL_DEST_PATH ${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE}/mathkarl.dll)

# 创建自定义命令，用于复制DLL文件
add_custom_command(
    TARGET ${PROJECT_NAME}   # 将这个命令附加到调用DLL的目标上
    POST_BUILD  # 在构建目标之后运行
    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${DLL_SOURCE_PATH} ${DLL_DEST_PATH}
)
# 创建自定义目标，将自定义命令作为依赖
add_custom_target(CopyDLL ALL DEPENDS ${DLL_DEST_PATH})
# 将自定义目标添加到构建目标的依赖关系中
add_dependencies(${PROJECT_NAME} CopyDLL)
]]


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
    set(__manifest_path "${PROJECT_BINARY_DIR}/${CMAKE_BUILD_TYPE}/${PROJECT_NAME}.manifest")
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
				${PROJECT_BINARY_DIR}/Release/${PROJECT_NAME}.exe)")
    install(DIRECTORY ${PROJECT_BINARY_DIR}/Release/ DESTINATION /)
    include (InstallRequiredSystemLibraries) #msvc库会copy到bin目录，需要优化 TODO 
else()
    set(INSTALL_TARGETS ${INSTALL_TARGETS}  ${PROJECT_NAME})
#安装路径
    install(TARGETS ${INSTALL_TARGETS} EXPORT Karl-app
    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)
endif()


#cmake
# 构建一个 CPack 安装包(cmake install的内容打成安装包),切换到out目录，命令行：cpack 
if (K_WINDOWS)
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
endif(K_WINDOWS)
