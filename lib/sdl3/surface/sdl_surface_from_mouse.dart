part of '../sdl_surface.dart';

extension SdlSurfacePointerFromMouseEx on Pointer<SdlSurface> {
  ///
  /// Create a color cursor.
  ///
  /// If this function is passed a surface with alternate representations added
  /// with SDL_AddSurfaceAlternateImage(), the surface will be interpreted as the
  /// content to be used for 100% display scale, and the alternate
  /// representations will be used for high DPI situations if
  /// SDL_HINT_MOUSE_DPI_SCALE_CURSORS is enabled. For example, if the original
  /// surface is 32x32, then on a 2x macOS display or 200% display scale on
  /// Windows, a 64x64 version of the image will be used, if available. If a
  /// matching version of the image isn't available, the closest larger size
  /// image will be downscaled to the appropriate size and be used instead, if
  /// available. Otherwise, the closest smaller image will be upscaled and be
  /// used instead.
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
  /// \sa SDL_AddSurfaceAlternateImage
  /// \sa SDL_CreateAnimatedCursor
  /// \sa SDL_CreateCursor
  /// \sa SDL_CreateSystemCursor
  /// \sa SDL_DestroyCursor
  /// \sa SDL_SetCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateColorCursor(SDL_Surface *surface, int hot_x, int hot_y)
  /// ```
  ///
  /// See also:
  /// - [SDL_CreateColorCursor - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateColorCursor)
  ///
  /// {@category mouse}
  Pointer<SdlCursor> createColorCursor(int hotX, int hotY) =>
      sdlCreateColorCursor(this, hotX, hotY);
}
