# FunctionReference

FunctionReference holds the `FunctionRef` instance. `FunctionRef` is a system that holds a reference to a callable object (function, lambda, etc)

!!! note
    this does not hold a function, only reference it, meaning that you must ensure that the object exists during this class lifetime

## FunctionRef

### Constructor

```cpp
template <typename CallableObject>
FunctionRef<ReturnType(ArgTypes...)>::FunctionRef(CallableObject&& Obj);
```
Create a reference of the object. `ReturnType` is the variable type to return, `ArgTypes` are a list of variable types use for arguments, and `Obj` is the object itself

### Operators

```cpp
ReturnType FunctionRef::operator()(ArgTypes... Args) const;
```
Runs the object using `Args` as the argument

### Functions
```cpp
void FunctionRef::Reset();
```
Removes all data from the function reference

### Examples

Example #1:

```cpp
void FunctionExample()
{
    LOG("If you are reading this, then function has run!");
}

void FunctionWrapper(FunctionRef<void()> Func)
{
    Func();
}

int main()
{
    FunctionWrapper(FunctionExample); // Output: "If you are reading this, then function has run!"
    return 0;
}
```

Example #2:

```cpp
bool FunctionExample(int A, double B)
{
    return A > B;
}

bool FunctionWrapper(FunctionRef<bool(int, double)> Func, int Number)
{
    return Func(Number, 5);
}

int main()
{
    bool Output = FunctionWrapper(FunctionExample, 6); // Output: 1 (True)
    return 0;
}
```

Example #3:

```cpp
int FunctionExample()
{
    return 5;
}

int FunctionWrapper(FunctionRef<int()> Func)
{
    return Func();
}

int main()
{
    auto ExampleLambda = [](){return 10;};

    int Output_A = FunctionWrapper(FunctionExample); // Output: 5

    int Output_B = FunctionWrapper(ExampleLambda); // Output: 10
    return 0;
}
```
