# Core module

The Core module contains common code that will be used everywhere in the engine.

## Notes

- Core has multiple include collections

    - `Core.h` contains every core file, including other collections

    - `CoreMinimal.h` contains minimal includes that is contains the basic elements of the engine

    - `CoreTypes.h` contains unique values the engine will constantly use, for example, Arrays and Strings

    - `Platform.h` contains includes of all platform-specific classes and functions

    - `PlatformCore.h` contains important code and includes needed for almost every file

- Relight Engine uses the name `UTF16` to define UTF-16 characters. This is defined in a platform's core header

- Relight Engine has custom integer naming to ensure full compatiblity between platforms. This is defined in a platform's core ehader

    - `int8` - 8-bit integer

    - `uint8` - unsigned 8-bit integer

    - `int16` - 16-bit integer

    - `uint16` - unsigned 16-bit integer

    - `int32` - 32-bit integer

    - `uint32` - unsigned 32-bit integer

    - `int64` - 64-bit integer

    - `uint64` - unsigned 64-bit integer

- Platforms are imported based on each folder based on their platform name, all platforms uses `PlatformBase` as their parent class

- Mutliple important variables are stored in CoreGlobal

    - `RShutdownMode` - if true, then the runtime is shutting down
