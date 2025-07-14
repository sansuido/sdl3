
# CategoryIntrinsics

SDL does some preprocessor gymnastics to determine if any CPU-specific
compiler intrinsics are available, as this is not necessarily an easy thing
to calculate, and sometimes depends on quirks of a system, versions of
build tools, and other external forces.

Apps including SDL's headers will be able to check consistent preprocessor
definitions to decide if it's safe to use compiler intrinsics for a
specific CPU architecture. This check only tells you that the compiler is
capable of using those intrinsics; at runtime, you should still check if
they are available on the current system with the
[CPU info functions](https://wiki.libsdl.org/SDL3/CategoryCPUInfo)
, such as SDL_HasSSE() or SDL_HasNEON(). Otherwise, the process might crash
for using an unsupported CPU instruction.

SDL only sets preprocessor defines for CPU intrinsics if they are
supported, so apps should check with `#ifdef` and not `#if`.

SDL will also include the appropriate instruction-set-specific support
headers, so if SDL decides to define SDL_SSE2_INTRINSICS, it will also
`#include <emmintrin.h>` as well.
