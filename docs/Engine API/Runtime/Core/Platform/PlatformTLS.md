# PlatformTLS
Thread-local storage. A system in which each thread get's their own copy of a variable

```cpp
static uint32 AllocateTLSSlot()
```

Allocate a slot for TLS, returns the TLS key, or `-1` if unsuccessful

---

```cpp
static void FreeTLSSlot(uint32 Index);
```

Delete the slot for TLS, `Index` is the key to delete
