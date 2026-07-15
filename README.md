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

## SDL_projects for Dart
https://github.com/sansuido/sdl3_projects/


# Author

yamahara

# Task List (for 3.0.0)
- [x] ~~lib_sdl.dart~~
- [x] ~~lib_sdl_assert.dart~~ Please use Dart assert.
- [x] [lib_sdl_asyncio.dart](./lib/sdl3/ex/sdl/asyncio/lib_sdl_asyncio.dart)
- [x] ~~lib_sdl_atomic.dart~~ Not needed. Dart uses an isolate-based concurrency model.
- [x] [lib_sdl_audio.dart](./lib/sdl3/ex/sdl/audio/lib_sdl_audio.dart)
- [x] ~~lib_sdl_blendmode.dart~~
- [x] [lib_sdl_camera.dart](./lib/sdl3/ex/sdl/camera/lib_sdl_camera.dart)
- [x] [lib_sdl_clipboard.dart](./lib/sdl3/ex/sdl/clipboard/lib_sdl_clipboard.dart)
- [x] ~~lib_sdl_cpuinfo.dart~~
- [x] [lib_sdl_dialog.dart](./lib/sdl3/ex/sdl/dialog/lib_sdl_dialog.dart)
- [x] ~~lib_sdl_error.dart~~
- [x] [lib_sdl_events.dart](./lib/sdl3/ex/sdl/events/lib_sdl_events.dart)
- [x] [lib_sdl_filesystem.dart](./lib/sdl3/ex/sdl/filesystem/lib_sdl_filesystem.dart)
- [x] [lib_sdl_gamepad.dart](./lib/sdl3/ex/sdl/gamepad/lib_sdl_gamepad.dart)
- [x] [lib_sdl_gpu.dart](./lib/sdl3/ex/sdl/gpu/lib_sdl_gpu.dart)
- [x] [lib_sdl_guid.dart](./lib/sdl3/ex/sdl/guid/lib_sdl_guid.dart)
- [x] [lib_sdl_haptic.dart](./lib/sdl3/ex/sdl/haptic/lib_sdl_haptic.dart)
- [x] [lib_sdl_hidapi.dart](./lib/sdl3/ex/sdl/hidapi/lib_sdl_hidapi.dart)
- [x] ~~lib_sdl_hints.dart~~
- [x] [lib_sdl_image.dart](./lib/sdl3/ex/image/lib_sdl_image.dart)
- [x] ~~lib_sdl_init.dart~~
- [x] [lib_sdl_iostream.dart](./lib/sdl3/ex/sdl/iostream/lib_sdl_iostream.dart)
- [x] [lib_sdl_joystick.dart](./lib/sdl3/ex/sdl/joystick/lib_sdl_joystick.dart)
- [x] [lib_sdl_keyboard.dart](./lib/sdl3/ex/sdl/keyboard/lib_sdl_keyboard.dart)
- [x] ~~lib_sdl_loadso.dart~~ Please use dart:ffi.
- [x] [lib_sdl_locale.dart](./lib/sdl3/ex/sdl/locale/lib_sdl_locale.dart)
- [x] ~~lib_sdl_log.dart~~
- [x] ~~lib_sdl_main.dart~~ Not supported. SDL3 main callbacks (SDL_AppInit) require compiling a C-level entry point.
- [x] [lib_sdl_messagebox.dart](./lib/sdl3/ex/sdl/messagebox/lib_sdl_messagebox.dart)
- [x] ~~lib_sdl_metal.dart~~
- [x] ~~lib_sdl_misc.dart~~
- [x] [lib_sdl_mixer.dart](./lib/sdl3/ex/mixer/lib_sdl_mixer.dart)
- [x] [lib_sdl_mouse.dart](./lib/sdl3/ex/sdl/mouse/lib_sdl_mouse.dart)
- [x] ~~lib_sdl_mutex.dart~~ Please use Dart async utilities or Mutex packages.
- [x] [lib_sdl_net.dart](./lib/sdl3/ex/net/lib_sdl_net.dart)
- [x] [lib_sdl_notification.dart](./lib/sdl3/ex/sdl/notification/lib_sdl_notification.dart)
- [x] ~~lib_sdl_opengl.dart~~
- [x] ~~lib_sdl_opengl_glext.dart~~
- [x] ~~lib_sdl_openxr.dart~~ Not supported. XR rendering pipelines should be handled directly in native C/C++.
- [x] ~~lib_sdl_pen.dart~~
- [x] [lib_sdl_pixels.dart](./lib/sdl3/ex/sdl/pixels/lib_sdl_pixels.dart)
- [x] ~~lib_sdl_platform.dart~~
- [x] [lib_sdl_power.dart](./lib/sdl3/ex/sdl/power/lib_sdl_power.dart)
- [x] [lib_sdl_process.dart](./lib/sdl3/ex/sdl/process/lib_sdl_process.dart)
- [x] [lib_sdl_properties.dart](./lib/sdl3/ex/sdl/properties/lib_sdl_properties.dart)
- [x] [lib_sdl_rect.dart](./lib/sdl3/ex/sdl/rect/lib_sdl_rect.dart)
- [x] [lib_sdl_render.dart](./lib/sdl3/ex/sdl/render/lib_sdl_render.dart)
- [x] [lib_sdl_sensor.dart](./lib/sdl3/ex/sdl/sensor/lib_sdl_sensor.dart)
- [x] [lib_sdl_shadercross.dart](./lib/sdl3/ex/shadercross/lib_sdl_shadercross.dart)
- [x] [lib_sdl_stdinc.dart](./lib/sdl3/ex/sdl/stdinc/lib_sdl_stdinc.dart)
- [x] [lib_sdl_storage.dart](./lib/sdl3/ex/sdl/storage/lib_sdl_storage.dart)
- [x] [lib_sdl_surface.dart](./lib/sdl3/ex/sdl/surface/lib_sdl_surface.dart)
- [x] [lib_sdl_system.dart](./lib/sdl3/ex/sdl/system/lib_sdl_system.dart)
- [x] ~~lib_sdl_thread.dart~~ Please use Dart Isolates.
- [x] [lib_sdl_time.dart](./lib/sdl3/ex/sdl/time/lib_sdl_time.dart)
- [x] ~~lib_sdl_timer.dart~~
- [x] [lib_sdl_touch.dart](./lib/sdl3/ex/sdl/touch/lib_sdl_touch.dart)
- [x] [lib_sdl_tray.dart](./lib/sdl3/ex/sdl/tray/lib_sdl_tray.dart)
- [x] [lib_sdl_ttf.dart](./lib/sdl3/ex/ttf/lib_sdl_ttf.dart)
- [x] ~~lib_sdl_version.dart~~
- [x] [lib_sdl_video.dart](./lib/sdl3/ex/sdl/video/lib_sdl_video.dart)
- [x] [lib_sdl_vulkan.dart](./lib/sdl3/ex/sdl/vulkan/lib_sdl_vulkan.dart)
