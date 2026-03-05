# FileReader

!!! warning "Rewrite planned"
    This class is planned to get rewritten, all these functions are temporarily

FileReader is a container that stores data from a file that's been read

## Operators

```cpp
FileReaderClass[Integer]
```
Get's a constant character from file contents

## Functions

```cpp
void Serialize(void* Input, int Length) override
```
Stores `Input`, which contains file contents, and set the size to `Length`

---

```cpp
size_t GetSize()
```
Return's the size of the file contents

---

```cpp
String ToString
```
convert file contents to string
