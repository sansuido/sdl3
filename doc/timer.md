
# CategoryTimer

SDL provides time management functionality. It is useful for dealing with
(usually) small durations of time.

This is not to be confused with _calendar time_ management, which is
provided by [CategoryTime](CategoryTime).

This category covers measuring time elapsed (SDL_GetTicks(),
SDL_GetPerformanceCounter()), putting a thread to sleep for a certain
amount of time (SDL_Delay(), SDL_DelayNS(), SDL_DelayPrecise()), and firing
a callback function after a certain amount of time has elasped
(SDL_AddTimer(), etc).

There are also useful macros to convert between time units, like
SDL_SECONDS_TO_NS() and such.
