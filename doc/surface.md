
# CategorySurface

SDL surfaces are buffers of pixels in system RAM. These are useful for
passing around and manipulating images that are not stored in GPU memory.

SDL_Surface makes serious efforts to manage images in various formats, and
provides a reasonable toolbox for transforming the data, including copying
between surfaces, filling rectangles in the image data, etc.

There is also a simple .bmp loader, SDL_LoadBMP(), and a simple .png
loader, SDL_LoadPNG(). SDL itself does not provide loaders for other file
formats, but there are several excellent external libraries that do,
including its own satellite library,
[SDL_image](https://wiki.libsdl.org/SDL3_image)
.

In general these functions are thread-safe in that they can be called on
different threads with different surfaces. You should not try to modify any
surface from two threads simultaneously.
