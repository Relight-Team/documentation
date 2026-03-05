# Log

Log is how we Relight Engine store information about the runtime to the user. It uses Relight's custom logging system, and will display messages, warnings, errors, and any potential fatal errors the program encounters.

Log is also defined in `CoreMinimal.h`

## Using LOG

To use log, you use this function

```cpp
LOG(CORE_API::LogCategory Category, LogType LogWarning, String Text)
```
Category - The category this log belongs in

LogWarning - The type of warning this log will use

Text - The message to display

---

```cpp
LOG(String Text)
```
If you only have the string defined, then we will use `LogCore` as the category and `LogType::Log` as the Log Type

## Log type

The log type will determine how the message will be displayed, and how the game will respond to the log. Here's the list of all the log types:

`LogType::Log` - A basic level of logging, this let the developer know basic information on what the engine/project is doing. It doesn't not warrent any intention unless needed

`LogType::Warning` - Contains any issues detected by the Engine, but nothing that warrents any immediate concern

`LogType::Error` - Contains any issues detected by the engine that should get immediate attention, but the runtime will continue

`LogType::Fatal` - Contains any issues detected by the engine and will cause the runtime to shutdown.

## Log Category

To create your own category, you run this function

```cpp
CORE_API::LogCategory LogExample(String Name);
```
This is an example of creating a log category. `LogExample` will be the name you put in the `LOG` function, `Name` will be what is displayed in the Log system. It is recommended to have both `LogExample` and `Name` to be the same for simplicity sake
