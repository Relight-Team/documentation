# Names

Main file that handles the `RName` system

## How RName works

`RObjects` requires names to keep track and identify each object. If we were to use `String`, then doing operations or comparisons on the name could take a long time, and even lag the runtime on high-count objects. The solution is `RName`, which, instead of storing the entire raw string, we will attach each name to an ID on runtime. Now when we do operations and comparisons, it will only compare the numbers, instead of the full string.

The list of ID's to Name are stored in the pool, which `RName` can use to get the actual string name. This system is useful for fast comparison and optimization for common names

## RName

### Constructors

```cpp
RName(String Input, bool Unique = false)
```
Will create an `RName` instance from `Input`. If `Unique` is true, then it cannot be compared to other `RNames`, even if they are the same

---

```cpp
RName(UTF8* Input, bool Unique = false)
```
Same as above, but with UTF8* support

### Operators

```cpp
bool operator==(RName& Other)
```
compares 2 RName and check if they match, instead of checking each character, this only checks the ID and Duplication

### Functions

```cpp
uint32 GetIndex()
```
Returns the index that the RName is tracking

---

```cpp
String ToString()
```
Returns the String the RName is tracking

---

```cpp
uint32 GetDupIndex()
```
Get the duplication index of the RName, if not 0, then the RName is unique

## GlobalRNamePool (RNamePool)

`RNamePool` is delclared as a runtime variable called `GlobalRNamePool`. It handles both the link between ID and strings, and handle the duplication count

### functions

```cpp
uint32 GlobalRNamePool.Length()
```
Get the length of the pool

---

```cpp
uint32 GlobalRNamePool.Indices()
```
Get the indices of the pool (count from 0 instead of 1)

---

```cpp
RNameID GlobalRNamePool.FindOrAdd(String Input, bool IsDupList)
```
Find the ID of the `Input` string, if it doesn't exist, we will add it. If `IsDupList` is true, then we will increase the duplication count from pool. Returns the RNameID of the string

---

```cpp
RNameID GlobalRNamePool.FindOrAdd(char* Input, bool IsDupList)
```
Does the same as above, but support `char*` format

---

```cpp
uint32 GlobalRNamePool.GetDup(uint32 Index)
```
Get the duplication count from the index `Index`

---

```cpp
String GetNameFromID(uint32 Index)
```
Get the Name as a string from index `Index`
