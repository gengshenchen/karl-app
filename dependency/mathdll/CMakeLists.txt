cmake_minimum_required(VERSION 3.22.0)
if (POLICY CMP0065)
  # do not export symbols from executables
  # affects compiler checks in project(), so must be set before it
  cmake_policy(SET CMP0065 NEW)
endif()
project(mathkarl
    VERSION "1.1.0"
    LANGUAGES CXX C
    DESCRIPTION "Cross-platform mathkarl."
    HOMEPAGE_URL "toorich.top"
)

include(GNUInstallDirs)
if (NOT DEFINED CMAKE_MODULE_PATH)
  set(CMAKE_MODULE_PATH "")
endif()
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/" "${CMAKE_MODULE_PATH}")

if (NOT DEFINED CMAKE_INSTALL_LIBDIR)
  set(CMAKE_INSTALL_LIBDIR "lib")
endif()
if (NOT DEFINED CMAKE_INSTALL_BINDIR)
  set(CMAKE_INSTALL_BINDIR "bin")
endif()
if (NOT DEFINED CMAKE_INSTALL_INCLUDEDIR)
  set(CMAKE_INSTALL_INCLUDEDIR "include")
endif()

message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_LIBDIR: ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_BINDIR: ${CMAKE_INSTALL_BINDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_INSTALL_INCLUDEDIR: ${CMAKE_INSTALL_INCLUDEDIR}")
message(STATUS "${PROJECT_NAME} CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")
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

file(GLOB_RECURSE SOURCE_FILE *.cc *.cpp)
file(GLOB_RECURSE HEAD_FILE *.h)

# 生成链接库 SHARED or  STATIC
# add_library (mathkarl  SHARED ${DIR_LIB_SRCS})
add_library (${PROJECT_NAME} SHARED ${HEAD_FILE} ${SOURCE_FILE})

set(INSTALL_TARGETS ${INSTALL_TARGETS}  ${PROJECT_NAME})
# # 指定 MathKarl 库的安装路径
install(TARGETS ${INSTALL_TARGETS} EXPORT MathKarl
  LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}" 
  ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}" 
  RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"  
  INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}" 
)

#install (TARGETS mathkarl DESTINATION /) #lib
#install (FILES mathdll.h DESTINATION include)
