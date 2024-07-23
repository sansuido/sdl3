// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Get an ASCII string representation for a given SDL_GUID.
///
/// This returns temporary memory which will be automatically freed later, and
/// can be claimed with SDL_ClaimTemporaryMemory().
///
/// \param guid the SDL_GUID you wish to convert to string.
/// \returns the string representation of the GUID or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GUIDFromString
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GUIDToString(SDL_GUID guid)
/// ```
String? sdlGuidToString(SdlGuid guid) {
  final sdlGuidToStringLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(SdlGuid guid),
      Pointer<Utf8> Function(SdlGuid guid)>('SDL_GUIDToString');
  final result = sdlGuidToStringLookupFunction(guid);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Convert a GUID string into a SDL_GUID structure.
///
/// Performs no error checking. If this function is given a string containing
/// an invalid GUID, the function will silently succeed, but the GUID generated
/// will not be useful.
///
/// \param pchGUID string containing an ASCII representation of a GUID.
/// \returns a SDL_GUID structure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GUIDToString
///
/// ```c
/// extern SDL_DECLSPEC SDL_GUID SDLCALL SDL_GUIDFromString(const char *pchGUID)
/// ```
SdlGuid sdlGuidFromString(String? pchGuid) {
  final sdlGuidFromStringLookupFunction = libSdl3.lookupFunction<
      SdlGuid Function(Pointer<Utf8> pchGuid),
      SdlGuid Function(Pointer<Utf8> pchGuid)>('SDL_GUIDFromString');
  final pchGuidPointer = pchGuid != null ? pchGuid.toNativeUtf8() : nullptr;
  final result = sdlGuidFromStringLookupFunction(pchGuidPointer);
  calloc.free(pchGuidPointer);
  return result;
}
