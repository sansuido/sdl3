## 2.4.2
- SDL3-2025-10-26
- [add] Add image functions(imgSaveCurIo, imgSaveAnimation and more).

## 2.4.1
- SDL3-2025-10-19
- [fixed] Changed the license to MIT.
- [add] Added sdlCreateAnimatedCursor function.
- [add] Added sdlGetPenDeviceType function.
- [add] Added PinchFingerEvent(SDL_EVENT_PINCH_BEGIN, SDL_EVENT_PINCH_UPDATE, SDL_EVENT_PINCH_END).

## 2.4.0
- SDL3-2025-10-12
- [changed] Changed the license to MIT.
- [add] Added imgGetClipboardImage function.
- [add] Added PNG support functions to surface.

## 2.3.10
- SDL3-2025-10-05

## 2.3.9
- SDL3-2025-09-28
- [fixed] Fixed inconsistencies in the notation of some functions in SdlWindowPointerEx.

## 2.3.8
- SDL3-2025-09-21

## 2.3.7
- SDL3-2025-09-14
- [add] Added mixSetTrackRawIoStream.

## 2.3.6
- SDL3-2025-09-07

## 2.3.5
- SDL3-2025-08-31
- [changed] The name has changed from SdlGpuRenderStateDesc to SdlGpuRenderStateCreateInfo.

## 2.3.4
- SDL3-2025-08-24

## 2.3.3
- SDL3-2025-08-17
- [add] Added ImgAnimationEncoder and ImgAnimationDecoder functions (removed ImgAnimationStream).
- [add] Added ttfSet(or Get)FontCharSpacing.

## 2.3.2
- SDL3-2025-08-10

## 2.3.1
- SDL3-2025-08-03
- [add] Added webp and ImgAnimationStream functions.
- [add] Added polygon2d_test.dart example.

## 2.3.0
- SDL3-2025-07-27
- [changed] Critical changes have been made to mixer functions and structures.

## 2.2.1
- SDL3-2025-07-20
- [add] Added example (example/dxlib/no029.dart Action sample program).

## 2.2.0
- SDL3-2025-07-13
- [update] Added a category to doc.

## 2.1.1
- SDL3-2025-07-06

## 2.1.0
- SDL3-2025-06-29
- [fixed] Fixed a bug that some OpenGL functions were not referenced(`glActiveTexture` and more).
- [fixed] Changed the type of GLsizeiptr to Uint32* from Uint64.
- [deprecate] Links to libraries such as opengl32.dll have been removed.

## 2.0.0
- SDL3-2025-06-22
- [update] Updated SdlDynamicLibraryService class. Added OpenGL support.
- [update] Looked into doc dramatically.

## 1.6.3
- SDL3-2025-06-15
- [changed] Changed to `halildurmus_lints` from `lints`.

## 1.6.2
- SDL3-2025-06-08

## 1.6.1
- SDL3-2025-06-01
- [update] Added support for blend modes in gfx(default mode is SDL_BLENDMODE_BLEND).
- [add] Added functions(sdlPutAudioStreamDataNoCopy and callback).

## 1.6.0
- SDL3-2025-05-25
- [update] New formatting style. (Dart 3.8.0)

## 1.5.6
- SDL3-2025-05-18

## 1.5.5
- SDL3-2025-05-11
- [changed] The SDL tag has been removed from SDL_net.

## 1.5.4
- SDL3-2025-05-04

## 1.5.3
- SDL3-2025-04-27
- [add] Added functions(sdlGetEventDescription, sdlPutAudioStreamPlanarData AND sdlSetAudioIterationCallbacks).

## 1.5.2
- SDL3-2025-04-20

## 1.5.1
- SDL3-2025-04-13

## 1.5.0
- SDL3-2025-04-06
- [add] Added enum classes. (SdlkPropWindow, TtfkFontWeight, TtfkImage and more)

## 1.4.4
- SDL3-2025-03-30
- [add] Added functions(sdlGetWindowProgressState AND sdlGetWindowProgressValue).

## 1.4.3
- SDL3-2025-03-23
- [add] Added functions(sdlSetWindowProgressState AND sdlSetWindowProgressValue).

## 1.4.2
- SDL3-2025-03-16
- [add] Added sdlCreateGpuRenderState function AND scale mode `PIXELART`.

## 1.4.1
- SDL3-2025-03-09
- [add] Added functions(sdlSetRelativeMouseTransform, sdlRenderTexture9GridTiled and etc..)

## 1.4.0
- SDL3-2025-03-02
- [changed] Changed the site that provides the dll.
- [update] Support ffi ^2.1.4.

## 1.3.6
- SDL3-2025-02-23

## 1.3.5
- SDL3-2025-02-16
- [update] New formatting style. (Dart 3.7.0)

## 1.3.4
- SDL3-2025-02-09
- [add] Added sdlStretchSurface and ttf tag functions.

## 1.3.3
- SDL3-2025-02-02
- [add] Added ttf functions.

## 1.3.2
- SDL3-2025-01-26

## 1.3.1
- SDL3-2025-01-19

## 1.3.0
- SDL3-2025-01-12
- [fixed] Ignore `...` & `va_list`. (sdlLog and more)
- [add] Added SdlRendererPointerEx functions(textureAffine, textureTiled, texture9Grid, debugText).

## 1.2.1
- SDL3-2025-01-05

## 1.2.0
- SDL3-2024-12-29
- [add] Added tray functions.

## 1.1.1
- SDL3-2024-12-22

## 1.1.0
- SDL3-2024-12-15
- [add] Added gpu functions.

## 1.0.0
- SDL3-2024-12-08
- [deprecate] imgInit (IMG_INIT_flags...) and imgQuit are deprecated.
- [add] Added SdlAsyncIo related functions.
- [fixed] Fixed example sources.

## 0.1.45
- SDL3-2024-12-01

## 0.1.44
- SDL3-2024-11-24
- [add] Added SdlDynamicLibraryService class. You can now specify dynamic libraries for specific environments.

## 0.1.43
- SDL3-2024-11-17

## 0.1.42
- SDL3-2024-11-10

## 0.1.41
- SDL3-2024-11-03

## 0.1.40
- SDL3-2024-10-27
- [add] Added spot light example.

## 0.1.39
- SDL3-2024-10-20

## 0.1.38
- SDL3-2024-10-13

## 0.1.37
- SDL3-2024-10-06
- [update] Enum classes Renamed.

## 0.1.36
- SDL3-2024-09-30
- [update] Support Enum classes.

## 0.1.35
- SDL3-2024-09-22

## 0.1.34
- SDL3-2024-09-15

## 0.1.33
- SDL3-2024-09-10

## 0.1.32
- SDL3-2024-09-01
- [update] Support ffi ^2.1.3.

## 0.1.31
- SDL3-2024-08-25

## 0.1.30
- SDL3-2024-08-18

## 0.1.29
- SDL3-2024-08-11

## 0.1.28
- SDL3-2024-08-04

## 0.1.27
- SDL3-2024-07-28

## 0.1.26
- SDL3-2024-07-21

## 0.1.25
- SDL3-2024-07-14

## 0.1.24
- SDL3-2024-07-07

## 0.1.23
- SDL3-2024-06-30

## 0.1.22
- SDL3-2024-06-23

## 0.1.21
- SDL3-2024-06-16

## 0.1.20
- SDL3-2024-06-09

## 0.1.19
- SDL3-2024-06-02

## 0.1.18
- SDL3-2024-05-26

## 0.1.17
- SDL3-2024-05-19

## 0.1.16
- SDL3-2024-05-12

## 0.1.15
- SDL3-2024-05-05

## 0.1.14
- SDL3-2024-04-28

## 0.1.13
- SDL3-2024-04-07

## 0.1.12
- SDL3-2024-03-31

## 0.1.11
- [fixed] Fixed padding of structures inside structures.(SDL_Keysym and SDL_HapticDirection use case).

## 0.1.10
- SDL3-2024-03-24

## 0.1.9
- SDL3-2024-03-21
- [fixed] Fixed gfx functions.

## 0.1.8
- SDL3-2024-03-19

## 0.1.7
- SDL3-2024-03-10

## 0.1.6
- SDL3-2024-03-03

## 0.1.5
- [update] Added the renderer extension library.

## 0.1.4
- SDL3-2024-02-25
- [update] Removed generated/lib_sdl_video_capture.dart
- [update] Added generated/lib_sdl_camera.dart

## 0.1.3
- SDL3-2024-02-18
- [update] Removed deprecated `elementAt`. (Require Dart 3.3.0)
- [update] Support ffi ^2.1.2.

## 0.1.2
- SDL3-2024-02-11

## 0.1.1
- SDL3-2024-02-04

## 0.1.0
- SDL3-2024-02-01
