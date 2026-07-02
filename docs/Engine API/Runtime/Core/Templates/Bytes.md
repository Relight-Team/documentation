# Bytes

## AlignedBytes

Alligns to certain part of memory, useful for optimization, since it ensures that all the data is in a single chunk the cpu reads instead of 2 seperate chunks

(example: setting the input of `4` will start at memory `[0, 4, 8, 12, 16, etc]`.)

pretty much acts as padding

### Syntax

AlignedBytes is formatted like this

```cpp
template<int32 Size, uint32 Alignment>
struct AlignedBytes
```

- `Size` will determine the size, can be check with `sizeof()`

- `Alignment` will determine the padding, can be checked with `alignof()`


To use AlignedBytes, add this line inside your class/struct

```cpp
AlignedBytes<X, Y> ValueName;
```
