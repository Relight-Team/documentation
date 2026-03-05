## Config (Runtime API)

!!! note
    This section refers to API calls that interact with config files, if you wanna learn how to write and modify config files, then it's located at [Dealing with content]()

Config.h controls adding configs files and getting values from configs

## functions

``` cpp
static void Config::AddFile(String LocalFilePath, String ForceFullPath = "")
```

Adds a config file and stores it's contents. `LocalFilePath` gets the file from the config and saved directory. `ForceFullPath` will override the full file path (this is recommended only for specific needs)

---

``` cpp
static bool Config::GetString(String Section, String Variable, String& Output, String File)
```

Gets a config value and store it as a String, returns `true` if successful. `Section` will get the sepcified section the value is located at, `Variable` will be the name of the value we are getting, `Output` is where we will store the value, and `File` is the specified file the value is located in

---

``` cpp
static bool Config::GetInt(String Section, String Variable, int& Output, String File)
```

Gets a config value and store it as an 32-bit integer, returns `true` if successful. `Section` will get the sepcified section the value is located at, `Variable` will be the name of the value we are getting, `Output` is where we will store the value, and `File` is the specified file the value is located in

---

``` cpp
static bool Config::GetDouble(String Section, String Variable, double& Output, String File)
```

Gets a config value and store it as a double, returns `true` if successful. `Section` will get the sepcified section the value is located at, `Variable` will be the name of the value we are getting, `Output` is where we will store the value, and `File` is the specified file the value is located in

---

``` cpp
static bool Config::GetFloat(String Section, String Variable, float& Output, String File)
```

Gets a config value and store it as a float, returns `true` if successful. `Section` will get the sepcified section the value is located at, `Variable` will be the name of the value we are getting, `Output` is where we will store the value, and `File` is the specified file the value is located in

---

``` cpp
static bool Config::GetString(String Section, String Variable, bool& Output, String File)
```

Gets a config value and store it as a boolean, returns `true` if successful. `Section` will get the sepcified section the value is located at, `Variable` will be the name of the value we are getting, `Output` is where we will store the value, and `File` is the specified file the value is located in

---

``` cpp
static bool Config::GetArray(String Section, String Variable, Array<String>& Output, String File)
```

Gets a config value and store it as a string array, returns `true` if successful. `Section` will get the sepcified section the value is located at, `Variable` will be the name of the value we are getting, `Output` is where we will store the value, and `File` is the specified file the value is located in. Note that the array will get the same value from the same section, and some can be added or removed depending on what sections you run

---
