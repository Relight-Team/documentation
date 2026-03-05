# ToString

ToString holds functions that will convert a variable to string

## Functions

```cpp
inline String CORE_API::ToString(int Input)
```
Return's a string based on int

---

```cpp
inline String CORE_API::ToString(float Input)
```
Return's a string based on float

---

```cpp
inline String CORE_API::ToString(double Input)
```
Return's a string based on double

---

```cpp
inline String CORE_API::ToString(bool Input)
```
Return's a string based on boolean

---

```cpp
inline String CORE_API::ToString(String Input)
```
Return's a string, simply here to aid in Array conversion

---

```cpp
inline String CORE_API::ToString(const UTF16* Input)
```
Return's a string based on UTF16 pointer array

---

```cpp
inline String CORE_API::ToString(const char (&Input)[N])
```
Return's a string based on char pointer array

---

```cpp
inline String CORE_API::ToString(Array<ArrayInput> Input)
```
Return's a string based on an array (note: `ArrayInput` is a template for any type)
