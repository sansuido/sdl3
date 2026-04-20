SDL3 for Dart
====

# Requirement

* ffi ^2.2.0

This library is limited to 64bit.  
Since ffi is used, a dynamic library suitable for various environments is required.  
image, mixer, net, and ttf are optional. Please include it if necessary.  
Since sdl3gfx is included in the source, a dynamic library is not required.  
For OpenGL, call require separately.  

```dart
import 'package:sdl3/sdl3.dart'; // SDL3, SDL3_image, SDL3_mixer, SDL3_net, SDL3_ttf, SDL3_shadercross
import 'package:sdl3/sdl3gfx.dart'; // SDL3_gfx
import 'package:sdl3/sdl3opengl.dart'; // OpenGL
```

## Windows requires dll files.

SDL3.dll  
SDL3_image.dll  
SDL3_mixer.dll  
SDL3_net.dll  
SDL3_ttf.dll  
SDL3_shadercross.dll  

## Linux requires so files.

libSDL3.so.0  
libSDL3_image.so.0  
libSDL3_mixer.so.0  
libSDL3_net.so.0  
libSDL3_ttf.so.0  
libSDL3_shadercross.so.0

## Android, Fuchsia requires so files.

libSDL3.so  
libSDL3_image.so  
libSDL3_mixer.so  
libSDL3_net.so  
libSDL3_ttf.so  
libSDL3_shadercross.so

## MacOS (or iOS) requires dylib files.

libSDL3.dylib  
libSDL3_image.dylib  
libSDL3_mixer.dylib  
libSDL3_net.dylib  
libSDL3_ttf.dylib  
libSDL3_shadercross.dylib  

## And more.

If you want to set a library under special circumstances (example: dylib), do the following:  

```dart
SdlDynamicLibraryService().set('sdl', 'YOUR_SDL3_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('image', 'YOUR_SDL3_image_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('mixer', 'YOUR_SDL3_mixer_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('net', 'YOUR_SDL3_net_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('ttf', 'YOUR_SDL3_ttf_ENVIONMENT.dylib');
SdlDynamicLibraryService().set('shadercross', 'YOUR_SDL3_shadercross_ENVIONMENT.dylib');
if (sdlInit(SDL_INIT_VIDEO)) {
  // success
}
```

# Note

A Dart library for accessing SDL 3 APIs using, FFI.

https://www.libsdl.org/

Windows 64bit & Linux (Tested under Windows 11 WSL2 environment)

Currently, we are providing it on an experimental basis using the dll compiled below.

https://github.com/sansuido/build-sdl3

# Examples

## learnopengl.com for Dart
https://github.com/sansuido/sdl3_learnopengl/

## SDL_gpu_examples for Dart
https://github.com/sansuido/sdl3_gpu_examples/

# Author

yamahara
