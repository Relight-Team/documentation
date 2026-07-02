# PlatformOutput

PlatformOutput controls the output for an operating systems, these usually handle the 'print' operator

## functions

```cpp
static void PlatformOutput::Print(const String& Input)
```
Print's out string `Input` to system's terminal output

---

```cpp
static void PlatformOutput::Print(const Array<UTF8>& Input)
```
Print's out array `Input` to system's terminal output

---

```cpp
static void PlatformOutput::Print(const UTF8& Input)
```
Print's out UTF-16 character `Input` to system's terminal output

---

```cpp
static void PlatformOutput::Print(const char* Input)
```
Print's out char pointer `Input` to system's terminal output

---

```cpp
static void PlatformOutput::Print(const NonStringType& Input)
```
Convert the non-string `Input` into a string, then Print's out the string to system's terminal output. `NonStringType` is a template representing any non-string

---

```cpp
static void PlatformOutput::Println(const StringType& Input)
```
Print's out string `Input` and add's a new line to system's terminal output. StringType represents any string/non-string that `Print()` supports
