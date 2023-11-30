# CMAKE_SYSTEM_NAME 变量
message(STATUS "${PROJECT_NAME} CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")

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