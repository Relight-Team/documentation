# Using a Custom SDK

SDK in the context of Relight Engine is a peice of software(s) that allows RelightBuildTool to build the engine and project to a specified platform. SDK's can support binary and other python files that are needed to compile to a specific platform

## All valued locations

Official SDK created by the Relight Team are located in the `Programs/RelightBuildTool/SDK`, all unofficial SDKs are located at `Extras/CustomSDK`

## Getting the template and using it as a base

The SDK Template is located at `Extras/CustomSDK/Example/`. This contains documentation and examples of all important functions needed to compile the engine/project to the desired platform. The platform name must be in front of any other text (for example, if the platform is System, then the file names should be `SystemPlatform`, `SystemPlatformSDK`, etc).

## All required files

`PlatformSDK` - Checks for requirements for the SDK, some actions include validating SDK files, checking if SDK is destructive, etc.

`Platform` - Holds configurations and definitions for the platforms, example includes binary extensions, if we should create debug info, etc

`PlatformFactory` - Interface for RBT. Allows RBT to interact with the rest of the required files, registers SDK and platform class.

`Toolchain` - handles the process of compiling and linking c/cpp files together, uses Actions

## Using Action in Toolchain

in the Toolchain class, developers is expected to use Actions. Actions are objects that store the commands to run.

```python
NewAction = Action.Action()
```

This creates a new Action class

```python
Action.CommandPath = {String}
```

this will set the main program to run (example `'/home/software/CoolPlatformSDK/CoolPlatformSDK.bin'`

```python
Action.Arguments = {String}
```

All arguments we will run with the program (example `'-Compile all -SetCoolStuff=false'`)

## Compile Environment Class

The Compile Environment holds all configuration for the [Compiler](../Behind the Scenes/How Compiling Works/#compiler) and [Assembler](../Behind the Scenes/How Compiling Works/#assembler). These will be defined during the RBT build pipeline, and can be used by the toolchain to read configuration and apply them

`Plat = {Platform enum}` - The platform we are compiling (note: pre-defined in RBT, may not be needed)

`Conf = {None}` - What debugging mode we will use

`PCH_Act = {CompileEnvironment.PCHAction}` - The action we will use for PCH files. Default is Null

`Out = {CompileEnvironment.Output}` - All output info

`Arch = {String}` - The CPU architecture

`SharedPCH = {String List}` - The Precompiled Header file we will use globally

`PCHIncludeName = {String}` - The name of the header file we will precompile

`UseSharedBuildEnv = {Boolean}` - Create shared environment. Default is false

`UseAVX = {Boolean}` - If we should use Advanced Vector Extensions. Default is false

`UseRTTI = {Boolean}` - If we should use Run-Time Type Information. Default is false

`UseInlining = {Boolean}` - If we should use function inlining. Default is false

`BufferSecurityChecks = {Boolean}` - If we should use buffer security checks. Default is true

`FalseUnityOverride = {Boolean}` - Use if it's faster to not use UNITY system, will disable UNITY even if it's on. Default is false

`MinUnitySource = {Integer}` - The amount of files needed to enable Unity. Default is 0

`MinPCHSource = {Integer}` - The amount of files needed before we use Precompiled Header. Default is 0

`BuildLocallySNDBS = {Boolean}` - Build Locally when using SN-DBS. Default is false

`ExceptionHandling = {Boolean}` - If we should do Exception Handling. Default is false

`ShadowVariableWarnings = {Boolean}` - If we should give warnings about Shadow Variables. Default is true

`ShadowVariableAsError = {Boolean}` - If we shall give an error if there's a shadow variable. Default is false

`UndefinedIdentifierWarnings = {Boolean}` - If we should give warnings about Undefined Identifiers. Default is true

`UndefinedIdentifierAsError = {Boolean}` - If we shall give an error if there's an Undefined Identifiers. Default is false

`Optimize = {Boolean}` - If true, we will optimize the binary. Default is false

`OptimizeSize = {Boolean}` - If true, we will optimize for smallest possible size. Default is false

`AddDebugInfo = {Boolean}` - If we should create Debug information. Default is true

`IsLibrary = {Boolean}` - If we are compiling static library (.a/.lib). Default is false

`IsDynamic = {Boolean}` - If we are compiling dynamically (.so/.dll). Default is false

`UseStaticCRT = {Boolean}` - If we should compile using statically-linked CRT. Default is false

`UseDebugCRT = {Boolean}` - If we should use Debug CRT. Default is false

`ExcludeFramePointers = {Boolean}` - If true, we shall not include frame pointers. Default is true

`IncrementalLinking = {Boolean}` - If true, we shall only link files that are updated. Default is true

`AllowLTCG = {Boolean}` - If we should use link time code generation. Default is false

`PGOProfile = {Boolean}` - If we should use Profile Guided Optimization Instrumentation. Default is false

`PGOOptimize = {Boolean}` - If we should optimize using Profile Guided Optimization. Default is false

`PGODirectory = {String}` - Directory where PGO is stored

`PGOFilePrefix = {String}` - Filename where PGO is stored

`PrintTimingInfo = {Boolean}` - If true, we will log timing info from the compiler we are using. Default is false

`GenerateDependFile = {Boolean}` - If true, we shall Put Dependencies file along with output build products. Default is true

`AllowRemotelyCompiledPCHs = {Boolean}` - If true, we shall let XGE compile PCH files externally, instead of locally. Default is false

`UserIncPaths = {String List}` - Included paths

`SysIncPaths = {String List}` - Included System paths, will supress warnings

`CheckSysHeaderForChanges = {Boolean}` - If headers in SysIncPaths are modified, then the action is outdated. Default is false

`ForceIncFiles = {String List}` - Paths to include no matter what

`Defines = {String List}` - Definitions we will use across the engine

`AdditionalArgs = {String}` - Any additional arguments we will use

`AdditionalFrameworks = {String List}` - Any additional Frameworks we will use

`PCHFile = {None}` - The Precompiled Header file

`UsingRHT = {Boolean}` - If we are using Relight Header Tool. Default is false

`HideSymbols = {Boolean}` - If we should hide Symbols by default. Default is false

`CopyIncToIntermediate = {Boolean}` - If we should copy header files to intermediate. Default is false

## Linker Environment Class

The Link Environment holds all configuration for the [Linker](../Behind the Scenes/How Compiling Works#linker). These will be defined during the RBT build pipeline, and can be used by the toolchain to read configuration and apply them

`Platform = {None}` - The platform we are compiling

`Config = {None}` - The config we are compiling

`Arch = {String}` - The arch we are linking

`BundleDir = {String}` - Bundle software path on MacOS

`OutputDir = {String}` - The directory that will store non-binary data in

`IntermediateDir = {String}` - The intermediate directory

`LocalShadowDir = {None}` - The local shadow directory, this directory serves as a temp directory of source files, mainly used when linking via mutliple servers

`OutputPaths = {String List}` - The full output binary files and it's path that this linker will produce

`LibraryPaths = {String List}` - Paths to search for libraries

`ExcludeLibs = {String List}` - Libraries we will not link

`AdditionalLibs = {Stirng List}` - Additional Libraries we will link

`RuntimeLibPaths = {String List}` - Paths to search for Runtime Libraries

`AdditionalFrameworks = {Stirng List}` - Additional framworks to link

`AdditionalBundlesRes = {String List}` - Additional bundles to link

`DelayLoadDynamics = {String List}` - A list of "Delayed Load Dynamics". These are Dynamic libraries that will not load into the software until they are first called

`AdditionalArgs = {String}` - Additional arguments to pass

`AddDebugInfo = {Boolean}` - If we should create debug information. Default is true

`DisableSymbolCashe = {Boolean}` - If true, we shall not create cached symbols. Default is false

`IsBuildingLibrary = {Boolean}` - If true, then we are linking to a static Library (.a, .lib, etc). Default is false

`IsBuildingDynamic = {Boolean}` - If true, then we are linking to a dynamic Library (.so, .dll, etc). Default is false

`DefaultStackSize = {Integer}` - Default memory size allocation. Default is 5000000

`OptimizeSize = {Boolean}` - If True, the software will be optimize for size. Default is false

`ExcludeFramePointers = {Boolean}` - If true, we will not include frame pointers. Default is true

`IncrementalLinking = {Boolean}` - If true, then we will use Incremental Linking. A system which modifies the Output executable instead of rebuilding everything from scratch. Default is false

`AllowLTCG = {Boolean}` - If true, then we will use LTCG (Link Time Code Generation). Default is false

`PGOProfile = {Boolean}` - If true, then we will use PGO Profile (Profile Guided Optimization). Default is false

`PGOOptimize = {Boolean}` - If true, then we will use PGO Optimize. Default is false

`PGODirectory = {String}` - Directory that PGO Profiling will be saved

`PGOFilePrefix = {String}` - File prefix for the PGO Profiling, usually platform specific

`CreateMapFile = {Boolean}` - If true, we will attempt to create map file, which stores detailed overview about the linker. Default is false

`AllowASLR = {Boolean}` - If true, we will attempt ASLR (address space layout randomization). Default is false

`UseFastPDBLinking = {Boolean}` - If we should use Fast PDB when linking. Default is false

`PrintTimingInfo = {Boolean}` - Print Timing info when linking. Default is false

`InputFiles = {String List}` - A list of files that will be linked

`InputLibs = {String List}` - Libraries we will link
