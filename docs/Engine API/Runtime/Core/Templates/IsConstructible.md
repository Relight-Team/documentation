# IsConstructible

A template that determines if an object can be created using the given argument type

!!! note
    This only checks if the Object is constructible, the runtime will crash if object doesn't exist

# Syntax

```cpp
template <typename Object, typename... ArgTypes>
struct IsConstructible
```

To access the output, you would call `::Value`

# Examples

Example #1

```cpp
struct Example
{
    Example(int Test)
    {
    }
};

int main()
{
    bool Ret = IsConstructible<Example, int>::Value;

    return Ret; // true
}
```

Example #2

```cpp
struct Example
{
    Example(char* Test)
    {
    }
};

int main()
{
    bool Ret = IsConstructible<Example, int>::Value;

    return Ret; // false
}
```

Example #3

```cpp
struct Example
{
    Example(int Test, bool Test2)
    {
    }
};

int main()
{
    bool Ret = IsConstructible<Example, int, bool>::Value;

    return Ret; // true
}
```

Example #4

```cpp
struct Example
{
    Example()
    {
    }
};

int main()
{
    bool Ret = IsConstructible<Example>::Value;

    return Ret; // true
}
```

Example #5

```cpp
struct Example
{
    Example() = delete;
};

int main()
{
    bool Ret = IsConstructible<Example>::Value;

    return Ret; // false
}
```
