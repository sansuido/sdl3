
# CategoryInit

All SDL programs need to initialize the library before starting to work
with it.

Almost everything can simply call SDL_Init() near startup, with a handful
of flags to specify subsystems to touch. These are here to make sure SDL
does not even attempt to touch low-level pieces of the operating system
that you don't intend to use. For example, you might be using SDL for video
and input but chose an external library for audio, and in this case you
would just need to leave off the `SDL_INIT_AUDIO` flag to make sure that
external library has complete control.

Most apps, when terminating, should call SDL_Quit(). This will clean up
(nearly) everything that SDL might have allocated, and crucially, it'll
make sure that the display's resolution is back to what the user expects if
you had previously changed it for your game.

SDL3 apps are strongly encouraged to call SDL_SetAppMetadata() at startup
to fill in details about the program. This is completely optional, but it
helps in small ways (we can provide an About dialog box for the macOS menu,
we can name the app in the system's audio mixer, etc). Those that want to
provide a _lot_ of information should look at the more-detailed
SDL_SetAppMetadataProperty().
