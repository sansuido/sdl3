part of '../../sdl.dart';

///
/// Get the output size in pixels of a rendering context.
///
/// This returns the true output size in pixels, ignoring any render targets or
/// logical size and presentation.
///
/// For the output size of the current rendering target, with logical size
/// adjustments, use SDL_GetCurrentRenderOutputSize() instead.
///
/// \param renderer the rendering context.
/// \param w a pointer filled in with the width in pixels.
/// \param h a pointer filled in with the height in pixels.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetCurrentRenderOutputSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderOutputSize(SDL_Renderer *renderer, int *w, int *h)
/// ```
/// {@category render}
bool sdlxGetRenderOutputSize(Pointer<SdlRenderer> renderer, SdlxPoint size) {
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final result = sdlGetRenderOutputSize(renderer, wPointer, hPointer);
  size
    ..x = wPointer.value
    ..y = hPointer.value;
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}

///
/// Get the current output size in pixels of a rendering context.
///
/// If a rendering target is active, this will return the size of the rendering
/// target in pixels, otherwise return the value of SDL_GetRenderOutputSize().
///
/// Rendering target or not, the output will be adjusted by the current logical
/// presentation state, dictated by SDL_SetRenderLogicalPresentation().
///
/// \param renderer the rendering context.
/// \param w a pointer filled in with the current width.
/// \param h a pointer filled in with the current height.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRenderOutputSize
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetCurrentRenderOutputSize(SDL_Renderer *renderer, int *w, int *h)
/// ```
/// {@category render}
bool sdlxGetCurrentRenderOutputSize(
  Pointer<SdlRenderer> renderer,
  SdlxPoint size,
) {
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final result = sdlGetCurrentRenderOutputSize(renderer, wPointer, hPointer);
  size
    ..x = wPointer.value
    ..y = hPointer.value;
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}

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
bool sdlxGetTextureSize(Pointer<SdlTexture> texture, SdlxFPoint size) {
  final wPointer = ffi.calloc<Float>();
  final hPointer = ffi.calloc<Float>();
  final result = sdlGetTextureSize(texture, wPointer, hPointer);
  size
    ..x = wPointer.value
    ..y = hPointer.value;
  wPointer.callocFree();
  hPointer.callocFree();
  return result;
}

///
/// Set the palette used by a texture.
///
/// Setting the palette keeps an internal reference to the palette, which can
/// be safely destroyed afterwards.
///
/// A single palette can be shared with many textures.
///
/// \param texture the texture to update.
/// \param palette the SDL_Palette structure to use.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_CreatePalette
/// \sa SDL_GetTexturePalette
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetTexturePalette(SDL_Texture *texture, SDL_Palette *palette)
/// ```
/// {@category render}
bool sdlxSetTexturePalette(Pointer<SdlTexture> texture, SdlxPalette palette) {
  final palettePointer = palette.calloc();
  final result = sdlSetTexturePalette(texture, palettePointer);
  palettePointer.callocAllFree();
  return result;
}

///
/// Get the palette used by a texture.
///
/// \param texture the texture to query.
/// \returns a pointer to the palette used by the texture, or NULL if there is
/// no palette used.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_SetTexturePalette
///
/// ```c
/// extern SDL_DECLSPEC SDL_Palette * SDLCALL SDL_GetTexturePalette(SDL_Texture *texture)
/// ```
/// {@category render}
SdlxPalette? sdlxGetTexturePalette(Pointer<SdlTexture> texture) {
  SdlxPalette? result;
  final palettePointer = sdlGetTexturePalette(texture);
  if (palettePointer != nullptr) {
    result = SdlxPalette()..loadFromPointer(palettePointer);
    sdlDestroyPalette(palettePointer);
  }
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
bool sdlxSetTextureColorMod(Pointer<SdlTexture> texture, SdlxColor color) {
  var result = sdlSetTextureColorMod(texture, color.r, color.g, color.b);
  if (result) {
    result = sdlSetTextureAlphaMod(texture, color.a);
  }
  return result;
}

///
/// Set an additional color value multiplied into render copy operations.
///
/// When this texture is rendered, during the copy operation each source color
/// channel is modulated by the appropriate color value according to the
/// following formula:
///
/// `srcC = srcC * color`
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
/// \sa SDL_GetTextureColorModFloat
/// \sa SDL_SetTextureAlphaModFloat
/// \sa SDL_SetTextureColorMod
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetTextureColorModFloat(SDL_Texture *texture, float r, float g, float b)
/// ```
/// {@category render}
bool sdlxSetTextureColorModFloat(
  Pointer<SdlTexture> texture,
  SdlxFColor color,
) {
  var result = sdlSetTextureColorModFloat(texture, color.r, color.g, color.b);
  if (result) {
    result = sdlSetTextureAlphaModFloat(texture, color.a);
  }
  return result;
}

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
bool sdlxGetTextureColorMod(Pointer<SdlTexture> texture, SdlxColor color) {
  final rPointer = ffi.calloc<Uint8>();
  final gPointer = ffi.calloc<Uint8>();
  final bPointer = ffi.calloc<Uint8>();
  final aPointer = ffi.calloc<Uint8>();
  var result = sdlGetTextureColorMod(texture, rPointer, gPointer, bPointer);
  if (result) {
    color
      ..r = rPointer.value
      ..g = gPointer.value
      ..b = bPointer.value;
    result = sdlGetTextureAlphaMod(texture, aPointer);
    if (result) {
      color.a = aPointer.value;
    }
  }
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  aPointer.callocFree();
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
/// \sa SDL_GetTextureAlphaModFloat
/// \sa SDL_GetTextureColorMod
/// \sa SDL_SetTextureAlphaMod
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextureAlphaMod(SDL_Texture *texture, Uint8 *alpha)
/// ```
/// {@category render}
int? sdlxGetTextureAlphaMod(Pointer<SdlTexture> texture) {
  int? result;
  final alphaPointer = calloc<Uint8>();
  final bl = sdlGetTextureAlphaMod(texture, alphaPointer);
  if (bl) {
    result = alphaPointer.value;
  }
  alphaPointer.callocFree();
  return result;
}

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
/// \sa SDL_GetTextureAlphaModFloat
/// \sa SDL_GetTextureColorMod
/// \sa SDL_SetTextureColorModFloat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetTextureColorModFloat(SDL_Texture *texture, float *r, float *g, float *b)
/// ```
/// {@category render}
bool sdlxGetTextureColorModFloat(
  Pointer<SdlTexture> texture,
  SdlxFColor color,
) {
  final rPointer = ffi.calloc<Float>();
  final gPointer = ffi.calloc<Float>();
  final bPointer = ffi.calloc<Float>();
  final aPointer = ffi.calloc<Float>();
  var result = sdlGetTextureColorModFloat(
    texture,
    rPointer,
    gPointer,
    bPointer,
  );
  if (result) {
    color
      ..r = rPointer.value
      ..g = gPointer.value
      ..b = bPointer.value;
    result = sdlGetTextureAlphaModFloat(texture, aPointer);
    if (result) {
      color.a = aPointer.value;
    }
  }
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  aPointer.callocFree();
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
double? sdlxGetTextureAlphaModFloat(Pointer<SdlTexture> texture) {
  double? result;
  final alphaPointer = calloc<Float>();
  final bl = sdlGetTextureAlphaModFloat(texture, alphaPointer);
  if (bl) {
    result = alphaPointer.value;
  }
  alphaPointer.callocFree();
  return result;
}

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
int? sdlxGetTextureBlendMode(Pointer<SdlTexture> texture) {
  int? result;
  final blendModePointer = calloc<Uint32>();
  final bl = sdlGetTextureBlendMode(texture, blendModePointer);
  if (bl) {
    result = blendModePointer.value;
  }
  blendModePointer.callocFree();
  return result;
}

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
int? sdlxGetTextureScaleMode(Pointer<SdlTexture> texture) {
  int? result;
  final scaleModePointer = calloc<Int32>();
  final bl = sdlGetTextureScaleMode(texture, scaleModePointer);
  if (bl) {
    result = scaleModePointer.value;
  }
  scaleModePointer.callocFree();
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
bool sdlxUpdateTexture(
  Pointer<SdlTexture> texture,
  Pointer<NativeType> pixels,
  int pitch, {
  SdlxRect? rect,
}) {
  Pointer<SdlRect> rectPointer = nullptr;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlUpdateTexture(texture, rectPointer, pixels, pitch);
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  return result;
}

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
bool sdlxUpdateYuvTexture(
  Pointer<SdlTexture> texture, {
  SdlxRect? rect,
  List<int>? yplane,
  List<int>? uplane,
  List<int>? vplane,
}) {
  Pointer<SdlRect> rectPointer = nullptr;
  Pointer<Uint8> yplanePointer = nullptr;
  var yplanePitch = 0;
  Pointer<Uint8> uplanePointer = nullptr;
  var uplanePitch = 0;
  Pointer<Uint8> vplanePointer = nullptr;
  var vplanePitch = 0;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  if (yplane != null) {
    yplanePointer = calloc<Uint8>(yplane.length);
    for (var i = 0; i < yplane.length; i++) {
      yplanePointer[i] = yplane[i];
    }
    yplanePitch = yplane.length;
  }
  if (uplane != null) {
    uplanePointer = calloc<Uint8>(uplane.length);
    for (var i = 0; i < uplane.length; i++) {
      uplanePointer[i] = uplane[i];
    }
    uplanePitch = uplane.length;
  }
  if (vplane != null) {
    vplanePointer = calloc<Uint8>(vplane.length);
    for (var i = 0; i < vplane.length; i++) {
      vplanePointer[i] = vplane[i];
    }
    vplanePitch = vplane.length;
  }
  final result = sdlUpdateYuvTexture(
    texture,
    rectPointer,
    yplanePointer,
    yplanePitch,
    uplanePointer,
    uplanePitch,
    vplanePointer,
    vplanePitch,
  );
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  if (yplanePointer != nullptr) {
    yplanePointer.callocFree();
  }
  if (uplanePointer != nullptr) {
    uplanePointer.callocFree();
  }
  if (vplanePointer != nullptr) {
    vplanePointer.callocFree();
  }
  return result;
}

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
bool sdlxUpdateNvTexture(
  Pointer<SdlTexture> texture, {
  SdlxRect? rect,
  List<int>? yplane,
  List<int>? uVplane,
}) {
  Pointer<SdlRect> rectPointer = nullptr;
  Pointer<Uint8> yplanePointer = nullptr;
  var yplanePitch = 0;
  Pointer<Uint8> uVplanePointer = nullptr;
  var uVplanePitch = 0;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  if (yplane != null) {
    yplanePointer = calloc<Uint8>(yplane.length);
    for (var i = 0; i < yplane.length; i++) {
      yplanePointer[i] = yplane[i];
    }
    yplanePitch = yplane.length;
  }
  if (uVplane != null) {
    uVplanePointer = calloc<Uint8>(uVplane.length);
    for (var i = 0; i < uVplane.length; i++) {
      uVplanePointer[i] = uVplane[i];
    }
    uVplanePitch = uVplane.length;
  }
  final result = sdlUpdateNvTexture(
    texture,
    rectPointer,
    yplanePointer,
    yplanePitch,
    uVplanePointer,
    uVplanePitch,
  );
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  if (yplanePointer != nullptr) {
    yplanePointer.callocFree();
  }
  if (uVplanePointer != nullptr) {
    uVplanePointer.callocFree();
  }
  return result;
}

///
/// Set a device-independent resolution and presentation mode for rendering.
///
/// This function sets the width and height of the logical rendering output.
/// The renderer will act as if the current render target is always the
/// requested dimensions, scaling to the actual resolution as necessary.
///
/// This can be useful for games that expect a fixed size, but would like to
/// scale the output to whatever is available, regardless of how a user resizes
/// a window, or if the display is high DPI.
///
/// Logical presentation can be used with both render target textures and the
/// renderer's window; the state is unique to each render target, and this
/// function sets the state for the current render target. It might be useful
/// to draw to a texture that matches the window dimensions with logical
/// presentation enabled, and then draw that texture across the entire window
/// with logical presentation disabled. Be careful not to render both with
/// logical presentation enabled, however, as this could produce
/// double-letterboxing, etc.
///
/// You can disable logical coordinates by setting the mode to
/// SDL_LOGICAL_PRESENTATION_DISABLED, and in that case you get the full pixel
/// resolution of the render target; it is safe to toggle logical presentation
/// during the rendering of a frame: perhaps most of the rendering is done to
/// specific dimensions but to make fonts look sharp, the app turns off logical
/// presentation while drawing text, for example.
///
/// You can convert coordinates in an event into rendering coordinates using
/// SDL_ConvertEventToRenderCoordinates().
///
/// \param renderer the rendering context.
/// \param w the width of the logical resolution.
/// \param h the height of the logical resolution.
/// \param mode the presentation mode used.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ConvertEventToRenderCoordinates
/// \sa SDL_GetRenderLogicalPresentation
/// \sa SDL_GetRenderLogicalPresentationRect
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderLogicalPresentation(SDL_Renderer *renderer, int w, int h, SDL_RendererLogicalPresentation mode)
/// ```
/// {@category render}
bool sdlxSetRenderLogicalPresentation(
  Pointer<SdlRenderer> renderer,
  SdlxRenderLogicalPresentationInfo info,
) => sdlSetRenderLogicalPresentation(renderer, info.w, info.h, info.mode);

///
/// Get device independent resolution and presentation mode for rendering.
///
/// This function gets the width and height of the logical rendering output, or
/// 0 if a logical resolution is not enabled.
///
/// Each render target has its own logical presentation state. This function
/// gets the state for the current render target.
///
/// \param renderer the rendering context.
/// \param w an int filled with the logical presentation width.
/// \param h an int filled with the logical presentation height.
/// \param mode a variable filled with the logical presentation mode being
/// used.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetRenderLogicalPresentation
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderLogicalPresentation(SDL_Renderer *renderer, int *w, int *h, SDL_RendererLogicalPresentation *mode)
/// ```
/// {@category render}
bool sdlxGetRenderLogicalPresentation(
  Pointer<SdlRenderer> renderer,
  SdlxRenderLogicalPresentationInfo info,
) {
  final wPointer = calloc<Int32>();
  final hPointer = calloc<Int32>();
  final modePointer = calloc<Int32>();
  final rectPointer = calloc<SdlFRect>();
  var result = sdlGetRenderLogicalPresentation(
    renderer,
    wPointer,
    hPointer,
    modePointer,
  );
  if (result) {
    info
      ..w = wPointer.value
      ..h = hPointer.value
      ..mode = modePointer.value;
    result = sdlGetRenderLogicalPresentationRect(renderer, rectPointer);
    if (result) {
      info.rect.loadFromPointer(rectPointer);
    }
  }
  wPointer.callocFree();
  hPointer.callocFree();
  modePointer.callocFree();
  rectPointer.callocFree();
  return result;
}

///
/// Get a point in render coordinates when given a point in window coordinates.
///
/// This takes into account several states:
///
/// - The window dimensions.
/// - The logical presentation settings (SDL_SetRenderLogicalPresentation)
/// - The scale (SDL_SetRenderScale)
/// - The viewport (SDL_SetRenderViewport)
///
/// \param renderer the rendering context.
/// \param window_x the x coordinate in window coordinates.
/// \param window_y the y coordinate in window coordinates.
/// \param x a pointer filled with the x coordinate in render coordinates.
/// \param y a pointer filled with the y coordinate in render coordinates.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetRenderLogicalPresentation
/// \sa SDL_SetRenderScale
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderCoordinatesFromWindow(SDL_Renderer *renderer, float window_x, float window_y, float *x, float *y)
/// ```
/// {@category render}
bool sdlxRenderCoordinatesFromWindow(
  Pointer<SdlRenderer> renderer, {
  required SdlxFPoint windowPosition,
  required SdlxFPoint renderPosition,
}) {
  final xPointer = calloc<Float>();
  final yPointer = calloc<Float>();
  final result = sdlRenderCoordinatesFromWindow(
    renderer,
    windowPosition.x,
    windowPosition.y,
    xPointer,
    yPointer,
  );
  if (result) {
    renderPosition
      ..x = xPointer.value
      ..y = yPointer.value;
  }
  xPointer.callocFree();
  yPointer.callocFree();
  return result;
}

///
/// Get a point in window coordinates when given a point in render coordinates.
///
/// This takes into account several states:
///
/// - The window dimensions.
/// - The logical presentation settings (SDL_SetRenderLogicalPresentation)
/// - The scale (SDL_SetRenderScale)
/// - The viewport (SDL_SetRenderViewport)
///
/// \param renderer the rendering context.
/// \param x the x coordinate in render coordinates.
/// \param y the y coordinate in render coordinates.
/// \param window_x a pointer filled with the x coordinate in window
/// coordinates.
/// \param window_y a pointer filled with the y coordinate in window
/// coordinates.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetRenderLogicalPresentation
/// \sa SDL_SetRenderScale
/// \sa SDL_SetRenderViewport
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderCoordinatesToWindow(SDL_Renderer *renderer, float x, float y, float *window_x, float *window_y)
/// ```
/// {@category render}
bool sdlxRenderCoordinatesToWindow(
  Pointer<SdlRenderer> renderer, {
  required SdlxFPoint renderPosition,
  required SdlxFPoint windowPosition,
}) {
  final windowXPointer = calloc<Float>();
  final windowYPointer = calloc<Float>();
  final result = sdlRenderCoordinatesToWindow(
    renderer,
    renderPosition.x,
    renderPosition.y,
    windowXPointer,
    windowYPointer,
  );
  if (result) {
    windowPosition
      ..x = windowXPointer.value
      ..y = windowYPointer.value;
  }
  windowXPointer.callocFree();
  windowYPointer.callocFree();
  return result;
}

///
/// Set the drawing area for rendering on the current target.
///
/// Drawing will clip to this area (separately from any clipping done with
/// SDL_SetRenderClipRect), and the top left of the area will become coordinate
/// (0, 0) for future drawing commands.
///
/// The area's width and height must be >= 0.
///
/// Each render target has its own viewport. This function sets the viewport
/// for the current render target.
///
/// \param renderer the rendering context.
/// \param rect the SDL_Rect structure representing the drawing area, or NULL
/// to set the viewport to the entire target.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRenderViewport
/// \sa SDL_RenderViewportSet
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderViewport(SDL_Renderer *renderer, const SDL_Rect *rect)
/// ```
/// {@category render}
bool sdlxSetRenderViewport(Pointer<SdlRenderer> renderer, SdlxRect? rect) {
  Pointer<SdlRect> rectPointer = nullptr;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlSetRenderViewport(renderer, rectPointer);
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  return result;
}

///
/// Get the drawing area for the current target.
///
/// Each render target has its own viewport. This function gets the viewport
/// for the current render target.
///
/// \param renderer the rendering context.
/// \param rect an SDL_Rect structure filled in with the current drawing area.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderViewportSet
/// \sa SDL_SetRenderViewport
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderViewport(SDL_Renderer *renderer, SDL_Rect *rect)
/// ```
/// {@category render}
bool sdlxGetRenderViewport(Pointer<SdlRenderer> renderer, SdlxRect rect) {
  final rectPointer = rect.calloc();
  final result = sdlGetRenderViewport(renderer, rectPointer);
  if (result) {
    rect.loadFromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return result;
}

///
/// Get the safe area for rendering within the current viewport.
///
/// Some devices have portions of the screen which are partially obscured or
/// not interactive, possibly due to on-screen controls, curved edges, camera
/// notches, TV overscan, etc. This function provides the area of the current
/// viewport which is safe to have interactible content. You should continue
/// rendering into the rest of the render target, but it should not contain
/// visually important or interactible content.
///
/// \param renderer the rendering context.
/// \param rect a pointer filled in with the area that is safe for interactive
/// content.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderSafeArea(SDL_Renderer *renderer, SDL_Rect *rect)
/// ```
/// {@category render}
bool sdlxGetRenderSafeArea(Pointer<SdlRenderer> renderer, SdlxRect rect) {
  final rectPointer = rect.calloc();
  final result = sdlGetRenderSafeArea(renderer, rectPointer);
  if (result) {
    rect.loadFromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return result;
}

///
/// Set the clip rectangle for rendering on the specified target.
///
/// Each render target has its own clip rectangle. This function sets the
/// cliprect for the current render target.
///
/// \param renderer the rendering context.
/// \param rect an SDL_Rect structure representing the clip area, relative to
/// the viewport, or NULL to disable clipping.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRenderClipRect
/// \sa SDL_RenderClipEnabled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderClipRect(SDL_Renderer *renderer, const SDL_Rect *rect)
/// ```
/// {@category render}
bool sdlxSetRenderClipRect(Pointer<SdlRenderer> renderer, SdlxRect? rect) {
  Pointer<SdlRect> rectPointer = nullptr;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlSetRenderClipRect(renderer, rectPointer);
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  return result;
}

///
/// Get the clip rectangle for the current target.
///
/// Each render target has its own clip rectangle. This function gets the
/// cliprect for the current render target.
///
/// \param renderer the rendering context.
/// \param rect an SDL_Rect structure filled in with the current clipping area
/// or an empty rectangle if clipping is disabled.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderClipEnabled
/// \sa SDL_SetRenderClipRect
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderClipRect(SDL_Renderer *renderer, SDL_Rect *rect)
/// ```
/// {@category render}
bool sdlxGetRenderClipRect(Pointer<SdlRenderer> renderer, SdlxRect rect) {
  final rectPointer = rect.calloc();
  final result = sdlGetRenderClipRect(renderer, rectPointer);
  if (result) {
    rect.loadFromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return result;
}

///
/// Set the drawing scale for rendering on the current target.
///
/// The drawing coordinates are scaled by the x/y scaling factors before they
/// are used by the renderer. This allows resolution independent drawing with a
/// single coordinate system.
///
/// If this results in scaling or subpixel drawing by the rendering backend, it
/// will be handled using the appropriate quality hints. For best results use
/// integer scaling factors.
///
/// Each render target has its own scale. This function sets the scale for the
/// current render target.
///
/// \param renderer the rendering context.
/// \param scaleX the horizontal scaling factor.
/// \param scaleY the vertical scaling factor.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRenderScale
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderScale(SDL_Renderer *renderer, float scaleX, float scaleY)
/// ```
/// {@category render}
bool sdlxSetRenderScale(Pointer<SdlRenderer> renderer, SdlxFPoint scale) =>
    sdlSetRenderScale(renderer, scale.x, scale.y);

///
/// Get the drawing scale for the current target.
///
/// Each render target has its own scale. This function gets the scale for the
/// current render target.
///
/// \param renderer the rendering context.
/// \param scaleX a pointer filled in with the horizontal scaling factor.
/// \param scaleY a pointer filled in with the vertical scaling factor.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetRenderScale
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderScale(SDL_Renderer *renderer, float *scaleX, float *scaleY)
/// ```
/// {@category render}
bool sdlxGetRenderScale(Pointer<SdlRenderer> renderer, SdlxFPoint scale) {
  final scaleXPointer = ffi.calloc<Float>();
  final scaleYPointer = ffi.calloc<Float>();
  final result = sdlGetRenderScale(renderer, scaleXPointer, scaleYPointer);
  if (result) {
    scale
      ..x = scaleXPointer.value
      ..y = scaleYPointer.value;
  }
  scaleXPointer.callocFree();
  scaleYPointer.callocFree();
  return result;
}

///
/// Set the color used for drawing operations.
///
/// Set the color for drawing or filling rectangles, lines, and points, and for
/// SDL_RenderClear().
///
/// \param renderer the rendering context.
/// \param r the red value used to draw on the rendering target.
/// \param g the green value used to draw on the rendering target.
/// \param b the blue value used to draw on the rendering target.
/// \param a the alpha value used to draw on the rendering target; usually
/// `SDL_ALPHA_OPAQUE` (255). Use SDL_SetRenderDrawBlendMode to
/// specify how the alpha channel is used.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRenderDrawColor
/// \sa SDL_SetRenderDrawColorFloat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderDrawColor(SDL_Renderer *renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
/// ```
/// {@category render}
bool sdlxSetRenderDrawColor(Pointer<SdlRenderer> renderer, SdlxColor color) =>
    sdlSetRenderDrawColor(renderer, color.r, color.g, color.b, color.a);

///
/// Set the color used for drawing operations (Rect, Line and Clear).
///
/// Set the color for drawing or filling rectangles, lines, and points, and for
/// SDL_RenderClear().
///
/// \param renderer the rendering context.
/// \param r the red value used to draw on the rendering target.
/// \param g the green value used to draw on the rendering target.
/// \param b the blue value used to draw on the rendering target.
/// \param a the alpha value used to draw on the rendering target. Use
/// SDL_SetRenderDrawBlendMode to specify how the alpha channel is
/// used.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRenderDrawColorFloat
/// \sa SDL_SetRenderDrawColor
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderDrawColorFloat(SDL_Renderer *renderer, float r, float g, float b, float a)
/// ```
/// {@category render}
bool sdlxSetRenderDrawColorFloat(
  Pointer<SdlRenderer> renderer,
  SdlxFColor color,
) => sdlSetRenderDrawColorFloat(renderer, color.r, color.g, color.b, color.a);

///
/// Get the color used for drawing operations (Rect, Line and Clear).
///
/// \param renderer the rendering context.
/// \param r a pointer filled in with the red value used to draw on the
/// rendering target.
/// \param g a pointer filled in with the green value used to draw on the
/// rendering target.
/// \param b a pointer filled in with the blue value used to draw on the
/// rendering target.
/// \param a a pointer filled in with the alpha value used to draw on the
/// rendering target; usually `SDL_ALPHA_OPAQUE` (255).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetRenderDrawColorFloat
/// \sa SDL_SetRenderDrawColor
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderDrawColor(SDL_Renderer *renderer, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a)
/// ```
/// {@category render}
bool sdlxGetRenderDrawColor(Pointer<SdlRenderer> renderer, SdlxColor color) {
  final rPointer = calloc<Uint8>();
  final gPointer = calloc<Uint8>();
  final bPointer = calloc<Uint8>();
  final aPointer = calloc<Uint8>();
  final result = sdlGetRenderDrawColor(
    renderer,
    rPointer,
    gPointer,
    bPointer,
    aPointer,
  );
  if (result) {
    color
      ..r = rPointer.value
      ..g = gPointer.value
      ..b = bPointer.value
      ..a = aPointer.value;
  }
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  aPointer.callocFree();
  return result;
}

///
/// Get the color used for drawing operations (Rect, Line and Clear).
///
/// \param renderer the rendering context.
/// \param r a pointer filled in with the red value used to draw on the
/// rendering target.
/// \param g a pointer filled in with the green value used to draw on the
/// rendering target.
/// \param b a pointer filled in with the blue value used to draw on the
/// rendering target.
/// \param a a pointer filled in with the alpha value used to draw on the
/// rendering target.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetRenderDrawColorFloat
/// \sa SDL_GetRenderDrawColor
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderDrawColorFloat(SDL_Renderer *renderer, float *r, float *g, float *b, float *a)
/// ```
/// {@category render}
bool sdlxGetRenderDrawColorFloat(
  Pointer<SdlRenderer> renderer,
  SdlxFColor color,
) {
  final rPointer = calloc<Float>();
  final gPointer = calloc<Float>();
  final bPointer = calloc<Float>();
  final aPointer = calloc<Float>();
  final result = sdlGetRenderDrawColorFloat(
    renderer,
    rPointer,
    gPointer,
    bPointer,
    aPointer,
  );
  if (result) {
    color
      ..r = rPointer.value
      ..g = gPointer.value
      ..b = bPointer.value
      ..a = aPointer.value;
  }
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  aPointer.callocFree();
  return result;
}

///
/// Get the color scale used for render operations.
///
/// \param renderer the rendering context.
/// \param scale a pointer filled in with the current color scale value.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetRenderColorScale
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderColorScale(SDL_Renderer *renderer, float *scale)
/// ```
/// {@category render}
double? sdlxGetRenderColorScale(Pointer<SdlRenderer> renderer) {
  double? result;
  final scalePointer = ffi.calloc<Float>();
  final bl = sdlGetRenderColorScale(renderer, scalePointer);
  if (bl) {
    result = scalePointer.value;
  }
  scalePointer.callocFree();
  return result;
}

///
/// Get the blend mode used for drawing operations.
///
/// \param renderer the rendering context.
/// \param blendMode a pointer filled in with the current SDL_BlendMode.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetRenderDrawBlendMode
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderDrawBlendMode(SDL_Renderer *renderer, SDL_BlendMode *blendMode)
/// ```
/// {@category render}
int? sdlxGetRenderDrawBlendMode(Pointer<SdlRenderer> renderer) {
  int? result;
  final blendModePointer = ffi.calloc<Uint32>();
  final bl = sdlGetRenderDrawBlendMode(renderer, blendModePointer);
  if (bl) {
    result = blendModePointer.value;
  }
  blendModePointer.callocFree();
  return result;
}

///
/// Draw a point on the current rendering target at subpixel precision.
///
/// \param renderer the renderer which should draw a point.
/// \param x the x coordinate of the point.
/// \param y the y coordinate of the point.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderPoints
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderPoint(SDL_Renderer *renderer, float x, float y)
/// ```
/// {@category render}
bool sdlxRenderPoint(Pointer<SdlRenderer> renderer, SdlxFPoint point) =>
    sdlRenderPoint(renderer, point.x, point.y);

///
/// Draw multiple points on the current rendering target at subpixel precision.
///
/// \param renderer the renderer which should draw multiple points.
/// \param points the points to draw.
/// \param count the number of points to draw.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderPoint
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderPoints(SDL_Renderer *renderer, const SDL_FPoint *points, int count)
/// ```
/// {@category render}
bool sdlxRenderPoints(Pointer<SdlRenderer> renderer, List<SdlxFPoint> points) {
  final pointsPointer = points.calloc();
  final result = sdlRenderPoints(renderer, pointsPointer, points.length);
  pointsPointer.callocFree();
  return result;
}

///
/// Draw a line on the current rendering target at subpixel precision.
///
/// \param renderer the renderer which should draw a line.
/// \param x1 the x coordinate of the start point.
/// \param y1 the y coordinate of the start point.
/// \param x2 the x coordinate of the end point.
/// \param y2 the y coordinate of the end point.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderLines
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderLine(SDL_Renderer *renderer, float x1, float y1, float x2, float y2)
/// ```
/// {@category render}
bool sdlxRenderLine(
  Pointer<SdlRenderer> renderer,
  SdlxFPoint p1,
  SdlxFPoint p2,
) => sdlRenderLine(renderer, p1.x, p1.y, p2.x, p2.y);

///
/// Draw a series of connected lines on the current rendering target at
/// subpixel precision.
///
/// \param renderer the renderer which should draw multiple lines.
/// \param points the points along the lines.
/// \param count the number of points, drawing count-1 lines.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderLine
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderLines(SDL_Renderer *renderer, const SDL_FPoint *points, int count)
/// ```
/// {@category render}
bool sdlxRenderLines(Pointer<SdlRenderer> renderer, List<SdlxFPoint> points) {
  final pointsPointer = points.calloc();
  final result = sdlRenderLines(renderer, pointsPointer, points.length);
  pointsPointer.callocFree();
  return result;
}

///
/// Draw a rectangle on the current rendering target at subpixel precision.
///
/// \param renderer the renderer which should draw a rectangle.
/// \param rect a pointer to the destination rectangle, or NULL to outline the
/// entire rendering target.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderRects
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderRect(SDL_Renderer *renderer, const SDL_FRect *rect)
/// ```
/// {@category render}
bool sdlxRenderRect(Pointer<SdlRenderer> renderer, SdlxFRect? rect) {
  Pointer<SdlFRect> rectPointer = nullptr;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlRenderRect(renderer, rectPointer);
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  return result;
}

///
/// Draw some number of rectangles on the current rendering target at subpixel
/// precision.
///
/// \param renderer the renderer which should draw multiple rectangles.
/// \param rects a pointer to an array of destination rectangles.
/// \param count the number of rectangles.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderRect
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderRects(SDL_Renderer *renderer, const SDL_FRect *rects, int count)
/// ```
/// {@category render}
bool sdlxRenderRects(Pointer<SdlRenderer> renderer, List<SdlxFRect> rects) {
  final rectsPointer = rects.calloc();
  final result = sdlRenderRects(renderer, rectsPointer, rects.length);
  rectsPointer.callocFree();
  return result;
}

///
/// Fill a rectangle on the current rendering target with the drawing color at
/// subpixel precision.
///
/// \param renderer the renderer which should fill a rectangle.
/// \param rect a pointer to the destination rectangle, or NULL for the entire
/// rendering target.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderFillRects
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderFillRect(SDL_Renderer *renderer, const SDL_FRect *rect)
/// ```
/// {@category render}
bool sdlxRenderFillRect(Pointer<SdlRenderer> renderer, SdlxFRect? rect) {
  Pointer<SdlFRect> rectPointer = nullptr;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlRenderFillRect(renderer, rectPointer);
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  return result;
}

///
/// Fill some number of rectangles on the current rendering target with the
/// drawing color at subpixel precision.
///
/// \param renderer the renderer which should fill multiple rectangles.
/// \param rects a pointer to an array of destination rectangles.
/// \param count the number of rectangles.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderFillRect
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderFillRects(SDL_Renderer *renderer, const SDL_FRect *rects, int count)
/// ```
/// {@category render}
bool sdlxRenderFillRects(Pointer<SdlRenderer> renderer, List<SdlxFRect> rects) {
  final rectsPointer = rects.calloc();
  final result = sdlRenderFillRects(renderer, rectsPointer, rects.length);
  rectsPointer.callocFree();
  return result;
}

///
/// Copy a portion of the texture to the current rendering target at subpixel
/// precision.
///
/// \param renderer the renderer which should copy parts of a texture.
/// \param texture the source texture.
/// \param srcrect a pointer to the source rectangle, or NULL for the entire
/// texture.
/// \param dstrect a pointer to the destination rectangle, or NULL for the
/// entire rendering target.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderTextureRotated
/// \sa SDL_RenderTextureTiled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderTexture(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, const SDL_FRect *dstrect)
/// ```
/// {@category render}
bool sdlxRenderTexture(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlTexture> texture, {
  SdlxFRect? srcrect,
  SdlxFRect? dstrect,
}) {
  Pointer<SdlFRect> srcrectPointer = nullptr;
  Pointer<SdlFRect> dstrectPointer = nullptr;
  if (srcrect != null) {
    srcrectPointer = srcrect.calloc();
  }
  if (dstrect != null) {
    dstrectPointer = dstrect.calloc();
  }
  final result = sdlRenderTexture(
    renderer,
    texture,
    srcrectPointer,
    dstrectPointer,
  );
  if (srcrectPointer != nullptr) {
    srcrectPointer.callocFree();
  }
  if (dstrectPointer != nullptr) {
    dstrectPointer.callocFree();
  }
  return result;
}

///
/// Copy a portion of the source texture to the current rendering target, with
/// rotation and flipping, at subpixel precision.
///
/// \param renderer the renderer which should copy parts of a texture.
/// \param texture the source texture.
/// \param srcrect a pointer to the source rectangle, or NULL for the entire
/// texture.
/// \param dstrect a pointer to the destination rectangle, or NULL for the
/// entire rendering target.
/// \param angle an angle in degrees that indicates the rotation that will be
/// applied to dstrect, rotating it in a clockwise direction.
/// \param center a pointer to a point indicating the point around which
/// dstrect will be rotated (if NULL, rotation will be done
/// around dstrect.w/2, dstrect.h/2).
/// \param flip an SDL_FlipMode value stating which flipping actions should be
/// performed on the texture.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderTexture
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderTextureRotated(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, const SDL_FRect *dstrect, double angle, const SDL_FPoint *center, SDL_FlipMode flip)
/// ```
/// {@category render}
bool sdlxRenderTextureRotated(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlTexture> texture, {
  SdlxFRect? srcrect,
  SdlxFRect? dstrect,
  double angle = 0,
  SdlxFPoint? center,
  int flip = SdlkFlip.none,
}) {
  Pointer<SdlFRect> srcrectPointer = nullptr;
  Pointer<SdlFRect> dstrectPointer = nullptr;
  Pointer<SdlFPoint> centerPointer = nullptr;
  if (srcrect != null) {
    srcrectPointer = srcrect.calloc();
  }
  if (dstrect != null) {
    dstrectPointer = dstrect.calloc();
  }
  if (center != null) {
    centerPointer = center.calloc();
  }
  final result = sdlRenderTextureRotated(
    renderer,
    texture,
    srcrectPointer,
    dstrectPointer,
    angle,
    centerPointer,
    flip,
  );
  if (srcrectPointer != nullptr) {
    srcrectPointer.callocFree();
  }
  if (dstrectPointer != nullptr) {
    dstrectPointer.callocFree();
  }
  if (centerPointer != nullptr) {
    centerPointer.callocFree();
  }
  return result;
}

///
/// Copy a portion of the source texture to the current rendering target, with
/// affine transform, at subpixel precision.
///
/// \param renderer the renderer which should copy parts of a texture.
/// \param texture the source texture.
/// \param srcrect a pointer to the source rectangle, or NULL for the entire
/// texture.
/// \param origin a pointer to a point indicating where the top-left corner of
/// srcrect should be mapped to, or NULL for the rendering
/// target's origin.
/// \param right a pointer to a point indicating where the top-right corner of
/// srcrect should be mapped to, or NULL for the rendering
/// target's top-right corner.
/// \param down a pointer to a point indicating where the bottom-left corner of
/// srcrect should be mapped to, or NULL for the rendering target's
/// bottom-left corner.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety You may only call this function from the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderTexture
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderTextureAffine(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, const SDL_FPoint *origin, const SDL_FPoint *right, const SDL_FPoint *down)
/// ```
/// {@category render}
bool sdlxRenderTextureAffine(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlTexture> texture, {
  SdlxFRect? srcrect,
  SdlxFPoint? origin,
  SdlxFPoint? right,
  SdlxFPoint? down,
}) {
  Pointer<SdlFRect> srcrectPointer = nullptr;
  Pointer<SdlFPoint> originPointer = nullptr;
  Pointer<SdlFPoint> rightPointer = nullptr;
  Pointer<SdlFPoint> downPointer = nullptr;
  if (srcrect != null) {
    srcrectPointer = srcrect.calloc();
  }
  if (origin != null) {
    originPointer = origin.calloc();
  }
  if (right != null) {
    rightPointer = right.calloc();
  }
  if (down != null) {
    downPointer = down.calloc();
  }
  final result = sdlRenderTextureAffine(
    renderer,
    texture,
    srcrectPointer,
    originPointer,
    rightPointer,
    downPointer,
  );
  if (srcrectPointer != nullptr) {
    srcrectPointer.callocFree();
  }
  if (originPointer != nullptr) {
    originPointer.callocFree();
  }
  if (rightPointer != nullptr) {
    rightPointer.callocFree();
  }
  if (downPointer != nullptr) {
    downPointer.callocFree();
  }
  return result;
}

///
/// Tile a portion of the texture to the current rendering target at subpixel
/// precision.
///
/// The pixels in `srcrect` will be repeated as many times as needed to
/// completely fill `dstrect`.
///
/// \param renderer the renderer which should copy parts of a texture.
/// \param texture the source texture.
/// \param srcrect a pointer to the source rectangle, or NULL for the entire
/// texture.
/// \param scale the scale used to transform srcrect into the destination
/// rectangle, e.g. a 32x32 texture with a scale of 2 would fill
/// 64x64 tiles.
/// \param dstrect a pointer to the destination rectangle, or NULL for the
/// entire rendering target.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderTexture
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderTextureTiled(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, float scale, const SDL_FRect *dstrect)
/// ```
/// {@category render}
bool sdlxRenderTextureTiled(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlTexture> texture, {
  SdlxFRect? srcrect,
  double scale = 1,
  SdlxFRect? dstrect,
}) {
  Pointer<SdlFRect> srcrectPointer = nullptr;
  Pointer<SdlFRect> dstrectPointer = nullptr;
  if (srcrect != null) {
    srcrectPointer = srcrect.calloc();
  }
  if (dstrect != null) {
    dstrectPointer = dstrect.calloc();
  }
  final result = sdlRenderTextureTiled(
    renderer,
    texture,
    srcrectPointer,
    scale,
    dstrectPointer,
  );
  if (srcrectPointer != nullptr) {
    srcrectPointer.callocFree();
  }
  if (dstrectPointer != nullptr) {
    dstrectPointer.callocFree();
  }
  return result;
}

///
/// Perform a scaled copy using the 9-grid algorithm to the current rendering
/// target at subpixel precision.
///
/// The pixels in the texture are split into a 3x3 grid, using the different
/// corner sizes for each corner, and the sides and center making up the
/// remaining pixels. The corners are then scaled using `scale` and fit into
/// the corners of the destination rectangle. The sides and center are then
/// stretched into place to cover the remaining destination rectangle.
///
/// \param renderer the renderer which should copy parts of a texture.
/// \param texture the source texture.
/// \param srcrect the SDL_Rect structure representing the rectangle to be used
/// for the 9-grid, or NULL to use the entire texture.
/// \param left_width the width, in pixels, of the left corners in `srcrect`.
/// \param right_width the width, in pixels, of the right corners in `srcrect`.
/// \param top_height the height, in pixels, of the top corners in `srcrect`.
/// \param bottom_height the height, in pixels, of the bottom corners in
/// `srcrect`.
/// \param scale the scale used to transform the corner of `srcrect` into the
/// corner of `dstrect`, or 0.0f for an unscaled copy.
/// \param dstrect a pointer to the destination rectangle, or NULL for the
/// entire rendering target.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderTexture
/// \sa SDL_RenderTexture9GridTiled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderTexture9Grid(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, float left_width, float right_width, float top_height, float bottom_height, float scale, const SDL_FRect *dstrect)
/// ```
/// {@category render}
bool sdlxRenderTexture9Grid(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlTexture> texture, {
  required double leftWidth,
  required double rightWidth,
  required double topHeight,
  required double bottomHeight,
  SdlxFRect? srcrect,
  double scale = 1,
  SdlxFRect? dstrect,
}) {
  Pointer<SdlFRect> srcrectPointer = nullptr;
  Pointer<SdlFRect> dstrectPointer = nullptr;
  if (srcrect != null) {
    srcrectPointer = srcrect.calloc();
  }
  if (dstrect != null) {
    dstrectPointer = dstrect.calloc();
  }
  final result = sdlRenderTexture9Grid(
    renderer,
    texture,
    srcrectPointer,
    leftWidth,
    rightWidth,
    topHeight,
    bottomHeight,
    scale,
    dstrectPointer,
  );
  if (srcrectPointer != nullptr) {
    srcrectPointer.callocFree();
  }
  if (dstrectPointer != nullptr) {
    dstrectPointer.callocFree();
  }
  return result;
}

bool sdlxRenderTexture9GridTiled(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlTexture> texture, {
  required double leftWidth,
  required double rightWidth,
  required double topHeight,
  required double bottomHeight,
  SdlxFRect? srcrect,
  double scale = 1,
  SdlxFRect? dstrect,
  double tileScale = 1,
}) {
  Pointer<SdlFRect> srcrectPointer = nullptr;
  Pointer<SdlFRect> dstrectPointer = nullptr;
  if (srcrect != null) {
    srcrectPointer = srcrect.calloc();
  }
  if (dstrect != null) {
    dstrectPointer = dstrect.calloc();
  }
  final result = sdlRenderTexture9GridTiled(
    renderer,
    texture,
    srcrectPointer,
    leftWidth,
    rightWidth,
    topHeight,
    bottomHeight,
    scale,
    dstrectPointer,
    tileScale,
  );
  if (srcrectPointer != nullptr) {
    srcrectPointer.callocFree();
  }
  if (dstrectPointer != nullptr) {
    dstrectPointer.callocFree();
  }
  return result;
}

///
/// Render a list of triangles, optionally using a texture and indices into the
/// vertex array.
///
/// Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and
/// SDL_SetTextureAlphaMod are ignored).
///
/// \param renderer the rendering context.
/// \param texture (optional) The SDL texture to use.
/// \param vertices vertices.
/// \param num_vertices number of vertices.
/// \param indices (optional) An array of integer indices into the 'vertices'
/// array, if NULL all vertices will be rendered in sequential
/// order.
/// \param num_indices number of indices.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderGeometryRaw
/// \sa SDL_SetRenderTextureAddressMode
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderGeometry(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Vertex *vertices, int num_vertices, const int *indices, int num_indices)
/// ```
/// {@category render}
bool sdlxRenderGeometry(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlTexture> texture, {
  List<SdlxVertex>? vertices,
  List<int>? indices,
}) {
  Pointer<SdlVertex> verticesPointer = nullptr;
  var numVertices = 0;
  Pointer<Int32> indicesPointer = nullptr;
  var numIndices = 0;
  if (vertices != null) {
    verticesPointer = vertices.calloc();
    numVertices = vertices.length;
  }
  if (indices != null) {
    indicesPointer = calloc<Int32>(indices.length);
    for (var i = 0; i < indices.length; i++) {
      indicesPointer[i] = indices[i];
    }
    numIndices = indices.length;
  }
  final result = sdlRenderGeometry(
    renderer,
    texture,
    verticesPointer,
    numVertices,
    indicesPointer,
    numIndices,
  );
  if (verticesPointer != nullptr) {
    verticesPointer.callocFree();
  }
  if (indicesPointer != nullptr) {
    indicesPointer.callocFree();
  }
  return result;
}

///
/// Read pixels from the current rendering target.
///
/// The returned surface contains pixels inside the desired area clipped to the
/// current viewport, and should be freed with SDL_DestroySurface().
///
/// Note that this returns the actual pixels on the screen, so if you are using
/// logical presentation you should use SDL_GetRenderLogicalPresentationRect()
/// to get the area containing your content.
///
/// **WARNING**: This is a very slow operation, and should not be used
/// frequently. If you're using this on the main rendering target, it should be
/// called after rendering and before SDL_RenderPresent().
///
/// \param renderer the rendering context.
/// \param rect an SDL_Rect structure representing the area to read, which will
/// be clipped to the current viewport, or NULL for the entire
/// viewport.
/// \returns a new SDL_Surface on success or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_RenderReadPixels(SDL_Renderer *renderer, const SDL_Rect *rect)
/// ```
/// {@category render}
Pointer<SdlSurface> sdlxRenderReadPixels(
  Pointer<SdlRenderer> renderer,
  SdlxRect? rect,
) {
  Pointer<SdlRect> rectPointer = nullptr;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlRenderReadPixels(renderer, rectPointer);
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  return result;
}

///
/// Set sampler bindings variables in a custom GPU render state.
///
/// The data is copied and will be binded using SDL_BindGPUFragmentSamplers()
/// during draw call execution.
///
/// \param state the state to modify.
/// \param num_sampler_bindings The number of additional fragment samplers to
/// bind.
/// \param sampler_bindings Additional fragment samplers to bind.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// renderer.
///
/// \since This function is available since SDL 3.6.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPURenderStateSamplerBindings(SDL_GPURenderState *state, int num_sampler_bindings, const SDL_GPUTextureSamplerBinding *sampler_bindings)
/// ```
/// {@category render}
bool sdlxSetGpuRenderStateSamplerBindings(
  Pointer<SdlGpuRenderState> state, {
  required List<SdlxGpuTextureSamplerBinding> bindings,
}) {
  var result = false;
  if (bindings.isNotEmpty) {
    final bindingsPointer = bindings.calloc();
    result = sdlSetGpuRenderStateSamplerBindings(
      state,
      bindings.length,
      bindingsPointer,
    );
    bindingsPointer.callocFree();
  }
  return result;
}
