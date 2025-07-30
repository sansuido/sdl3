
# CategoryError

Simple error message routines for SDL.

Most apps will interface with these APIs in exactly one function: when
almost any SDL function call reports failure, you can get a human-readable
string of the problem from SDL_GetError().

These strings are maintained per-thread, and apps are welcome to set their
own errors, which is popular when building libraries on top of SDL for
other apps to consume. These strings are set by calling SDL_SetError().

A common usage pattern is to have a function that returns true for success
and false for failure, and do this when something fails:

```c
if (something_went_wrong) {
   return SDL_SetError("The thing broke in this specific way: %d", errcode);
}
```

It's also common to just return `false` in this case if the failing thing
is known to call SDL_SetError(), so errors simply propagate through.
