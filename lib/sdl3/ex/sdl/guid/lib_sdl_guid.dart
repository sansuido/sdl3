part of '../../../sdl.dart';

///
/// Get an ASCII string representation for a given SDL_GUID.
///
/// \param guid the SDL_GUID you wish to convert to string.
/// \param pszGUID buffer in which to write the ASCII string.
/// \param cbGUID the size of pszGUID, should be at least 33 bytes.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StringToGUID
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GUIDToString(SDL_GUID guid, char *pszGUID, int cbGUID)
/// ```
/// {@category guid}
String sdlxGuidToString(SdlGuid guid) {
  const bufferSize = 64;
  final pszGuidPointer = ffi.calloc<Int8>(bufferSize);
  sdlGuidToString(guid, pszGuidPointer, bufferSize);
  final result = pszGuidPointer.cast<Utf8>().toDartString();
  pszGuidPointer.callocFree();
  return result;
}
