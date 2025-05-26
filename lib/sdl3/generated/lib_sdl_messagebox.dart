// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Create a modal message box.
///
/// If your needs aren't complex, it might be easier to use
/// SDL_ShowSimpleMessageBox.
///
/// This function should be called on the thread that created the parent
/// window, or on the main thread if the messagebox has no parent. It will
/// block execution of that thread until the user clicks a button or closes the
/// messagebox.
///
/// This function may be called at any time, even before SDL_Init(). This makes
/// it useful for reporting errors like a failure to create a renderer or
/// OpenGL context.
///
/// On X11, SDL rolls its own dialog box with X11 primitives instead of a
/// formal toolkit like GTK+ or Qt.
///
/// Note that if SDL_Init() would fail because there isn't any available video
/// target, this function is likely to fail for the same reasons. If this is a
/// concern, check the return value from this function and fall back to writing
/// to stderr if you can.
///
/// \param messageboxdata the SDL_MessageBoxData structure with title, text and
/// other options.
/// \param buttonid the pointer to which user id of hit button should be
/// copied.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ShowSimpleMessageBox
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ShowMessageBox(const SDL_MessageBoxData *messageboxdata, int *buttonid)
/// ```
bool sdlShowMessageBox(
  Pointer<SdlMessageBoxData> messageboxdata,
  Pointer<Int32> buttonid,
) {
  final sdlShowMessageBoxLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlMessageBoxData> messageboxdata,
          Pointer<Int32> buttonid,
        ),
        int Function(
          Pointer<SdlMessageBoxData> messageboxdata,
          Pointer<Int32> buttonid,
        )
      >('SDL_ShowMessageBox');
  return sdlShowMessageBoxLookupFunction(messageboxdata, buttonid) == 1;
}

///
/// Display a simple modal message box.
///
/// If your needs aren't complex, this function is preferred over
/// SDL_ShowMessageBox.
///
/// `flags` may be any of the following:
///
/// - `SDL_MESSAGEBOX_ERROR`: error dialog
/// - `SDL_MESSAGEBOX_WARNING`: warning dialog
/// - `SDL_MESSAGEBOX_INFORMATION`: informational dialog
///
/// This function should be called on the thread that created the parent
/// window, or on the main thread if the messagebox has no parent. It will
/// block execution of that thread until the user clicks a button or closes the
/// messagebox.
///
/// This function may be called at any time, even before SDL_Init(). This makes
/// it useful for reporting errors like a failure to create a renderer or
/// OpenGL context.
///
/// On X11, SDL rolls its own dialog box with X11 primitives instead of a
/// formal toolkit like GTK+ or Qt.
///
/// Note that if SDL_Init() would fail because there isn't any available video
/// target, this function is likely to fail for the same reasons. If this is a
/// concern, check the return value from this function and fall back to writing
/// to stderr if you can.
///
/// \param flags an SDL_MessageBoxFlags value.
/// \param title UTF-8 title text.
/// \param message UTF-8 message text.
/// \param window the parent window, or NULL for no parent.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ShowMessageBox
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ShowSimpleMessageBox(SDL_MessageBoxFlags flags, const char *title, const char *message, SDL_Window *window)
/// ```
bool sdlShowSimpleMessageBox(
  int flags,
  String? title,
  String? message,
  Pointer<SdlWindow> window,
) {
  final sdlShowSimpleMessageBoxLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Uint32 flags,
          Pointer<Utf8> title,
          Pointer<Utf8> message,
          Pointer<SdlWindow> window,
        ),
        int Function(
          int flags,
          Pointer<Utf8> title,
          Pointer<Utf8> message,
          Pointer<SdlWindow> window,
        )
      >('SDL_ShowSimpleMessageBox');
  final titlePointer = title != null ? title.toNativeUtf8() : nullptr;
  final messagePointer = message != null ? message.toNativeUtf8() : nullptr;
  final result =
      sdlShowSimpleMessageBoxLookupFunction(
        flags,
        titlePointer,
        messagePointer,
        window,
      ) ==
      1;
  calloc.free(titlePointer);
  calloc.free(messagePointer);
  return result;
}
