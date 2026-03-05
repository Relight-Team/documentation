# Vector

A vector stores 3 values, `X`, `Y`, and `Z`. these values can be an integer or any type of float

## Constructor

`FloatType` will be used as a placeholder for typename (note: integers can also be accepted)

```cpp
CORE_API::Math::Vector<FloatType> MyValue;
```
Set all 3 values to `0`

---

```cpp
CORE_API::Math::Vector<FloatType> MyValue(FloatType InX, FloatType InY, FloatType InZ);
```
Set X to `InX`, Y to `InY`, and Z to `InZ`

---

```cpp
CORE_API::Math::Vector<FloatType> MyValue(FloatType All);
```
Set X, Y, and Z to `All`

## Functions

```cpp
String ToString()
```
returns the vector as a full string, useful for debugging

---

```cpp
FloatType GetX()
```
returns the X value

---

```cpp
FloatType GetY()
```
returns the Y value

---

```cpp
FloatType GetZ()
```
returns the Z value

---

```cpp
FloatType SetX(FloatType Input)
```
Set the X value to `Input`

---

```cpp
FloatType SetY(FloatType Input)
```
Set the Y value to `Input`

---

```cpp
FloatType SetZ(FloatType Input)
```
Set the Z value to `Input`

---

```cpp
FloatType Set(FloatType InX, FloatType InY, FloatType InZ)
```
Set X to `InX`, Y to `InY`, and Z to `InZ`

---

```cpp
bool Serialize(Archive& Container)
```
Serialize the vector to `Container`, returns `true` if successful
