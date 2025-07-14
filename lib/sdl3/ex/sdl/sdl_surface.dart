// ignore_for_file: avoid_positional_boolean_parameters
part of '../../sdl.dart';

extension SdlSurfaceEx on SdlSurface {
  ///
  /// Load a BMP image from a file.
  ///
  /// The new surface should be freed with SDL_DestroySurface(). Not doing so
  /// will result in a memory leak.
  ///
  /// \param file the BMP file to load.
  /// \returns a pointer to a new SDL_Surface structure or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_DestroySurface
  /// \sa SDL_LoadBMP_IO
  /// \sa SDL_SaveBMP
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_LoadBMP(const char *file)
  /// ```
  /// {@category surface}
  static Pointer<SdlSurface> loadBmp(String file) => sdlLoadBmp(file);
}

extension SdlSurfacePointerEx on Pointer<SdlSurface> {
  // lib_sdl_mouse.dart

  ///
  /// Create a color cursor.
  ///
  /// If this function is passed a surface with alternate representations added
  /// with SDL_AddSurfaceAlternateImage(), the surface will be interpreted as the
  /// content to be used for 100% display scale, and the alternate
  /// representations will be used for high DPI situations. For example, if the
  /// original surface is 32x32, then on a 2x macOS display or 200% display scale
  /// on Windows, a 64x64 version of the image will be used, if available. If a
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
  /// \sa SDL_CreateCursor
  /// \sa SDL_CreateSystemCursor
  /// \sa SDL_DestroyCursor
  /// \sa SDL_SetCursor
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Cursor * SDLCALL SDL_CreateColorCursor(SDL_Surface *surface, int hot_x, int hot_y)
  /// ```
  /// {@category mouse}
  Pointer<SdlCursor> createColorCursor(int hotX, int hotY) =>
      sdlCreateColorCursor(this, hotX, hotY);

  // lib_sdl_surface.dart

  // sdlCreateRgbSurface
  // sdlCreateRgbSurfaceWithFormat
  // sdlCreateRgbSurfaceFrom
  // sdlCreateRgbSurfaceWithFormatFrom

  ///
  /// Free a surface.
  ///
  /// It is safe to pass NULL to this function.
  ///
  /// \param surface the SDL_Surface to free.
  ///
  /// \threadsafety No other thread should be using the surface when it is freed.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateSurface
  /// \sa SDL_CreateSurfaceFrom
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroySurface(SDL_Surface *surface)
  /// ```
  /// {@category surface}
  bool destroy() {
    if (this != nullptr) {
      sdlDestroySurface(this);
      return true;
    }
    return false;
  }

  ///
  /// Set the palette used by a surface.
  ///
  /// A single palette can be shared with many surfaces.
  ///
  /// \param surface the SDL_Surface structure to update.
  /// \param palette the SDL_Palette structure to use.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreatePalette
  /// \sa SDL_GetSurfacePalette
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetSurfacePalette(SDL_Surface *surface, SDL_Palette *palette)
  /// ```
  /// {@category surface}
  bool setPalette(Pointer<SdlPalette> palette) =>
      sdlSetSurfacePalette(this, palette);

  ///
  /// Set up a surface for directly accessing the pixels.
  ///
  /// Between calls to SDL_LockSurface() / SDL_UnlockSurface(), you can write to
  /// and read from `surface->pixels`, using the pixel format stored in
  /// `surface->format`. Once you are done accessing the surface, you should use
  /// SDL_UnlockSurface() to release it.
  ///
  /// Not all surfaces require locking. If `SDL_MUSTLOCK(surface)` evaluates to
  /// 0, then you can read and write to the surface at any time, and the pixel
  /// format of the surface will not change.
  ///
  /// \param surface the SDL_Surface structure to be locked.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe. The locking referred to by
  /// this function is making the pixels available for direct
  /// access, not thread-safe locking.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_MUSTLOCK
  /// \sa SDL_UnlockSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_LockSurface(SDL_Surface *surface)
  /// ```
  /// {@category surface}
  bool lock() => sdlLockSurface(this);

  ///
  /// Release a surface after directly accessing the pixels.
  ///
  /// \param surface the SDL_Surface structure to be unlocked.
  ///
  /// \threadsafety This function is not thread safe. The locking referred to by
  /// this function is making the pixels available for direct
  /// access, not thread-safe locking.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_LockSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_UnlockSurface(SDL_Surface *surface)
  /// ```
  /// {@category surface}
  void unlock() {
    sdlUnlockSurface(this);
  }

  ///
  /// Load a BMP image from a seekable SDL data stream.
  ///
  /// The new surface should be freed with SDL_DestroySurface(). Not doing so
  /// will result in a memory leak.
  ///
  /// \param src the data stream for the surface.
  /// \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
  /// in the case of an error.
  /// \returns a pointer to a new SDL_Surface structure or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_DestroySurface
  /// \sa SDL_LoadBMP
  /// \sa SDL_SaveBMP_IO
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_LoadBMP_IO(SDL_IOStream *src, bool closeio)
  /// ```
  /// {@category surface}
  Pointer<SdlSurface> loadBmpIo(Pointer<SdlIoStream> src, bool freesrc) =>
      sdlLoadBmpIo(src, freesrc);

  ///
  /// Save a surface to a seekable SDL data stream in BMP format.
  ///
  /// Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
  /// BMP directly. Other RGB formats with 8-bit or higher get converted to a
  /// 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
  /// surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
  /// not supported.
  ///
  /// \param surface the SDL_Surface structure containing the image to be saved.
  /// \param dst a data stream to save to.
  /// \param closeio if true, calls SDL_CloseIO() on `dst` before returning, even
  /// in the case of an error.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_LoadBMP_IO
  /// \sa SDL_SaveBMP
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SaveBMP_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio)
  /// ```
  /// {@category surface}
  bool saveBmpIo(Pointer<SdlIoStream> dst, bool freedst) =>
      sdlSaveBmpIo(this, dst, freedst);

  ///
  /// Set the RLE acceleration hint for a surface.
  ///
  /// If RLE is enabled, color key and alpha blending blits are much faster, but
  /// the surface must be locked before directly accessing the pixels.
  ///
  /// \param surface the SDL_Surface structure to optimize.
  /// \param enabled true to enable RLE acceleration, false to disable it.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_BlitSurface
  /// \sa SDL_LockSurface
  /// \sa SDL_UnlockSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetSurfaceRLE(SDL_Surface *surface, bool enabled)
  /// ```
  /// {@category surface}
  bool setRre(bool enabled) => sdlSetSurfaceRle(this, enabled);

  ///
  /// Returns whether the surface is RLE enabled.
  ///
  /// It is safe to pass a NULL `surface` here; it will return false.
  ///
  /// \param surface the SDL_Surface structure to query.
  /// \returns true if the surface is RLE enabled, false otherwise.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetSurfaceRLE
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SurfaceHasRLE(SDL_Surface *surface)
  /// ```
  /// {@category surface}
  bool hasRre() => sdlSurfaceHasRle(this);

  ///
  /// Set the color key (transparent pixel) in a surface.
  ///
  /// The color key defines a pixel value that will be treated as transparent in
  /// a blit. For example, one can use this to specify that cyan pixels should be
  /// considered transparent, and therefore not rendered.
  ///
  /// It is a pixel of the format used by the surface, as generated by
  /// SDL_MapRGB().
  ///
  /// \param surface the SDL_Surface structure to update.
  /// \param enabled true to enable color key, false to disable color key.
  /// \param key the transparent pixel.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetSurfaceColorKey
  /// \sa SDL_SetSurfaceRLE
  /// \sa SDL_SurfaceHasColorKey
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetSurfaceColorKey(SDL_Surface *surface, bool enabled, Uint32 key)
  /// ```
  /// {@category surface}
  bool setColorKey(bool enabled, int key) =>
      sdlSetSurfaceColorKey(this, enabled, key);

  ///
  /// Returns whether the surface has a color key.
  ///
  /// It is safe to pass a NULL `surface` here; it will return false.
  ///
  /// \param surface the SDL_Surface structure to query.
  /// \returns true if the surface has a color key, false otherwise.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetSurfaceColorKey
  /// \sa SDL_GetSurfaceColorKey
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SurfaceHasColorKey(SDL_Surface *surface)
  /// ```
  /// {@category surface}
  bool hadColorKey() => sdlSurfaceHasColorKey(this);

  ///
  /// Get the color key (transparent pixel) for a surface.
  ///
  /// The color key is a pixel of the format used by the surface, as generated by
  /// SDL_MapRGB().
  ///
  /// If the surface doesn't have color key enabled this function returns false.
  ///
  /// \param surface the SDL_Surface structure to query.
  /// \param key a pointer filled in with the transparent pixel.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetSurfaceColorKey
  /// \sa SDL_SurfaceHasColorKey
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetSurfaceColorKey(SDL_Surface *surface, Uint32 *key)
  /// ```
  /// {@category surface}
  int? getColorKey() {
    int? result;
    final keyPointer = calloc<Uint32>();
    if (sdlGetSurfaceColorKey(this, keyPointer)) {
      result = keyPointer.value;
    }
    calloc.free(keyPointer);
    return result;
  }

  ///
  /// Set an additional color value multiplied into blit operations.
  ///
  /// When this surface is blitted, during the blit operation each source color
  /// channel is modulated by the appropriate color value according to the
  /// following formula:
  ///
  /// `srcC = srcC * (color / 255)`
  ///
  /// \param surface the SDL_Surface structure to update.
  /// \param r the red color value multiplied into blit operations.
  /// \param g the green color value multiplied into blit operations.
  /// \param b the blue color value multiplied into blit operations.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetSurfaceColorMod
  /// \sa SDL_SetSurfaceAlphaMod
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetSurfaceColorMod(SDL_Surface *surface, Uint8 r, Uint8 g, Uint8 b)
  /// ```
  /// {@category surface}
  bool setColorMod(int r, int g, int b) => sdlSetSurfaceColorMod(this, r, g, b);

  ///
  /// Get the additional color value multiplied into blit operations.
  ///
  /// \param surface the SDL_Surface structure to query.
  /// \param r a pointer filled in with the current red color value.
  /// \param g a pointer filled in with the current green color value.
  /// \param b a pointer filled in with the current blue color value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetSurfaceAlphaMod
  /// \sa SDL_SetSurfaceColorMod
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetSurfaceColorMod(SDL_Surface *surface, Uint8 *r, Uint8 *g, Uint8 *b)
  /// ```
  /// {@category surface}
  int? getColorMod() {
    int? result;
    final rPointer = calloc<Uint8>();
    final gPointer = calloc<Uint8>();
    final bPointer = calloc<Uint8>();
    if (sdlGetSurfaceColorMod(this, rPointer, gPointer, bPointer)) {
      result = 0;
      result += rPointer.value << 16;
      result += gPointer.value << 8;
      result += bPointer.value << 0;
    }
    calloc
      ..free(rPointer)
      ..free(gPointer)
      ..free(bPointer);
    return result;
  }

  ///
  /// Set an additional alpha value used in blit operations.
  ///
  /// When this surface is blitted, during the blit operation the source alpha
  /// value is modulated by this alpha value according to the following formula:
  ///
  /// `srcA = srcA * (alpha / 255)`
  ///
  /// \param surface the SDL_Surface structure to update.
  /// \param alpha the alpha value multiplied into blit operations.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetSurfaceAlphaMod
  /// \sa SDL_SetSurfaceColorMod
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetSurfaceAlphaMod(SDL_Surface *surface, Uint8 alpha)
  /// ```
  /// {@category surface}
  bool setAlphaMod(int alpha) => sdlSetSurfaceAlphaMod(this, alpha);

  ///
  /// Get the additional alpha value used in blit operations.
  ///
  /// \param surface the SDL_Surface structure to query.
  /// \param alpha a pointer filled in with the current alpha value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetSurfaceColorMod
  /// \sa SDL_SetSurfaceAlphaMod
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetSurfaceAlphaMod(SDL_Surface *surface, Uint8 *alpha)
  /// ```
  /// {@category surface}
  int? getAlphaMod() {
    int? result;
    final alphaPointer = calloc<Uint8>();
    if (sdlGetSurfaceAlphaMod(this, alphaPointer)) {
      result = alphaPointer.value;
    }
    calloc.free(alphaPointer);
    return result;
  }

  ///
  /// Set the blend mode used for blit operations.
  ///
  /// To copy a surface to another surface (or texture) without blending with the
  /// existing data, the blendmode of the SOURCE surface should be set to
  /// `SDL_BLENDMODE_NONE`.
  ///
  /// \param surface the SDL_Surface structure to update.
  /// \param blendMode the SDL_BlendMode to use for blit blending.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetSurfaceBlendMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetSurfaceBlendMode(SDL_Surface *surface, SDL_BlendMode blendMode)
  /// ```
  /// {@category surface}
  bool setBlendMode(int blendMode) => sdlSetSurfaceBlendMode(this, blendMode);

  ///
  /// Get the blend mode used for blit operations.
  ///
  /// \param surface the SDL_Surface structure to query.
  /// \param blendMode a pointer filled in with the current SDL_BlendMode.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetSurfaceBlendMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetSurfaceBlendMode(SDL_Surface *surface, SDL_BlendMode *blendMode)
  /// ```
  /// {@category surface}
  int? getBlendMode() {
    int? result;
    final blendModePointer = calloc<Uint32>();
    if (sdlGetSurfaceBlendMode(this, blendModePointer)) {
      result = blendModePointer.value;
    }
    calloc.free(blendModePointer);
    return result;
  }

  ///
  /// Set the clipping rectangle for a surface.
  ///
  /// When `surface` is the destination of a blit, only the area within the clip
  /// rectangle is drawn into.
  ///
  /// Note that blits are automatically clipped to the edges of the source and
  /// destination surfaces.
  ///
  /// \param surface the SDL_Surface structure to be clipped.
  /// \param rect the SDL_Rect structure representing the clipping rectangle, or
  /// NULL to disable clipping.
  /// \returns true if the rectangle intersects the surface, otherwise false and
  /// blits will be completely clipped.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetSurfaceClipRect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetSurfaceClipRect(SDL_Surface *surface, const SDL_Rect *rect)
  /// ```
  /// {@category surface}
  bool setClipRect([math.Rectangle<double>? rect]) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    final result = sdlSetSurfaceClipRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Get the clipping rectangle for a surface.
  ///
  /// When `surface` is the destination of a blit, only the area within the clip
  /// rectangle is drawn into.
  ///
  /// \param surface the SDL_Surface structure representing the surface to be
  /// clipped.
  /// \param rect an SDL_Rect structure filled in with the clipping rectangle for
  /// the surface.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetSurfaceClipRect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetSurfaceClipRect(SDL_Surface *surface, SDL_Rect *rect)
  /// ```
  /// {@category surface}
  math.Rectangle<double> getClipRect() {
    final rectPointer = calloc<SdlRect>();
    sdlGetSurfaceClipRect(this, rectPointer);
    final result = rectPointer.create();
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Creates a new surface identical to the existing surface.
  ///
  /// If the original surface has alternate images, the new surface will have a
  /// reference to them as well.
  ///
  /// The returned surface should be freed with SDL_DestroySurface().
  ///
  /// \param surface the surface to duplicate.
  /// \returns a copy of the surface or NULL on failure; call SDL_GetError() for
  /// more information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_DestroySurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_DuplicateSurface(SDL_Surface *surface)
  /// ```
  /// {@category surface}
  Pointer<SdlSurface> duplicate() => sdlDuplicateSurface(this);

  // sdlConvertPixels
  // sdlPremultiplyAlpha

  ///
  /// Perform a fast fill of a rectangle with a specific color.
  ///
  /// `color` should be a pixel of the format used by the surface, and can be
  /// generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an
  /// alpha component then the destination is simply filled with that alpha
  /// information, no blending takes place.
  ///
  /// If there is a clip rectangle set on the destination (set via
  /// SDL_SetSurfaceClipRect()), then this function will fill based on the
  /// intersection of the clip rectangle and `rect`.
  ///
  /// \param dst the SDL_Surface structure that is the drawing target.
  /// \param rect the SDL_Rect structure representing the rectangle to fill, or
  /// NULL to fill the entire surface.
  /// \param color the color to fill with.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_FillSurfaceRects
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_FillSurfaceRect(SDL_Surface *dst, const SDL_Rect *rect, Uint32 color)
  /// ```
  /// {@category surface}
  bool fillRect(math.Rectangle<double>? rect, int color) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    final result = sdlFillSurfaceRect(this, rectPointer, color);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Perform a fast fill of a set of rectangles with a specific color.
  ///
  /// `color` should be a pixel of the format used by the surface, and can be
  /// generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an
  /// alpha component then the destination is simply filled with that alpha
  /// information, no blending takes place.
  ///
  /// If there is a clip rectangle set on the destination (set via
  /// SDL_SetSurfaceClipRect()), then this function will fill based on the
  /// intersection of the clip rectangle and `rect`.
  ///
  /// \param dst the SDL_Surface structure that is the drawing target.
  /// \param rects an array of SDL_Rects representing the rectangles to fill.
  /// \param count the number of rectangles in the array.
  /// \param color the color to fill with.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_FillSurfaceRect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_FillSurfaceRects(SDL_Surface *dst, const SDL_Rect *rects, int count, Uint32 color)
  /// ```
  /// {@category surface}
  bool fillRects(List<math.Rectangle<double>> rects, int color) {
    final rectsPointer = rects.callocInt();
    final result = sdlFillSurfaceRects(this, rectsPointer, rects.length, color);
    calloc.free(rectsPointer);
    return result;
  }

  ///
  /// Performs a fast blit from the source surface to the destination surface
  /// with clipping.
  ///
  /// If either `srcrect` or `dstrect` are NULL, the entire surface (`src` or
  /// `dst`) is copied while ensuring clipping to `dst->clip_rect`.
  ///
  /// The blit function should not be called on a locked surface.
  ///
  /// The blit semantics for surfaces with and without blending and colorkey are
  /// defined as follows:
  ///
  /// ===
  /// RGBA->RGB:
  /// Source surface blend mode set to SDL_BLENDMODE_BLEND:
  /// alpha-blend (using the source alpha-channel and per-surface alpha)
  /// SDL_SRCCOLORKEY ignored.
  /// Source surface blend mode set to SDL_BLENDMODE_NONE:
  /// copy RGB.
  /// if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
  /// RGB values of the source color key, ignoring alpha in the
  /// comparison.
  ///
  /// RGB->RGBA:
  /// Source surface blend mode set to SDL_BLENDMODE_BLEND:
  /// alpha-blend (using the source per-surface alpha)
  /// Source surface blend mode set to SDL_BLENDMODE_NONE:
  /// copy RGB, set destination alpha to source per-surface alpha value.
  /// both:
  /// if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
  /// source color key.
  ///
  /// RGBA->RGBA:
  /// Source surface blend mode set to SDL_BLENDMODE_BLEND:
  /// alpha-blend (using the source alpha-channel and per-surface alpha)
  /// SDL_SRCCOLORKEY ignored.
  /// Source surface blend mode set to SDL_BLENDMODE_NONE:
  /// copy all of RGBA to the destination.
  /// if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
  /// RGB values of the source color key, ignoring alpha in the
  /// comparison.
  ///
  /// RGB->RGB:
  /// Source surface blend mode set to SDL_BLENDMODE_BLEND:
  /// alpha-blend (using the source per-surface alpha)
  /// Source surface blend mode set to SDL_BLENDMODE_NONE:
  /// copy RGB.
  /// both:
  /// if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
  /// source color key.
  /// ===
  ///
  /// \param src the SDL_Surface structure to be copied from.
  /// \param srcrect the SDL_Rect structure representing the rectangle to be
  /// copied, or NULL to copy the entire surface.
  /// \param dst the SDL_Surface structure that is the blit target.
  /// \param dstrect the SDL_Rect structure representing the x and y position in
  /// the destination surface, or NULL for (0,0). The width and
  /// height are ignored, and are copied from `srcrect`. If you
  /// want a specific width and height, you should use
  /// SDL_BlitSurfaceScaled().
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety Only one thread should be using the `src` and `dst` surfaces
  /// at any given time.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_BlitSurfaceScaled
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_BlitSurface(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect)
  /// ```
  /// {@category surface}
  bool upperBlit(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
  }) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    final result = sdlBlitSurface(this, srcrectPointer, dst, dstrectPointer);
    calloc
      ..free(srcrectPointer)
      ..free(dstrectPointer);
    return result;
  }

  ///
  /// Perform low-level surface blitting only.
  ///
  /// This is a semi-private blit function and it performs low-level surface
  /// blitting, assuming the input rectangles have already been clipped.
  ///
  /// \param src the SDL_Surface structure to be copied from.
  /// \param srcrect the SDL_Rect structure representing the rectangle to be
  /// copied, may not be NULL.
  /// \param dst the SDL_Surface structure that is the blit target.
  /// \param dstrect the SDL_Rect structure representing the target rectangle in
  /// the destination surface, may not be NULL.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety Only one thread should be using the `src` and `dst` surfaces
  /// at any given time.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_BlitSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_BlitSurfaceUnchecked(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect)
  /// ```
  /// {@category surface}
  bool lowerBlit(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
  }) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    final result = sdlBlitSurfaceUnchecked(
      this,
      srcrectPointer,
      dst,
      dstrectPointer,
    );
    calloc
      ..free(srcrectPointer)
      ..free(dstrectPointer);
    return result;
  }

  ///
  /// Perform a scaled blit to a destination surface, which may be of a different
  /// format.
  ///
  /// \param src the SDL_Surface structure to be copied from.
  /// \param srcrect the SDL_Rect structure representing the rectangle to be
  /// copied, or NULL to copy the entire surface.
  /// \param dst the SDL_Surface structure that is the blit target.
  /// \param dstrect the SDL_Rect structure representing the target rectangle in
  /// the destination surface, or NULL to fill the entire
  /// destination surface.
  /// \param scaleMode the SDL_ScaleMode to be used.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety Only one thread should be using the `src` and `dst` surfaces
  /// at any given time.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_BlitSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_BlitSurfaceScaled(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect, SDL_ScaleMode scaleMode)
  /// ```
  /// {@category surface}
  bool upperBlitScaled(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
    int scaleMode = 0,
  }) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    final result = sdlBlitSurfaceScaled(
      this,
      srcrectPointer,
      dst,
      dstrectPointer,
      scaleMode,
    );
    calloc
      ..free(srcrectPointer)
      ..free(dstrectPointer);
    return result;
  }

  ///
  /// Perform low-level surface scaled blitting only.
  ///
  /// This is a semi-private function and it performs low-level surface blitting,
  /// assuming the input rectangles have already been clipped.
  ///
  /// \param src the SDL_Surface structure to be copied from.
  /// \param srcrect the SDL_Rect structure representing the rectangle to be
  /// copied, may not be NULL.
  /// \param dst the SDL_Surface structure that is the blit target.
  /// \param dstrect the SDL_Rect structure representing the target rectangle in
  /// the destination surface, may not be NULL.
  /// \param scaleMode the SDL_ScaleMode to be used.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety Only one thread should be using the `src` and `dst` surfaces
  /// at any given time.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_BlitSurfaceScaled
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_BlitSurfaceUncheckedScaled(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect, SDL_ScaleMode scaleMode)
  /// ```
  /// {@category surface}
  bool lowerBlitScaled(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
    int scaleMode = 0,
  }) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    final result = sdlBlitSurfaceUncheckedScaled(
      this,
      srcrectPointer,
      dst,
      dstrectPointer,
      scaleMode,
    );
    calloc
      ..free(srcrectPointer)
      ..free(dstrectPointer);
    return result;
  }

  // sdlSetYuvConversionMode
  // sdlGetYuvConversionMode
  // sdlGetYuvConversionModeForResolution

  // lib_sdl_ex.dart
  //Pointer<SdlSurface> loadBmp(String file) {
  //  return sdlLoadBmp(file);
  //}

  ///
  /// Save a surface to a file.
  ///
  /// Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
  /// BMP directly. Other RGB formats with 8-bit or higher get converted to a
  /// 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
  /// surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
  /// not supported.
  ///
  /// \param surface the SDL_Surface structure containing the image to be saved.
  /// \param file a file to save to.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function is not thread safe.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_LoadBMP
  /// \sa SDL_SaveBMP_IO
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SaveBMP(SDL_Surface *surface, const char *file)
  /// ```
  /// {@category surface}
  bool saveBmp(String file) => sdlSaveBmp(this, file);

  bool blit(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
  }) => upperBlit(dst, srcrect: srcrect, dstrect: dstrect);

  bool blitScaled(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
  }) => upperBlitScaled(dst, srcrect: srcrect, dstrect: dstrect);
}
