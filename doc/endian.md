
# CategoryEndian

Functions converting endian-specific values to different byte orders.

These functions either unconditionally swap byte order (SDL_Swap16,
SDL_Swap32, SDL_Swap64, SDL_SwapFloat), or they swap to/from the system's
native byte order (SDL_Swap16LE, SDL_Swap16BE, SDL_Swap32LE, SDL_Swap32BE,
SDL_Swap32LE, SDL_Swap32BE, SDL_SwapFloatLE, SDL_SwapFloatBE). In the
latter case, the functionality is provided by macros that become no-ops if
a swap isn't necessary: on an x86 (littleendian) processor, SDL_Swap32LE
does nothing, but SDL_Swap32BE reverses the bytes of the data. On a PowerPC
processor (bigendian), the macros behavior is reversed.

The swap routines are inline functions, and attempt to use compiler
intrinsics, inline assembly, and other magic to make byteswapping
efficient.
