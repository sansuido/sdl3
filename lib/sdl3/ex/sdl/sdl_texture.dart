part of '../../sdl.dart';

extension SdlTexturePointerEx on Pointer<SdlTexture> {
  // lib_sdl_renderer.dart

  ///
  /// Get the size of a texture, as floating point values.
  ///
  /// \param texture the texture to query.
  /// \param w a pointer filled in with the width of the texture in pixels. This
  /// argument can be NULL if you don't need this information.
  /// \param h a pointer filled in with the height of the texture in pixels. This
  /// argument can be NULL if you don't need this information.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextureSize(SDL_Texture *texture, float *w, float *h)
  /// ```
  /// {@category render}
  math.Point<double>? getSize() {
    math.Point<double>? result;
    final wPointer = calloc<Float>();
    final hPointer = calloc<Float>();
    if (sdlGetTextureSize(this, wPointer, hPointer)) {
      result = math.Point(wPointer.value, hPointer.value);
    }
    calloc
      ..free(wPointer)
      ..free(hPointer);
    return result;
  }

  ///
  /// Set an additional color value multiplied into render copy operations.
  ///
  /// When this texture is rendered, during the copy operation each source color
  /// channel is modulated by the appropriate color value according to the
  /// following formula:
  ///
  /// `srcC = srcC * (color / 255)`
  ///
  /// Color modulation is not always supported by the renderer; it will return
  /// false if color modulation is not supported.
  ///
  /// \param texture the texture to update.
  /// \param r the red color value multiplied into copy operations.
  /// \param g the green color value multiplied into copy operations.
  /// \param b the blue color value multiplied into copy operations.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTextureColorMod
  /// \sa SDL_SetTextureAlphaMod
  /// \sa SDL_SetTextureColorModFloat
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetTextureColorMod(SDL_Texture *texture, Uint8 r, Uint8 g, Uint8 b)
  /// ```
  /// {@category render}
  bool setColorMod(int r, int g, int b) => sdlSetTextureColorMod(this, r, g, b);

  ///
  /// Get the additional color value multiplied into render copy operations.
  ///
  /// \param texture the texture to query.
  /// \param r a pointer filled in with the current red color value.
  /// \param g a pointer filled in with the current green color value.
  /// \param b a pointer filled in with the current blue color value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTextureAlphaMod
  /// \sa SDL_GetTextureColorModFloat
  /// \sa SDL_SetTextureColorMod
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextureColorMod(SDL_Texture *texture, Uint8 *r, Uint8 *g, Uint8 *b)
  /// ```
  /// {@category render}
  int? getColorMod() {
    int? result;
    final rPointer = calloc<Uint8>();
    final gPointer = calloc<Uint8>();
    final bPointer = calloc<Uint8>();
    if (sdlGetTextureColorMod(this, rPointer, gPointer, bPointer)) {
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
  /// Set an additional alpha value multiplied into render copy operations.
  ///
  /// When this texture is rendered, during the copy operation the source alpha
  /// value is modulated by this alpha value according to the following formula:
  ///
  /// `srcA = srcA * (alpha / 255)`
  ///
  /// Alpha modulation is not always supported by the renderer; it will return
  /// false if alpha modulation is not supported.
  ///
  /// \param texture the texture to update.
  /// \param alpha the source alpha value multiplied into copy operations.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTextureAlphaMod
  /// \sa SDL_SetTextureAlphaModFloat
  /// \sa SDL_SetTextureColorMod
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetTextureAlphaMod(SDL_Texture *texture, Uint8 alpha)
  /// ```
  /// {@category render}
  bool setAlphaMod(int alpha) => sdlSetTextureAlphaMod(this, alpha);

  ///
  /// Set an additional alpha value multiplied into render copy operations.
  ///
  /// When this texture is rendered, during the copy operation the source alpha
  /// value is modulated by this alpha value according to the following formula:
  ///
  /// `srcA = srcA * (alpha / 255)`
  ///
  /// Alpha modulation is not always supported by the renderer; it will return
  /// false if alpha modulation is not supported.
  ///
  /// \param texture the texture to update.
  /// \param alpha the source alpha value multiplied into copy operations.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTextureAlphaMod
  /// \sa SDL_SetTextureAlphaModFloat
  /// \sa SDL_SetTextureColorMod
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetTextureAlphaMod(SDL_Texture *texture, Uint8 alpha)
  /// ```
  /// {@category render}
  bool setAlphaModFloat(double alpha) =>
      sdlSetTextureAlphaModFloat(this, alpha);

  ///
  /// Get the additional alpha value multiplied into render copy operations.
  ///
  /// \param texture the texture to query.
  /// \param alpha a pointer filled in with the current alpha value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTextureAlphaModFloat
  /// \sa SDL_GetTextureColorMod
  /// \sa SDL_SetTextureAlphaMod
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextureAlphaMod(SDL_Texture *texture, Uint8 *alpha)
  /// ```
  /// {@category render}
  int? getAlphaMod() {
    int? result;
    final alphaPointer = calloc<Uint8>();
    if (sdlGetTextureAlphaMod(this, alphaPointer)) {
      result = alphaPointer.value;
    }
    calloc.free(alphaPointer);
    return result;
  }

  ///
  /// Get the additional alpha value multiplied into render copy operations.
  ///
  /// \param texture the texture to query.
  /// \param alpha a pointer filled in with the current alpha value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTextureAlphaMod
  /// \sa SDL_GetTextureColorModFloat
  /// \sa SDL_SetTextureAlphaModFloat
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextureAlphaModFloat(SDL_Texture *texture, float *alpha)
  /// ```
  /// {@category render}
  double? getAlphaModFloat() {
    double? result;
    final alphaPointer = calloc<Float>();
    if (sdlGetTextureAlphaModFloat(this, alphaPointer)) {
      result = alphaPointer.value;
    }
    calloc.free(alphaPointer);
    return result;
  }

  ///
  /// Set the blend mode for a texture, used by SDL_RenderTexture().
  ///
  /// If the blend mode is not supported, the closest supported mode is chosen
  /// and this function returns false.
  ///
  /// \param texture the texture to update.
  /// \param blendMode the SDL_BlendMode to use for texture blending.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTextureBlendMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetTextureBlendMode(SDL_Texture *texture, SDL_BlendMode blendMode)
  /// ```
  /// {@category render}
  bool setBlendMode(int blendMode) => sdlSetTextureBlendMode(this, blendMode);

  ///
  /// Get the blend mode used for texture copy operations.
  ///
  /// \param texture the texture to query.
  /// \param blendMode a pointer filled in with the current SDL_BlendMode.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetTextureBlendMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextureBlendMode(SDL_Texture *texture, SDL_BlendMode *blendMode)
  /// ```
  /// {@category render}
  int? getBlendMode() {
    int? result;
    final blendModePointer = calloc<Uint32>();
    if (sdlGetTextureBlendMode(this, blendModePointer)) {
      result = blendModePointer.value;
    }
    calloc.free(blendModePointer);
    return result;
  }

  ///
  /// Set the scale mode used for texture scale operations.
  ///
  /// The default texture scale mode is SDL_SCALEMODE_LINEAR.
  ///
  /// If the scale mode is not supported, the closest supported mode is chosen.
  ///
  /// \param texture the texture to update.
  /// \param scaleMode the SDL_ScaleMode to use for texture scaling.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_GetTextureScaleMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetTextureScaleMode(SDL_Texture *texture, SDL_ScaleMode scaleMode)
  /// ```
  /// {@category render}
  bool setScaleMode(int scaleMode) => sdlSetTextureScaleMode(this, scaleMode);

  ///
  /// Get the scale mode used for texture scale operations.
  ///
  /// \param texture the texture to query.
  /// \param scaleMode a pointer filled in with the current scale mode.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_SetTextureScaleMode
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextureScaleMode(SDL_Texture *texture, SDL_ScaleMode *scaleMode)
  /// ```
  /// {@category render}
  int? getScaleMode() {
    int? result;
    final scaleModePointer = calloc<Int32>();
    if (sdlGetTextureScaleMode(this, scaleModePointer)) {
      result = scaleModePointer.value;
    }
    calloc.free(scaleModePointer);
    return result;
  }

  ///
  /// Update the given texture rectangle with new pixel data.
  ///
  /// The pixel data must be in the pixel format of the texture, which can be
  /// queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
  ///
  /// This is a fairly slow function, intended for use with static textures that
  /// do not change often.
  ///
  /// If the texture is intended to be updated often, it is preferred to create
  /// the texture as streaming and use the locking functions referenced below.
  /// While this function will work with streaming textures, for optimization
  /// reasons you may not get the pixels back if you lock the texture afterward.
  ///
  /// \param texture the texture to update.
  /// \param rect an SDL_Rect structure representing the area to update, or NULL
  /// to update the entire texture.
  /// \param pixels the raw pixel data in the format of the texture.
  /// \param pitch the number of bytes in a row of pixel data, including padding
  /// between lines.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_LockTexture
  /// \sa SDL_UnlockTexture
  /// \sa SDL_UpdateNVTexture
  /// \sa SDL_UpdateYUVTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateTexture(SDL_Texture *texture, const SDL_Rect *rect, const void *pixels, int pitch)
  /// ```
  /// {@category render}
  bool update(Pointer<SdlRect> rect, Pointer<NativeType> pixels, int pitch) =>
      sdlUpdateTexture(this, rect, pixels, pitch);

  ///
  /// Update a rectangle within a planar YV12 or IYUV texture with new pixel
  /// data.
  ///
  /// You can use SDL_UpdateTexture() as long as your pixel data is a contiguous
  /// block of Y and U/V planes in the proper order, but this function is
  /// available if your pixel data is not contiguous.
  ///
  /// \param texture the texture to update.
  /// \param rect a pointer to the rectangle of pixels to update, or NULL to
  /// update the entire texture.
  /// \param Yplane the raw pixel data for the Y plane.
  /// \param Ypitch the number of bytes between rows of pixel data for the Y
  /// plane.
  /// \param Uplane the raw pixel data for the U plane.
  /// \param Upitch the number of bytes between rows of pixel data for the U
  /// plane.
  /// \param Vplane the raw pixel data for the V plane.
  /// \param Vpitch the number of bytes between rows of pixel data for the V
  /// plane.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_UpdateNVTexture
  /// \sa SDL_UpdateTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateYUVTexture(SDL_Texture *texture, const SDL_Rect *rect, const Uint8 *Yplane, int Ypitch, const Uint8 *Uplane, int Upitch, const Uint8 *Vplane, int Vpitch)
  /// ```
  /// {@category render}
  bool updateYuv(
    Pointer<SdlRect> rect,
    Pointer<Uint8> yplane,
    int ypitch,
    Pointer<Uint8> uplane,
    int upitch,
    Pointer<Uint8> vplane,
    int vpitch,
  ) => sdlUpdateYuvTexture(
    this,
    rect,
    yplane,
    ypitch,
    uplane,
    upitch,
    vplane,
    vpitch,
  );

  ///
  /// Update a rectangle within a planar NV12 or NV21 texture with new pixels.
  ///
  /// You can use SDL_UpdateTexture() as long as your pixel data is a contiguous
  /// block of NV12/21 planes in the proper order, but this function is available
  /// if your pixel data is not contiguous.
  ///
  /// \param texture the texture to update.
  /// \param rect a pointer to the rectangle of pixels to update, or NULL to
  /// update the entire texture.
  /// \param Yplane the raw pixel data for the Y plane.
  /// \param Ypitch the number of bytes between rows of pixel data for the Y
  /// plane.
  /// \param UVplane the raw pixel data for the UV plane.
  /// \param UVpitch the number of bytes between rows of pixel data for the UV
  /// plane.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_UpdateTexture
  /// \sa SDL_UpdateYUVTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateNVTexture(SDL_Texture *texture, const SDL_Rect *rect, const Uint8 *Yplane, int Ypitch, const Uint8 *UVplane, int UVpitch)
  /// ```
  /// {@category render}
  bool updateNv(
    Pointer<SdlRect> rect,
    Pointer<Uint8> yplane,
    int ypitch,
    Pointer<Uint8> uVplane,
    int uVpitch,
  ) => sdlUpdateNvTexture(this, rect, yplane, ypitch, uVplane, uVpitch);

  ///
  /// Lock a portion of the texture for **write-only** pixel access.
  ///
  /// As an optimization, the pixels made available for editing don't necessarily
  /// contain the old texture data. This is a write-only operation, and if you
  /// need to keep a copy of the texture data you should do that at the
  /// application level.
  ///
  /// You must use SDL_UnlockTexture() to unlock the pixels and apply any
  /// changes.
  ///
  /// \param texture the texture to lock for access, which was created with
  /// `SDL_TEXTUREACCESS_STREAMING`.
  /// \param rect an SDL_Rect structure representing the area to lock for access;
  /// NULL to lock the entire texture.
  /// \param pixels this is filled in with a pointer to the locked pixels,
  /// appropriately offset by the locked area.
  /// \param pitch this is filled in with the pitch of the locked pixels; the
  /// pitch is the length of one row in bytes.
  /// \returns true on success or false if the texture is not valid or was not
  /// created with `SDL_TEXTUREACCESS_STREAMING`; call SDL_GetError()
  /// for more information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_LockTextureToSurface
  /// \sa SDL_UnlockTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_LockTexture(SDL_Texture *texture, const SDL_Rect *rect, void **pixels, int *pitch)
  /// ```
  /// {@category render}
  bool lock(
    Pointer<SdlRect> rect,
    Pointer<Pointer<NativeType>> pixels,
    Pointer<Int32> pitch,
  ) => sdlLockTexture(this, rect, pixels, pitch);

  ///
  /// Lock a portion of the texture for **write-only** pixel access, and expose
  /// it as a SDL surface.
  ///
  /// Besides providing an SDL_Surface instead of raw pixel data, this function
  /// operates like SDL_LockTexture.
  ///
  /// As an optimization, the pixels made available for editing don't necessarily
  /// contain the old texture data. This is a write-only operation, and if you
  /// need to keep a copy of the texture data you should do that at the
  /// application level.
  ///
  /// You must use SDL_UnlockTexture() to unlock the pixels and apply any
  /// changes.
  ///
  /// The returned surface is freed internally after calling SDL_UnlockTexture()
  /// or SDL_DestroyTexture(). The caller should not free it.
  ///
  /// \param texture the texture to lock for access, which must be created with
  /// `SDL_TEXTUREACCESS_STREAMING`.
  /// \param rect a pointer to the rectangle to lock for access. If the rect is
  /// NULL, the entire texture will be locked.
  /// \param surface a pointer to an SDL surface of size **rect**. Don't assume
  /// any specific pixel content.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_LockTexture
  /// \sa SDL_UnlockTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_LockTextureToSurface(SDL_Texture *texture, const SDL_Rect *rect, SDL_Surface **surface)
  /// ```
  /// {@category render}
  bool lockToSurface(
    Pointer<SdlRect> rect,
    Pointer<Pointer<SdlSurface>> surface,
  ) => sdlLockTextureToSurface(this, rect, surface);

  ///
  /// Unlock a texture, uploading the changes to video memory, if needed.
  ///
  /// **Warning**: Please note that SDL_LockTexture() is intended to be
  /// write-only; it will not guarantee the previous contents of the texture will
  /// be provided. You must fully initialize any area of a texture that you lock
  /// before unlocking it, as the pixels might otherwise be uninitialized memory.
  ///
  /// Which is to say: locking and immediately unlocking a texture can result in
  /// corrupted textures, depending on the renderer in use.
  ///
  /// \param texture a texture locked by SDL_LockTexture().
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_LockTexture
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_UnlockTexture(SDL_Texture *texture)
  /// ```
  /// {@category render}
  void unlock() {
    sdlUnlockTexture(this);
  }

  ///
  /// Destroy the specified texture.
  ///
  /// Passing NULL or an otherwise invalid texture will set the SDL error message
  /// to "Invalid texture".
  ///
  /// \param texture the texture to destroy.
  ///
  /// \threadsafety This function should only be called on the main thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CreateTexture
  /// \sa SDL_CreateTextureFromSurface
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyTexture(SDL_Texture *texture)
  /// ```
  /// {@category render}
  bool destroy() {
    if (this != nullptr) {
      sdlDestroyTexture(this);
      return true;
    }
    return false;
  }
}
