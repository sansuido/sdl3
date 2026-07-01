# Changelog

## [2.9.3] - 2026-07-01
- SDL3-2026-06-28
### Added
- Added functions and wrapper classes for the filesystem, stdinc, storage, system.
- Added `example/stdinc_environment_demo.dart`.
### Fixed
- Fixed functions and wrapper classes for the ttf.
- Removed struct `SdlxPowerInfo` and `SdlxDataResult` (use Record).
- Revised the folder hierarchy in `lib/sdl3/ex/sdl`.

## [2.9.2] - 2026-06-25
- SDL3-2026-06-21
### Added
- Added `sdlxConvertEventToRenderCoordinates` function.
- Added `isTargetWindow` helper to easily route events to specific windows.
- Added functions and wrapper classes for the camera.
- Added functions and wrapper classes for the ttf(TtfEngine, TtfText).
- Added `example/ttf_text_engine_renderer_demo.dart`.
### Updated
- Dart 3.12.2

## [2.9.1] - 2026-06-16
- SDL3-2026-06-14
### Changed
- **Strictly Typed Callbacks**: Upgraded raw anonymous function pointers (`Pointer<Void>`) into proper `Pointer<NativeFunction>` types across structs (e.g., `SdlVirtualJoystickDesc`, `SdlIoStreamInterface`).
### Added
- Added support for `SdlNotificationEvent`.
- Added functions and wrapper classes for the gamepad, guid, joystick, power, properties, sensor, time, touch, tray.
- Added `sdlxPushEvent` function.
- Added `example/properties_demo.dart`.
- Added `example/tray_demo.dart`.

## [2.9.0] - 2026-06-09
- SDL3-2026-06-07
### Changed
- **Major overhaul of FFI type definitions**: Refactored bindings to use proper `Short`, `UnsignedLong`, and `Bool` types for robust multi-platform compatibility (Windows & Steam Deck).
- **Fixed `SDL_Event` layout**: Successfully migrated to a full `Union` structure with correct 128-byte alignment, removing manual pointer casting hacks.
- Simplified boolean returns by removing manual `== 1` checks.
### Added
- Added functions and wrapper classes for the iostream.
- Added functions and wrapper classes for the locale.
- Added functions and wrapper classes for the process.
- Added functions for the vulkan.
- Added `example/hidapi_demo.dart`.
- Added `example/locale_demo.dart`.
- Added `example/process_iostream_demo.dart`.
- Added `example/process_read_demo.dart`.

## [2.8.5] - 2026-06-03
- SDL3-2026-05-31
### Added
- Added functions and wrapper classes for the asyncio.
- Added functions for the clipboard.
- Added functions and wrapper classes for the image.
- Added Task List (for 2.9.0) in README.md.
- Added `example/asyncio_demo.dart`.

## [2.8.4] - 2026-05-25
- SDL3-2026-05-24
### Added
- Added functions and wrapper classes for the audio and mixer.
- Added `SdlxGamepadCapSenseEvent` (`SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH`, `SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE`).
- Added `example/dxlib/no029_steep_slope1.dart` and `no029_steep_slope2.dart`.
- Added `FpsManager.getDeltaTime()`.
- Added a link to the SDL_projects for Dart in README.md.

### Changed
- **Updated Examples**: All sample code has been migrated to use the new native audio and mixer structs.

## [2.8.3] - 2026-05-20
- SDL3-2026-05-17
### Added
- Added functions and wrapper classes for the pixels.
### Fixed
- Removed SdlxPalette.
### Updated
- Dart 3.12.0

## [2.8.2] - 2026-05-12
- SDL3-2026-05-10
### Added
- Added functions and wrapper classes for the events.
- Added functions and wrapper classes for the keyboard.
- Added operator == for the SdlxFPoint.
### Changed
- **Updated Examples**: All sample code has been migrated to use the new events.
### Fixed
- Removed the padding that was previously handled knowledge-wise within the structure.
- Improved the `gfx/primitives_stack.dart`.
- Renamed the class of SdlxRenderLogicalPresentation (remove "Info" from the end).

## [2.8.1] - 2026-05-04
- SDL3-2026-05-03
### Added
- Added functions and wrapper classes for the messagebox.
- Added `example/show_message_box.dart`.
- Added `example/rust/animation_desktop_companion.dart`.


## [2.8.0] - 2026-04-29
- SDL3-2026-04-26
### Changed
- **Breaking Change**: Removed redundant `size_t length` parameters. Array lengths are now automatically inferred from Dart `List` objects.
- **Geometry Refactoring**: Removed dependency on `dart:math`'s `Point` and `Rectangle`. 
- **API Standardization**: Refactored `SdlxFPoint`, `SdlxColor`, and `SdlxFRect` to use **positional parameters** and added utility methods (`moveBy`, `moveTo`, etc.).
- **Updated Examples**: All sample code has been migrated to use the new native geometry structs.
- **Format Update**: Migrated to the "Keep a Changelog" standard.

### Migration Guide
- Replace `math.Point<double>` with `SdlxFPoint`.
- Replace `math.Rectangle<double>` with `SdlxFRect`.
- Note: Many functions no longer require an explicit `length` argument when passing a list of points or rectangles.

## [2.7.4] - 2026-04-19
- SDL3-2026-04-19
### Fixed
- Fixed dynamic library loading on Linux by using `.so.0` extension to ensure compatibility with installed SDL3 system libraries.
- Separated Linux and Fuchsia platform handling to use correct library extensions for each.
### Added
- Added `example/hit_test.dart`.

## [2.7.3] - 2026-04-12
- SDL3-2026-04-12

## [2.7.2] - 2026-04-05
- SDL3-2026-04-05
### Added
- Added functions and wrapper classes for the dialog.
- Added `example/dialog_demo.dart`.

## [2.7.1] - 2026-03-29
- SDL3-2026-03-29
### Updated
- Dart 3.11.4

## [2.7.0] - 2026-03-22
- SDL3-2026-03-22
### Fixed
- Fixed an issue with memory allocation on the Dart side for some structs.
### Added
- Added functions and wrapper classes for the GPU.
- Added the URL for `sdl3_gpu_examples` to the readme file.
### Updated
- Dart 3.11.3

## [2.6.2] - 2026-03-15
- SDL3-2026-03-15
### Added
- Added functions and wrapper classes for the GPU (first implementation).
### Updated
- Dart 3.11.2

## [2.6.1] - 2026-03-08
- SDL3-2026-03-08
### Fixed
- Fixed some incorrect calculation of byte size of structure (`SdlGpuGraphicsPipelineCreateInfo` and more).
### Added
- Added mixer functions (`mixLockMixer`, `mixUnlockMixer` and `mixLoadAudioNoCopy`).
- Added GPU functions (`sdlSetGpuRenderStateSamplerBindings`, `sdlSetGpuRenderStateStorageTextures`, `sdlSetGpuRenderStateStorageBuffers`, `sdlGdkSuspendRenderer` and `sdlGdkResumeRenderer`).

## [2.6.0] - 2026-03-01
- SDL3-2026-03-01
### Added
- Added shadercross library.
- Added `example/test_shadercross.dart`.
### Changed
- The return value of `mixGenerate` has been changed to `int`.
### Updated
- Dart 3.11.1

## [2.5.7] - 2026-02-22
- SDL3-2026-02-22

## [2.5.6] - 2026-02-15
- SDL3-2026-02-15
### Updated
- Dart 3.11.0
- ffi ^2.2.0
- halildurmus_lints: ^2.0.0

## [2.5.5] - 2026-02-08
- SDL3-2026-02-08
### Added
- Added `sdlCreateTrayWithProperties`.
### Updated
- Dart 3.10.9
- halildurmus_lints: ^1.1.0

## [2.5.4] - 2026-02-01
- SDL3-2026-02-01
### Added
- Added OpenXR functions and structs.
- Added `sdlTryLockJoysticks`.
### Fixed
- Fixed an incorrect functions argument (`sdlLockJoysticks`, `sdlLockMutex` and more).
### Updated
- Dart 3.10.8

## [2.5.3] - 2026-01-25
- SDL3-2026-01-25

## [2.5.2] - 2026-01-18
- SDL3-2026-01-18
### Changed
- Changed `mixTrackLooping` to `mixGetTrackLoops`.
### Added
- Added `mixSetMixerFrequencyRatio` and `mixGetMixerFrequencyRatio`.
- Added `imgLoadGpuTexture`, `imgLoadGpuTextureIo` and `imgLoadGpuTextureTypedIo`.

## [2.5.1] - 2026-01-11
- SDL3-2026-01-11
### Updated
- Dart 3.10.7
- ffi ^2.1.5

## [2.5.0] - 2026-01-04
- SDL3-2026-01-04
### Added
- Added `mixGetTrackTags` and `mixGetTaggedTracks`.
- Added enum image classes (`ImgkPropAnimationEncoderCreate`, `ImgkDecoderStatus` and more).
- Added enum mixer classes (`MixkPropAudioLoad`, `MixkPropMetadata` and more).

## [2.4.11] - 2025-12-28
- SDL3-2025-12-28
### Updated
- Dart 3.10.6

## [2.4.10] - 2025-12-21
- SDL3-2025-12-21
### Added
- Added `mixSetTrackLoops`.

## [2.4.9] - 2025-12-14
- SDL3-2025-12-14
### Added
- Added `sdlSetWindowFillDocument`.
### Updated
- Dart 3.10.4

## [2.4.8] - 2025-12-07
- SDL3-2025-12-07
### Updated
- Dart 3.10.2

## [2.4.7] - 2025-11-30
- SDL3-2025-11-30
### Updated
- Dart 3.10.1

## [2.4.6] - 2025-11-23
- SDL3-2025-11-23

## [2.4.5] - 2025-11-16
- SDL3-2025-11-16
### Added
- Added `sdlLoadSurfaceIo` and `SdlGpuVulkanOptions`.
### Updated
- Dart 3.10.0

## [2.4.4] - 2025-11-10
- SDL3-2025-11-10
### Added
- Added example (`example/geometry_triangle.dart`).

## [2.4.3] - 2025-11-02
- SDL3-2025-11-02

## [2.4.2] - 2025-10-26
- SDL3-2025-10-26
### Added
- Add image functions (`imgSaveCurIo`, `imgSaveAnimation` and more).

## [2.4.1] - 2025-10-19
- SDL3-2025-10-19
### Fixed
- Changed the license to MIT.
### Added
- Added `sdlCreateAnimatedCursor` function.
- Added `sdlGetPenDeviceType` function.
- Added `PinchFingerEvent` (`SDL_EVENT_PINCH_BEGIN`, `SDL_EVENT_PINCH_UPDATE`, `SDL_EVENT_PINCH_END`).

## [2.4.0] - 2025-10-12
- SDL3-2025-10-12
### Changed
- Changed the license to MIT.
### Added
- Added `imgGetClipboardImage` function.
- Added PNG support functions to surface.

## [2.3.10] - 2025-10-05
- SDL3-2025-10-05

## [2.3.9] - 2025-09-28
- SDL3-2025-09-28
### Fixed
- Fixed inconsistencies in the notation of some functions in `SdlWindowPointerEx`.

## [2.3.8] - 2025-09-21
- SDL3-2025-09-21

## [2.3.7] - 2025-09-14
- SDL3-2025-09-14
### Added
- Added `mixSetTrackRawIoStream`.

## [2.3.6] - 2025-09-07
- SDL3-2025-09-07

## [2.3.5] - 2025-08-31
- SDL3-2025-08-31
### Changed
- The name has changed from `SdlGpuRenderStateDesc` to `SdlGpuRenderStateCreateInfo`.

## [2.3.4] - 2025-08-24
- SDL3-2025-08-24

## [2.3.3] - 2025-08-17
- SDL3-2025-08-17
### Added
- Added `ImgAnimationEncoder` and `ImgAnimationDecoder` functions (removed `ImgAnimationStream`).
- Added `ttfSet` (or `Get`) `FontCharSpacing`.

## [2.3.2] - 2025-08-10
- SDL3-2025-08-10

## [2.3.1] - 2025-08-03
- SDL3-2025-08-03
### Added
- Added webp and `ImgAnimationStream` functions.
- Added `polygon2d_test.dart` example.

## [2.3.0] - 2025-07-27
- SDL3-2025-07-27
### Changed
- Critical changes have been made to mixer functions and structures.

## [2.2.1] - 2025-07-20
- SDL3-2025-07-20
### Added
- Added example (`example/dxlib/no029.dart` Action sample program).

## [2.2.0] - 2025-07-13
- SDL3-2025-07-13
### Updated
- Added a category to doc.

## [2.1.1] - 2025-07-06
- SDL3-2025-07-06

## [2.1.0] - 2025-06-29
- SDL3-2025-06-29
### Fixed
- Fixed a bug that some OpenGL functions were not referenced (`glActiveTexture` and more).
- Changed the type of `GLsizeiptr` to `Uint32*` from `Uint64`.
### Deprecated
- Links to libraries such as `opengl32.dll` have been removed.

## [2.0.0] - 2025-06-22
- SDL3-2025-06-22
### Updated
- Updated `SdlDynamicLibraryService` class. Added OpenGL support.
- Looked into doc dramatically.

## [1.6.3] - 2025-06-15
- SDL3-2025-06-15
### Changed
- Changed to `halildurmus_lints` from `lints`.

## [1.6.2] - 2025-06-08
- SDL3-2025-06-08

## [1.6.1] - 2025-06-01
- SDL3-2025-06-01
### Updated
- Added support for blend modes in gfx (default mode is `SDL_BLENDMODE_BLEND`).
### Added
- Added functions (`sdlPutAudioStreamDataNoCopy` and callback).

## [1.6.0] - 2025-05-25
- SDL3-2025-05-25
### Updated
- New formatting style. (Dart 3.8.0)

## [1.5.6] - 2025-05-18
- SDL3-2025-05-18

## [1.5.5] - 2025-05-11
- SDL3-2025-05-11
### Changed
- The SDL tag has been removed from `SDL_net`.

## [1.5.4] - 2025-05-04
- SDL3-2025-05-04

## [1.5.3] - 2025-04-27
- SDL3-2025-04-27
### Added
- Added functions (`sdlGetEventDescription`, `sdlPutAudioStreamPlanarData` AND `sdlSetAudioIterationCallbacks`).

## [1.5.2] - 2025-04-20
- SDL3-2025-04-20

## [1.5.1] - 2025-04-13
- SDL3-2025-04-13

## [1.5.0] - 2025-04-06
- SDL3-2025-04-06
### Added
- Added enum classes. (`SdlkPropWindow`, `TtfkFontWeight`, `TtfkImage` and more)

## [1.4.4] - 2025-03-30
- SDL3-2025-03-30
### Added
- Added functions (`sdlGetWindowProgressState` AND `sdlGetWindowProgressValue`).

## [1.4.3] - 2025-03-23
- SDL3-2025-03-23
### Added
- Added functions (`sdlSetWindowProgressState` AND `sdlSetWindowProgressValue`).

## [1.4.2] - 2025-03-16
- SDL3-2025-03-16
### Added
- Added `sdlCreateGpuRenderState` function AND scale mode `PIXELART`.

## [1.4.1] - 2025-03-09
- SDL3-2025-03-09
### Added
- Added functions (`sdlSetRelativeMouseTransform`, `sdlRenderTexture9GridTiled` and etc.)

## [1.4.0] - 2025-03-02
- SDL3-2025-03-02
### Changed
- Changed the site that provides the dll.
### Updated
- Support ffi ^2.1.4.

## [1.3.6] - 2025-02-23
- SDL3-2025-02-23

## [1.3.5] - 2025-02-16
- SDL3-2025-02-16
### Updated
- New formatting style. (Dart 3.7.0)

## [1.3.4] - 2025-02-09
- SDL3-2025-02-09
### Added
- Added `sdlStretchSurface` and ttf tag functions.

## [1.3.3] - 2025-02-02
- SDL3-2025-02-02
### Added
- Added ttf functions.

## [1.3.2] - 2025-01-26
- SDL3-2025-01-26

## [1.3.1] - 2025-01-19
- SDL3-2025-01-19

## [1.3.0] - 2025-01-12
- SDL3-2025-01-12
### Fixed
- Ignore `...` & `va_list`. (`sdlLog` and more)
### Added
- Added `SdlRendererPointerEx` functions (`textureAffine`, `textureTiled`, `texture9Grid`, `debugText`).

## [1.2.1] - 2025-01-05
- SDL3-2025-01-05

## [1.2.0] - 2024-12-29
- SDL3-2024-12-29
### Added
- Added tray functions.

## [1.1.1] - 2024-12-22
- SDL3-2024-12-22

## [1.1.0] - 2024-12-15
- SDL3-2024-12-15
### Added
- Added gpu functions.

## [1.0.0] - 2024-12-08
- SDL3-2024-12-08
### Deprecated
- `imgInit` (`IMG_INIT_flags...`) and `imgQuit` are deprecated.
### Added
- Added `SdlAsyncIo` related functions.
### Fixed
- Fixed example sources.

## [0.1.45] - 2024-12-01
- SDL3-2024-12-01

## [0.1.44] - 2024-11-24
- SDL3-2024-11-24
### Added
- Added `SdlDynamicLibraryService` class. You can now specify dynamic libraries for specific environments.

## [0.1.43] - 2024-11-17
- SDL3-2024-11-17

## [0.1.42] - 2024-11-10
- SDL3-2024-11-10

## [0.1.41] - 2024-11-03
- SDL3-2024-11-03

## [0.1.40] - 2024-10-27
- SDL3-2024-10-27
### Added
- Added spot light example.

## [0.1.39] - 2024-10-20
- SDL3-2024-10-20

## [0.1.38] - 2024-10-13
- SDL3-2024-10-13

## [0.1.37] - 2024-10-06
- SDL3-2024-10-06
### Updated
- Enum classes Renamed.

## [0.1.36] - 2024-09-30
- SDL3-2024-09-30
### Updated
- Support Enum classes.

## [0.1.35] - 2024-09-22
- SDL3-2024-09-22

## [0.1.34] - 2024-09-15
- SDL3-2024-09-15

## [0.1.33] - 2024-09-10
- SDL3-2024-09-10

## [0.1.32] - 2024-09-01
- SDL3-2024-09-01
### Updated
- Support ffi ^2.1.3.

## [0.1.31] - 2024-08-25
- SDL3-2024-08-25

## [0.1.30] - 2024-08-18
- SDL3-2024-08-18

## [0.1.29] - 2024-08-11
- SDL3-2024-08-11

## [0.1.28] - 2024-08-04
- SDL3-2024-08-04

## [0.1.27] - 2024-07-28
- SDL3-2024-07-28

## [0.1.26] - 2024-07-21
- SDL3-2024-07-21

## [0.1.25] - 2024-07-14
- SDL3-2024-07-14

## [0.1.24] - 2024-07-07
- SDL3-2024-07-07

## [0.1.23] - 2024-06-30
- SDL3-2024-06-30

## [0.1.22] - 2024-06-23
- SDL3-2024-06-23

## [0.1.21] - 2024-06-16
- SDL3-2024-06-16

## [0.1.20] - 2024-06-09
- SDL3-2024-06-09

## [0.1.19] - 2024-06-02
- SDL3-2024-06-02

## [0.1.18] - 2024-05-26
- SDL3-2024-05-26

## [0.1.17] - 2024-05-19
- SDL3-2024-05-19

## [0.1.16] - 2024-05-12
- SDL3-2024-05-12

## [0.1.15] - 2024-05-05
- SDL3-2024-05-05

## [0.1.14] - 2024-04-28
- SDL3-2024-04-28

## [0.1.13] - 2024-04-07
- SDL3-2024-04-07

## [0.1.12] - 2024-03-31
- SDL3-2024-03-31

## [0.1.11] - 2024-03-31
### Fixed
- Fixed padding of structures inside structures (`SDL_Keysym` and `SDL_HapticDirection` use case).

## [0.1.10] - 2024-03-24
- SDL3-2024-03-24

## [0.1.9] - 2024-03-21
- SDL3-2024-03-21
### Fixed
- Fixed gfx functions.

## [0.1.8] - 2024-03-19
- SDL3-2024-03-19

## [0.1.7] - 2024-03-10
- SDL3-2024-03-10

## [0.1.6] - 2024-03-03
- SDL3-2024-03-03

## [0.1.5] - 2024-03-03
### Updated
- Added the renderer extension library.

## [0.1.4] - 2024-02-25
- SDL3-2024-02-25
### Updated
- Removed `generated/lib_sdl_video_capture.dart`
- Added `generated/lib_sdl_camera.dart`

## [0.1.3] - 2024-02-18
- SDL3-2024-02-18
### Updated
- Removed deprecated `elementAt`. (Require Dart 3.3.0)
- Support ffi ^2.1.2.

## [0.1.2] - 2024-02-11
- SDL3-2024-02-11

## [0.1.1] - 2024-02-04
- SDL3-2024-02-04

## [0.1.0] - 2024-02-01
- SDL3-2024-02-01
- Initial Release.