
# CategoryBeginCode

`SDL_begin_code.h` sets things up for C dynamic library function
definitions, static inlined functions, and structures aligned at 4-byte
alignment. If you don't like ugly C preprocessor code, don't look at this
file. :)

SDL's headers use this; applications generally should not include this
header directly.
