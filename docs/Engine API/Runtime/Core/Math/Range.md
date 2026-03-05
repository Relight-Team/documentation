# Range

`Range` is a class that is very similar to arrays, however is optimized for huge sets of numbers. How it works is that instead of storing each individual number, we will only hold a min value and a max value, and any number in-between these 2 numbers will be consider part of the 'set'

## Constructor

We will use `T` as a placeholder for a typename

```cpp
CORE_API::Math::Range<T> ValueName(T Both)
```
Create a range of `[Both, Both]` with both values being inclusive

---

```cpp
CORE_API::Math::Range<T> ValueName(T Lower, T Higher)
```
Create a range of `[Lower, Higher)` with Lower value being inclusive and Higher value being exclusive

---

```cpp
CORE_API::Math::Range<T> ValueName(RangeBound<T> Lower, RnageBound<T> Higher)
```
Set the range based on predefined bounds using `RangeBound`

## Functions

```cpp
bool IsAdjoint(Range& Second)
```
returns `true` if the parent range and `Second` are directly next to each other (not overlapping and no gaps)

---

```cpp
bool Contains(T Value)
```
returns `true` if Value is contained in range
