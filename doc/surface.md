
# CategorySurface

SDL surfaces are buffers of pixels in system RAM. These are useful for
passing around and manipulating images that are not stored in GPU memory.

SDL_Surface makes serious efforts to manage images in various formats, and
provides a reasonable toolbox for transforming the data, including copying
between surfaces, filling rectangles in the image data, etc.

There is also a simple .bmp loader, SDL_LoadBMP(). SDL itself does not
provide loaders for various other file formats, but there are several
excellent external libraries that do, including its own satellite library,
[SDL_image](https://wiki.libsdl.org/SDL3_image)
:

https://github.com/libsdl-org/SDL_image
