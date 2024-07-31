// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Return whether a keyboard is currently connected.
///
/// \returns SDL_TRUE if a keyboard is connected, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboards
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasKeyboard(void)
/// ```
bool sdlHasKeyboard() {
  final sdlHasKeyboardLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_HasKeyboard');
  return sdlHasKeyboardLookupFunction() == 1;
}

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
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboardNameForID
/// \sa SDL_HasKeyboard
///
/// ```c
/// extern SDL_DECLSPEC_FREE SDL_KeyboardID * SDLCALL SDL_GetKeyboards(int *count)
/// ```
Pointer<Uint32> sdlGetKeyboards(Pointer<Int32> count) {
  final sdlGetKeyboardsLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(Pointer<Int32> count)>('SDL_GetKeyboards');
  return sdlGetKeyboardsLookupFunction(count);
}

///
/// Get the name of a keyboard.
///
/// This function returns "" if the keyboard doesn't have a name.
///
/// \param instance_id the keyboard instance ID.
/// \returns the name of the selected keyboard or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboards
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetKeyboardNameForID(SDL_KeyboardID instance_id)
/// ```
String? sdlGetKeyboardNameForId(int instanceId) {
  final sdlGetKeyboardNameForIdLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetKeyboardNameForID');
  final result = sdlGetKeyboardNameForIdLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Query the window which currently has keyboard focus.
///
/// \returns the window with keyboard focus.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_GetKeyboardFocus(void)
/// ```
Pointer<SdlWindow> sdlGetKeyboardFocus() {
  final sdlGetKeyboardFocusLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlWindow> Function(),
      Pointer<SdlWindow> Function()>('SDL_GetKeyboardFocus');
  return sdlGetKeyboardFocusLookupFunction();
}

///
/// Get a snapshot of the current state of the keyboard.
///
/// The pointer returned is a pointer to an internal SDL array. It will be
/// valid for the whole lifetime of the application and should not be freed by
/// the caller.
///
/// A array element with a value of 1 means that the key is pressed and a value
/// of 0 means that it is not. Indexes into this array are obtained by using
/// SDL_Scancode values.
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
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PumpEvents
/// \sa SDL_ResetKeyboard
///
/// ```c
/// extern SDL_DECLSPEC const Uint8 * SDLCALL SDL_GetKeyboardState(int *numkeys)
/// ```
Pointer<Uint8> sdlGetKeyboardState(Pointer<Int32> numkeys) {
  final sdlGetKeyboardStateLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint8> Function(Pointer<Int32> numkeys),
      Pointer<Uint8> Function(Pointer<Int32> numkeys)>('SDL_GetKeyboardState');
  return sdlGetKeyboardStateLookupFunction(numkeys);
}

///
/// Clear the state of the keyboard.
///
/// This function will generate key up events for all pressed keys.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboardState
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ResetKeyboard(void)
/// ```
void sdlResetKeyboard() {
  final sdlResetKeyboardLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_ResetKeyboard');
  return sdlResetKeyboardLookupFunction();
}

///
/// Get the current key modifier state for the keyboard.
///
/// \returns an OR'd combination of the modifier keys for the keyboard. See
/// SDL_Keymod for details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyboardState
/// \sa SDL_SetModState
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keymod SDLCALL SDL_GetModState(void)
/// ```
int sdlGetModState() {
  final sdlGetModStateLookupFunction = libSdl3
      .lookupFunction<Uint16 Function(), int Function()>('SDL_GetModState');
  return sdlGetModStateLookupFunction();
}

///
/// Set the current key modifier state for the keyboard.
///
/// The inverse of SDL_GetModState(), SDL_SetModState() allows you to impose
/// modifier key states on your application. Simply pass your desired modifier
/// states into `modstate`. This value may be a bitwise, OR'd combination of
/// SDL_Keymod values.
///
/// This does not change the keyboard state, only the key modifier flags that
/// SDL reports.
///
/// \param modstate the desired SDL_Keymod for the keyboard.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetModState
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetModState(SDL_Keymod modstate)
/// ```
void sdlSetModState(int modstate) {
  final sdlSetModStateLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint16 modstate),
      void Function(int modstate)>('SDL_SetModState');
  return sdlSetModStateLookupFunction(modstate);
}

///
/// Get the key code corresponding to the given scancode according to a default
/// en_US keyboard layout.
///
/// See SDL_Keycode for details.
///
/// \param scancode the desired SDL_Scancode to query.
/// \param modstate the modifier state to use when translating the scancode to
/// a keycode.
/// \returns the SDL_Keycode that corresponds to the given SDL_Scancode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyName
/// \sa SDL_GetScancodeFromKey
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keycode SDLCALL SDL_GetDefaultKeyFromScancode(SDL_Scancode scancode, SDL_Keymod modstate)
/// ```
int sdlGetDefaultKeyFromScancode(int scancode, int modstate) {
  final sdlGetDefaultKeyFromScancodeLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Int32 scancode, Uint16 modstate),
      int Function(
          int scancode, int modstate)>('SDL_GetDefaultKeyFromScancode');
  return sdlGetDefaultKeyFromScancodeLookupFunction(scancode, modstate);
}

///
/// Get the key code corresponding to the given scancode according to the
/// current keyboard layout.
///
/// See SDL_Keycode for details.
///
/// \param scancode the desired SDL_Scancode to query.
/// \param modstate the modifier state to use when translating the scancode to
/// a keycode.
/// \returns the SDL_Keycode that corresponds to the given SDL_Scancode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDefaultKeyFromScancode
/// \sa SDL_GetKeyName
/// \sa SDL_GetScancodeFromKey
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keycode SDLCALL SDL_GetKeyFromScancode(SDL_Scancode scancode, SDL_Keymod modstate)
/// ```
int sdlGetKeyFromScancode(int scancode, int modstate) {
  final sdlGetKeyFromScancodeLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Int32 scancode, Uint16 modstate),
      int Function(int scancode, int modstate)>('SDL_GetKeyFromScancode');
  return sdlGetKeyFromScancodeLookupFunction(scancode, modstate);
}

///
/// Get the scancode corresponding to the given key code according to a default
/// en_US keyboard layout.
///
/// Note that there may be multiple scancode+modifier states that can generate
/// this keycode, this will just return the first one found.
///
/// \param key the desired SDL_Keycode to query.
/// \param modstate a pointer to the modifier state that would be used when the
/// scancode generates this key, may be NULL.
/// \returns the SDL_Scancode that corresponds to the given SDL_Keycode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetScancodeFromKey
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Scancode SDLCALL SDL_GetDefaultScancodeFromKey(SDL_Keycode key, SDL_Keymod *modstate)
/// ```
int sdlGetDefaultScancodeFromKey(int key, Pointer<Uint16> modstate) {
  final sdlGetDefaultScancodeFromKeyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 key, Pointer<Uint16> modstate),
      int Function(
          int key, Pointer<Uint16> modstate)>('SDL_GetDefaultScancodeFromKey');
  return sdlGetDefaultScancodeFromKeyLookupFunction(key, modstate);
}

///
/// Get the scancode corresponding to the given key code according to the
/// current keyboard layout.
///
/// Note that there may be multiple scancode+modifier states that can generate
/// this keycode, this will just return the first one found.
///
/// \param key the desired SDL_Keycode to query.
/// \param modstate a pointer to the modifier state that would be used when the
/// scancode generates this key, may be NULL.
/// \returns the SDL_Scancode that corresponds to the given SDL_Keycode.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDefaultScancodeFromKey
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Scancode SDLCALL SDL_GetScancodeFromKey(SDL_Keycode key, SDL_Keymod *modstate)
/// ```
int sdlGetScancodeFromKey(int key, Pointer<Uint16> modstate) {
  final sdlGetScancodeFromKeyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 key, Pointer<Uint16> modstate),
      int Function(
          int key, Pointer<Uint16> modstate)>('SDL_GetScancodeFromKey');
  return sdlGetScancodeFromKeyLookupFunction(key, modstate);
}

///
/// Set a human-readable name for a scancode.
///
/// \param scancode the desired SDL_Scancode.
/// \param name the name to use for the scancode, encoded as UTF-8. The string
/// is not copied, so the pointer given to this function must stay
/// valid while SDL is being used.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetScancodeName(SDL_Scancode scancode, const char *name)
/// ```
int sdlSetScancodeName(int scancode, String? name) {
  final sdlSetScancodeNameLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 scancode, Pointer<Utf8> name),
      int Function(int scancode, Pointer<Utf8> name)>('SDL_SetScancodeName');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlSetScancodeNameLookupFunction(scancode, namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Get a human-readable name for a scancode.
///
/// **Warning**: The returned name is by design not stable across platforms,
/// e.g. the name for `SDL_SCANCODE_LGUI` is "Left GUI" under Linux but "Left
/// Windows" under Microsoft Windows, and some scancodes like
/// `SDL_SCANCODE_NONUSBACKSLASH` don't have any name at all. There are even
/// scancodes that share names, e.g. `SDL_SCANCODE_RETURN` and
/// `SDL_SCANCODE_RETURN2` (both called "Return"). This function is therefore
/// unsuitable for creating a stable cross-platform two-way mapping between
/// strings and scancodes.
///
/// \param scancode the desired SDL_Scancode to query.
/// \returns a pointer to the name for the scancode. If the scancode doesn't
/// have a name this function returns an empty string ("").
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetScancodeFromKey
/// \sa SDL_GetScancodeFromName
/// \sa SDL_SetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetScancodeName(SDL_Scancode scancode)
/// ```
String? sdlGetScancodeName(int scancode) {
  final sdlGetScancodeNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 scancode),
      Pointer<Utf8> Function(int scancode)>('SDL_GetScancodeName');
  final result = sdlGetScancodeNameLookupFunction(scancode);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get a scancode from a human-readable name.
///
/// \param name the human-readable scancode name.
/// \returns the SDL_Scancode, or `SDL_SCANCODE_UNKNOWN` if the name wasn't
/// recognized; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyFromName
/// \sa SDL_GetScancodeFromKey
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Scancode SDLCALL SDL_GetScancodeFromName(const char *name)
/// ```
int sdlGetScancodeFromName(String? name) {
  final sdlGetScancodeFromNameLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> name),
      int Function(Pointer<Utf8> name)>('SDL_GetScancodeFromName');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetScancodeFromNameLookupFunction(namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Get a human-readable name for a key.
///
/// Both lowercase and uppercase alphabetic keycodes have uppercase names, e.g.
/// SDL_Keycode 'a' and 'A' both have the name "A".
///
/// If the key doesn't have a name, this function returns an empty string ("").
///
/// \param key the desired SDL_Keycode to query.
/// \returns a UTF-8 encoded string of the key name.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyFromName
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetScancodeFromKey
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetKeyName(SDL_Keycode key)
/// ```
String? sdlGetKeyName(int key) {
  final sdlGetKeyNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 key),
      Pointer<Utf8> Function(int key)>('SDL_GetKeyName');
  final result = sdlGetKeyNameLookupFunction(key);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get a key code from a human-readable name.
///
/// \param name the human-readable key name.
/// \returns key code, or `SDLK_UNKNOWN` if the name wasn't recognized; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetKeyName
/// \sa SDL_GetScancodeFromName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keycode SDLCALL SDL_GetKeyFromName(const char *name)
/// ```
int sdlGetKeyFromName(String? name) {
  final sdlGetKeyFromNameLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<Utf8> name),
      int Function(Pointer<Utf8> name)>('SDL_GetKeyFromName');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetKeyFromNameLookupFunction(namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Start accepting Unicode text input events in a window.
///
/// This function will enable text input (SDL_EVENT_TEXT_INPUT and
/// SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this
/// function paired with SDL_StopTextInput().
///
/// Text input events are not received by default.
///
/// On some platforms using this function shows the screen keyboard.
///
/// \param window the window to enable text input.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetTextInputArea
/// \sa SDL_StopTextInput
/// \sa SDL_TextInputActive
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_StartTextInput(SDL_Window *window)
/// ```
int sdlStartTextInput(Pointer<SdlWindow> window) {
  final sdlStartTextInputLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_StartTextInput');
  return sdlStartTextInputLookupFunction(window);
}

///
/// Check whether or not Unicode text input events are enabled for a window.
///
/// \param window the window to check.
/// \returns SDL_TRUE if text input events are enabled else SDL_FALSE.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_TextInputActive(SDL_Window *window)
/// ```
bool sdlTextInputActive(Pointer<SdlWindow> window) {
  final sdlTextInputActiveLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_TextInputActive');
  return sdlTextInputActiveLookupFunction(window) == 1;
}

///
/// Stop receiving any text input events in a window.
///
/// If SDL_StartTextInput() showed the screen keyboard, this function will hide
/// it.
///
/// \param window the window to disable text input.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_StopTextInput(SDL_Window *window)
/// ```
int sdlStopTextInput(Pointer<SdlWindow> window) {
  final sdlStopTextInputLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_StopTextInput');
  return sdlStopTextInputLookupFunction(window);
}

///
/// Dismiss the composition window/IME without disabling the subsystem.
///
/// \param window the window to affect.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
/// \sa SDL_StopTextInput
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_ClearComposition(SDL_Window *window)
/// ```
int sdlClearComposition(Pointer<SdlWindow> window) {
  final sdlClearCompositionLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_ClearComposition');
  return sdlClearCompositionLookupFunction(window);
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetTextInputArea
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetTextInputArea(SDL_Window *window, const SDL_Rect *rect, int cursor)
/// ```
int sdlSetTextInputArea(
    Pointer<SdlWindow> window, Pointer<SdlRect> rect, int cursor) {
  final sdlSetTextInputAreaLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlWindow> window, Pointer<SdlRect> rect, Int32 cursor),
      int Function(Pointer<SdlWindow> window, Pointer<SdlRect> rect,
          int cursor)>('SDL_SetTextInputArea');
  return sdlSetTextInputAreaLookupFunction(window, rect, cursor);
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
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetTextInputArea
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetTextInputArea(SDL_Window *window, SDL_Rect *rect, int *cursor)
/// ```
int sdlGetTextInputArea(
    Pointer<SdlWindow> window, Pointer<SdlRect> rect, Pointer<Int32> cursor) {
  final sdlGetTextInputAreaLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window, Pointer<SdlRect> rect,
          Pointer<Int32> cursor),
      int Function(Pointer<SdlWindow> window, Pointer<SdlRect> rect,
          Pointer<Int32> cursor)>('SDL_GetTextInputArea');
  return sdlGetTextInputAreaLookupFunction(window, rect, cursor);
}

///
/// Check whether the platform has screen keyboard support.
///
/// \returns SDL_TRUE if the platform has some screen keyboard support or
/// SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_StartTextInput
/// \sa SDL_ScreenKeyboardShown
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_HasScreenKeyboardSupport(void)
/// ```
bool sdlHasScreenKeyboardSupport() {
  final sdlHasScreenKeyboardSupportLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_HasScreenKeyboardSupport');
  return sdlHasScreenKeyboardSupportLookupFunction() == 1;
}

///
/// Check whether the screen keyboard is shown for given window.
///
/// \param window the window for which screen keyboard should be queried.
/// \returns SDL_TRUE if screen keyboard is shown or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasScreenKeyboardSupport
///
/// ```c
/// extern SDL_DECLSPEC SDL_bool SDLCALL SDL_ScreenKeyboardShown(SDL_Window *window)
/// ```
bool sdlScreenKeyboardShown(Pointer<SdlWindow> window) {
  final sdlScreenKeyboardShownLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlWindow> window),
      int Function(Pointer<SdlWindow> window)>('SDL_ScreenKeyboardShown');
  return sdlScreenKeyboardShownLookupFunction(window) == 1;
}
