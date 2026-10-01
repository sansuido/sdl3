part of '../sdl_video.dart';

extension SdlWindowPointerFromKeyboardEx on Pointer<SdlWindow> {
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
  ///
  /// See also:
  /// - [SDL_StartTextInput - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_StartTextInput)
  ///
  /// {@category keyboard}
  bool startTextInput() => sdlStartTextInput(this);

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
  /// - `SDL_PROP_TEXTINPUT_TITLE_STRING` - a title for the top of the on-screen
  /// keyboard window, if it has one.
  /// - `SDL_PROP_TEXTINPUT_PLACEHOLDER_STRING` - the placeholder shown before
  /// the user starts typing, when the field is empty.
  /// - `SDL_PROP_TEXTINPUT_DEFAULT_TEXT_STRING` - text to prefill the text field
  /// with.
  /// - `SDL_PROP_TEXTINPUT_MAX_LENGTH_NUMBER` - maximum length for the text
  /// field, in characters (not bytes).
  ///
  /// On Android you can directly specify the input type:
  ///
  /// - `SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER` - the text input type to
  /// use, overriding other properties. This is documented at
  /// https://developer.android.com/reference/android/text/InputType
  ///
  /// On HarmonyOS/OpenHarmony you can directly specify the input type:
  ///
  /// - `SDL_PROP_TEXTINPUT_OPENHARMONY_INPUTTYPE_NUMBER` - the text input type
  /// to use, overriding other properties. This is documented at
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
  ///
  /// See also:
  /// - [SDL_StartTextInputWithProperties - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_StartTextInputWithProperties)
  ///
  /// {@category keyboard}
  bool startTextInputWithProperties(int props) =>
      sdlStartTextInputWithProperties(this, props);

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
  ///
  /// See also:
  /// - [SDL_TextInputActive - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_TextInputActive)
  ///
  /// {@category keyboard}
  bool textInputActive() => sdlTextInputActive(this);

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
  ///
  /// See also:
  /// - [SDL_StopTextInput - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_StopTextInput)
  ///
  /// {@category keyboard}
  bool stopTextInput() => sdlStopTextInput(this);

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
  ///
  /// See also:
  /// - [SDL_ClearComposition - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ClearComposition)
  ///
  /// {@category keyboard}
  bool clearComposition() => sdlClearComposition(this);

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
  ///
  /// See also:
  /// - [SDL_SetTextInputArea - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetTextInputArea)
  ///
  /// {@category keyboard}
  bool setTextInputArea(SdlxRect rect, int cursor) =>
      sdlxSetTextInputArea(this, rect, cursor);

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
  ///
  /// See also:
  /// - [SDL_GetTextInputArea - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetTextInputArea)
  ///
  /// {@category keyboard}
  ({int cursor, SdlxRect rect})? getTextInputArea() =>
      sdlxGetTextInputArea(this);

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
  ///
  /// See also:
  /// - [SDL_ScreenKeyboardShown - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ScreenKeyboardShown)
  ///
  /// {@category keyboard}
  bool screenKeyboardShown() => sdlScreenKeyboardShown(this);
}
