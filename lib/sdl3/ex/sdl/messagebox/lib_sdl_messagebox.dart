part of '../../../sdl.dart';

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
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ShowSimpleMessageBox
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ShowMessageBox(const SDL_MessageBoxData *messageboxdata, int *buttonid)
/// ```
/// {@category messagebox}
bool sdlxShowMessageBox(SdlxMessageBoxData messageBoxData) {
  final messageBoxDataPointer = messageBoxData.calloc();
  final buttonidPointer = calloc<Int32>();
  final result = sdlShowMessageBox(messageBoxDataPointer, buttonidPointer);
  if (result) {
    messageBoxData.selectedButtonId = buttonidPointer.value;
  }
  messageBoxDataPointer.callocAllFree();
  buttonidPointer.callocFree();
  return result;
}
