# Unity System

The unity system is a process in which each `.cpp` file is combined into a single `.cpp` file before compiling. This is useful for faster compile times and compiling preformance

``` mermaid
graph TD
File1(File1.cpp) -->|Unity System| Unified;
File2(File2.cpp) -->|Unity System| Unified;
File3(File3.cpp) -->|Unity System| Unified;
Unified(Module.0.cpp) -->|Get's automatically added to Pipeline| Pipeline;
Pipeline(RelightBuildTool Pipeline);
```

Pros:

- Faster compiling times
- Iterate's better on large projects

Cons:

- Harder to debug
- Large object files
