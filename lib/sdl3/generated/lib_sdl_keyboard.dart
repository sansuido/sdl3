// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
part of '../sdl.dart';

///
/// Return whether a keyboard is currently connected.
///
/// \returns true if a keyboard is connected, false otherwise.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyboards
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasKeyboard(void)
/// ```
/// {@category keyboard}
bool sdlHasKeyboard() {
  final sdlHasKeyboardLookupFunction = _libSdl
      .lookupFunction<Uint8 Function(), int Function()>('SDL_HasKeyboard');
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
Pointer<Uint32> sdlGetKeyboards(Pointer<Int32> count) {
  final sdlGetKeyboardsLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Uint32> Function(Pointer<Int32> count),
        Pointer<Uint32> Function(Pointer<Int32> count)
      >('SDL_GetKeyboards');
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
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyboards
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetKeyboardNameForID(SDL_KeyboardID instance_id)
/// ```
/// {@category keyboard}
String? sdlGetKeyboardNameForId(int instanceId) {
  final sdlGetKeyboardNameForIdLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Utf8> Function(Uint32 instanceId),
        Pointer<Utf8> Function(int instanceId)
      >('SDL_GetKeyboardNameForID');
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
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Window * SDLCALL SDL_GetKeyboardFocus(void)
/// ```
/// {@category keyboard}
Pointer<SdlWindow> sdlGetKeyboardFocus() {
  final sdlGetKeyboardFocusLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlWindow> Function(),
        Pointer<SdlWindow> Function()
      >('SDL_GetKeyboardFocus');
  return sdlGetKeyboardFocusLookupFunction();
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
Pointer<Uint8> sdlGetKeyboardState(Pointer<Int32> numkeys) {
  final sdlGetKeyboardStateLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Uint8> Function(Pointer<Int32> numkeys),
        Pointer<Uint8> Function(Pointer<Int32> numkeys)
      >('SDL_GetKeyboardState');
  return sdlGetKeyboardStateLookupFunction(numkeys);
}

///
/// Clear the state of the keyboard.
///
/// This function will generate key up events for all pressed keys.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyboardState
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ResetKeyboard(void)
/// ```
/// {@category keyboard}
void sdlResetKeyboard() {
  final sdlResetKeyboardLookupFunction = _libSdl
      .lookupFunction<Void Function(), void Function()>('SDL_ResetKeyboard');
  return sdlResetKeyboardLookupFunction();
}

///
/// Get the current key modifier state for the keyboard.
///
/// \returns an OR'd combination of the modifier keys for the keyboard. See
/// SDL_Keymod for details.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyboardState
/// \sa SDL_SetModState
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keymod SDLCALL SDL_GetModState(void)
/// ```
/// {@category keyboard}
int sdlGetModState() {
  final sdlGetModStateLookupFunction = _libSdl
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
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetModState
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetModState(SDL_Keymod modstate)
/// ```
/// {@category keyboard}
void sdlSetModState(int modstate) {
  final sdlSetModStateLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Uint16 modstate),
        void Function(int modstate)
      >('SDL_SetModState');
  return sdlSetModStateLookupFunction(modstate);
}

///
/// Get the key code corresponding to the given scancode according to the
/// current keyboard layout.
///
/// If you want to get the keycode as it would be delivered in key events,
/// including options specified in SDL_HINT_KEYCODE_OPTIONS, then you should
/// pass `key_event` as true. Otherwise this function simply translates the
/// scancode based on the given modifier state.
///
/// \param scancode the desired SDL_Scancode to query.
/// \param modstate the modifier state to use when translating the scancode to
/// a keycode.
/// \param key_event true if the keycode will be used in key events.
/// \returns the SDL_Keycode that corresponds to the given SDL_Scancode.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyName
/// \sa SDL_GetScancodeFromKey
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keycode SDLCALL SDL_GetKeyFromScancode(SDL_Scancode scancode, SDL_Keymod modstate, bool key_event)
/// ```
/// {@category keyboard}
int sdlGetKeyFromScancode(int scancode, int modstate, bool keyEvent) {
  final sdlGetKeyFromScancodeLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Int32 scancode, Uint16 modstate, Uint8 keyEvent),
        int Function(int scancode, int modstate, int keyEvent)
      >('SDL_GetKeyFromScancode');
  return sdlGetKeyFromScancodeLookupFunction(
    scancode,
    modstate,
    keyEvent ? 1 : 0,
  );
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
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Scancode SDLCALL SDL_GetScancodeFromKey(SDL_Keycode key, SDL_Keymod *modstate)
/// ```
/// {@category keyboard}
int sdlGetScancodeFromKey(int key, Pointer<Uint16> modstate) {
  final sdlGetScancodeFromKeyLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Uint32 key, Pointer<Uint16> modstate),
        int Function(int key, Pointer<Uint16> modstate)
      >('SDL_GetScancodeFromKey');
  return sdlGetScancodeFromKeyLookupFunction(key, modstate);
}

///
/// Set a human-readable name for a scancode.
///
/// \param scancode the desired SDL_Scancode.
/// \param name the name to use for the scancode, encoded as UTF-8. The string
/// is not copied, so the pointer given to this function must stay
/// valid while SDL is being used.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetScancodeName(SDL_Scancode scancode, const char *name)
/// ```
/// {@category keyboard}
bool sdlSetScancodeName(int scancode, String? name) {
  final sdlSetScancodeNameLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Int32 scancode, Pointer<Utf8> name),
        int Function(int scancode, Pointer<Utf8> name)
      >('SDL_SetScancodeName');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlSetScancodeNameLookupFunction(scancode, namePointer) == 1;
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
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetScancodeFromKey
/// \sa SDL_GetScancodeFromName
/// \sa SDL_SetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetScancodeName(SDL_Scancode scancode)
/// ```
/// {@category keyboard}
String? sdlGetScancodeName(int scancode) {
  final sdlGetScancodeNameLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Utf8> Function(Int32 scancode),
        Pointer<Utf8> Function(int scancode)
      >('SDL_GetScancodeName');
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
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyFromName
/// \sa SDL_GetScancodeFromKey
/// \sa SDL_GetScancodeName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Scancode SDLCALL SDL_GetScancodeFromName(const char *name)
/// ```
/// {@category keyboard}
int sdlGetScancodeFromName(String? name) {
  final sdlGetScancodeFromNameLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Pointer<Utf8> name),
        int Function(Pointer<Utf8> name)
      >('SDL_GetScancodeFromName');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetScancodeFromNameLookupFunction(namePointer);
  calloc.free(namePointer);
  return result;
}

///
/// Get a human-readable name for a key.
///
/// If the key doesn't have a name, this function returns an empty string ("").
///
/// Letters will be presented in their uppercase form, if applicable.
///
/// \param key the desired SDL_Keycode to query.
/// \returns a UTF-8 encoded string of the key name.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyFromName
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetScancodeFromKey
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetKeyName(SDL_Keycode key)
/// ```
/// {@category keyboard}
String? sdlGetKeyName(int key) {
  final sdlGetKeyNameLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Utf8> Function(Uint32 key),
        Pointer<Utf8> Function(int key)
      >('SDL_GetKeyName');
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
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetKeyFromScancode
/// \sa SDL_GetKeyName
/// \sa SDL_GetScancodeFromName
///
/// ```c
/// extern SDL_DECLSPEC SDL_Keycode SDLCALL SDL_GetKeyFromName(const char *name)
/// ```
/// {@category keyboard}
int sdlGetKeyFromName(String? name) {
  final sdlGetKeyFromNameLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<Utf8> name),
        int Function(Pointer<Utf8> name)
      >('SDL_GetKeyFromName');
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
/// On some platforms using this function shows the screen keyboard and/or
/// activates an IME, which can prevent some key press events from being passed
/// through.
///
/// \param window the window to enable text input.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetTextInputArea
/// \sa SDL_StartTextInputWithProperties
/// \sa SDL_StopTextInput
/// \sa SDL_TextInputActive
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_StartTextInput(SDL_Window *window)
/// ```
/// {@category keyboard}
bool sdlStartTextInput(Pointer<SdlWindow> window) {
  final sdlStartTextInputLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlWindow> window),
        int Function(Pointer<SdlWindow> window)
      >('SDL_StartTextInput');
  return sdlStartTextInputLookupFunction(window) == 1;
}

///
/// Start accepting Unicode text input events in a window, with properties
/// describing the input.
///
/// This function will enable text input (SDL_EVENT_TEXT_INPUT and
/// SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this
/// function paired with SDL_StopTextInput().
///
/// Text input events are not received by default.
///
/// On some platforms using this function shows the screen keyboard and/or
/// activates an IME, which can prevent some key press events from being passed
/// through.
///
/// These are the supported properties:
///
/// - `SDL_PROP_TEXTINPUT_TYPE_NUMBER` - an SDL_TextInputType value that
/// describes text being input, defaults to SDL_TEXTINPUT_TYPE_TEXT.
/// - `SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER` - an SDL_Capitalization value
/// that describes how text should be capitalized, defaults to
/// SDL_CAPITALIZE_SENTENCES for normal text entry, SDL_CAPITALIZE_WORDS for
/// SDL_TEXTINPUT_TYPE_TEXT_NAME, and SDL_CAPITALIZE_NONE for e-mail
/// addresses, usernames, and passwords.
/// - `SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN` - true to enable auto completion
/// and auto correction, defaults to true.
/// - `SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN` - true if multiple lines of text
/// are allowed. This defaults to true if SDL_HINT_RETURN_KEY_HIDES_IME is
/// "0" or is not set, and defaults to false if SDL_HINT_RETURN_KEY_HIDES_IME
/// is "1".
///
/// On Android you can directly specify the input type:
///
/// - `SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER` - the text input type to
/// use, overriding other properties. This is documented at
/// https://developer.android.com/reference/android/text/InputType
///
/// \param window the window to enable text input.
/// \param props the properties to use.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetTextInputArea
/// \sa SDL_StartTextInput
/// \sa SDL_StopTextInput
/// \sa SDL_TextInputActive
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_StartTextInputWithProperties(SDL_Window *window, SDL_PropertiesID props)
/// ```
/// {@category keyboard}
bool sdlStartTextInputWithProperties(Pointer<SdlWindow> window, int props) {
  final sdlStartTextInputWithPropertiesLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlWindow> window, Uint32 props),
        int Function(Pointer<SdlWindow> window, int props)
      >('SDL_StartTextInputWithProperties');
  return sdlStartTextInputWithPropertiesLookupFunction(window, props) == 1;
}

///
/// Check whether or not Unicode text input events are enabled for a window.
///
/// \param window the window to check.
/// \returns true if text input events are enabled else false.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_TextInputActive(SDL_Window *window)
/// ```
/// {@category keyboard}
bool sdlTextInputActive(Pointer<SdlWindow> window) {
  final sdlTextInputActiveLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlWindow> window),
        int Function(Pointer<SdlWindow> window)
      >('SDL_TextInputActive');
  return sdlTextInputActiveLookupFunction(window) == 1;
}

///
/// Stop receiving any text input events in a window.
///
/// If SDL_StartTextInput() showed the screen keyboard, this function will hide
/// it.
///
/// \param window the window to disable text input.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StartTextInput
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_StopTextInput(SDL_Window *window)
/// ```
/// {@category keyboard}
bool sdlStopTextInput(Pointer<SdlWindow> window) {
  final sdlStopTextInputLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlWindow> window),
        int Function(Pointer<SdlWindow> window)
      >('SDL_StopTextInput');
  return sdlStopTextInputLookupFunction(window) == 1;
}

///
/// Dismiss the composition window/IME without disabling the subsystem.
///
/// \param window the window to affect.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StartTextInput
/// \sa SDL_StopTextInput
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ClearComposition(SDL_Window *window)
/// ```
/// {@category keyboard}
bool sdlClearComposition(Pointer<SdlWindow> window) {
  final sdlClearCompositionLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlWindow> window),
        int Function(Pointer<SdlWindow> window)
      >('SDL_ClearComposition');
  return sdlClearCompositionLookupFunction(window) == 1;
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
bool sdlSetTextInputArea(
  Pointer<SdlWindow> window,
  Pointer<SdlRect> rect,
  int cursor,
) {
  final sdlSetTextInputAreaLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlWindow> window,
          Pointer<SdlRect> rect,
          Int32 cursor,
        ),
        int Function(
          Pointer<SdlWindow> window,
          Pointer<SdlRect> rect,
          int cursor,
        )
      >('SDL_SetTextInputArea');
  return sdlSetTextInputAreaLookupFunction(window, rect, cursor) == 1;
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
bool sdlGetTextInputArea(
  Pointer<SdlWindow> window,
  Pointer<SdlRect> rect,
  Pointer<Int32> cursor,
) {
  final sdlGetTextInputAreaLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlWindow> window,
          Pointer<SdlRect> rect,
          Pointer<Int32> cursor,
        ),
        int Function(
          Pointer<SdlWindow> window,
          Pointer<SdlRect> rect,
          Pointer<Int32> cursor,
        )
      >('SDL_GetTextInputArea');
  return sdlGetTextInputAreaLookupFunction(window, rect, cursor) == 1;
}

///
/// Check whether the platform has screen keyboard support.
///
/// \returns true if the platform has some screen keyboard support or false if
/// not.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StartTextInput
/// \sa SDL_ScreenKeyboardShown
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasScreenKeyboardSupport(void)
/// ```
/// {@category keyboard}
bool sdlHasScreenKeyboardSupport() {
  final sdlHasScreenKeyboardSupportLookupFunction = _libSdl
      .lookupFunction<Uint8 Function(), int Function()>(
        'SDL_HasScreenKeyboardSupport',
      );
  return sdlHasScreenKeyboardSupportLookupFunction() == 1;
}

///
/// Check whether the screen keyboard is shown for given window.
///
/// \param window the window for which screen keyboard should be queried.
/// \returns true if screen keyboard is shown or false if not.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasScreenKeyboardSupport
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ScreenKeyboardShown(SDL_Window *window)
/// ```
/// {@category keyboard}
bool sdlScreenKeyboardShown(Pointer<SdlWindow> window) {
  final sdlScreenKeyboardShownLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlWindow> window),
        int Function(Pointer<SdlWindow> window)
      >('SDL_ScreenKeyboardShown');
  return sdlScreenKeyboardShownLookupFunction(window) == 1;
}
