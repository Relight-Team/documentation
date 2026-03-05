# How Compiling Works

!!! note "C++ compiling context"
    This goes over C/C++ compiling pipeline, if you already know how it works, you may skip this section


## Basic pipeline overview

``` mermaid
graph TB
    A_Step1[File1.cpp] -->|Preprocessor| A_Step2;
    B_Step1[File2.cpp] -->|Preprocessor| B_Step2;
    C_Step1[File3.cpp] -->|Preprocessor| C_Step2;

    A_Step2[File1.cpp] -->|Compiler| A_Step3;
    B_Step2[File2.cpp] -->|Compiler| B_Step3;
    C_Step2[File3.cpp] -->|Compiler| C_Step3;

    A_Step3[File1.s] -->|Assembler| A_Step4;
    B_Step3[File2.s] -->|Assembler| B_Step4;
    C_Step3[File3.s] -->|Assembler| C_Step4;

    A_Step4[File1.o] -->|Linker| Exe;
    B_Step4[File2.o] -->|Linker| Exe;
    C_Step4[File3.o] -->|Linker| Exe;

    Exe[Final Binary file];
```

## Preprocessor

The Preprocessor modifies a C, C++, and/or Header file and store the modifications in a copy to be used in pipeline. These modifications are included by the developers themselves. For example, if we have a file that looks like

```cpp
#include "LogStuff.h"
#define Greeting "Hello world!"

int main()
{
    Log(Greeting);
}
```

Then the Preprocessor copy would look like this:

```cpp
void Log(char* Input)
{
    printf(Input);
}

int main()
{
    Log("Hello world!");
}
```

This is especially useful in the Engine for includes and constant compiled variables, such as build configurations and platform info, without having the engine checking the info at runtime.

## Compiler

The compiler converts the Preprocessed C/C++ files into assembly. Assembly is a low-level language, which acts as a readable version of machine code. Each machine code is different depending on your architecture, and can be difficult to read without comments. RelightBuildTool currently doesn't interact with the compiler, if at all, outside of any SDK toolset. Let's show an example, if your .cpp file looks like this

```cpp
int main()
{
    int Number = 5;
}
```

Then the Compiler will turn into this (using `GCC on x86_64`)
```asm
main:
    push    rbp
    mov     rbp, rsp
    mov     DWORD PTR [rbp-4], 5
    mov     eax, 0
    pop     rbp
    ret
```

all generated assembly code are located in `.s` files

## Assembler

After we get the assembly code, it's time to assemble it into machine code, this process turns all `.s` files into native machine code objects `.o` (`.obj` on windows). These object files resides in the `Intermediate` directory and can be viewed yourself if you go into this directory for your compiled project. These files are NOT shipped in the final product, and mainly served as to track for updates, ensuring we don't recompile code that hasn't been updated.

## Linker

After we get each object files, it's time to link them together into the final product, this works by combining all objects into a single binary file. There are 2 different types of linking a developer could pick

`Static Linking` - Combining object and static libraries (`.a` or `.lib`) into a single executable

`Dynamic Linking` - Have references to code in another file (`.so` or `.dll`)

Most of the time, Dynamic Linking will be a hybrid of sort, using Static Linking for some libraries, and using dynamic linking for others, or a dynamic library may have static library including in the file. No matter how you look at it, this is the final step, as after this, the final executable is produced
