// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Displays a dialog that lets the user select a file on their filesystem.
///
/// This function should only be invoked from the main thread.
///
/// This is an asynchronous function; it will return immediately, and the
/// result will be passed to the callback.
///
/// The callback will be invoked with a null-terminated list of files the user
/// chose. The list will be empty if the user canceled the dialog, and it will
/// be NULL if an error occured.
///
/// Note that the callback may be called from a different thread than the one
/// the function was invoked on.
///
/// Depending on the platform, the user may be allowed to input paths that
/// don't yet exist.
///
/// \param callback An SDL_DialogFileCallback to be invoked when the user
/// selects a file and accepts, or cancels the dialog, or an
/// error occurs. The first argument is a null-terminated list
/// of C strings, representing the paths chosen by the user.
/// The list will be empty if the user canceled the dialog, and
/// it will be NULL if an error occured. If an error occured,
/// it can be fetched with SDL_GetError(). The second argument
/// is the userdata pointer passed to the function. The third
/// argument is the index of the filter selected by the user,
/// or one past the index of the last filter (therefore the
/// index of the terminating NULL filter) if no filter was
/// chosen, or -1 if the platform does not support detecting
/// the selected filter.
/// \param userdata An optional pointer to pass extra data to the callback when
/// it will be invoked.
/// \param window The window that the dialog should be modal for. May be NULL.
/// Not all platforms support this option.
/// \param filters A null-terminated list of SDL_DialogFileFilter's. May be
/// NULL. Not all platforms support this option, and platforms
/// that do support it may allow the user to ignore the filters.
/// \param default_location The default folder or file to start the dialog at.
/// May be NULL. Not all platforms support this option.
/// \param allow_many If non-zero, the user will be allowed to select multiple
/// entries. Not all platforms support this option.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_DialogFileFilter
/// \sa SDL_ShowSaveFileDialog
/// \sa SDL_ShowOpenFolderDialog
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ShowOpenFileDialog(SDL_DialogFileCallback callback, void *userdata, SDL_Window *window, const SDL_DialogFileFilter *filters, const char *default_location, SDL_bool allow_many)
/// ```
void sdlShowOpenFileDialog(
    Pointer<NativeFunction<SdlDialogFileCallback>> callback,
    Pointer<NativeType> userdata,
    Pointer<SdlWindow> window,
    Pointer<SdlDialogFileFilter> filters,
    String? defaultLocation,
    bool allowMany) {
  final sdlShowOpenFileDialogLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<SdlDialogFileFilter> filters,
          Pointer<Utf8> defaultLocation,
          Int32 allowMany),
      void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<SdlDialogFileFilter> filters,
          Pointer<Utf8> defaultLocation,
          int allowMany)>('SDL_ShowOpenFileDialog');
  final defaultLocationPointer =
      defaultLocation != null ? defaultLocation.toNativeUtf8() : nullptr;
  final result = sdlShowOpenFileDialogLookupFunction(callback, userdata, window,
      filters, defaultLocationPointer, allowMany ? 1 : 0);
  calloc.free(defaultLocationPointer);
  return result;
}

///
/// Displays a dialog that lets the user choose a new or existing file on their
/// filesystem.
///
/// This function should only be invoked from the main thread.
///
/// This is an asynchronous function; it will return immediately, and the
/// result will be passed to the callback.
///
/// The callback will be invoked with a null-terminated list of files the user
/// chose. The list will be empty if the user canceled the dialog, and it will
/// be NULL if an error occured.
///
/// Note that the callback may be called from a different thread than the one
/// the function was invoked on.
///
/// The chosen file may or may not already exist.
///
/// \param callback An SDL_DialogFileCallback to be invoked when the user
/// selects a file and accepts, or cancels the dialog, or an
/// error occurs. The first argument is a null-terminated list
/// of C strings, representing the paths chosen by the user.
/// The list will be empty if the user canceled the dialog, and
/// it will be NULL if an error occured. If an error occured,
/// it can be fetched with SDL_GetError(). The second argument
/// is the userdata pointer passed to the function. The third
/// argument is the index of the filter selected by the user,
/// or one past the index of the last filter (therefore the
/// index of the terminating NULL filter) if no filter was
/// chosen, or -1 if the platform does not support detecting
/// the selected filter.
/// \param userdata An optional pointer to pass extra data to the callback when
/// it will be invoked.
/// \param window The window that the dialog should be modal for. May be NULL.
/// Not all platforms support this option.
/// \param filters A null-terminated list of SDL_DialogFileFilter's. May be
/// NULL. Not all platforms support this option, and platforms
/// that do support it may allow the user to ignore the filters.
/// \param default_location The default folder or file to start the dialog at.
/// May be NULL. Not all platforms support this option.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_DialogFileFilter
/// \sa SDL_ShowOpenFileDialog
/// \sa SDL_ShowOpenFolderDialog
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ShowSaveFileDialog(SDL_DialogFileCallback callback, void *userdata, SDL_Window *window, const SDL_DialogFileFilter *filters, const char *default_location)
/// ```
void sdlShowSaveFileDialog(
    Pointer<NativeFunction<SdlDialogFileCallback>> callback,
    Pointer<NativeType> userdata,
    Pointer<SdlWindow> window,
    Pointer<SdlDialogFileFilter> filters,
    String? defaultLocation) {
  final sdlShowSaveFileDialogLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<SdlDialogFileFilter> filters,
          Pointer<Utf8> defaultLocation),
      void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<SdlDialogFileFilter> filters,
          Pointer<Utf8> defaultLocation)>('SDL_ShowSaveFileDialog');
  final defaultLocationPointer =
      defaultLocation != null ? defaultLocation.toNativeUtf8() : nullptr;
  final result = sdlShowSaveFileDialogLookupFunction(
      callback, userdata, window, filters, defaultLocationPointer);
  calloc.free(defaultLocationPointer);
  return result;
}

///
/// Displays a dialog that lets the user select a folder on their filesystem.
///
/// This function should only be invoked from the main thread.
///
/// This is an asynchronous function; it will return immediately, and the
/// result will be passed to the callback.
///
/// The callback will be invoked with a null-terminated list of files the user
/// chose. The list will be empty if the user canceled the dialog, and it will
/// be NULL if an error occured.
///
/// Note that the callback may be called from a different thread than the one
/// the function was invoked on.
///
/// Depending on the platform, the user may be allowed to input paths that
/// don't yet exist.
///
/// \param callback An SDL_DialogFileCallback to be invoked when the user
/// selects a file and accepts, or cancels the dialog, or an
/// error occurs. The first argument is a null-terminated list
/// of C strings, representing the paths chosen by the user.
/// The list will be empty if the user canceled the dialog, and
/// it will be NULL if an error occured. If an error occured,
/// it can be fetched with SDL_GetError(). The second argument
/// is the userdata pointer passed to the function. The third
/// argument is always -1 for SDL_ShowOpenFolderDialog.
/// \param userdata An optional pointer to pass extra data to the callback when
/// it will be invoked.
/// \param window The window that the dialog should be modal for. May be NULL.
/// Not all platforms support this option.
/// \param default_location The default folder or file to start the dialog at.
/// May be NULL. Not all platforms support this option.
/// \param allow_many If non-zero, the user will be allowed to select multiple
/// entries. Not all platforms support this option.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_ShowOpenFileDialog
/// \sa SDL_ShowSaveFileDialog
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ShowOpenFolderDialog(SDL_DialogFileCallback callback, void *userdata, SDL_Window *window, const char *default_location, SDL_bool allow_many)
/// ```
void sdlShowOpenFolderDialog(
    Pointer<NativeFunction<SdlDialogFileCallback>> callback,
    Pointer<NativeType> userdata,
    Pointer<SdlWindow> window,
    String? defaultLocation,
    bool allowMany) {
  final sdlShowOpenFolderDialogLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<Utf8> defaultLocation,
          Int32 allowMany),
      void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<Utf8> defaultLocation,
          int allowMany)>('SDL_ShowOpenFolderDialog');
  final defaultLocationPointer =
      defaultLocation != null ? defaultLocation.toNativeUtf8() : nullptr;
  final result = sdlShowOpenFolderDialogLookupFunction(
      callback, userdata, window, defaultLocationPointer, allowMany ? 1 : 0);
  calloc.free(defaultLocationPointer);
  return result;
}
