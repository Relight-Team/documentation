# FunctionOwner

An internal class that handles how the class owns a function

## Base class

All FunctionOwner classes are based on `CORE_API::Internal::FunctionReference::CallableObjectOwnerBase`

### functions

```cpp
virtual void* CallableObjectOwnerBase::GetAddress() = 0;
```
Get's the address of the function

---

```cpp
virtual void CallableObjectOwnerBase::Destroy() = 0;
```
Destroy the function

---
