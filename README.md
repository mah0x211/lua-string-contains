# lua-string-contains

[![test](https://github.com/mah0x211/lua-string-contains/actions/workflows/test.yml/badge.svg)](https://github.com/mah0x211/lua-string-contains/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/mah0x211/lua-string-contains/branch/master/graph/badge.svg)](https://codecov.io/gh/mah0x211/lua-string-contains)

tests whether a substring is contained in a string or not.


## Installation

```sh
luarocks install string-contains
```

---


## ok = contains( s, ss [, is_pattern] )

tests whether the `ss` is contained in `s` or not.

**Params**

- `s:string`: string.
- `ss:string`: substring.
- `is_pattern:boolean`: if `true`, the `ss` will be used as a pattern string.

**Returns**

- `ok:boolean`: `true` if `ss` is contained in `s`.


### ok = contains.prefix( s, prefix [, is_pattern] )

tests whether `s` starts with `prefix`.

**Params**

- `s:string`: string.
- `prefix:string`: prefix string.
- `is_pattern:boolean`: if `true`, the `prefix` will be used as a pattern string.


**Returns**

- `ok:boolean`: `true` if `s` starts with `prefix`.


### ok = contains.suffix( s, suffix [, is_pattern] )

tests whether `s` ends with `suffix`.

**Params**

- `s:string`: string.
- `suffix:string`: suffix string.
- `is_pattern:boolean`: if `true`, the `suffix` will be used as a pattern string.


**Returns**

- `ok:boolean`: `true` if `s` ends with `suffix`.

    
