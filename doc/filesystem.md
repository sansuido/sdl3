
# CategoryFilesystem

SDL offers an API for examining and manipulating the system's filesystem.
This covers most things one would need to do with directories, except for
actual file I/O (which is covered by [CategoryIOStream](CategoryIOStream)
and [CategoryAsyncIO](CategoryAsyncIO) instead).

There are functions to answer necessary path questions:

- Where is my app's data? SDL_GetBasePath().
- Where can I safely write files? SDL_GetPrefPath().
- Where are paths like Downloads, Desktop, Music? SDL_GetUserFolder().
- What is this thing at this location? SDL_GetPathInfo().
- What items live in this folder? SDL_EnumerateDirectory().
- What items live in this folder by wildcard? SDL_GlobDirectory().
- What is my current working directory? SDL_GetCurrentDirectory().

SDL also offers functions to manipulate the directory tree: renaming,
removing, copying files.
