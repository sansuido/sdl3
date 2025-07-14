
# CategoryPower

SDL power management routines.

There is a single function in this category: SDL_GetPowerInfo().

This function is useful for games on the go. This allows an app to know if
it's running on a draining battery, which can be useful if the app wants to
reduce processing, or perhaps framerate, to extend the duration of the
battery's charge. Perhaps the app just wants to show a battery meter when
fullscreen, or alert the user when the power is getting extremely low, so
they can save their game.
