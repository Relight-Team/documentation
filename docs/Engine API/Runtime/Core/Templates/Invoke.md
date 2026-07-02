# Invoke

Runs a function with parameters

## Syntax

```cpp
template <typename FuncT, typename... ArgsT>
auto Invoke(FuncT&& Func, ArgsT&&... Args) ->
    decltype(Forward<FuncT>(Func)(Forward<ArgsT>(Args)...))
```
Runs `Func` with the parameters of `Args`. `decltype` is used to figure out return type

## Example
```cpp
int Add(double A, float B)
{
    return A + B;
}

int main()
{
    int Ret = Invoke(Add, 5, 10);

    return Ret; // Return's 15
}
```
