# PlatformAtomics

PlatformAtomics handles low-level Atomics on a platform. An atomic is low-level operations to allow multiple threads to read and modify safely

## functions

```cpp
static inline void* InterlockedCompareExchangePtr(void*volatile* Destination, void* Exchange, void* Comparand);
```
atomically compare-and-swap for pointers and updates a pointer only if it is currently equal to a specific value. `Destination` stores the pointer to the pointer to modify, `Exchange` is the new pointer to store, and `Comparand` is the expected current value. It will return the origional value in Destination before the operation
