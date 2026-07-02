# IsSameType

Determines if 2 value types are the same

# Syntax

```cpp
template <typename A, typename B>
struct IsSameType
```
To access the output, you would call `::Value`

# Examples

example #1

```cpp
int main()
{
    bool Ret = IsSameType<int, int>::Value;
    return Ret; // true
}
```

example #2

```cpp
int main()
{
    bool Ret = IsSameType<int, char>::Value;
    return Ret; // false
}
```

example #3

```cpp
int main()
{
    bool Ret = IsSameType<int&, int>::Value;
    return Ret; // false
}
```

example #4

```cpp
int main()
{
    int X;
    bool Ret = IsSameType<int, decltype(X)>::Value;
    return Ret; // true
}
```

example #5

```cpp
int main()
{
    bool Ret = IsSameType<int*, int>::Value;
    return Ret; // false
}
```
