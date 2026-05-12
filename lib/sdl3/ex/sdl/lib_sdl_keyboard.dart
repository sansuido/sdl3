part of '../../sdl.dart';

///
/// Get a list of currently connected keyboards.
///
/// Note that this will include any device or virtual driver that includes
/// keyboard functionality, including some mice, KVM switches, motherboard
/// power buttons, etc. You should wait for input from a device before you
/// consider it actively in use.
///
/// \param count a pointer filled in with the number of keyboards returned, may
/// be NULL.
/// \returns a 0 terminated array of keyboards instance IDs or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyboardNameForID
/// \sa SDL_HasKeyboard
///
/// ```c
/// extern SDL_DECLSPEC SDL_KeyboardID * SDLCALL SDL_GetKeyboards(int *count)
/// ```
/// {@category keyboard}
List<int> sdlxGetKeyboards() {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final resultPointer = sdlGetKeyboards(countPointer);
  if (resultPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(resultPointer[i]);
    }
    sdlFree(resultPointer);
  }
  countPointer.callocFree();
  return result;
}

///
/// Get a snapshot of the current state of the keyboard.
///
/// The pointer returned is a pointer to an internal SDL array. It will be
/// valid for the whole lifetime of the application and should not be freed by
/// the caller.
///
/// A array element with a value of true means that the key is pressed and a
/// value of false means that it is not. Indexes into this array are obtained
/// by using SDL_Scancode values.
///
/// Use SDL_PumpEvents() to update the state array.
///
/// This function gives you the current state after all events have been
/// processed, so if a key or button has been pressed and released before you
/// process events, then the pressed state will never show up in the
/// SDL_GetKeyboardState() calls.
///
/// Note: This function doesn't take into account whether shift has been
/// pressed or not.
///
/// \param numkeys if non-NULL, receives the length of the returned array.
/// \returns a pointer to an array of key states.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PumpEvents
/// \sa SDL_ResetKeyboard
///
/// ```c
/// extern SDL_DECLSPEC const bool * SDLCALL SDL_GetKeyboardState(int *numkeys)
/// ```
/// {@category keyboard}
List<bool> sdlxGetKeyboardState() {
  final result = <bool>[];
  final numkeysPointer = ffi.calloc<Int32>();
  final resultPointer = sdlGetKeyboardState(numkeysPointer);
  if (resultPointer != nullptr) {
    for (var i = 0; i < numkeysPointer.value; i++) {
      result.add(resultPointer[i] != 0);
    }
  }
  numkeysPointer.callocFree();
  return result;
}

///
/// Set the area used to type Unicode text input.
///
/// Native input methods may place a window with word suggestions near the
/// cursor, without covering the text being entered.
///
/// \param window the window for which to set the text input area.
/// \param rect the SDL_Rect representing the text input area, in window
/// coordinates, or NULL to clear it.
/// \param cursor the offset of the current cursor location relative to
/// `rect->x`, in window coordinates.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetTextInputArea
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetTextInputArea(SDL_Window *window, const SDL_Rect *rect, int cursor)
/// ```
/// {@category keyboard}
bool sdlxSetTextInputArea(Pointer<SdlWindow> window, SdlxTextInputArea area) {
  final rectPointer = area.rect.calloc();
  final result = sdlSetTextInputArea(window, rectPointer, area.cursor);
  rectPointer.callocFree();
  return result;
}

///
/// Get the area used to type Unicode text input.
///
/// This returns the values previously set by SDL_SetTextInputArea().
///
/// \param window the window for which to query the text input area.
/// \param rect a pointer to an SDL_Rect filled in with the text input area,
/// may be NULL.
/// \param cursor a pointer to the offset of the current cursor location
/// relative to `rect->x`, may be NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetTextInputArea
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextInputArea(SDL_Window *window, SDL_Rect *rect, int *cursor)
/// ```
/// {@category keyboard}
bool sdlxGetTextInputArea(Pointer<SdlWindow> window, SdlxTextInputArea area) {
  final rectPointer = area.rect.calloc();
  final cursorPointer = ffi.calloc<Int32>();
  final result = sdlGetTextInputArea(window, rectPointer, cursorPointer);
  if (result) {
    area.rect.loadFromPointer(rectPointer);
    area.cursor = cursorPointer.value;
  }
  cursorPointer.callocFree();
  rectPointer.callocFree();
  return result;
}
