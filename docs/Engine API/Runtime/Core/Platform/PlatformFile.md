# PlatformFile

PlatformFile handles an implementation of handling files and folders of an operating system.

All functions will return `true` when successful

## functions

```cpp
static bool PlatformFile::FileExists(String File)
```
Checks if `File` exists

---

```cpp
static bool PlatformFile::ReadFile(String File, char** Output, size_t* OutputSize)
```
Read's a `File` and store it in `Output` and store the size of the file in `OutputSize`

---

```cpp
static bool PlatformFile::CreateFile(String File)
```
Create's a file called `File`

---

```cpp
static bool PlatformFile::WriteFile(String File, Array<int32> Contents)
```
Write's a file called `File` and writes `Contents` to the file

---

```cpp
static bool PlatformFile::CopyFile(String FileA, String FileB)
```
Copies `FileA` and put the copy at `FileB`

---

```cpp
static bool PlatformFile::DeleteFile(String File)
```
Delete's the file `File`

---

```cpp
static bool PlatformFile::MoveFile(String File, String MoveDirectory)
```
Get's the file `File` and moves it to `MoveDirectory`

---

```cpp
static bool PlatformFile::DirectoryExists(String Directory)
```
returns `true` if directory `Directory` exists

---

```cpp
static bool PlatformFile::CreateDirectory(String Directory)
```
Create's a directory called `Directory`

---

```cpp
static bool PlatformFile::ListFiles(String Directory, Array<String>& Output, Array<String>& Directories, String Ext = "NULL")
```
Will find all files and directories from `Directory`, and store all files in `Output` and Store all Directories in `Directories`, if `Ext` is not `NULL`, then we will ignore files with those extensions (examples: `png`, `jpg`, `mp4`). Return's true if successful

---

```cpp
static const char* PlatformFile::ToConstChar(String Input)
```
Convert's string `Input` to `const char*` and returns it

---
