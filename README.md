#  karl-app 

<!-- [![CI: Build Test](https://github.com/wangwenx190/framelesshelper/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/wangwenx190/framelesshelper/actions/workflows/ci.yml) -->

- framelesshelp in ubuntu 22, need to release,crashing with debug, so do release for ubuntu.

## Join with Us :triangular_flag_on_post:

You can join our [Discord channel](https://discord.gg/grrM4Tmesy) to communicate with us. You can share your findings, thoughts and ideas on improving / implementing FramelessHelper functionalities on more platforms and apps!

## TODO



## Screenshots

### Windows

![Light](./doc/win_light.png)

![Dark](./doc/win_dark.png)

### Linux

![Light](./doc/linux_light.png)

![Dark](./doc/linux_dark.png)

### macOS

![Light](./doc/mac_light.png)

![Dark](./doc/mac_dark.png)


## Build

```bash
git clone --recursive https://github.com/wangwenx190/framelesshelper.git # "--recursive" is necessary to clone the submodules.
mkdir build # Please change to your own build directory!
cd build
cmake -DCMAKE_PREFIX_PATH=<YOUR_QT_SDK_DIR_PATH> -DCMAKE_INSTALL_PREFIX=<WHERE_YOU_WANT_TO_INSTALL> -DCMAKE_BUILD_TYPE=Release -GNinja <PATH_TO_THE_REPOSITORY>
cmake --build . --config Release --target all --parallel
cmake --install . --config Release --strip # Don't add "--strip" for MSVC/Clang-CL/Intel-CL toolchains!
# YOUR_QT_SDK_DIR_PATH: the Qt SDK directory, something like "C:/Qt/6.5.1/msvc2019_64" or "/opt/Qt/6.5.1/gcc_64". Please change to your own path!
# WHERE_YOU_WANT_TO_INSTALL: the install directory of FramelessHelper, something like "../install". You can ignore this setting if you don't need to install the CMake package. Please change to your own path!
# PATH_TO_THE_REPOSITORY: the source code directory of FramelessHelper, something like "../framelesshelper". Please change to your own path!
```



- Microsoft: <https://docs.microsoft.com/en-us/windows/apps/design/basics/titlebar-design>
- KDE: <https://develop.kde.org/hig/>
- GNOME: <https://developer.gnome.org/hig/patterns/containers/header-bars.html>
- Apple: <https://developer.apple.com/design/human-interface-guidelines/macos/windows-and-views/window-anatomy/>

## Platform Notes

### Windows
## Special Thanks

*Ordered by first contribution time (it may not be very accurate, sorry)*

- [Yuhang Zhao](https://github.com/wangwenx190): Help me create this project. This project is mainly based on his code.

- And also thanks to other contributors not listed here! Without their valuable help, this library wouldn't have such good quality and user experience!

## License

```text
MIT License

Copyright (C) 2021-2023 by wangwenx190 (Yuhang Zhao)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

add by karlchen.me