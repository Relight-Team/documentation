# Building Pipeline

## Overview on Building pipeline
Here's a graphical overview of the pipeline RBT goes through when building a project. We will go over the details for each step in each section

``` mermaid
graph TD
    Main(Main.py) -->|Run Build Mode| BuildMode;
    BuildMode[BuildMode.py] -->|Get Target File| TargetBuilder;
    TargetBuilder[TargetBuilder.py] -->|create class representing binary| Binary;
    Binary[Binary.py] -->|Compile module in binary| ModuleBuilder;
    ModuleBuilder[ModuleBuilder.py] -->|Run module in Toolchain| CompileToolchain;
    CompileToolchain[SDK Toolchain Compiling process];

    CompileToolchain -->|Loop for each module| Binary;

    LinkingToolchain[SDK Toolchain Linking process];
    CompileToolchain -->|When binaries compiled, link them| LinkingToolchain;

    LinkingToolchain -->|For each binary| TargetBuilder;

    LinkingToolchain -->|After we compiled all targets| ActionExecute;
    ActionExecute[ActionExecute.py] -->|Run action execute| StartActionExe;
    StartActionExe[Start Action Executor] -->|Get action| ExecuteAction;
    ExecuteAction[Execute action] -->|For each Action in list| ActionExecute;

    LinkingToolchain -->|For each Target file| BuildMode;

    ExecuteAction -->|After all target's actions are completed| Finish;

    Finish(Finished);
```
## main.py

`main.py` is the first file to run and act as a precondition to build mode, all it currently does is print the logo, set up the logging system, and create the build mode class, once the class has been created, we will run the `main` function for the mode

## BuildMode.py

When the main function of BuildMode is called, we will create a `StartingTarget`, a Starting target represents the first target we will build with minimum information, this usually get's set by the `command line arguments`. After this, we will register the specified platform to the platform class, and start the `Build Process`. when we are in the build process, we will get a list of targets and for each target we will [Create and Build TargetBuilder](#targetbuilderpy). After we build each target, we will get the actions from the target and add it to a `Action List Manager`, which will link all actions together. After this, we will ensure all starting target has the same config, then we will [execute the actions](#actionexecutepy)

## TargetBuilder.py

TargetBuilder represents the building process of a program, including multiple binaries and their configuration. when the Create function is called, we will create a `TargetReader` class, which will be found based on the name. Once we created the reader, we will create the TargetBuilder class itself, when we create the class, we set the starting target and the normal target, then we will set the arch and engine and project intermediate directory, after this, then we will setup prebuild. Prebuild will get each module and set values. After the creation of the TargetBuilder, we will start the `Build process`. When the build function get's called, the first step is to run the `RelightCookerTool` if we enabled the auto baking to be on. Next, we get the platform class, set up the `Toolchain class`, create both link and compile environment and set global settings for them, and get all values needed to create and run the build function in the [Binary class](#binarypy). binary filter, plugin support, and Header Tool is also set here

## Binary.py

Binary represents a specific binary file to build and settings for the specific binary. When first created, it will just set all the required values into the class instance. Then in the Build function, we will run CreateLinkEnv. Inside CreateLinkEnv, we will create a new link and compile environment based on the input environments, and modify the environments based on settings. After this, we will loop for each module in a binary, we will add each module's additional libs to the link environment's additional lib, after that, we will [compile the module](#modulebuilderpy), sync NewLinkEnv with CompileEnv, and add the input files to the NewLinkEnv. After syncing more LinkEnv, we will return it to the NewLinkEnv to the Build function. After we finished the NewLinkEnv function, we will continue to linking if we are allowed to, and run [LinkEveryFiles in toolchain class](#toolchain). After this, we will run [PostBuilt from toolchain](#toolchain) and return the output files

## ModuleBuilder.py

ModuleBuilder represents the compiling process of a specific module, and is main purpose is handling configuration on a module and compiling it, please note that ModuleBuilder does not handle anything relating to linking, and only in the compiling process. Once we start the compilation function, we will check for any 3rd party and if there is any, build it if we are allowed. After this, we will add all additionallibs to the return list, and add Third party contents to the `CompileEnv`. Next we will run `GetAndCompileDependencies`, which first add the include to the module's src directory to the compile environment. After this, we will run each module, then loop for each submodule in that module, and compile each one, ensure all requirements are compiled in order. Back to the compile function, after we confirm all required modules are compiled, we will setup the [UNITY SYSTEM]() if it's activated. We will then set the Module Name from the reader, and set the Intermediate directory. If Precompiled is false and we are not using UNITY SYSTEM, then we will run [CompileMultiArchCPPs from Toolchain](#toolchain), if UNITY SYSTEM is true, then we will run [UniteCPPFiles from UNITY SYSTEM](). If we are using Precompiled mode, then get all engine object files and get includes from intermediate, and compile/unify the project files. We will return the list of compiled objects that will be created

## Toolchain

The Toolchain process depends on each platform, for documentation and tutorial on how the SDK works, including Toolchain, then please see our [SDK Tutorial Document](../../Using a Custom SDK), you can also view a template from `Extras/CustomSDK/Examples`

## ActionExecute.py

Once the toolchain set's all actions and added them to the list, BuildMode.py will start ActionExecute, in this class, we will get each action and execute the commands to compile. We will keep track of the progress on each action and execute them, compiling and linking all files and create the final product
