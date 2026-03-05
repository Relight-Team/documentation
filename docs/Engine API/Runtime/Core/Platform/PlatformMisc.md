# PlatformMisc

PlatformMisc stores additional functions that the OS could use

## Functions

```cpp
static bool PlatformMisc::ExeDir(String& Output)
```
Store the game's directory into Output, return's `true` if successful

An example of this would be (`Game/`)

---

```cpp
static bool PlatformMisc::ConfigDir(String& Output)
```
Store the game's config directory into Output, return's `true` if successful

An example of this would be (`Game/Config`)

---

```cpp
static bool PlatformMisc::ContentDir(String& Output)
```
Store the game's content directory into Output, return's `true` if successful

An example of this would be (`Game/Content`)

---

```cpp
static bool PlatformMisc::ShadertDir(String& Output)
```
Store the game's shader directory into Output, return's `true` if successful

An example of this would be (`Game/Shader`)

---

```cpp
static bool PlatformMisc::SavedDir(String& Output)
```
Store the game's Save directory into Output, return's `true` if successful

An example of this would be (`Game/Saved`)

---

```cpp
static bool PlatformMisc::SavedConfigDir(String& Output)
```
Store the game's Save configuration directory into Output, return's `true` if successful

An example of this would be (`Game/Saved/Config`)

---

```cpp
static bool PlatformMisc::EngineDir(String& Output)
```
Store the game's engine directory into Output, return's `true` if successful

An example of this would be (`Game/Engine`)
