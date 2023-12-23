#  karl-app 

<!-- [![CI: Build Test](https://github.com/wangwenx190/framelesshelper/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/wangwenx190/framelesshelper/actions/workflows/ci.yml) -->
- This is a GUI APP Demo base Qt framework. And integration framelesshelper , material ui style, use  cmake etc. 
- framelesshelp in ubuntu 22, need to release,crashing with debug, so do release for ubuntu.


## Screenshots

### Windows

![Light](./doc/win_light.png)

![Dark](./doc/win_dark.png)

### Linux



### macOS


## use this
``` 
    //clone repository
    git clone --recurse-submodules -j8 https://github.com/gengshenchen/karl-app.git
    or 
    git clone https://github.com/gengshenchen/karl-app.git
    git submodule update --recursive --init 
```
### windows

```
    //in dir karl-app, release: 
    cmake -S . -B out -DCMAKE_BUILD_TYPE=Release
    cmake --build out --config Release
    cmake --install out --config Release
    //cpack
    cd out 
    cpack .

     //in dir karl-app, debug: 
     //you can set Qtdir forexample -DQTDIR=C:\Qt\Qt5.14.2\5.14.2 Or CMAKE_PREFIX_PATH=C:\Qt\Qt5.14.2\5.14.2 that contains Src directory, so that in Visual studio IDE can debug into Qt source code more convenient.
    cmake -S . -B out -DCMAKE_BUILD_TYPE=Debug
    cmake --build out --config Debug
    cmake --install out --config Debug
    //Do not cpack iwith debug build
    //cd out  && cpack . and error for debug
```
### linux
```
    //change in dir "karl-app",release,  
    // you can set qtdir -DQTDIR=/opt/Qt5.14.2/5.14.2/gcc_64/
    sudo cmake -S . -B out -DCMAKE_BUILD_TYPE=Release
    sudo cmake --build out --config Release
    //install to /opt/<app-name>/
    sudo cmake --install out --config Release

    //if want to make a pack, change in "out" dir
    //first ubuntu: sudo apt-get install rpm 
    sudo cpack 
    // source pack:
    sudo cpack -G TGZ --config CPackSourceConfig.cmake
    
    // ubuntu install deb pack
    sudo dpkg -i karl-app-1.1.0-Linux.deb 

```
### macos
```
    // generator Unix Makefiles
    cmake -S . -B out  -DK_MACOS_UNIVERSAL=ON -DQTDIR=/Users/karl/Qt/6.6.1/macos   -DFRAMELESSHELPER_NO_SUMMARY=OFF  -DFRAMELESSHELPER_BUILD_STATIC=ON
    cmake --build out --config Release
    //go into the contains "karl-app.app" directory
    macdeployqt karl-app.app -dmg

    //If use Xcode gentetor  make sure FRAMELESSHELPER_BUILD_QUICK=OFF
    cmake -S . -B out  -DK_MACOS_UNIVERSAL=ON -DQTDIR=/Users/karl/Qt/6.6.1/macos   -DFRAMELESSHELPER_NO_SUMMARY=OFF -DFRAMELESSHELPER_ENABLE_UNIVERSAL_BUILD=ON  -DFRAMELESSHELPER_BUILD_STATIC=ON -DFRAMELESSHELPER_BUILD_QUICK=OFF  -GXcode
    
    //pack to dmg file
    //cd root “karl-app” directory ，run build.py, output to installer/bin/ folder
    python3 scripts/build/build.py 
    
```
## Work in progress

- [ ] boost test / google test
- [ ] Valgrind / Sanitizers(LLVM, google) (unix-like)
- [ ] VLD (windows) 
- [ ] boost


## Desigin Doc
- Microsoft: <https://docs.microsoft.com/en-us/windows/apps/design/basics/titlebar-design>
- KDE: <https://develop.kde.org/hig/>
- GNOME: <https://developer.gnome.org/hig/patterns/containers/header-bars.html>
- Apple: <https://developer.apple.com/design/human-interface-guidelines/macos/windows-and-views/window-anatomy/>

## License
