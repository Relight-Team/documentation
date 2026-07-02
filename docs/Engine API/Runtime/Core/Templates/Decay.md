# Decay

Decay converts a variable type

## what does it convert

- Removes `const` and `volatile`
- Converts `foo[]` and `foo[x]` to `foo*`
- Convert a `function` into a `raw pointer`

## Syntax

Decay is formatted like this

```cpp
template <typename T>
Decay<T>
```

- `T` is any variable type

To access the decayed variable type, you would need to type `::Type` after the Decay syntax

## Examples
Example #1:

```cpp
Decay<const int&>::Type; // Convert into int
```

Example #2:

```cpp
Decay<const int&>::Type A = 5; // Will convert into 'int A = 5'
```

Example #3:

```cpp
// Setup example
const int PartA = 5;
const int& PartB = PartA;

// We can use decltype to get the value type
Decay<decltype(PartB)>::Type Ret = PartA; // We copy PartA, but now in a simple int, instead of const int&

```
