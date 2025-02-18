import 'dart:ffi';
//import '../../generated/const_sdl.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/lib_sdl_mouse.dart';

extension SdlCursorEx on SdlCursor {
  // lib_sdl_mouse.dart

  ///
  /// Create a cursor using the specified bitmap data and mask (in MSB format).
  ///
  /// `mask` has to be in MSB (Most Significant Bit) format.
  ///
  /// The cursor width (`w`) must be a multiple of 8 bits.
  ///
  /// The cursor is created in black and white according to the following:
  ///
  /// - data=0, mask=1: white
  /// - data=1, mask=1: black
  /// - data=0, mask=0: transparent
  /// - data=1, mask=0: inverted color if possible, black if not.
  ///
  /// Cursors created with this function must be freed with SDL_DestroyCursor().
  ///
  /// If you want to have a color cursor, or create your cursor from an
  /// SDL_Surface, you should use SDL_CreateColorCursor(). Alternately, you can
  /// hide the cursor and draw your own as part of your game's rendering, but it
  /// will be bound to the framerate.
  ///
  /// Also, SDL_CreateSystemCursor() is available, which provides several
  /// readily-available system cursors to pick from.
  ///
  /// \param data the color value for each pixel of the cursor.
  /// \param mask the mask value for each pixel of the cursor.
  /// \param w the width of the cursor.
  /// \param h the height of the cursor.
  /// \param hot_x the x-axis offset from the left of the cursor image to the
  /// mouse x position, in the range of 0 to `w` - 1.
  /// \param hot_y the y-axis offset from the top of the cursor image to the
  /// mouse y position, in the range of 0 to `h` - 1.
  /// \returns a new cursor with the specified parameters on success or NULL on
  /// failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateColorCursor
  /// \sa SDL_CreateSystemCursor
  /// \sa SDL_DestroyCursor
  /// \sa SDL_SetCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateCursor(const Uint8 *data, const Uint8 *mask, int w, int h, int hot_x, int hot_y)
  /// ```
  static Pointer<SdlCursor> create(
    Pointer<Uint8> data,
    Pointer<Uint8> mask,
    int w,
    int h,
    int hotX,
    int hotY,
  ) {
    return sdlCreateCursor(data, mask, w, h, hotX, hotY);
  }

  ///
  /// Create a color cursor.
  ///
  /// If this function is passed a surface with alternate representations, the
  /// surface will be interpreted as the content to be used for 100% display
  /// scale, and the alternate representations will be used for high DPI
  /// situations. For example, if the original surface is 32x32, then on a 2x
  /// macOS display or 200% display scale on Windows, a 64x64 version of the
  /// image will be used, if available. If a matching version of the image isn't
  /// available, the closest larger size image will be downscaled to the
  /// appropriate size and be used instead, if available. Otherwise, the closest
  /// smaller image will be upscaled and be used instead.
  ///
  /// \param surface an SDL_Surface structure representing the cursor image.
  /// \param hot_x the x position of the cursor hot spot.
  /// \param hot_y the y position of the cursor hot spot.
  /// \returns the new cursor on success or NULL on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateCursor
  /// \sa SDL_CreateSystemCursor
  /// \sa SDL_DestroyCursor
  /// \sa SDL_SetCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateColorCursor(SDL_Surface *surface, int hot_x, int hot_y)
  /// ```
  static Pointer<SdlCursor> createColor(
    Pointer<SdlSurface> surface,
    int hotX,
    int hotY,
  ) {
    return sdlCreateColorCursor(surface, hotX, hotY);
  }

  ///
  /// Create a system cursor.
  ///
  /// \param id an SDL_SystemCursor enum value.
  /// \returns a cursor on success or NULL on failure; call SDL_GetError() for
  /// more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_DestroyCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateSystemCursor(SDL_SystemCursor id)
  /// ```
  static Pointer<SdlCursor> createSystem(int id) {
    return sdlCreateSystemCursor(id);
  }

  ///
  /// Get the active cursor.
  ///
  /// This function returns a pointer to the current cursor which is owned by the
  /// library. It is not necessary to free the cursor with SDL_DestroyCursor().
  ///
  /// \returns the active cursor or NULL if there is no mouse.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_GetCursor(void)
  /// ```
  static Pointer<SdlCursor> get() {
    return sdlGetCursor();
  }

  ///
  /// Get the default cursor.
  ///
  /// You do not have to call SDL_DestroyCursor() on the return value, but it is
  /// safe to do so.
  ///
  /// \returns the default cursor on success or NULL on failuree; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_GetDefaultCursor(void)
  /// ```
  static Pointer<SdlCursor> getDefault() {
    return sdlGetDefaultCursor();
  }

  ///
  /// Show the cursor.
  ///
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CursorVisible
  /// \sa SDL_HideCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_ShowCursor(void)
  /// ```
  static bool show() {
    return sdlShowCursor();
  }

  ///
  /// Hide the cursor.
  ///
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CursorVisible
  /// \sa SDL_ShowCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_HideCursor(void)
  /// ```
  static bool hide() {
    return sdlHideCursor();
  }
}

extension SdlCursorPointerEx on Pointer<SdlCursor> {
  // lib_sdl_mouse.dart

  ///
  /// Set the active cursor.
  ///
  /// This function sets the currently active cursor to the specified one. If the
  /// cursor is currently visible, the change will be immediately represented on
  /// the display. SDL_SetCursor(NULL) can be used to force cursor redraw, if
  /// this is desired for any reason.
  ///
  /// \param cursor a cursor to make active.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetCursor(SDL_Cursor *cursor)
  /// ```
  bool set() {
    return sdlSetCursor(this);
  }

  ///
  /// Free a previously-created cursor.
  ///
  /// Use this function to free cursor resources created with SDL_CreateCursor(),
  /// SDL_CreateColorCursor() or SDL_CreateSystemCursor().
  ///
  /// \param cursor the cursor to free.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateColorCursor
  /// \sa SDL_CreateCursor
  /// \sa SDL_CreateSystemCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyCursor(SDL_Cursor *cursor)
  /// ```
  void destroy() {
    sdlDestroyCursor(this);
  }
}
