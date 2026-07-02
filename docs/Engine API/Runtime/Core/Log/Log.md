# Log

Log is how we Relight Engine store information about the runtime to the user. It uses Relight's custom logging system, and will display messages, warnings, errors, and any potential fatal errors the program encounters.
You can also extend messages by either using the `+` operator or by formatting the string.

Log is also defined in `CoreMinimal.h`

## Using LOG

To use log, you use this function

```cpp
template <typename... InputTypes>
LOG(CORE_API::LogCategory Category, LogType LogWarning, String Text, InputTypes... Input)
```
Category - The category this log belongs in

LogWarning - The type of warning this log will use

Text - The message to display

Input - Optional list of arguments for formatting

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

## Log Formatting

You can format the log message by adding additional arguments after the Text, It only supports limited types.

### String (Relight's custom String class)

Strings can be called using the keyword `%s`, in order to call it, you must place a pointer in front of the String to format (I.E `*StringName`)

```cpp
String MyName = "Ethan";
LOG("My name is: %s", *MyName); // Output: "My name is: Ethan"
```

### char*

Raw string types can be called using the keyword `%s`

```cpp
const char* Test = "World!";
LOG("Hello %s", Test); // Output: "Hello World!"
```

### Integer

Any integer types can be called using the keyword `%d`

```cpp
uint32 Test = 50;
LOG("Test = %d", Test); // Output: "Test = 50"
```

### Float and Double

Both Floats and Doubles can be called using the keyword `%f`

```cpp
float Test = 50.5;
LOG("Test = %f", Test); // Output: "Test = 50.5"
```

### UTF8 and Char

both UTF8 and Char can be called using the keyword `%c`

```cpp
char Test = 'A';
LOG("Letter of the day: %c", Test); // Output: "Letter of the day: A"
```

### Pointers

Pointers can be called using the keyword `%p`

```cpp
char Test = 'B';
char* Test2 = &Test;
LOG("Pointer location: %p", Test); // Output: "Pointer location: 0x__ (Memory address varies)"
```

### Multiple format example

```cpp
LOG("%c am %d really %d really %f cool", 'I', 4, 7, 3.3); // Output: "I am 4 really 7 really 3.300000 cool"
```

### Formatting options

You can format your strings by either using the 'format option' or '+ operator option'. It's all based on your preference.

```cpp
String Test = "Sup";

// Format option
LOG("Hi %s, %d", *Test, 3); // Output: "Hi Sup, 3"

// '+' operator option
LOG("Hi " + Test + ", " + CORE_API::ToString(3)); // Output: "Hi Sup, 3"

// Different options, same result
```

## Log Category

To create your own category, you run this function

```cpp
CORE_API::LogCategory LogExample(String Name);
```
This is an example of creating a log category. `LogExample` will be the name you put in the `LOG` function, `Name` will be what is displayed in the Log system. It is recommended to have both `LogExample` and `Name` to be the same for simplicity sake
