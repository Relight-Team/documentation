# Map

A map is contains 2 arrays, a key and a value, each value is assigned a key, the key and Value can be seperate value types

It can also be included in `CoreTypes.h` and `CoreMinimal.h`

## Constructor

!!! note "Typename Key and Value"
    This value uses 2 typename, in this doc, they will be represented as `TKey` for Key typename and `TValue` for value typename

``` cpp
Map<(any type)> MapName;
```

Create an empty map

## Operators
``` cpp
MapName[TKey];
```

returns the value from `Tkey`, if it doesn't exist, it will create a key with default `TValue` constructor

## Functions

``` cpp
int32 Indices()
```

Returns the length of map starting at `0`

---

``` cpp
bool Exist(KeyType Name)
```

Returns `true` if the key exists

---

``` cpp
int32 Find(KeyType A)
```

Returns the index of the key, returns `-1` if it's false

---

``` cpp
KeyType First(int32 i)
```

Returns the key based on index `i`

---

``` cpp
ValueType Second(int32 i)
```

Returns the value based on index `i`

---

``` cpp
void SetAdd(KeyType K, ValueType V)
```

If key `K` exists, replace it's existing value with `V`, otherwise we will create a new key with the value

---

``` cpp
void Remove(KeyType K)
```

Remove both key and value of key `K`

---

``` cpp
Array<KeyType> GetKeys()
```

Returns an array of all keys in this Map

---

``` cpp
Array<ValueType> GetValues()
```

Returns an array of all values in this Map
