# FunctionRunner

FunctionRunner is an internal class that handles running a function in storage

## Syntax

FunctionRunner is defined in `CORE_API::Internal::FunctionRunner::FunctionRunner`

---

```cpp
template <typename FunctionObjType, typename ReturnType, typename... ParamTypes>
static ReturnType FunctionRunner::Run(void* Obj, ParamTypes... Params)
```
Runs the function via `Invoke`

FunctionObjType - The struct/class type that we will use

ReturnType - The variable type we will return

ParamTypes - List of each varaible type for each parameter

Obj - The object itself to run

Params - The parameter input to run

## Example

```cpp

// example struct
struct StructExample
{
    int operator(float A, double B)
    {
        return A + B;
    }
};


void main()
{
    // we add this just so the code doesn't look messy
    typedef FunctionRunnerPath = CORE_API::Internal::FunctionRunner

    // Create object based on StructExample
    StructExample Example;

    // Store the return of the function
    int Ret = FunctionRunnerPath::FunctionRunner<StructExample, int, float, double>::Run(Example, 5.5, 10.5);

    LOG(Ret); // prints "16"
}

```
