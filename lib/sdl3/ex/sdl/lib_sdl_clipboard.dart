part of '../../sdl.dart';

///
/// Get UTF-8 text from the clipboard.
///
/// This function returns an empty string if there is not enough memory left
/// for a copy of the clipboard's content.
///
/// \returns the clipboard text on success or an empty string on failure; call
/// SDL_GetError() for more information. This should be freed with
/// SDL_free() when it is no longer needed.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasClipboardText
/// \sa SDL_SetClipboardText
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetClipboardText(void)
/// ```
/// {@category clipboard}
String? sdlxGetClipboardText() {
  final result = sdlGetClipboardText();
  if (result == nullptr) {
    return null;
  }
  final text = result.cast<Utf8>().toDartString();
  sdlFree(result.cast<Void>());
  return text;
}

///
/// Get UTF-8 text from the primary selection.
///
/// This function returns an empty string if there is not enough memory left
/// for a copy of the primary selection's content.
///
/// \returns the primary selection text on success or an empty string on
/// failure; call SDL_GetError() for more information. This should be
/// freed with SDL_free() when it is no longer needed.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasPrimarySelectionText
/// \sa SDL_SetPrimarySelectionText
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetPrimarySelectionText(void)
/// ```
/// {@category clipboard}
String? sdlxGetPrimarySelectionText() {
  final result = sdlGetPrimarySelectionText();
  if (result == nullptr) {
    return null;
  }
  final text = result.cast<Utf8>().toDartString();
  sdlFree(result.cast<Void>());
  return text;
}

///
/// Get the data from the clipboard for a given mime type.
///
/// The size of text data does not include the terminator, but the text is
/// guaranteed to be null-terminated.
///
/// \param mime_type the mime type to read from the clipboard.
/// \param size a pointer filled in with the length of the returned data.
/// \returns the retrieved data buffer or NULL on failure; call SDL_GetError()
/// for more information. This should be freed with SDL_free() when it
/// is no longer needed.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasClipboardData
/// \sa SDL_SetClipboardData
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_GetClipboardData(const char *mime_type, size_t *size)
/// ```
/// {@category clipboard}
String? sdlxGetClipboardData(String mimeType) {
  String? result;
  final sizePointer = ffi.calloc<Size>();
  final data = sdlGetClipboardData(mimeType, sizePointer).cast<Utf8>();
  if (data != nullptr) {
    result = data.toDartString(length: sizePointer.value);
    sdlFree(data.cast<Void>());
  }
  sizePointer.callocFree();
  return result;
}

///
/// Retrieve the list of mime types available in the clipboard.
///
/// \param num_mime_types a pointer filled with the number of mime types, may
/// be NULL.
/// \returns a null-terminated array of strings with mime types, or NULL on
/// failure; call SDL_GetError() for more information. This should be
/// freed with SDL_free() when it is no longer needed.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetClipboardData
///
/// ```c
/// extern SDL_DECLSPEC char ** SDLCALL SDL_GetClipboardMimeTypes(size_t *num_mime_types)
/// ```
/// {@category clipboard}
List<String> sdlxGetClipboardMimeTypes() {
  final result = <String>[];
  final numMimeTypesPointer = ffi.calloc<Size>();
  final mimeTypesPointer = sdlGetClipboardMimeTypes(numMimeTypesPointer);
  if (mimeTypesPointer != nullptr) {
    for (var i = 0; i < numMimeTypesPointer.value; i++) {
      final mimeTypePointer = mimeTypesPointer[i];
      if (mimeTypePointer != nullptr) {
        result.add(mimeTypePointer.cast<Utf8>().toDartString());
      }
    }
    sdlFree(mimeTypesPointer.cast<Void>());
  }
  numMimeTypesPointer.callocFree();
  return result;
}
