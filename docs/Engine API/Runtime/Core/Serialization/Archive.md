# Archive

Archive acts as a base and a wrapper for all serialization types. Serialization is the process of converting an object state or data strucutre into a storable format. Examples include Memory Reader and Writer, a File Reader and Writer, etc. All serialization systems uses this class as a base

## Constructor

``` cpp
Archive ArchiveClass;
```
Create an archive

## Functions

```cpp
virtual void Serialize(void* Input, int Length)
```
Serialize the data `Input` for the size of `Length`. By default, Archive will just run `Memset` on the data

---

```cpp
virtual void Flush()
```
Forces data to stop and push the data into final destination. By default, it does nothing

---

```cpp
virtual void Seek(int Offset)
```
Set the current offset into backing data storage by position `Offset`. By default, it does nothing

---

```cpp
bool DoesReturnCode()
```
Return's `true` if the archive contains code

---

```cpp
bool DoesContainRMap()
```
Return's `true` if the archive contains `RMap` data

---

```cpp
bool DoesIsSaveLoadGame()
```
Return's `true` if the archive is for saving and/or loading a game

---

```cpp
bool DoesIsCountingMem()
```
Return's `true` if the archive count memory

---

```cpp
bool DoesIsLoading()
```
Return's `true` if the archive is for loading data

---

```cpp
bool DoesIsSaving()
```
Return's `true` if the archive is for saving data

---

```cpp
bool DoesIsTracking()
```
Return's `true` if the archive tracks content (like undo/redo actions)

---

```cpp
bool DoesIsLoadingPak()
```
Return's `true` if the archive is loading from a pak file

---

```cpp
bool DoesIsError()
```
Return's `true` if the archive contains errors

---

```cpp
bool DoesIsFatal()
```
Return's `true` if the archive contains fatal errors
