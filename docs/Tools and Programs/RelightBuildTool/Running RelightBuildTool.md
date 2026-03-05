# Running RelightBuildTool

## Requirements

- Python 3
- colorama 0.4.4

## Running RBT

To run the program, you must run the python runtime, The program iteself is located at `Programs/RelightBuildTool`, and you must run main.py in that directory

If you are running the program through a terminal, the command you run would be:

```
Python main.py {Arguments}
```

## Command line arguments

### Global commands (can be used in any modes)

`-Mode={String}` - The mode we will run, if left empty, we will run Build mode by default. (for options and information on modes, check [Other Modes](../Other Modes))

`-Project={String}` - The full path of the .RProject file that will be compiled

`-Target={String}` - The file name of the target file without extension (Only used when `-Project` is not defined)

`-TargetDir={String}` - The directory of the target file to search (Only used when `-Project` is not defined)

`-Platform={String}` - The platform and SDK we will compile/use. We will use developer's platform by default

`-Arch={String}` - The architecture we will compile/use. Default is x86

`-BuildType={String}` - The type of build we will compile (Final, Development, or Debug), default is Development

`-NoMessages={Boolean}` - If true, then we will not print log details in the terminal. Default is false

`-NoLog={Boolean}` - If true, we will not log information into a text file. Default is false

### Build commands

`-Module={String}` - The modules to compile, even if they are not defined in Target file

`-Precompile={Boolean}` - If true, then we will use existing modules instead of compiling the engine from scratch. Default is false

`-Cook={Boolean}` - If true, then we will automatically run RelightCookerTool with default parameters while building. Default is false (for more imformation, check [RelightCookerTool](../../RelightCookerTool))

### Clean commands

`-Ignore-Bin={Boolean}` - If true, we will ignore the bin directory when cleaning. Default is false

`-Ignore-Intermediate={Boolean}` - If true, we will ignore the intermediate directory when cleaning. Default is false

`-Ignore-Cooked={Boolean}` - If true, we will ignore the Cooked directory (Configs, content, shaders, etc) when cleaning. Default is false

!!! danger "Dangerous clean options"
    The following clean mode arguments are dangerous and can delete important files without warning. Only use at your own risk!

`--Ignore-All-Confirmation={Boolean}` - If true, then we will only ask for confirmation once, and will never ask again. Default is false

`--Verify-Sus-Directories={Boolean}` - instead of closing RBT when encountering a suspicious directory to delete, we will instead ask the user if they wish to continue. Default is false

`--Clean-Everything={Boolean}` - Delete all files in a directory instead of specified extensions. Default is false

## Building the engine

Scripts for common platforms to build the engine is located in the `Build` directory of Relight Engine. If you wish to build the engine from scratch, then you would run RBT on the Relight Engine target file. An example of the command is the following:

```bash
python main.py -Target=RelightEngine -TargetDir=../../ -Platform=Linux -Arch=x86 -Cook=True
```
