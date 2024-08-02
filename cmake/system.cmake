# CMAKE_SYSTEM_NAME 变量
message(STATUS "${PROJECT_NAME} CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")

if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  message(STATUS "This is macOS.")
  set(KMACOS ON CACHE INTERNAL "This is macOS.")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
  message(STATUS "This is Windows.")
  set(KWINDOWS ON CACHE INTERNAL "This is Windows")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  message(STATUS "This is Linux.")
  set(KLINUX ON CACHE INTERNAL "This is Linux")
else()
  # other system
  message("---This is an unknown or unsupported operating system.")
endif()