# RMemory

!!! warning "Placeholder functions"
    custom memory functions do not exist yet, for now it uses system defaults, this is planned to change in the future

RMemory is relight's custom memory management struct. Handling allocating and deallocating memory

## Functions

```cpp
static void* RMemory::Malloc(size_t Size, int32 Alignment = 0)
```
Allocate's memory on heap for `Size` and return it's pointer

---

```cpp
static void* RMemory::Realloc(void* Ptr, size_t Size, int32 Alignment = 0)
```
changes size to `Size` for `Ptr`, may expand and/or move to new location, return new pointer

---

```cpp
static void RMemory::Free(void* Ptr)
```
Free's `Ptr` from memory

---

```cpp
static void* RMemory::Memmove(void* Dest, void* Src, size_t Size)
```
Copy's the source bytes to destination. `Dest` determines the destination, `Src` determines the source, and `Size` determines the amount of bytes to copy. Returns destination pointer. This method is a bit slower than `Memcpy` but is overlap safe, which is useful if you are unsure if the memory block will overlap

---

```cpp
static int RMemory::Memcmp(void* A, void* B, size_t Size)
```
Compares memory `A` and memory `B` for `Size` amount of bytes to check, returns `0` if the 2 blocks are equal, `positive number` if `A` is bigger, or `negative number` if `B` is bigger

---

```cpp
static void* RMemory::Memset(void* A, int32 C, size_t Size)
```
Fills the memory block `A` with the content `C` for `Size` bytes. Returns filled pointer

---

```cpp
static void* RMemory::Memcpy(void* Dest, void* Src, size_t Size)
```
Similar to to `Memmove`, but with the main difference being that `memcpy` isn't safe with overlaps (will cause undefined behavior), but it is faster than `Memmove`. Only use this if you are 100% sure that the new memory region does not overlap

---

```cpp
static void* RMemory::Memzero(void* A, size_t Size)
```
Fills the memory block `A` with 0 for `Size` bytes. Returns filled pointer
