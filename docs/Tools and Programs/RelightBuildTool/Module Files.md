# Module Files

!!! warning "malicious code risk"
    Module files can contain code that could harm your computer, since it uses python as a backend. Please check and verify any module files you see online

Module files (`.Module`) are files that acts as a configuration for a specific module in your project/engine.

## Syntax

just like Target files, Module files internally uses python, meaning all syntax and libraries are the exact same as python

## Read-only configs

The following are settings that cannot be set by the module file, but can be read, allowing for more personalized settings

`TARGET_NAME` - A string that contains the name of the target

`TARGET_DIRECTORY` - A String that contains the directory of the target

`PROJECT` - A String that contains the full project name and directory

`PLATFORM` - A String that contains the platform we are compiling on

`PLATFORM_GROUP` - A String that contains the platform group we are compiling on

`FILEPATH` - A String that contains the full file path of the target file

`FilePath` - A string that contains the full file path and file name of a module (Directory and file name)

`ModuleDirectory` - A String that contains the full file path of a module (Just the directory)


## Module Configs

Configuration that will control the specific module. The following is all the options you can set

### Global Configs

`Name = {String}` - The name of the module

`ObjectName = {String}` - The name of the object, mainly should be used as a replacement for long module names

`Description = {String}` - The description of the module, mainly used for documentation and debugging

`Type = {String}` - The type of module. `Internal` is a Relight-based project, while `External` is a 3rd-party project. Default is `Internal`

`Modules = {String List}` - The list of dependencies this module requires

`ModulesIncludes = {String List}` - Names of Modules we will include

`Includes = {String List}` - All directories we will include

`SysIncludes = {String List}` - includes that act like system (might be used by some 3rd party)

`Defines = {String List}` - Defines for this specific module

`DynamicModulePaths = {String List}` - Directories to search for dynamic libraries

`Static3rdParty = {String List}` - Static libraries for 3rd parties (.a/.lib)

`ThirdParty = {String List}` - Third party software this module will use, will be added to Static3rdParty and Includes

`Optimization = {String}` - What level of optimization we should use, less optimization = faster compiling and debugging, but bigger file size

`DisableUnity = {Boolean}` - If true, we will not use UNITY system on this module, even if the target/project file allows UNITY. Default is false

`RTTI = {Boolean}` - if we should use RTTI (run time type information). Default is false

`AVX = {Boolean}` - if we should use AVX instructions. Default is false

`AutoIncludeModules = {Boolean}` - If true, then we will automatically append Includes to have Modules, you will have to manually do it if false. Default is true

`IsEngineModule = {Boolean}` - If true, we will treat it as a engine module (put module in engine dir instead of project dir). Default is false

`ModuleUnityMinSourceFiles = {Integer}` - The amount of source files needed to use Unity files, will override Target. Leave number negative to disable override, requires Unity to be true in target. Default is -1

### Third Party Only Configs

`AdditionalLibs = {String List}` - Additional Libraries to append

`CommandToRun = {String List}` - The command to run for third party
