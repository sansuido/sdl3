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
/// be NULL if an error occurred.
///
/// Note that the callback may be called from a different thread than the one
/// the function was invoked on.
///
/// Depending on the platform, the user may be allowed to input paths that
/// don't yet exist.
///
/// On Linux, dialogs may require XDG Portals, which requires DBus, which
/// requires an event-handling loop. Apps that do not use SDL to handle events
/// should add a call to SDL_PumpEvents in their main loop.
///
/// \param callback a function pointer to be invoked when the user selects a
/// file and accepts, or cancels the dialog, or an error
/// occurs.
/// \param userdata an optional pointer to pass extra data to the callback when
/// it will be invoked.
/// \param window the window that the dialog should be modal for, may be NULL.
/// Not all platforms support this option.
/// \param filters a list of filters, may be NULL. Not all platforms support
/// this option, and platforms that do support it may allow the
/// user to ignore the filters.
/// \param nfilters the number of filters. Ignored if filters is NULL.
/// \param default_location the default folder or file to start the dialog at,
/// may be NULL. Not all platforms support this option.
/// \param allow_many if non-zero, the user will be allowed to select multiple
/// entries. Not all platforms support this option.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_DialogFileFilter
/// \sa SDL_ShowSaveFileDialog
/// \sa SDL_ShowOpenFolderDialog
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ShowOpenFileDialog(SDL_DialogFileCallback callback, void *userdata, SDL_Window *window, const SDL_DialogFileFilter *filters, int nfilters, const char *default_location, bool allow_many)
/// ```
void sdlShowOpenFileDialog(
    Pointer<NativeFunction<SdlDialogFileCallback>> callback,
    Pointer<NativeType> userdata,
    Pointer<SdlWindow> window,
    Pointer<SdlDialogFileFilter> filters,
    int nfilters,
    String? defaultLocation,
    bool allowMany) {
  final sdlShowOpenFileDialogLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<SdlDialogFileFilter> filters,
          Int32 nfilters,
          Pointer<Utf8> defaultLocation,
          Uint8 allowMany),
      void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<SdlDialogFileFilter> filters,
          int nfilters,
          Pointer<Utf8> defaultLocation,
          int allowMany)>('SDL_ShowOpenFileDialog');
  final defaultLocationPointer =
      defaultLocation != null ? defaultLocation.toNativeUtf8() : nullptr;
  final result = sdlShowOpenFileDialogLookupFunction(callback, userdata, window,
      filters, nfilters, defaultLocationPointer, allowMany ? 1 : 0);
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
/// be NULL if an error occurred.
///
/// Note that the callback may be called from a different thread than the one
/// the function was invoked on.
///
/// The chosen file may or may not already exist.
///
/// On Linux, dialogs may require XDG Portals, which requires DBus, which
/// requires an event-handling loop. Apps that do not use SDL to handle events
/// should add a call to SDL_PumpEvents in their main loop.
///
/// \param callback a function pointer to be invoked when the user selects a
/// file and accepts, or cancels the dialog, or an error
/// occurs.
/// \param userdata an optional pointer to pass extra data to the callback when
/// it will be invoked.
/// \param window the window that the dialog should be modal for, may be NULL.
/// Not all platforms support this option.
/// \param filters a list of filters, may be NULL. Not all platforms support
/// this option, and platforms that do support it may allow the
/// user to ignore the filters.
/// \param nfilters the number of filters. Ignored if filters is NULL.
/// \param default_location the default folder or file to start the dialog at,
/// may be NULL. Not all platforms support this option.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_DialogFileFilter
/// \sa SDL_ShowOpenFileDialog
/// \sa SDL_ShowOpenFolderDialog
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ShowSaveFileDialog(SDL_DialogFileCallback callback, void *userdata, SDL_Window *window, const SDL_DialogFileFilter *filters, int nfilters, const char *default_location)
/// ```
void sdlShowSaveFileDialog(
    Pointer<NativeFunction<SdlDialogFileCallback>> callback,
    Pointer<NativeType> userdata,
    Pointer<SdlWindow> window,
    Pointer<SdlDialogFileFilter> filters,
    int nfilters,
    String? defaultLocation) {
  final sdlShowSaveFileDialogLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<SdlDialogFileFilter> filters,
          Int32 nfilters,
          Pointer<Utf8> defaultLocation),
      void Function(
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Pointer<SdlWindow> window,
          Pointer<SdlDialogFileFilter> filters,
          int nfilters,
          Pointer<Utf8> defaultLocation)>('SDL_ShowSaveFileDialog');
  final defaultLocationPointer =
      defaultLocation != null ? defaultLocation.toNativeUtf8() : nullptr;
  final result = sdlShowSaveFileDialogLookupFunction(
      callback, userdata, window, filters, nfilters, defaultLocationPointer);
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
/// be NULL if an error occurred.
///
/// Note that the callback may be called from a different thread than the one
/// the function was invoked on.
///
/// Depending on the platform, the user may be allowed to input paths that
/// don't yet exist.
///
/// On Linux, dialogs may require XDG Portals, which requires DBus, which
/// requires an event-handling loop. Apps that do not use SDL to handle events
/// should add a call to SDL_PumpEvents in their main loop.
///
/// \param callback a function pointer to be invoked when the user selects a
/// file and accepts, or cancels the dialog, or an error
/// occurs.
/// \param userdata an optional pointer to pass extra data to the callback when
/// it will be invoked.
/// \param window the window that the dialog should be modal for, may be NULL.
/// Not all platforms support this option.
/// \param default_location the default folder or file to start the dialog at,
/// may be NULL. Not all platforms support this option.
/// \param allow_many if non-zero, the user will be allowed to select multiple
/// entries. Not all platforms support this option.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_ShowOpenFileDialog
/// \sa SDL_ShowSaveFileDialog
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ShowOpenFolderDialog(SDL_DialogFileCallback callback, void *userdata, SDL_Window *window, const char *default_location, bool allow_many)
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
          Uint8 allowMany),
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
