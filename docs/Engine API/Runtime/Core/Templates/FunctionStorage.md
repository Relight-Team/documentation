# FunctionStorage

A class which dictates how a function should be stored, whether it should just be a raw pointer, heap, inline, etc

## Base class

All FunctionOwner classes are based on `CORE_API::Internal::FunctionReference::FunctionStorageBase`

### Functions

!!! note
    while not defined in the base class, it's highly recommended to have a binding function called `Bind`

```cpp
virtual void* FunctionStorageBase::GetPointer() const = 0;
```
Get's the pointer of the function

---

```cpp
virtual void FunctionStorageBase::Unbind() = 0;
```
Unbinds the function from the storage

## FunctionReferenceStorage

FunctionReferenceStorage is a storage that's used for `FunctionRef`

### functions

```cpp
template <typename AnyCallableObject>
typename RemoveReference<AnyCallableObject>::Type* FunctionStorageBase::Bind(AnyCallableObject& Input)
```
Binds the callable object to the storage
