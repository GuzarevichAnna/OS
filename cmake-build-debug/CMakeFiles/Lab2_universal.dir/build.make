# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2021.2.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2021.2.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/Lab2_universal.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/Lab2_universal.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Lab2_universal.dir/flags.make

CMakeFiles/Lab2_universal.dir/main.cpp.obj: CMakeFiles/Lab2_universal.dir/flags.make
CMakeFiles/Lab2_universal.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Lab2_universal.dir/main.cpp.obj"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\Lab2_universal.dir\main.cpp.obj -c "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\main.cpp"

CMakeFiles/Lab2_universal.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Lab2_universal.dir/main.cpp.i"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\main.cpp" > CMakeFiles\Lab2_universal.dir\main.cpp.i

CMakeFiles/Lab2_universal.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Lab2_universal.dir/main.cpp.s"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\main.cpp" -o CMakeFiles\Lab2_universal.dir\main.cpp.s

# Object files for target Lab2_universal
Lab2_universal_OBJECTS = \
"CMakeFiles/Lab2_universal.dir/main.cpp.obj"

# External object files for target Lab2_universal
Lab2_universal_EXTERNAL_OBJECTS =

Lab2_universal.exe: CMakeFiles/Lab2_universal.dir/main.cpp.obj
Lab2_universal.exe: CMakeFiles/Lab2_universal.dir/build.make
Lab2_universal.exe: CMakeFiles/Lab2_universal.dir/linklibs.rsp
Lab2_universal.exe: CMakeFiles/Lab2_universal.dir/objects1.rsp
Lab2_universal.exe: CMakeFiles/Lab2_universal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Lab2_universal.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\Lab2_universal.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Lab2_universal.dir/build: Lab2_universal.exe
.PHONY : CMakeFiles/Lab2_universal.dir/build

CMakeFiles/Lab2_universal.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\Lab2_universal.dir\cmake_clean.cmake
.PHONY : CMakeFiles/Lab2_universal.dir/clean

CMakeFiles/Lab2_universal.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh" "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh" "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\cmake-build-debug" "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\cmake-build-debug" "A:\FAMCS\3_sem\OS 3 sem\Lab2_windowsh\cmake-build-debug\CMakeFiles\Lab2_universal.dir\DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/Lab2_universal.dir/depend

