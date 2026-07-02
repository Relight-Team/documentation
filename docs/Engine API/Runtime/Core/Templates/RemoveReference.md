# RemoveReference

Removes all references from a variable, resulting in the pure version of a variable

## Syntax

```cpp
template <typename T>
struct RemoveReference
```

To access the output, you would call `::Type`

## Examples

Example #1

```cpp
using Output = RemoveReference<int&>::Type; // Convert int& -> int
```

Example #2

```cpp
using Output = RemoveReference<int&&>::Type; // Convert int&& -> int
```

Example #3

```cpp
using Output = RemoveReference<int>::Type; // Convert int -> int
```

Example #4

```cpp
using Output = RemoveReference<const int&>::Type; // Convert const int& -> const int
```

Example #5

```cpp
template<typename InputType>
void Example(InputType&& Input)
{
    // In this example, we will use the Input type, and get the pure type
    typename RemoveReference<InputType>::Type Output;
}
```
