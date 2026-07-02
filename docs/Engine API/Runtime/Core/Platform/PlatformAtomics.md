# PlatformAtomics

PlatformAtomics handles low-level Atomics on a platform. An atomic is low-level operations to allow multiple threads to read and modify safely

## functions

```cpp
static inline int32 InterlockedCompareExchange(volatile int32* Destination, int32 Exchange, int32 Comparand)
```
atomically compare-and-swap for int32 and updates the int32 only if it is currently equal to a specific value. `Destination` stores the integer to modify, `Exchange` is the new integer to store, and `Comparand` is the expected current value. It will return the original value in Destination before the operation

---

```cpp
static inline void* InterlockedCompareExchangePtr(void*volatile* Destination, void* Exchange, void* Comparand);
```
atomically compare-and-swap for pointers and updates a pointer only if it is currently equal to a specific value. `Destination` stores the pointer to the pointer to modify, `Exchange` is the new pointer to store, and `Comparand` is the expected current value. It will return the original value in Destination before the operation

---

```cpp
static inline int32 InterlockedOr(volatile int8* ValueA, const int8 ValueB)
```
atomically preforms a bitwise OR on an 8-bit integer. `ValueA` stores the pointer to the 8-bit integer, `ValueB` contains the bits to put into

---

```cpp
static inline int32 AtomicReadRelaxed(volatile const int32* Value)
```
atomically reads the 32-bit value safely. `Value` is the pointer of the 32-bit integer to read
