# String

The `String` class is Relight's custom string implementation which stores an `array` of characters. This class can store words, sentences, or even entire paragraphs.

It can also be included in `CoreTypes.h` and `CoreMinimal.h`

## Constructor

``` cpp
String StrName;
```

To create an empty string

---

``` cpp
String StrName = "Hello world!";
```

You can add a default string directly when creating the object

---

``` cpp
char* A = {"a", "b", "c"};
String StrName = A;
```

You can also set the default string to be a `char` pointer

---

``` cpp
UTF16* A = {"a", "b", "c"};
String StrName = A;
```

You can also set the default string to be a [UTF16]() pointer

---

``` cpp
Array<UTF16> HelloWorld = {"a", "b", "c"};
String StrName = HelloWorld;
```

You can also set the default string using UTF16 [Array](../Array)

## Operators

``` cpp
UTF16 StrName[Integer];
```

You can get a specific character using `[]`

---

``` cpp
StrName == StrName2
```

returns `true` if `StrName` and `StrName2` is the same, is case sensitive

---

``` cpp
StrName != StrName2
```

Return's `true` if `StrName` and `StrName2` are not the same, also case sensitive

---

``` cpp
StrName + StrName2
```

Append's `StrName2` to `StrName`

## Functions

``` cpp
bool Compare(String B, bool CaseSensitive = true)
```

Returns `true` if `String` and `B` are equal, if CaseSensitive is `false`, then capitlization will be ignored

---

``` cpp
char ToChar(int I)
```

Convert a character at index `I` from `UTF16` to `char` and returns said `char`

---

``` cpp
int Length() const
```

Returns the length of a string, starting from `1`

---

``` cpp
int Indices() const
```

Similar to `Length()` but we start from `0` instead

---

``` cpp
String ToUpper()
```

Returns a new string where all characters are uppercase

---

``` cpp
String ToLower()
```

Returns a new string where all characters are lowercase

---

``` cpp
void Append(const UTF16& B)
```

Append's character `B` to String

---

``` cpp
void Append(const String& B)
```

Append's String `B` to String

---

``` cpp
void Append(const UTF16* B)
```

Append's UTF16 array `B` to String

---

``` cpp
void Append(const char* B)
```

Append's char array `B` to String

---

``` cpp
void Add(const UTF16& B)
```

The same as `void Append(const UTF16& B)`

---

``` cpp
bool StartsWith(const String& B, bool CaseSensitive = true)
```

Returns `true` if the String starts with `B`, if `CaseSensitive` is `false`, then capitlization will be ignored

---

``` cpp
bool EndsWith(const String& B, bool CaseSensitive = true)
```

Returns `true` if the String ends with `B`, if `CaseSensitive` is `false`, then capitlization will be ignored

---

``` cpp
String Reverse()
```

Returns a copy of the string in reverse

---

``` cpp
bool Contains(const UTF16& StrCheck)
```

returns `true` if string contains character `StrCheck`

---

``` cpp
bool Contains(const String& StrCheck)
```

returns `true` if string contains string `StrCheck`

---

``` cpp
int Find(const String& StrCheck, bool CaseSensitive = true)
```

finds `StrCheck` and returns the index of where it's located. Returns `-1` if it doesn't exist. If `CaseSensitive` is `false`, then capitlization will be ignored

---

``` cpp
bool Split(String& Str, String& Left, String& Right, bool CaseSensitive = true)
```

finds the index of where `Str` is located in the string, and split it between `Left` and `Right`. If `CaseSensitive` is `false`, then capitlization will be ignored. Str can also be `const`

---

``` cpp
void Empty()
```

Reset the String and empty it

---

``` cpp
void TrimStart()
```

Removes any whitespace from the beginning of the string

---

``` cpp
void TrimEnd()
```

Removes any whitespace from the end of the string

---

``` cpp
void Trim()
```

Removes any whitespace from both beginning and end of string

---

``` cpp
void TrimStartChar(UTF16 Input)
```

Remove the first character if the first character is `Input`

---

``` cpp
void TrimEndChar(UTF16 Input)
```

Remove the last character if the last character is `Input`

---

``` cpp
void TrimChar(UTF16 Input)
```

Remove the first and last character if the characters are `Input`

---

``` cpp
void TrimQuotes()
```

Removes any quotes at beginning and end of string

---

``` cpp
Array<UTF16> ToArr()
```

Returns the UTF16 Array

---

``` cpp
void Swap(int A, int B)
```

Swap chracters from index `A` and index `B`

---

``` cpp
void Replace(UTF16 Input, int Index)
```

Replaces character and index `Index` to `Input`

---

``` cpp
Array<char> ToArrayChar()
```

Get any valid characters and return a char Array with them
