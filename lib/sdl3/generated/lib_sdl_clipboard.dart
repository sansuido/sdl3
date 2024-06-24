// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Put UTF-8 text into the clipboard.
///
/// \param text the text to store in the clipboard.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetClipboardText
/// \sa SDL_HasClipboardText
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetClipboardText(const char *text)
/// ```
int sdlSetClipboardText(String? text) {
  final sdlSetClipboardTextLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> text),
      int Function(Pointer<Utf8> text)>('SDL_SetClipboardText');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = sdlSetClipboardTextLookupFunction(textPointer);
  calloc.free(textPointer);
  return result;
}

///
/// Get UTF-8 text from the clipboard, which must be freed with SDL_free().
///
/// This functions returns empty string if there was not enough memory left for
/// a copy of the clipboard's content.
///
/// \returns the clipboard text on success or an empty string on failure; call
/// SDL_GetError() for more information. Caller must call SDL_free()
/// on the returned pointer when done with it (even if there was an
/// error).
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasClipboardText
/// \sa SDL_SetClipboardText
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetClipboardText(void)
/// ```
Pointer<Int8> sdlGetClipboardText() {
  final sdlGetClipboardTextLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(),
      Pointer<Int8> Function()>('SDL_GetClipboardText');
  return sdlGetClipboardTextLookupFunction();
}

///
/// Query whether the clipboard exists and contains a non-empty text string.
///
/// \returns SDL_TRUE if the clipboard has text, or SDL_FALSE if it does not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetClipboardText
/// \sa SDL_SetClipboardText
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasClipboardText(void)
/// ```
bool sdlHasClipboardText() {
  final sdlHasClipboardTextLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_HasClipboardText');
  return sdlHasClipboardTextLookupFunction() == 1;
}

///
/// Put UTF-8 text into the primary selection.
///
/// \param text the text to store in the primary selection.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPrimarySelectionText
/// \sa SDL_HasPrimarySelectionText
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetPrimarySelectionText(const char *text)
/// ```
int sdlSetPrimarySelectionText(String? text) {
  final sdlSetPrimarySelectionTextLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> text),
      int Function(Pointer<Utf8> text)>('SDL_SetPrimarySelectionText');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = sdlSetPrimarySelectionTextLookupFunction(textPointer);
  calloc.free(textPointer);
  return result;
}

///
/// Get UTF-8 text from the primary selection, which must be freed with
/// SDL_free().
///
/// This functions returns empty string if there was not enough memory left for
/// a copy of the primary selection's content.
///
/// \returns the primary selection text on success or an empty string on
/// failure; call SDL_GetError() for more information. Caller must
/// call SDL_free() on the returned pointer when done with it (even if
/// there was an error).
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasPrimarySelectionText
/// \sa SDL_SetPrimarySelectionText
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetPrimarySelectionText(void)
/// ```
Pointer<Int8> sdlGetPrimarySelectionText() {
  final sdlGetPrimarySelectionTextLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(),
      Pointer<Int8> Function()>('SDL_GetPrimarySelectionText');
  return sdlGetPrimarySelectionTextLookupFunction();
}

///
/// Query whether the primary selection exists and contains a non-empty text
/// string.
///
/// \returns SDL_TRUE if the primary selection has text, or SDL_FALSE if it
/// does not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPrimarySelectionText
/// \sa SDL_SetPrimarySelectionText
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasPrimarySelectionText(void)
/// ```
bool sdlHasPrimarySelectionText() {
  final sdlHasPrimarySelectionTextLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_HasPrimarySelectionText');
  return sdlHasPrimarySelectionTextLookupFunction() == 1;
}

///
/// Offer clipboard data to the OS.
///
/// Tell the operating system that the application is offering clipboard data
/// for each of the proivded mime-types. Once another application requests the
/// data the callback function will be called allowing it to generate and
/// respond with the data for the requested mime-type.
///
/// The size of text data does not include any terminator, and the text does
/// not need to be null terminated (e.g. you can directly copy a portion of a
/// document)
///
/// \param callback a function pointer to the function that provides the
/// clipboard data.
/// \param cleanup a function pointer to the function that cleans up the
/// clipboard data.
/// \param userdata an opaque pointer that will be forwarded to the callbacks.
/// \param mime_types a list of mime-types that are being offered.
/// \param num_mime_types the number of mime-types in the mime_types list.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ClearClipboardData
/// \sa SDL_GetClipboardData
/// \sa SDL_HasClipboardData
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetClipboardData(SDL_ClipboardDataCallback callback, SDL_ClipboardCleanupCallback cleanup, void *userdata, const char **mime_types, size_t num_mime_types)
/// ```
int sdlSetClipboardData(
    Pointer<NativeFunction<SdlClipboardDataCallback>> callback,
    Pointer<NativeFunction<SdlClipboardCleanupCallback>> cleanup,
    Pointer<NativeType> userdata,
    Pointer<Pointer<Int8>> mimeTypes,
    int numMimeTypes) {
  final sdlSetClipboardDataLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<NativeFunction<SdlClipboardDataCallback>> callback,
          Pointer<NativeFunction<SdlClipboardCleanupCallback>> cleanup,
          Pointer<NativeType> userdata,
          Pointer<Pointer<Int8>> mimeTypes,
          Uint32 numMimeTypes),
      int Function(
          Pointer<NativeFunction<SdlClipboardDataCallback>> callback,
          Pointer<NativeFunction<SdlClipboardCleanupCallback>> cleanup,
          Pointer<NativeType> userdata,
          Pointer<Pointer<Int8>> mimeTypes,
          int numMimeTypes)>('SDL_SetClipboardData');
  return sdlSetClipboardDataLookupFunction(
      callback, cleanup, userdata, mimeTypes, numMimeTypes);
}

///
/// Clear the clipboard data.
///
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetClipboardData
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_ClearClipboardData(void)
/// ```
int sdlClearClipboardData() {
  final sdlClearClipboardDataLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_ClearClipboardData');
  return sdlClearClipboardDataLookupFunction();
}

///
/// Get the data from clipboard for a given mime type.
///
/// The size of text data does not include the terminator, but the text is
/// guaranteed to be null terminated.
///
/// \param mime_type the mime type to read from the clipboard.
/// \param size a pointer filled in with the length of the returned data.
/// \returns the retrieved data buffer or NULL on failure; call SDL_GetError()
/// for more information. Caller must call SDL_free() on the returned
/// pointer when done with it.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasClipboardData
/// \sa SDL_SetClipboardData
///
/// ```c
/// extern SDL_DECLSPEC void *SDLCALL SDL_GetClipboardData(const char *mime_type, size_t *size)
/// ```
Pointer<NativeType> sdlGetClipboardData(
    String? mimeType, Pointer<Uint32> size) {
  final sdlGetClipboardDataLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<Utf8> mimeType, Pointer<Uint32> size),
      Pointer<NativeType> Function(Pointer<Utf8> mimeType,
          Pointer<Uint32> size)>('SDL_GetClipboardData');
  final mimeTypePointer = mimeType != null ? mimeType.toNativeUtf8() : nullptr;
  final result = sdlGetClipboardDataLookupFunction(mimeTypePointer, size);
  calloc.free(mimeTypePointer);
  return result;
}

///
/// Query whether there is data in the clipboard for the provided mime type.
///
/// \param mime_type the mime type to check for data for.
/// \returns SDL_TRUE if there exists data in clipboard for the provided mime
/// type, SDL_FALSE if it does not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetClipboardData
/// \sa SDL_GetClipboardData
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasClipboardData(const char *mime_type)
/// ```
bool sdlHasClipboardData(String? mimeType) {
  final sdlHasClipboardDataLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> mimeType),
      int Function(Pointer<Utf8> mimeType)>('SDL_HasClipboardData');
  final mimeTypePointer = mimeType != null ? mimeType.toNativeUtf8() : nullptr;
  final result = sdlHasClipboardDataLookupFunction(mimeTypePointer) == 1;
  calloc.free(mimeTypePointer);
  return result;
}
