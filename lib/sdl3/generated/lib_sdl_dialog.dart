// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Displays a dialog that lets the user select a file on their filesystem.
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
/// user to ignore the filters. If non-NULL, it must remain
/// valid at least until the callback is invoked.
/// \param nfilters the number of filters. Ignored if filters is NULL.
/// \param default_location the default folder or file to start the dialog at,
/// may be NULL. Not all platforms support this option.
/// \param allow_many if non-zero, the user will be allowed to select multiple
/// entries. Not all platforms support this option.
///
/// \threadsafety This function should be called only from the main thread. The
/// callback may be invoked from the same thread or from a
/// different one, depending on the OS's constraints.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_DialogFileFilter
/// \sa SDL_ShowSaveFileDialog
/// \sa SDL_ShowOpenFolderDialog
/// \sa SDL_ShowFileDialogWithProperties
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
/// user to ignore the filters. If non-NULL, it must remain
/// valid at least until the callback is invoked.
/// \param nfilters the number of filters. Ignored if filters is NULL.
/// \param default_location the default folder or file to start the dialog at,
/// may be NULL. Not all platforms support this option.
///
/// \threadsafety This function should be called only from the main thread. The
/// callback may be invoked from the same thread or from a
/// different one, depending on the OS's constraints.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_DialogFileFilter
/// \sa SDL_ShowOpenFileDialog
/// \sa SDL_ShowOpenFolderDialog
/// \sa SDL_ShowFileDialogWithProperties
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
/// \threadsafety This function should be called only from the main thread. The
/// callback may be invoked from the same thread or from a
/// different one, depending on the OS's constraints.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_DialogFileCallback
/// \sa SDL_ShowOpenFileDialog
/// \sa SDL_ShowSaveFileDialog
/// \sa SDL_ShowFileDialogWithProperties
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

///
/// Create and launch a file dialog with the specified properties.
///
/// These are the supported properties:
///
/// - `SDL_PROP_FILE_DIALOG_FILTERS_POINTER`: a pointer to a list of
/// SDL_DialogFileFilter's, which will be used as filters for file-based
/// selections. Ignored if the dialog is an "Open Folder" dialog. If
/// non-NULL, the array of filters must remain valid at least until the
/// callback is invoked.
/// - `SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER`: the number of filters in the
/// array of filters, if it exists.
/// - `SDL_PROP_FILE_DIALOG_WINDOW_POINTER`: the window that the dialog should
/// be modal for.
/// - `SDL_PROP_FILE_DIALOG_LOCATION_STRING`: the default folder or file to
/// start the dialog at.
/// - `SDL_PROP_FILE_DIALOG_MANY_BOOLEAN`: true to allow the user to select
/// more than one entry.
/// - `SDL_PROP_FILE_DIALOG_TITLE_STRING`: the title for the dialog.
/// - `SDL_PROP_FILE_DIALOG_ACCEPT_STRING`: the label that the accept button
/// should have.
/// - `SDL_PROP_FILE_DIALOG_CANCEL_STRING`: the label that the cancel button
/// should have.
///
/// Note that each platform may or may not support any of the properties.
///
/// \param type the type of file dialog.
/// \param callback a function pointer to be invoked when the user selects a
/// file and accepts, or cancels the dialog, or an error
/// occurs.
/// \param userdata an optional pointer to pass extra data to the callback when
/// it will be invoked.
/// \param props the properties to use.
///
/// \threadsafety This function should be called only from the main thread. The
/// callback may be invoked from the same thread or from a
/// different one, depending on the OS's constraints.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_FileDialogType
/// \sa SDL_DialogFileCallback
/// \sa SDL_DialogFileFilter
/// \sa SDL_ShowOpenFileDialog
/// \sa SDL_ShowSaveFileDialog
/// \sa SDL_ShowOpenFolderDialog
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ShowFileDialogWithProperties(SDL_FileDialogType type, SDL_DialogFileCallback callback, void *userdata, SDL_PropertiesID props)
/// ```
void sdlShowFileDialogWithProperties(
    int type,
    Pointer<NativeFunction<SdlDialogFileCallback>> callback,
    Pointer<NativeType> userdata,
    int props) {
  final sdlShowFileDialogWithPropertiesLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Int32 type,
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          Uint32 props),
      void Function(
          int type,
          Pointer<NativeFunction<SdlDialogFileCallback>> callback,
          Pointer<NativeType> userdata,
          int props)>('SDL_ShowFileDialogWithProperties');
  return sdlShowFileDialogWithPropertiesLookupFunction(
      type, callback, userdata, props);
}
