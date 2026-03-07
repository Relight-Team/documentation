# Array

The `Array` class is Relight Engine's custom dynamic array system that is stored in the heap. An array contains an ordered collections of a specific variable type.

It can also be included in `CoreTypes.h` and `CoreMinimal.h`

## Constructor

!!! note "Template"
    You must set the value template when creating any array, for all examples we will use `<(any type)>`. This needs to be replaced by any data types, such as values, classes, etc. Examples include `<int8>`, `<boolean>`, etc

---

``` cpp
Array<(any type)> ArrayName;
```

To create an empty array

---

``` cpp
Array<(any type)> ArrayName = {A, B, C D};
```

Create an array with contents already in it

---

``` cpp
Array<(any type)> ArrayName = Array2;
```

Create an array based on another array

## Operators

``` cpp
Array[Integer];
```

Returns the item in the index of the array

---

``` cpp
Array = Array2;
```

You can overwrite the array to contain another array

---

``` cpp
Array += Array2;
```

You can append an array using `+=` operator

## Functions

!!! note "T template"
    `T` will be use as the typename for your value


``` cpp
void Init(T Repeat, int32 Size)
```

Will initialize the array by repeating `Repeat` for the length of `Size`

---

``` cpp
void Init(T Input[], int32 Size)
```

Will initialize the array getting each item in the `Input` array until we reach `Size`

---

``` cpp
int32 Length() const
```

Returns the length of the array, starting at `1`

---

``` cpp
int32 Indices() const
```

Returns the Indices of the array, similar to `Length()`, but starts at `0` instead

---

``` cpp
bool Contains(T Input)
```

Returns `true` if the array contains `Input`

---

``` cpp
bool Find(T Input, int32& Value)
```

Will try to find first instance of`Input` in the array and store the index in `Value`. Returns `true` if `Input` exists

---

``` cpp
bool FindLast(T Input, int32& Value)
```

Similar to `Find(T Input, int32& Value)` except looks for the last instance instead

---

``` cpp
int32 GetTypeSize()
```

Returns the size of value, similar to `sizeof(T)`

---

``` cpp
bool IsValidIndex(int32 Index)
```

Returns `true` if `Index` is a valid array slot

---

``` cpp
Array<T> Reverse()
```

Returns a copy of an array where all the array slots are reversed `(eg [1, 2, 3] = [3, 2, 1])`

---

``` cpp
T Top()
```

Returns the first item in list

---

``` cpp
T Top(int32 a)
```

Returns the item from `0` to `a` (`0 + a`)

---

``` cpp
T Last()
```

Returns the last item in list

---

``` cpp
T Last(int32 a)
```

Returns the item from the last to `a` (`[Last Item Index] - a`)

---

``` cpp
void Add(T Input)
```

Add `Input` to the array

---

``` cpp
void Append(const Array& Input, int32 Size)
```

Adds `Input` to the array up to `Size`

---

``` cpp
void AddUnique(T Input)
```

Only adds `Input` to array if `Input` doesn't exist in the array

---

``` cpp
void Insert(T Input, int32 Index)
```

Insert's `Input` at `Index`. Will move the rest of the values to the right

---

``` cpp
void RemoveAt(int32 Index)
```

Removes an item at `Index`

---

``` cpp
T Pop(int32 Index)
```

Removes an item at `Index`, returns the removed item

---

``` cpp
T Pop()
```

Removes the last item, returns the removed item

---

``` cpp
bool RemoveSingle(T Input)
```

Removes only the first instance of `Input`

---

``` cpp
void Remove(T Input)
```

Removes all instances of `Input`

---

``` cpp
void Empty()
```

Removes everything in the array

---

``` cpp
bool SplitIndex(int32 Index, Array<T>& Left, Array<T>& Right)
```

Split the array into 2 and stored in `Left` and `Right` based on `Index`, `Index` value will be excluded. Returns true if successful

---

``` cpp
bool SplitIndexInclusive(int32 Index, Array<T>& Left, Array<T>& Right)
```

Similar to `bool SplitIndex(int32 Index, Array<T>& Left, Array<T>& Right)` but we will keep the index value and will be stored in `Right`

---

``` cpp
bool Split(const T& ItemToSplit, Array<T>& Left, Array<T>& Right, bool Last = false, bool Inclusive = false)
```

Will split the array based on `Item`, the split will be stored in `Left` and `Right`. If `Last` is `true`, then we will find the last item instead of the first. If `Inclusive` is `true`, then the index value will be included and stored in `Right`. Returns `true` if successful

---

``` cpp
void Swap(int32 A, int32 B)
```

Will swap index `A` and index `B`, `(example: [1, 2] = [2, 1])`

---

``` cpp
void Replace(T Input, int32 Index)
```

Will replace item at `Index` to `Input`

---

``` cpp
T* ReturnPointer()
```

Returns the array pointer
