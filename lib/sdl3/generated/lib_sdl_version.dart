// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

///
/// Get the version of SDL that is linked against your program.
///
/// If you are linking to SDL dynamically, then it is possible that the current
/// version will be different than the version you compiled against. This
/// function returns the current version, while SDL_VERSION is the version you
/// compiled with.
///
/// This function may be called safely at any time, even before SDL_Init().
///
/// \returns the version of the linked library.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRevision
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetVersion(void)
/// ```
/// {@category version}
int sdlGetVersion() {
  final sdlGetVersionLookupFunction = _libSdl
      .lookupFunction<Int32 Function(), int Function()>('SDL_GetVersion');
  return sdlGetVersionLookupFunction();
}

///
/// Get the code revision of the SDL library that is linked against your
/// program.
///
/// This value is the revision of the code you are linking against and may be
/// different from the code you are compiling with, which is found in the
/// constant SDL_REVISION if you explicitly include SDL_revision.h
///
/// The revision is an arbitrary string (a hash value) uniquely identifying the
/// exact revision of the SDL library in use, and is only useful in comparing
/// against other revisions. It is NOT an incrementing number.
///
/// If SDL wasn't built from a git repository with the appropriate tools, this
/// will return an empty string.
///
/// You shouldn't use this function for anything but logging it for debugging
/// purposes. The string is not intended to be reliable in any way.
///
/// \returns an arbitrary string, uniquely identifying the exact revision of
/// the SDL library in use.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetVersion
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetRevision(void)
/// ```
/// {@category version}
String? sdlGetRevision() {
  final sdlGetRevisionLookupFunction = _libSdl
      .lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'SDL_GetRevision',
      );
  final result = sdlGetRevisionLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}
