# Target Files

!!! warning "malicious code risk"
    Target files can contain code that could harm your computer, since it uses python as a backend. Please check and verify any target files you see online

Target files (`.Target`) are files that acts as a configuration for the final binary output (executable or dynamic library). All configuration in this target will represent everything in the executable itself.

## Syntax

Target files internally uses python, meaning all syntax and libraries are the exact same as python

## Read-only configs

The following are settings that cannot be set by the target file, but can be read, allowing for more personalized settings

`TARGET_NAME` - A string that contains the name of the target

`TARGET_DIRECTORY` - A String that contains the directory of the target

`PROJECT` - A String that contains the full project name and directory

`PLATFORM` - A String that contains the platform we are compiling on

`PLATFORM_GROUP` - A String that contains the platform group we are compiling on

`FILEPATH` - A String that contains the full file path of the target file

## Target Configs

Configuration that will control the final execuatble. The following is all the options you can set

### Universial

`Name = {String}` - The name of the target, will be used as the executable name (unless project file or command argument overrides it). If blank or none, we will use the target file name instead

`TargetType = {String}` - The target type, can be either `Game`, `Editor`, `Client`, `Server`, or `Program`. Used for enabiling some settings

`BuildType = {String}` - The Build type, determines what debugging tools we should include, can be either `Debug`, `Development`, and `Final`

`LinkType = {String}` - The type of link, if it’s `Monolithic`, it’s all in the same executable, if it’s `Modular`, then each module is a dynamic library alongside the executable. The default alue is `Default` (which will switch between the modes depending on the project type)

`IntermediateType = {String}` - The intermediate type, if it's `Shared`, then all Engine code would be in engine intermediate, while `Unique` is for Everything, even Engine code, to be in project intermediate (which will switch between the modes depending on the project type)

`Modules = {String List}` - All additional dependencies for the target to compile

`DisableDebugInfo = {Boolean}` - If true, will not create any debug related files. Default is false

`IsDynamicLibrary = {Boolean}` - If true, then instead of compiling this target as an executable, we compile it as a library. Default is false

`CompileEditor = {Boolean}` - If true, we will compile the editor, otherwise we do not need to compile the editor. Default is false

`UseCompiledEngine = {Boolean}` - If true, we will use existing Engine static libraries via intermediate directories instead of compiling the engine each time. Default is false

`Unity = {Boolean}` - If true, we will use the UNITY system, which will combine all .cpp files in each module into a single file. Default is true

`Defines = {String List}` - Defines that will be spread throughout every module

`IncludeLaunch = {Boolean}` -  If true, then we will include the module that launches the application, otherwise the first included module listed in `Modules` will be used as launcher instead. Default is false

`LaunchName = {String}` - If IncludeLaunch is true, then this would be the module name that would launch the application, default is `Launch`

`ExtraCompileArgs = {String}` - Any additional arguments to pass when compiling

`ExtraLinkingArgs = {String}` - Any additional arguments to pass when linking

`LinkFilesTogether = {Boolean}` - If true, we will link object files into final binary, if false, we will just output the object files. Default is true

`Arch = {String}` - The arch to compile if none is defined, default is "x86"

`CopyIncToIntermediate = {Boolean}` - if true, we will copy all header files to the intermediate folder. This will be used mostly for precompiled engine binaries. Default is False

`Precompiled = {Boolean}` - If true, then any engine module will use precompiled binaries. Musch faster for those who are not modifying Engine Code. Default is true

`AlwaysCompileThirdParty = {Boolean}` - If true, we will skip building Third party dependencies and assume the Third Party is already compiled. Default is false

`UnityMinSourceFiles = {Integer}` - The amount of source files needed to use Unity files, requires Unity to be true. Leave 0 to always use Unity. Default is 0

`ToolchainOverride = {NONE}` - A toolchain we will override

`BinSubPaths = {NONE}` - if not empty, we will put the binaries in a subfolder

### Linux

`UseAddressSanitizer = {Boolean}` - If we should use Address Sanitizer. Default is false

`UseThreadSanitizer = {Boolean}` - If we should use Thread Sanitizer. Default is false

`UseUnknownSanitizer = {Boolean}` - If we should use Undefined/Unknown Sanitizer. Default is false

`SavePSYM = {Boolean}` - If true, we will save portable symbol file. Default is false
