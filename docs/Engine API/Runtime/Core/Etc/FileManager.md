# FileManager

`FileManager` is a custom static class that allows the engine to preform file operations. It uses the Platform class as a base for handling files

## Functions

``` cpp
static bool FileManager::FileExists(String File)
```
Will return `true` if `File` exists

---

``` cpp
static bool FileManager::ReadFile(String File, FileReader& Output)
```
Will read a `File` and store it's contents in the [FileReader Archive]() called `Output`. Return true if we are successful.

---

``` cpp
static bool FileManager::WriteFile(String File, Array<int> Contents)
```
Will write `Contents` to `File`, return's `true` if successful

---

``` cpp
static bool FileManager::WriteFile(String File, int* Contents, int Size)
```
Will write the integer array of `Contents` to `File`, return's `true` if successful

---

``` cpp
static bool FileManager::WriteFile(String File, String Contents)
```
Will write string `Contents` to `File`, return's `true` if successful

---

``` cpp
static bool FileManager::CopyFile(String A, String B)
```
Will copy file `A` to file `B`, return `true` if successful

---

``` cpp
static bool FileManager::DeleteFile(String File)
```
Will delete `File`, return `true` if successful

---

``` cpp
static bool FileManager::MoveFile(String File, String Directory)
```
Move `File` to `Directory`, return `true` if successful

---

``` cpp
static bool FileManager::DirectoryExists(String Directory)
```
Will return `true` if `Directory` exists

---

``` cpp
static bool FileManager::CreateDirectory(String Directory)
```
Will create `Directory`, return `true` if successful

---

``` cpp
static bool FileManager::ListFiles(String Directory, Array<String>& Files, Array<String>& Directories, String Ext = "NULL")
```
Will find all files and directories from `Directory`, and store all files in `Files` and Store all Directories in `Directories`, if `Ext` is not `NULL`, then we will ignore files with those extensions (examples: `png`, `jpg`, `mp4`). Return's true if successful

---

``` cpp
static bool FileManager::ListFilesRecersive(String Directory, Array<String>& Files, Array<String>& Directories, String Ext = "NULL")
```
Similar to `FileManager::ListFiles`, but will recersively run for each subdirectory
