# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ibroel/dev/Kono

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ibroel/dev/Kono/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Kono_app_unity.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Kono_app_unity.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Kono_app_unity.dir/flags.make

cotire/Kono_app_CXX_prefix.hxx: cotire/Kono_app_CXX_prefix.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ibroel/dev/Kono/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating CXX prefix header cotire/Kono_app_CXX_prefix.hxx"
	/Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Debug -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /Users/ibroel/dev/Kono/Kono/vendor/cotire/CMake/cotire.cmake combine /Users/ibroel/dev/Kono/cmake-build-debug/Kono_app_CXX_Debug_cotire.cmake /Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_prefix.hxx /Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_prefix.cxx

cotire/Kono_app_CXX_unity.cxx: Kono_app_CXX_Debug_cotire.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ibroel/dev/Kono/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating CXX unity source cotire/Kono_app_CXX_unity.cxx"
	cd /Users/ibroel/dev/Kono && /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Debug -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /Users/ibroel/dev/Kono/Kono/vendor/cotire/CMake/cotire.cmake unity /Users/ibroel/dev/Kono/cmake-build-debug/Kono_app_CXX_Debug_cotire.cmake /Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_unity.cxx

cotire/Kono_app_CXX_prefix.cxx: ../Kono/src/knpch.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/ibroel/dev/Kono/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating CXX prefix source cotire/Kono_app_CXX_prefix.cxx"
	/Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Debug -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /Users/ibroel/dev/Kono/Kono/vendor/cotire/CMake/cotire.cmake combine /Users/ibroel/dev/Kono/cmake-build-debug/Kono_app_CXX_Debug_cotire.cmake /Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_prefix.cxx /Users/ibroel/dev/Kono/Kono/src/knpch.h

CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.o: CMakeFiles/Kono_app_unity.dir/flags.make
CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.o: cotire/Kono_app_CXX_unity.cxx
CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.o: cotire/Kono_app_CXX_prefix.hxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/ibroel/dev/Kono/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS)  -include "/Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_prefix.hxx"  -o CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.o -c /Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_unity.cxx

CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS)  -include "/Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_prefix.hxx"  -E /Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_unity.cxx > CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.i

CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS)  -include "/Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_prefix.hxx"  -S /Users/ibroel/dev/Kono/cmake-build-debug/cotire/Kono_app_CXX_unity.cxx -o CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.s

# Object files for target Kono_app_unity
Kono_app_unity_OBJECTS = \
"CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.o"

# External object files for target Kono_app_unity
Kono_app_unity_EXTERNAL_OBJECTS =

Kono_app: CMakeFiles/Kono_app_unity.dir/cotire/Kono_app_CXX_unity.cxx.o
Kono_app: CMakeFiles/Kono_app_unity.dir/build.make
Kono_app: libspdlogd.a
Kono_app: /usr/local/lib/libglfw.3.3.dylib
Kono_app: libGlad.a
Kono_app: libimgui.a
Kono_app: CMakeFiles/Kono_app_unity.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/ibroel/dev/Kono/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable Kono_app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Kono_app_unity.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Kono_app_unity.dir/build: Kono_app

.PHONY : CMakeFiles/Kono_app_unity.dir/build

CMakeFiles/Kono_app_unity.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Kono_app_unity.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Kono_app_unity.dir/clean

CMakeFiles/Kono_app_unity.dir/depend: cotire/Kono_app_CXX_prefix.cxx
CMakeFiles/Kono_app_unity.dir/depend: cotire/Kono_app_CXX_prefix.hxx
CMakeFiles/Kono_app_unity.dir/depend: cotire/Kono_app_CXX_unity.cxx
	cd /Users/ibroel/dev/Kono/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ibroel/dev/Kono /Users/ibroel/dev/Kono /Users/ibroel/dev/Kono/cmake-build-debug /Users/ibroel/dev/Kono/cmake-build-debug /Users/ibroel/dev/Kono/cmake-build-debug/CMakeFiles/Kono_app_unity.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Kono_app_unity.dir/depend
