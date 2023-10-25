#  karl-app 

<!-- [![CI: Build Test](https://github.com/wangwenx190/framelesshelper/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/wangwenx190/framelesshelper/actions/workflows/ci.yml) -->

- framelesshelp in ubuntu 22, need to release,crashing with debug, so do release for ubuntu.


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


## windows

```
    //in dir karl-app, release: 
    cmake -S . -B out -DCMAKE_BUILD_TYPE=Release
    cmake --build out --config Release
    cmake --install out --config Release
    cd out 
    cpack .

     //in dir karl-app, debug: 
    cmake -S . -B out -DCMAKE_BUILD_TYPE=Debug
    cmake --build out --config Debug
    cmake --install out --config Debug
    // cd out  && cpack .    error for debug
```
## linux
```
    //in dir karl-app, release: 
    cmake -S . -B out -DCMAKE_BUILD_TYPE=Release
    cmake --build out --config Release
    cmake --install out --config Release
```

## Desigin Doc
- Microsoft: <https://docs.microsoft.com/en-us/windows/apps/design/basics/titlebar-design>
- KDE: <https://develop.kde.org/hig/>
- GNOME: <https://developer.gnome.org/hig/patterns/containers/header-bars.html>
- Apple: <https://developer.apple.com/design/human-interface-guidelines/macos/windows-and-views/window-anatomy/>

## Platform Notes

### Windows

## License
