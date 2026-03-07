# ArchiveProxy

ArchiveProxy is a custom Archive that wraps around another archive, it allows overrides and modifications of the parent archive without changing it directly

## Constructors

``` cpp
ArchiveProxy ArchiveProxyClass(Archive& InArchive);
```
create an proxy archive based on `InArchive`

## Functions

```cpp
virtual void Serialize(void* Input, uint32 Length)
```
Serialize the data `Input` for the size of `Length`. By default, It will run parent Serialization

---

```cpp
virtual void Flush()
```
Forces data to stop and push the data into final destination. By default, it will run parent Flush

---

```cpp
virtual void Seek(int32 Offset)
```
Set the current offset into backing data storage by position `Offset`. By default, It will run parent Seek
