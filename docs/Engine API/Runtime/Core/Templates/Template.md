# Template

Contains common function templates

## Forward

Will preserve the lvalue and rvalue when being called from another function. Mostly used in templates, where both types can be used, and the code needs to know which function type to call

### Syntax

```cpp
template <typename T>
constexpr T&& Forward(std::remove_reference_t<T>& Obj) noexcept
```

Returns the Forward variable

### Examples

```cpp
// LValue (has identity and name, can be found in memory)
const char* Test(int& Input)
{
    return "lvalue";
}

// RValue (temporary value, has no identity, short-lived)
const char* Test(int&& Input)
{
    return "rvalue";
}

// Wrapper, which is the primary use case of Forward.
// && in params allow us to pass both lvalues and rvalues
template <typename T>
const char* Wrapper(T&& Input)
{
    // lvalues and rvalues category will be lost if we call the function normally,
    // since all named values inside a function parameter are always lvalue.
    // However, we can use Forward function to keep the difference, allowing us
    // to keep the lvalue and rvalue state
    return Test(Forward<T>(Input));
}

int main()
{
    int X = 10;
    Wrapper(X); // return "lvalue"

    Wrapper(10); // return "rvalue"

    return 0;
}
```

## RemovePointer

Remove's 1 level of pointer from a variable

### Syntax

```cpp
template <typename T>
struct RemovePointer
```

To access the output, you would call `::Type`

### Examples

```cpp
RemovePointer<int*>::Type // return's 'int'
```

---

```cpp
RemovePointer<int**>::Type // return's 'int*'
```

---

```cpp
RemovePointer<int>::Type // return's 'int'
```

---

```cpp
int main()
{
    int X = 5;

    int* Ptr = &X;

    RemovePointer<decltype(Ptr)> Ret; // becomes 'int Ret'

    return 0;
}
```

## EnableIf

Compiles a function based on if the conditions are true. needs to be declared as `typename EnableIf<>` underneath the template. Example: you can have 2 functions with same name and params, one checks if it's a float and another checks if it's a pointer based on your template input, a certain function will run. Return is void by default.

### Syntax

```cpp
template <bool Condition, typename Return = void>
struct EnableIf;
```

To access the output, you would call `::Type`

For functions, instead of putting the Return before the function name, add it as the second parameter in `EnableIf`

For objects (classes/structs), add `typename EnableIf<>::Type` as the second parameter in the template

### Examples

```cpp

// Example #1: Using EnableIf to determine the function to use,
// can also be used in class functions and constructors

// Only use this template function if input is integer
template <typename T>
typename EnableIf<IsSameType<T, int>::Value, const char*>::Type
Test(T Input)
{
    return "int!";
}

// Only use this template function if input is char
template <typename T>
typename EnableIf<IsSameType<T, char>::Value, const char*>::Type
Test(T Input)
{
    return "char!";
}

int main()
{
    const char* A = Test(5); // return's "int!"
    const char* B = Test('i'); // return's "char!"

    // const char* C = Test(5.5); // COMPILE ERROR: No matching function to Test(float)

    return 0;
}
```

---
```cpp

// Example #2: Using EnableIf to determine what object to use

template <typename T, typename = void>
struct ObjectTest;

template <typename T>
struct ObjectTest<T, typename EnableIf<IsSameType<T, int>::Value>::Type>
{
    int FuncTest()
    {
        return 0;
    }
};

template <typename T>
struct ObjectTest<T, typename EnableIf<IsSameType<T, char>::Value>::Type>
{
    int FuncTest()
    {
        return 1;
    }
};

int main()
{
    ObjectTest<int> Example1;
    ObjectTest<char> Example2;
    // ObjectTest<bool> Example3; // COMPILE ERROR: no matching object to ObjectTest<bool>

    int Ret_Example1 = Example1.FuncTest(); // Returns 0

    int Ret_Example2 = Example2.FuncTest(); // Returns 1

    return 0;
}
```


## And

Compares 2 objects with public `Value` boolean, mainly used for compile time variables

### Syntax

```cpp
template <typename LValue, typename... RValues>
struct And<LValue, RValues...>
```

To access the output, you would get `::Value` which is a `constexpr bool` type

You can also just call `And<>` without any parameters, which will always return `true`

!!! note
    The `And<>` function will automatically call the `::Value` on the parameters, do not put `::Value` in your parameters

### Example

```cpp
// Just for example
struct RandomCondition
{
    static constexpr bool Value = true;
};

// Most common use case is for the EnableIf function
// Note how we do not put ::Value in the And statement, since And<> will do it automatically
// Also notice how we can add as many and statements as needed
template <typename T>

// Only enable if the value is a constant, a pointer, and if random condition is true. (Note: we remove the pointer when checking const, otherwise it will not work
typename EnableIf<And<IsConst<typename RemovePointer<T>::Type>, IsPointer<T>, RandomCondition>::Value, int>::Type
FuncTest(T test)
{
    return 0;
}

int main()
{
    // FuncTest(5); // fails, not pointer or const

    // int A = 5;
    // int* B = &A;
    // FuncTest(B); // fails, while it is a pointer, it's not a const

    const int A = 5;
    const int* B = &A;
    FuncTest(B); // runs just fine!



    return 0;
}
```

## Or

Checks 2 objects with public `Value` boolean, and return's true if any parameters are correct, mainly used for compile time variables

### Syntax

```cpp
template <typename LValue, typename... RValues>
struct Or<LValue, RValues...>
```

To access the output, you would get `::Value` which is a `constexpr bool` type

You can also just call `Or<>` without any parameters, which will always return `false`

!!! note
    The `Or<>` function will automatically call the `::Value` on the parameters, do not put `::Value` in your parameters

### Examples

```cpp

// Most common use case is for the EnableIf function
// Note how we do not put ::Value in the And statement, since And<> will do it automatically
// Also notice how we can add as many and statements as needed
template <typename T>
typename EnableIf<Or<IsSameType<T, int>, IsSameType<T, char>>::Value, int>::Type
FuncTest(T test)
{
    return 0;
}

int main()
{

    FuncTest(5); // Works just fine, template is int, which is true

    FuncTest('W'); // Also works just fine, while not an int, it matches the other condition, which is being a char

    // FuncTest(true) // Fails, since it's not an int or a char

    return 0;
}
```

## Not

Reverse the output on compile time variables

### Syntax

```cpp
template <typename AnyTemplate>
struct Not
```

To access the output, you would get `::Value` which is a `constexpr bool` type

!!! note
    The `Not<>` function will automatically call the `::Value` on the parameters, do not put `::Value` in your parameters

### Examples

```cpp
// Most common use case is for the EnableIf function
// Note how we do not put ::Value in the And statement, since And<> will do it automatically
// Also notice how we can add as many and statements as needed
template <typename T>
typename EnableIf<Not<IsSameType<T, int>>::Value, int>::Type
FuncTest(T test)
{
    return 0;
}

int main()
{

    FuncTest('W'); // Success, not int

    FuncTest(3.5); // Success, not int

    //FuncTest(5); // Fails, it is an int

    return 0;
}
```

## IsPointer

Checks if the input value is a pointer

### Syntax

```cpp
template <typename T>
struct IsPointer
```

To access the output, you would get `::Value` which is a `constexpr bool` type


### Examples
```cpp
IsPointer<int>::Value; // false

IsPointer<int*>::Value; // true

IsPointer<const int*>; // true, this is a pointer to const int

IsPointer<int const*>; // false, this is a const pointer to int
```

## IsConst

Checks if the input value is a constent

### Syntax

```cpp
template <typename T>
struct IsConst
```

To access the output, you would get `::Value` which is a `constexpr bool` type


### Examples
```cpp
IsConst<int>::Value; // false

IsConst<const int>::Value; // true

IsConst<const int*>; // false, this is a pointer to const int

IsConst<int const*>; // true, this is a const pointer to int
```

## IsReference

Checks if the input value is a Reference

### Syntax

```cpp
template <typename T>
struct IsReference
```

To access the output, you would get `::Value` which is a `constexpr bool` type


### Examples
```cpp
IsConst<int>::Value; // false

IsConst<int&>::Value; // true

IsConst<int*>; // false
```
