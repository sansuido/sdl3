
# CategoryMain

Redefine main() if necessary so that it is called by SDL.

In order to make this consistent on all platforms, the application's main()
should look like this:

```c
#include <SDL3/SDL.h>
#include <SDL3/SDL_main.h>

int main(int argc, char *argv[])
{
}
```

SDL will take care of platform specific details on how it gets called.

This is also where an app can be configured to use the main callbacks, via
the SDL_MAIN_USE_CALLBACKS macro.

SDL_main.h is a "single-header library," which is to say that including
this header inserts code into your program, and you should only include it
once in most cases. SDL.h does not include this header automatically.

For more information, see:

https://wiki.libsdl.org/SDL3/README-main-functions
