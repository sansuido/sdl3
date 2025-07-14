// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

///
/// Get the name of the platform.
///
/// Here are the names returned for some (but not all) supported platforms:
///
/// - "Windows"
/// - "macOS"
/// - "Linux"
/// - "iOS"
/// - "Android"
///
/// \returns the name of the platform. If the correct platform name is not
/// available, returns a string beginning with the text "Unknown".
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetPlatform(void)
/// ```
/// {@category platform}
String? sdlGetPlatform() {
  final sdlGetPlatformLookupFunction = _libSdl
      .lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'SDL_GetPlatform',
      );
  final result = sdlGetPlatformLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}
