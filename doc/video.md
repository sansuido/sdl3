
# CategoryVideo

SDL's video subsystem is largely interested in abstracting window
management from the underlying operating system. You can create windows,
manage them in various ways, set them fullscreen, and get events when
interesting things happen with them, such as the mouse or keyboard
interacting with a window.

The video subsystem is also interested in abstracting away some
platform-specific differences in OpenGL: context creation, swapping
buffers, etc. This may be crucial to your app, but also you are not
required to use OpenGL at all. In fact, SDL can provide rendering to those
windows as well, either with an easy-to-use
[2D API](https://wiki.libsdl.org/SDL3/CategoryRender)
or with a more-powerful
[GPU API](https://wiki.libsdl.org/SDL3/CategoryGPU)
. Of course, it can simply get out of your way and give you the window
handles you need to use Vulkan, Direct3D, Metal, or whatever else you like
directly, too.

The video subsystem covers a lot of functionality, out of necessity, so it
is worth perusing the list of functions just to see what's available, but
most apps can get by with simply creating a window and listening for
events, so start with SDL_CreateWindow() and SDL_PollEvent().
