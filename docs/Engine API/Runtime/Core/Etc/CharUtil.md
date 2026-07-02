# CharUtil

CharUtil.h contains utilities for handling characters (both `char` and `UTF8`)

## Functions

``` cpp
static int32 CharUtil::CharToInt(char Character)
```

Convert a char to an integer

---

``` cpp
static char CharUtil::IntToChar(int32 DEC)
```

Convert an integer into a character

---

``` cpp
static char CharUtil::ToUpper(char Character)
```

Convert character to uppercase

---

``` cpp
static char CharUtil::ToLower(char Character)
```

Convert the ASCII character into lowercase

---

``` cpp
static bool CharUtil::IsUpper(CharType Character)
```

Returns `true` if a character is a capital number. `CharType` can be any valid character type

---

``` cpp
static bool CharUtil::IsLower(CharType Character)
```

Returns `true` if a character is a lowercase number. `CharType` can be any valid character type

---

``` cpp
static bool CharUtil::IsASCII(CharType Character)
```

Returns `true` if a character is ASCII compatible. `CharType` can be any valid character type

---
