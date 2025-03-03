SDL3 for Dart
====

# Requirement

* ffi ^2.1.4

This library is limited to 64bit.  
Since ffi is used, a dynamic library suitable for various environments is required.  
image, mixer, net, and ttf are optional. Please include it if necessary.  
Since sdl3gfx is included in the source, a dynamic library is not required.  

```dart
import 'package:sdl3/sdl3.dart'; // SDL3, SDL3_image, SDL3_mixer, SDL3_net, SDL3_ttf
import 'package:sdl3/sdl3gfx.dart'; // SDL3_gfx
```

## Windows requires dll files.

SDL3.dll  
SDL3_image.dll  
SDL3_mixer.dll  
SDL3_net.dll  
SDL3_ttf.dll  

## Linux (or Android, Fuchsia) requires so files.

libSDL3.so  
libSDL3_image.so  
libSDL3_mixer.so  
libSDL3_net.so  
libSDL3_ttf.so  

## MacOS (or iOS) requires dylib files.

libSDL3.dylib  
libSDL3_image.dylib  
libSDL3_mixer.dylib  
libSDL3_net.dylib  
libSDL3_ttf.dylib  

## And more.

If you want to add a library under special circumstances (example: dylib), do the following:  

```dart
SdlDynamicLibraryService().add('SDL3', DynamicLibrary.open('YOUR_SDL3_ENVIONMENT.dylib'));
SdlDynamicLibraryService().add('SDL3_image', DynamicLibrary.open('YOUR_SDL3_image_ENVIONMENT.dylib'));
SdlDynamicLibraryService().add('SDL3_mixer', DynamicLibrary.open('YOUR_SDL3_mixer_ENVIONMENT.dylib'));
SdlDynamicLibraryService().add('SDL3_net', DynamicLibrary.open('YOUR_SDL3_net_ENVIONMENT.dylib'));
SdlDynamicLibraryService().add('SDL3_ttf', DynamicLibrary.open('YOUR_SDL3_ttf_ENVIONMENT.dylib'));
if (sdlInit(SDL_INIT_VIDEO)) {
  // success
}
```

# Note

A Dart library for accessing SDL 3 APIs using, FFI.

https://www.libsdl.org/

Windows 64bit & Linux (Tested under Windows 10 WSL2 environment)

Currently, we are providing it on an experimental basis using the dll compiled below.

https://github.com/sansuido/build-sdl3

# Author

yamahara
