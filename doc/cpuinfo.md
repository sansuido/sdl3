
# CategoryCPUInfo

CPU feature detection for SDL.

These functions are largely concerned with reporting if the system has
access to various SIMD instruction sets, but also has other important info
to share, such as system RAM size and number of logical CPU cores.

CPU instruction set checks, like SDL_HasSSE() and SDL_HasNEON(), are
available on all platforms, even if they don't make sense (an ARM processor
will never have SSE and an x86 processor will never have NEON, for example,
but these functions still exist and will simply return false in these
cases).
