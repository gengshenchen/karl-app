# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.9/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.9/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/karl/work/karl-app

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/karl/work/karl-app/installer

# Utility rule file for FramelessHelperQuick_qmltyperegistration.

# Include any custom commands dependencies for this target.
include 3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/compiler_depend.make

# Include the progress variables for this target.
include 3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/progress.make

3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration: 3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp
3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration: 3rdparty/framelesshelper/imports/org/wangwenx190/FramelessHelper/plugins.qmltypes

3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: 3rdparty/framelesshelper/src/quick/qmltypes/FramelessHelperQuick_foreign_types.txt
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: 3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/./libexec/qmltyperegistrar
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6qml_relwithdebinfo_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6core_relwithdebinfo_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6network_relwithdebinfo_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6gui_relwithdebinfo_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6qmlmodels_relwithdebinfo_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6quick_relwithdebinfo_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6opengl_relwithdebinfo_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6quicktemplates2_relwithdebinfo_metatypes.json
3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp: /Users/karl/Qt/6.6.1/macos/metatypes/qt6quickcontrols2_relwithdebinfo_metatypes.json
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/karl/work/karl-app/installer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic QML type registration for target FramelessHelperQuick"
	cd /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick && /Users/karl/Qt/6.6.1/macos/libexec/qmltyperegistrar --generate-qmltypes=/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/imports/org/wangwenx190/FramelessHelper/plugins.qmltypes --import-name=org.wangwenx190.FramelessHelper --major-version=1 --minor-version=0 @/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/qmltypes/FramelessHelperQuick_foreign_types.txt -o /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json
	cd /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick && /opt/homebrew/Cellar/cmake/3.27.9/bin/cmake -E make_directory /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/.generated
	cd /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick && /opt/homebrew/Cellar/cmake/3.27.9/bin/cmake -E touch /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/.generated/plugins.qmltypes

3rdparty/framelesshelper/imports/org/wangwenx190/FramelessHelper/plugins.qmltypes: 3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp
	@$(CMAKE_COMMAND) -E touch_nocreate 3rdparty/framelesshelper/imports/org/wangwenx190/FramelessHelper/plugins.qmltypes

3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json: 3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json.gen
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/karl/work/karl-app/installer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating meta_types/qt6framelesshelperquick_release_metatypes.json"
	cd /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick && /opt/homebrew/Cellar/cmake/3.27.9/bin/cmake -E true

3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json.gen: /Users/karl/Qt/6.6.1/macos/./libexec/moc
3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json.gen: 3rdparty/framelesshelper/src/quick/meta_types/FramelessHelperQuick_json_file_list.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/karl/work/karl-app/installer/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Running moc --collect-json for target FramelessHelperQuick"
	cd /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick && /Users/karl/Qt/6.6.1/macos/libexec/moc -o /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json.gen --collect-json @/Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/meta_types/FramelessHelperQuick_json_file_list.txt
	cd /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick && /opt/homebrew/Cellar/cmake/3.27.9/bin/cmake -E copy_if_different /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json.gen /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json

FramelessHelperQuick_qmltyperegistration: 3rdparty/framelesshelper/imports/org/wangwenx190/FramelessHelper/plugins.qmltypes
FramelessHelperQuick_qmltyperegistration: 3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration
FramelessHelperQuick_qmltyperegistration: 3rdparty/framelesshelper/src/quick/framelesshelperquick_qmltyperegistrations.cpp
FramelessHelperQuick_qmltyperegistration: 3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json
FramelessHelperQuick_qmltyperegistration: 3rdparty/framelesshelper/src/quick/meta_types/qt6framelesshelperquick_release_metatypes.json.gen
FramelessHelperQuick_qmltyperegistration: 3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/build.make
.PHONY : FramelessHelperQuick_qmltyperegistration

# Rule to build all files generated by this target.
3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/build: FramelessHelperQuick_qmltyperegistration
.PHONY : 3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/build

3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/clean:
	cd /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick && $(CMAKE_COMMAND) -P CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/cmake_clean.cmake
.PHONY : 3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/clean

3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/depend:
	cd /Users/karl/work/karl-app/installer && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/karl/work/karl-app /Users/karl/work/karl-app/3rdparty/framelesshelper/src/quick /Users/karl/work/karl-app/installer /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick /Users/karl/work/karl-app/installer/3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : 3rdparty/framelesshelper/src/quick/CMakeFiles/FramelessHelperQuick_qmltyperegistration.dir/depend

