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
CMAKE_SOURCE_DIR = "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/User.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/User.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/User.dir/flags.make

CMakeFiles/User.dir/main.cpp.obj: CMakeFiles/User.dir/flags.make
CMakeFiles/User.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/User.dir/main.cpp.obj"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\User.dir\main.cpp.obj -c "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\main.cpp"

CMakeFiles/User.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/User.dir/main.cpp.i"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\main.cpp" > CMakeFiles\User.dir\main.cpp.i

CMakeFiles/User.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/User.dir/main.cpp.s"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\G__~1.EXE $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\main.cpp" -o CMakeFiles\User.dir\main.cpp.s

# Object files for target User
User_OBJECTS = \
"CMakeFiles/User.dir/main.cpp.obj"

# External object files for target User
User_EXTERNAL_OBJECTS =

User.exe: CMakeFiles/User.dir/main.cpp.obj
User.exe: CMakeFiles/User.dir/build.make
User.exe: CMakeFiles/User.dir/linklibs.rsp
User.exe: CMakeFiles/User.dir/objects1.rsp
User.exe: CMakeFiles/User.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable User.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\User.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/User.dir/build: User.exe
.PHONY : CMakeFiles/User.dir/build

CMakeFiles/User.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\User.dir\cmake_clean.cmake
.PHONY : CMakeFiles/User.dir/clean

CMakeFiles/User.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User" "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User" "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\cmake-build-debug" "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\cmake-build-debug" "A:\FAMCS\3_sem\OS 3 sem\Lab4_Lin\User\cmake-build-debug\CMakeFiles\User.dir\DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/User.dir/depend

