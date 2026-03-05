# Path

`Path` contains functions of getting common project directories. This acts as an interface to direct platform functions. All functions will use `absolute paths`, meaning the full directory, including `C:\` on windows and `/` on Unix-based systems, is included in the output.

## Functions

```cpp
static bool Path::ExeDir(String& Output)
```
Store the game's directory into Output, return's `true` if successful

An example of this would be (`Game/`)

---

```cpp
static bool Path::ConfigDir(String& Output)
```
Store the game's config directory into Output, return's `true` if successful

An example of this would be (`Game/Config`)

---

```cpp
static bool Path::ContentDir(String& Output)
```
Store the game's content directory into Output, return's `true` if successful

An example of this would be (`Game/Content`)

---

```cpp
static bool Path::ShadertDir(String& Output)
```
Store the game's shader directory into Output, return's `true` if successful

An example of this would be (`Game/Shader`)

---

```cpp
static bool Path::SavedDir(String& Output)
```
Store the game's Save directory into Output, return's `true` if successful

An example of this would be (`Game/Saved`)

---

```cpp
static bool Path::SavedConfigDir(String& Output)
```
Store the game's Save configuration directory into Output, return's `true` if successful

An example of this would be (`Game/Saved/Config`)

---

```cpp
static bool Path::EngineDir(String& Output)
```
Store the game's engine directory into Output, return's `true` if successful

An example of this would be (`Game/Engine`)
