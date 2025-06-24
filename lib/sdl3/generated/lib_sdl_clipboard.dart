// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

///
/// Put UTF-8 text into the clipboard.
///
/// \param text the text to store in the clipboard.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetClipboardText
/// \sa SDL_HasClipboardText
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetClipboardText(const char *text)
/// ```
bool sdlSetClipboardText(String? text) {
  final sdlSetClipboardTextLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<Utf8> text),
        int Function(Pointer<Utf8> text)
      >('SDL_SetClipboardText');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = sdlSetClipboardTextLookupFunction(textPointer) == 1;
  calloc.free(textPointer);
  return result;
}

///
/// Get UTF-8 text from the clipboard.
///
/// This functions returns an empty string if there was not enough memory left
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
Pointer<Int8> sdlGetClipboardText() {
  final sdlGetClipboardTextLookupFunction = _libSdl
      .lookupFunction<Pointer<Int8> Function(), Pointer<Int8> Function()>(
        'SDL_GetClipboardText',
      );
  return sdlGetClipboardTextLookupFunction();
}

///
/// Query whether the clipboard exists and contains a non-empty text string.
///
/// \returns true if the clipboard has text, or false if it does not.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetClipboardText
/// \sa SDL_SetClipboardText
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasClipboardText(void)
/// ```
bool sdlHasClipboardText() {
  final sdlHasClipboardTextLookupFunction = _libSdl
      .lookupFunction<Uint8 Function(), int Function()>('SDL_HasClipboardText');
  return sdlHasClipboardTextLookupFunction() == 1;
}

///
/// Put UTF-8 text into the primary selection.
///
/// \param text the text to store in the primary selection.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPrimarySelectionText
/// \sa SDL_HasPrimarySelectionText
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetPrimarySelectionText(const char *text)
/// ```
bool sdlSetPrimarySelectionText(String? text) {
  final sdlSetPrimarySelectionTextLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<Utf8> text),
        int Function(Pointer<Utf8> text)
      >('SDL_SetPrimarySelectionText');
  final textPointer = text != null ? text.toNativeUtf8() : nullptr;
  final result = sdlSetPrimarySelectionTextLookupFunction(textPointer) == 1;
  calloc.free(textPointer);
  return result;
}

///
/// Get UTF-8 text from the primary selection.
///
/// This functions returns an empty string if there was not enough memory left
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
Pointer<Int8> sdlGetPrimarySelectionText() {
  final sdlGetPrimarySelectionTextLookupFunction = _libSdl
      .lookupFunction<Pointer<Int8> Function(), Pointer<Int8> Function()>(
        'SDL_GetPrimarySelectionText',
      );
  return sdlGetPrimarySelectionTextLookupFunction();
}

///
/// Query whether the primary selection exists and contains a non-empty text
/// string.
///
/// \returns true if the primary selection has text, or false if it does not.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPrimarySelectionText
/// \sa SDL_SetPrimarySelectionText
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasPrimarySelectionText(void)
/// ```
bool sdlHasPrimarySelectionText() {
  final sdlHasPrimarySelectionTextLookupFunction = _libSdl
      .lookupFunction<Uint8 Function(), int Function()>(
        'SDL_HasPrimarySelectionText',
      );
  return sdlHasPrimarySelectionTextLookupFunction() == 1;
}

///
/// Offer clipboard data to the OS.
///
/// Tell the operating system that the application is offering clipboard data
/// for each of the provided mime-types. Once another application requests the
/// data the callback function will be called, allowing it to generate and
/// respond with the data for the requested mime-type.
///
/// The size of text data does not include any terminator, and the text does
/// not need to be null terminated (e.g. you can directly copy a portion of a
/// document).
///
/// \param callback a function pointer to the function that provides the
/// clipboard data.
/// \param cleanup a function pointer to the function that cleans up the
/// clipboard data.
/// \param userdata an opaque pointer that will be forwarded to the callbacks.
/// \param mime_types a list of mime-types that are being offered.
/// \param num_mime_types the number of mime-types in the mime_types list.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClearClipboardData
/// \sa SDL_GetClipboardData
/// \sa SDL_HasClipboardData
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetClipboardData(SDL_ClipboardDataCallback callback, SDL_ClipboardCleanupCallback cleanup, void *userdata, const char **mime_types, size_t num_mime_types)
/// ```
bool sdlSetClipboardData(
  Pointer<NativeFunction<SdlClipboardDataCallback>> callback,
  Pointer<NativeFunction<SdlClipboardCleanupCallback>> cleanup,
  Pointer<NativeType> userdata,
  Pointer<Pointer<Int8>> mimeTypes,
  int numMimeTypes,
) {
  final sdlSetClipboardDataLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<NativeFunction<SdlClipboardDataCallback>> callback,
          Pointer<NativeFunction<SdlClipboardCleanupCallback>> cleanup,
          Pointer<NativeType> userdata,
          Pointer<Pointer<Int8>> mimeTypes,
          Uint32 numMimeTypes,
        ),
        int Function(
          Pointer<NativeFunction<SdlClipboardDataCallback>> callback,
          Pointer<NativeFunction<SdlClipboardCleanupCallback>> cleanup,
          Pointer<NativeType> userdata,
          Pointer<Pointer<Int8>> mimeTypes,
          int numMimeTypes,
        )
      >('SDL_SetClipboardData');
  return sdlSetClipboardDataLookupFunction(
        callback,
        cleanup,
        userdata,
        mimeTypes,
        numMimeTypes,
      ) ==
      1;
}

///
/// Clear the clipboard data.
///
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetClipboardData
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ClearClipboardData(void)
/// ```
bool sdlClearClipboardData() {
  final sdlClearClipboardDataLookupFunction = _libSdl
      .lookupFunction<Uint8 Function(), int Function()>(
        'SDL_ClearClipboardData',
      );
  return sdlClearClipboardDataLookupFunction() == 1;
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
Pointer<NativeType> sdlGetClipboardData(
  String? mimeType,
  Pointer<Uint32> size,
) {
  final sdlGetClipboardDataLookupFunction = _libSdl
      .lookupFunction<
        Pointer<NativeType> Function(
          Pointer<Utf8> mimeType,
          Pointer<Uint32> size,
        ),
        Pointer<NativeType> Function(
          Pointer<Utf8> mimeType,
          Pointer<Uint32> size,
        )
      >('SDL_GetClipboardData');
  final mimeTypePointer = mimeType != null ? mimeType.toNativeUtf8() : nullptr;
  final result = sdlGetClipboardDataLookupFunction(mimeTypePointer, size);
  calloc.free(mimeTypePointer);
  return result;
}

///
/// Query whether there is data in the clipboard for the provided mime type.
///
/// \param mime_type the mime type to check for data for.
/// \returns true if there exists data in clipboard for the provided mime type,
/// false if it does not.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetClipboardData
/// \sa SDL_GetClipboardData
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasClipboardData(const char *mime_type)
/// ```
bool sdlHasClipboardData(String? mimeType) {
  final sdlHasClipboardDataLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<Utf8> mimeType),
        int Function(Pointer<Utf8> mimeType)
      >('SDL_HasClipboardData');
  final mimeTypePointer = mimeType != null ? mimeType.toNativeUtf8() : nullptr;
  final result = sdlHasClipboardDataLookupFunction(mimeTypePointer) == 1;
  calloc.free(mimeTypePointer);
  return result;
}

///
/// Retrieve the list of mime types available in the clipboard.
///
/// \param num_mime_types a pointer filled with the number of mime types, may
/// be NULL.
/// \returns a null terminated array of strings with mime types, or NULL on
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
Pointer<Pointer<Int8>> sdlGetClipboardMimeTypes(Pointer<Uint32> numMimeTypes) {
  final sdlGetClipboardMimeTypesLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Pointer<Int8>> Function(Pointer<Uint32> numMimeTypes),
        Pointer<Pointer<Int8>> Function(Pointer<Uint32> numMimeTypes)
      >('SDL_GetClipboardMimeTypes');
  return sdlGetClipboardMimeTypesLookupFunction(numMimeTypes);
}
