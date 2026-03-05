# RangeBound

RangeBound acts as a class implementation of a boundary of a range, whether that would be the beginning or the end, it is created primary for Range class

## RangeBoundType

RangeBoundType is an enum class that declares what type of bound we will use

`CORE_API::Math::RangeBoundType::Inclusive` - the bound is Inclusive, meaning we will include the bound value (example: if bound value is `5`, then we will include LowerBound-5. Denoted with `[]`)

`CORE_API::Math::RangeBoundType::Exclusive` - the bound is Exclusive, meaning we will not include the bound value (example: if bound value is `5`, then we will include LowerBound-4. Denoted with `()`)

`CORE_API::Math::RangeBoundType::Open` - the bound is open, meaning it goes on for infinity (example: LowerBound-Infinity)

## Constructor

We will use `T` as a placeholder for a typename

```cpp
CORE_API::Math::RangeBound<T> ValueName;
```
Create and set RangeBound to open

---

```cpp
CORE_API::Math::RangeBound<T> ValueName(T Value);
```
Create and set RangeBound an inclusive `Value`

---

## functions

```cpp
bool IsNotOpen()
```
return's `true` if bound is not open

---

```cpp
T ReturnNotOpen()
```
return's the value if the bound type is not open

---

```cpp
T SetNotOpen(T Value)
```
Set the bound to `Value` if bound is not open

---

```cpp
bool IsInclusive()
```
return's `true` if bound is Inclusive

---

```cpp
bool IsExclusive()
```
return's `true` if bound is Exclusive

---

```cpp
bool IsOpen()
```
return's `true` if bound is Open

## static functions

!!! failure "Redo this"
    all static functions here are incorrect, please fix it, once fix, document the code here
