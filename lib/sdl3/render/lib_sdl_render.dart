part of '../sdl_render.dart';

///
/// Create a window and default renderer.
///
/// \param title the title of the window, in UTF-8 encoding.
/// \param width the width of the window.
/// \param height the height of the window.
/// \param window_flags the flags used to create the window (see
/// SDL_CreateWindow()).
/// \param window a pointer filled with the window, or NULL on error.
/// \param renderer a pointer filled with the renderer, or NULL on error.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateRenderer
/// \sa SDL_CreateWindow
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CreateWindowAndRenderer(const char *title, int width, int height, SDL_WindowFlags window_flags, SDL_Window **window, SDL_Renderer **renderer)
/// ```
///
/// See also:
/// - [SDL_CreateWindowAndRenderer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateWindowAndRenderer)
///
/// {@category render}
({Pointer<SdlWindow> window, Pointer<SdlRenderer> renderer})?
sdlxCreateWindowAndRenderer(
  String title,
  int width,
  int height,
  int windowFlags,
) {
  Pointer<SdlWindow> window = nullptr;
  Pointer<SdlRenderer> renderer = nullptr;
  final windowPointer = ffi.calloc<Pointer<SdlWindow>>();
  final rendererPointer = ffi.calloc<Pointer<SdlRenderer>>();
  final result = sdlCreateWindowAndRenderer(
    title,
    width,
    height,
    windowFlags,
    windowPointer,
    rendererPointer,
  );
  if (result) {
    window = windowPointer.value;
    renderer = rendererPointer.value;
  }
  windowPointer.callocFree();
  rendererPointer.callocFree();
  if (!result) {
    return null;
  }
  return (window: window, renderer: renderer);
}

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
///
/// See also:
/// - [SDL_GetRenderOutputSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderOutputSize)
///
/// {@category render}
({int w, int h})? sdlxGetRenderOutputSize(Pointer<SdlRenderer> renderer) {
  var w = 0;
  var h = 0;
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final result = sdlGetRenderOutputSize(renderer, wPointer, hPointer);
  if (result) {
    w = wPointer.value;
    h = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  if (!result) {
    return null;
  }
  return (w: w, h: h);
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
///
/// See also:
/// - [SDL_GetCurrentRenderOutputSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetCurrentRenderOutputSize)
///
/// {@category render}
({int w, int h})? sdlxGetCurrentRenderOutputSize(
  Pointer<SdlRenderer> renderer,
) {
  var w = 0;
  var h = 0;
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final result = sdlGetCurrentRenderOutputSize(renderer, wPointer, hPointer);
  if (result) {
    w = wPointer.value;
    h = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  if (!result) {
    return null;
  }
  return (w: w, h: h);
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
///
/// See also:
/// - [SDL_GetTextureSize - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetTextureSize)
///
/// {@category render}
({double w, double h})? sdlxGetTextureSize(Pointer<SdlTexture> texture) {
  var w = 0.0;
  var h = 0.0;
  final wPointer = ffi.calloc<Float>();
  final hPointer = ffi.calloc<Float>();
  final result = sdlGetTextureSize(texture, wPointer, hPointer);
  if (result) {
    w = wPointer.value;
    h = hPointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  if (!result) {
    return null;
  }
  return (w: w, h: h);
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
///
/// See also:
/// - [SDL_SetTextureColorMod - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetTextureColorMod)
///
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
///
/// See also:
/// - [SDL_SetTextureColorModFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetTextureColorModFloat)
///
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
///
/// See also:
/// - [SDL_GetTextureColorMod - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetTextureColorMod)
///
/// {@category render}
({int r, int g, int b})? sdlxGetTextureColorMod(Pointer<SdlTexture> texture) {
  var r = 0;
  var g = 0;
  var b = 0;
  final rPointer = ffi.calloc<Uint8>();
  final gPointer = ffi.calloc<Uint8>();
  final bPointer = ffi.calloc<Uint8>();
  final result = sdlGetTextureColorMod(texture, rPointer, gPointer, bPointer);
  if (result) {
    r = rPointer.value;
    g = gPointer.value;
    b = bPointer.value;
  }
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  if (!result) {
    return null;
  }
  return (r: r, g: g, b: b);
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
///
/// See also:
/// - [SDL_GetTextureColorModFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetTextureColorModFloat)
///
/// {@category render}
({double r, double g, double b})? sdlxGetTextureColorModFloat(
  Pointer<SdlTexture> texture,
) {
  var r = 0.0;
  var g = 0.0;
  var b = 0.0;
  final rPointer = ffi.calloc<Float>();
  final gPointer = ffi.calloc<Float>();
  final bPointer = ffi.calloc<Float>();
  final result = sdlGetTextureColorModFloat(
    texture,
    rPointer,
    gPointer,
    bPointer,
  );
  if (result) {
    r = rPointer.value;
    g = gPointer.value;
    b = bPointer.value;
  }
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  if (!result) {
    return null;
  }
  return (r: r, g: g, b: b);
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
///
/// See also:
/// - [SDL_GetTextureAlphaMod - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaMod)
///
/// {@category render}
int? sdlxGetTextureAlphaMod(Pointer<SdlTexture> texture) {
  int? result;
  final alphaPointer = ffi.calloc<Uint8>();
  final bl = sdlGetTextureAlphaMod(texture, alphaPointer);
  if (bl) {
    result = alphaPointer.value;
  }
  alphaPointer.callocFree();
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
///
/// See also:
/// - [SDL_GetTextureAlphaModFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaModFloat)
///
/// {@category render}
double? sdlxGetTextureAlphaModFloat(Pointer<SdlTexture> texture) {
  double? result;
  final alphaPointer = ffi.calloc<Float>();
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
///
/// See also:
/// - [SDL_GetTextureBlendMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetTextureBlendMode)
///
/// {@category render}
int? sdlxGetTextureBlendMode(Pointer<SdlTexture> texture) {
  int? result;
  final blendModePointer = ffi.calloc<Uint32>();
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
///
/// See also:
/// - [SDL_GetTextureScaleMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode)
///
/// {@category render}
int? sdlxGetTextureScaleMode(Pointer<SdlTexture> texture) {
  int? result;
  final scaleModePointer = ffi.calloc<Int32>();
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
///
/// See also:
/// - [SDL_UpdateTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UpdateTexture)
///
/// {@category render}
bool sdlxUpdateTexture(
  Pointer<SdlTexture> texture,
  Pointer<Void> pixels,
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
///
/// See also:
/// - [SDL_UpdateYUVTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UpdateYUVTexture)
///
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
    yplanePointer = ffi.calloc<Uint8>(yplane.length);
    for (var i = 0; i < yplane.length; i++) {
      yplanePointer[i] = yplane[i];
    }
    yplanePitch = yplane.length;
  }
  if (uplane != null) {
    uplanePointer = ffi.calloc<Uint8>(uplane.length);
    for (var i = 0; i < uplane.length; i++) {
      uplanePointer[i] = uplane[i];
    }
    uplanePitch = uplane.length;
  }
  if (vplane != null) {
    vplanePointer = ffi.calloc<Uint8>(vplane.length);
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
///
/// See also:
/// - [SDL_UpdateNVTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UpdateNVTexture)
///
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
    yplanePointer = ffi.calloc<Uint8>(yplane.length);
    for (var i = 0; i < yplane.length; i++) {
      yplanePointer[i] = yplane[i];
    }
    yplanePitch = yplane.length;
  }
  if (uVplane != null) {
    uVplanePointer = ffi.calloc<Uint8>(uVplane.length);
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
///
/// See also:
/// - [SDL_LockTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_LockTexture)
///
/// {@category render}
({Pointer<Void> pixels, int pitch})? sdlxLockTexture(
  Pointer<SdlTexture> texture, {
  SdlxRect? rect,
}) {
  Pointer<Void> pixels = nullptr;
  var pitch = 0;
  Pointer<SdlRect> rectPointer = nullptr;
  final pixelsPointer = ffi.calloc<Pointer<Void>>();
  final pitchPointer = ffi.calloc<Int32>();
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlLockTexture(
    texture,
    rectPointer,
    pixelsPointer,
    pitchPointer,
  );
  if (result) {
    pixels = pixelsPointer.value;
    pitch = pitchPointer.value;
  }
  if (rectPointer != nullptr) {
    rectPointer.callocFree();
  }
  pixelsPointer.callocFree();
  pitchPointer.callocFree();
  return (pixels: pixels, pitch: pitch);
}

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
///
/// See also:
/// - [SDL_GetRenderLogicalPresentation - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentation)
///
/// {@category render}
({int w, int h, int mode})? sdlxGetRenderLogicalPresentation(
  Pointer<SdlRenderer> renderer,
) {
  var w = 0;
  var h = 0;
  var mode = 0;
  final wPointer = ffi.calloc<Int32>();
  final hPointer = ffi.calloc<Int32>();
  final modePointer = ffi.calloc<Int32>();
  final result = sdlGetRenderLogicalPresentation(
    renderer,
    wPointer,
    hPointer,
    modePointer,
  );
  if (result) {
    w = wPointer.value;
    h = hPointer.value;
    mode = modePointer.value;
  }
  wPointer.callocFree();
  hPointer.callocFree();
  modePointer.callocFree();
  if (!result) {
    return null;
  }
  return (w: w, h: h, mode: mode);
}

///
/// Get the final presentation rectangle for rendering.
///
/// This function returns the calculated rectangle used for logical
/// presentation, based on the presentation mode and output size. If logical
/// presentation is disabled, it will fill the rectangle with the output size,
/// in pixels.
///
/// Each render target has its own logical presentation state. This function
/// gets the rectangle for the current render target.
///
/// \param renderer the rendering context.
/// \param rect a pointer filled in with the final presentation rectangle, may
/// be NULL.
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
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderLogicalPresentationRect(SDL_Renderer *renderer, SDL_FRect *rect)
/// ```
///
/// See also:
/// - [SDL_GetRenderLogicalPresentationRect - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentationRect)
///
/// {@category render}
SdlxFRect? sdlxGetRenderLogicalPresentationRect(Pointer<SdlRenderer> renderer) {
  SdlxFRect? rect;
  final rectPointer = ffi.calloc<SdlFRect>();
  final result = sdlGetRenderLogicalPresentationRect(renderer, rectPointer);
  if (result) {
    rect = SdlxFRect.fromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return rect;
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
///
/// See also:
/// - [SDL_RenderCoordinatesFromWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesFromWindow)
///
/// {@category render}
({double x, double y})? sdlxRenderCoordinatesFromWindow(
  Pointer<SdlRenderer> renderer,
  double windowX,
  double windowY,
) {
  var x = 0.0;
  var y = 0.0;
  final xPointer = ffi.calloc<Float>();
  final yPointer = ffi.calloc<Float>();
  final result = sdlRenderCoordinatesFromWindow(
    renderer,
    windowX,
    windowY,
    xPointer,
    yPointer,
  );
  if (result) {
    x = xPointer.value;
    y = yPointer.value;
  }
  xPointer.callocFree();
  yPointer.callocFree();
  if (!result) {
    return null;
  }
  return (x: x, y: y);
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
///
/// See also:
/// - [SDL_RenderCoordinatesToWindow - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesToWindow)
///
/// {@category render}
({double windowX, double windowY})? sdlxRenderCoordinatesToWindow(
  Pointer<SdlRenderer> renderer,
  double x,
  double y,
) {
  var windowX = 0.0;
  var windowY = 0.0;
  final windowXPointer = ffi.calloc<Float>();
  final windowYPointer = ffi.calloc<Float>();
  final result = sdlRenderCoordinatesToWindow(
    renderer,
    x,
    y,
    windowXPointer,
    windowYPointer,
  );
  if (result) {
    windowX = windowXPointer.value;
    windowY = windowYPointer.value;
  }
  windowXPointer.callocFree();
  windowYPointer.callocFree();
  if (!result) {
    return null;
  }
  return (windowX: windowX, windowY: windowY);
}

///
/// Convert the coordinates in an event to render coordinates.
///
/// This takes into account several states:
///
/// - The window dimensions.
/// - The logical presentation settings (SDL_SetRenderLogicalPresentation)
/// - The scale (SDL_SetRenderScale)
/// - The viewport (SDL_SetRenderViewport)
///
/// Various event types are converted with this function: mouse, touch, pen,
/// etc.
///
/// Touch coordinates are converted from normalized coordinates in the window
/// to non-normalized rendering coordinates.
///
/// Relative mouse coordinates (xrel and yrel event fields) are _also_
/// converted. Applications that do not want these fields converted should use
/// SDL_RenderCoordinatesFromWindow() on the specific event fields instead of
/// converting the entire event structure.
///
/// Once converted, coordinates may be outside the rendering area.
///
/// \param renderer the rendering context.
/// \param event the event to modify.
/// \returns true if the event is converted or doesn't need conversion, or
/// false on failure; call SDL_GetError() for more information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderCoordinatesFromWindow
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ConvertEventToRenderCoordinates(SDL_Renderer *renderer, SDL_Event *event)
/// ```
///
/// See also:
/// - [SDL_ConvertEventToRenderCoordinates - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_ConvertEventToRenderCoordinates)
///
/// {@category render}
SdlxEvent? sdlxConvertEventToRenderCoordinates(
  Pointer<SdlRenderer> renderer,
  SdlxEvent event,
) => ffi.using((arena) {
  final eventPointer = event.toNative(arena);

  final success = sdlConvertEventToRenderCoordinates(renderer, eventPointer);

  if (!success) return null;

  return SdlxEvent.fromPointer(eventPointer);
});

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
/// \sa SDL_SetRenderViewportFloat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderViewport(SDL_Renderer *renderer, const SDL_Rect *rect)
/// ```
///
/// See also:
/// - [SDL_SetRenderViewport - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetRenderViewport)
///
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
/// \sa SDL_GetRenderViewportFloat
/// \sa SDL_RenderViewportSet
/// \sa SDL_SetRenderViewport
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderViewport(SDL_Renderer *renderer, SDL_Rect *rect)
/// ```
///
/// See also:
/// - [SDL_GetRenderViewport - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderViewport)
///
/// {@category render}
SdlxRect? sdlxGetRenderViewport(Pointer<SdlRenderer> renderer) =>
    ffi.using((arena) {
      final rectPointer = arena<SdlRect>();
      final result = sdlGetRenderViewport(renderer, rectPointer);

      if (!result) {
        return null;
      }

      return SdlxRect.fromPointer(rectPointer);
    });

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
/// \param rect the SDL_FRect structure representing the drawing area, or NULL
/// to set the viewport to the entire target.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_GetRenderViewportFloat
/// \sa SDL_RenderViewportSet
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderViewportFloat(SDL_Renderer *renderer, const SDL_FRect *rect)
/// ```
///
/// See also:
/// - [SDL_SetRenderViewportFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetRenderViewportFloat)
///
/// {@category render}
bool sdlxSetRenderViewportFloat(
  Pointer<SdlRenderer> renderer,
  SdlxFRect? rect,
) {
  Pointer<SdlFRect> rectPointer = nullptr;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlSetRenderViewportFloat(renderer, rectPointer);
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
/// \param rect an SDL_FRect structure filled in with the current drawing area.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_RenderViewportSet
/// \sa SDL_SetRenderViewportFloat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderViewportFloat(SDL_Renderer *renderer, SDL_FRect *rect)
/// ```
///
/// See also:
/// - [SDL_GetRenderViewportFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderViewportFloat)
///
/// {@category render}
SdlxFRect? sdlxGetRenderViewportFloat(Pointer<SdlRenderer> renderer) {
  SdlxFRect? rect;
  final rectPointer = ffi.calloc<SdlFRect>();
  final result = sdlGetRenderViewportFloat(renderer, rectPointer);
  if (result) {
    rect = SdlxFRect.fromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return rect;
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
///
/// See also:
/// - [SDL_GetRenderSafeArea - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderSafeArea)
///
/// {@category render}
SdlxRect? sdlxGetRenderSafeArea(Pointer<SdlRenderer> renderer) =>
    ffi.using((arena) {
      final rectPointer = arena<SdlRect>();
      final result = sdlGetRenderSafeArea(renderer, rectPointer);

      if (!result) {
        return null;
      }

      return SdlxRect.fromPointer(rectPointer);
    });

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
/// \sa SDL_SetRenderClipRectFloat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderClipRect(SDL_Renderer *renderer, const SDL_Rect *rect)
/// ```
///
/// See also:
/// - [SDL_SetRenderClipRect - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetRenderClipRect)
///
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
/// \sa SDL_GetRenderClipRectFloat
/// \sa SDL_RenderClipEnabled
/// \sa SDL_SetRenderClipRect
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderClipRect(SDL_Renderer *renderer, SDL_Rect *rect)
/// ```
///
/// See also:
/// - [SDL_GetRenderClipRect - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderClipRect)
///
/// {@category render}
SdlxRect? sdlxGetRenderClipRect(Pointer<SdlRenderer> renderer) =>
    ffi.using((arena) {
      final rectPointer = arena<SdlRect>();
      final result = sdlGetRenderClipRect(renderer, rectPointer);

      if (!result) {
        return null;
      }

      return SdlxRect.fromPointer(rectPointer);
    });

///
/// Set the clip rectangle for rendering on the specified target.
///
/// Each render target has its own clip rectangle. This function sets the
/// cliprect for the current render target.
///
/// \param renderer the rendering context.
/// \param rect an SDL_FRect structure representing the clip area, relative to
/// the viewport, or NULL to disable clipping.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_GetRenderClipRectFloat
/// \sa SDL_RenderClipEnabled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetRenderClipRectFloat(SDL_Renderer *renderer, const SDL_FRect *rect)
/// ```
///
/// See also:
/// - [SDL_SetRenderClipRectFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetRenderClipRectFloat)
///
/// {@category render}
bool sdlxSetRenderClipRectFloat(
  Pointer<SdlRenderer> renderer,
  SdlxFRect? rect,
) {
  Pointer<SdlFRect> rectPointer = nullptr;
  if (rect != null) {
    rectPointer = rect.calloc();
  }
  final result = sdlSetRenderClipRectFloat(renderer, rectPointer);
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
/// \param rect an SDL_FRect structure filled in with the current clipping area
/// or an empty rectangle if clipping is disabled.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.6.0.
///
/// \sa SDL_RenderClipEnabled
/// \sa SDL_SetRenderClipRectFloat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderClipRectFloat(SDL_Renderer *renderer, SDL_FRect *rect)
/// ```
///
/// See also:
/// - [SDL_GetRenderClipRectFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderClipRectFloat)
///
/// {@category render}
SdlxFRect? sdlxGetRenderClipRectFloat(Pointer<SdlRenderer> renderer) {
  SdlxFRect? rect;
  final rectPointer = ffi.calloc<SdlFRect>();
  final result = sdlGetRenderClipRectFloat(renderer, rectPointer);
  if (result) {
    rect = SdlxFRect.fromPointer(rectPointer);
  }
  rectPointer.callocFree();
  return rect;
}

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
///
/// See also:
/// - [SDL_GetRenderScale - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderScale)
///
/// {@category render}
({double scaleX, double scaleY})? sdlxGetRenderScale(
  Pointer<SdlRenderer> renderer,
) {
  var scaleX = 0.0;
  var scaleY = 0.0;
  final scaleXPointer = ffi.calloc<Float>();
  final scaleYPointer = ffi.calloc<Float>();
  final result = sdlGetRenderScale(renderer, scaleXPointer, scaleYPointer);
  if (result) {
    scaleX = scaleXPointer.value;
    scaleY = scaleYPointer.value;
  }
  scaleXPointer.callocFree();
  scaleYPointer.callocFree();
  if (!result) {
    return null;
  }
  return (scaleX: scaleX, scaleY: scaleY);
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
///
/// See also:
/// - [SDL_SetRenderDrawColor - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor)
///
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
///
/// See also:
/// - [SDL_SetRenderDrawColorFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColorFloat)
///
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
///
/// See also:
/// - [SDL_GetRenderDrawColor - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColor)
///
/// {@category render}
SdlxColor? sdlxGetRenderDrawColor(Pointer<SdlRenderer> renderer) =>
    ffi.using((arena) {
      final rPointer = arena<Uint8>();
      final gPointer = arena<Uint8>();
      final bPointer = arena<Uint8>();
      final aPointer = arena<Uint8>();

      final result = sdlGetRenderDrawColor(
        renderer,
        rPointer,
        gPointer,
        bPointer,
        aPointer,
      );

      if (!result) {
        return null;
      }

      return SdlxColor(
        rPointer.value,
        gPointer.value,
        bPointer.value,
        aPointer.value,
      );
    });

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
///
/// See also:
/// - [SDL_GetRenderDrawColorFloat - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColorFloat)
///
/// {@category render}
SdlxFColor? sdlxGetRenderDrawColorFloat(Pointer<SdlRenderer> renderer) =>
    ffi.using((arena) {
      final rPointer = arena<Float>();
      final gPointer = arena<Float>();
      final bPointer = arena<Float>();
      final aPointer = arena<Float>();

      final result = sdlGetRenderDrawColorFloat(
        renderer,
        rPointer,
        gPointer,
        bPointer,
        aPointer,
      );

      if (!result) {
        return null;
      }

      return SdlxFColor(
        rPointer.value,
        gPointer.value,
        bPointer.value,
        aPointer.value,
      );
    });

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
///
/// See also:
/// - [SDL_GetRenderColorScale - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderColorScale)
///
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
///
/// See also:
/// - [SDL_GetRenderDrawBlendMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawBlendMode)
///
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
///
/// See also:
/// - [SDL_RenderPoint - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderPoint)
///
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
///
/// See also:
/// - [SDL_RenderPoints - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderPoints)
///
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
///
/// See also:
/// - [SDL_RenderLine - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderLine)
///
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
///
/// See also:
/// - [SDL_RenderLines - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderLines)
///
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
///
/// See also:
/// - [SDL_RenderRect - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderRect)
///
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
///
/// See also:
/// - [SDL_RenderRects - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderRects)
///
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
///
/// See also:
/// - [SDL_RenderFillRect - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderFillRect)
///
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
///
/// See also:
/// - [SDL_RenderFillRects - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderFillRects)
///
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
///
/// See also:
/// - [SDL_RenderTexture - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderTexture)
///
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
///
/// See also:
/// - [SDL_RenderTextureRotated - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderTextureRotated)
///
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
///
/// See also:
/// - [SDL_RenderTextureAffine - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderTextureAffine)
///
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
///
/// See also:
/// - [SDL_RenderTextureTiled - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderTextureTiled)
///
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
///
/// See also:
/// - [SDL_RenderTexture9Grid - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderTexture9Grid)
///
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
///
/// See also:
/// - [SDL_RenderGeometry - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderGeometry)
///
/// {@category render}
bool sdlxRenderGeometry(
  Pointer<SdlRenderer> renderer,
  List<SdlxVertex> vertices, {
  Pointer<SdlTexture>? texture,
  List<int>? indices,
}) {
  if (vertices.isEmpty) {
    return true;
  }
  Pointer<SdlVertex> verticesPointer = nullptr;
  var numVertices = 0;
  Pointer<Int32> indicesPointer = nullptr;
  var numIndices = 0;
  verticesPointer = vertices.calloc();
  numVertices = vertices.length;
  if (indices != null) {
    indicesPointer = ffi.calloc<Int32>(indices.length);
    for (var i = 0; i < indices.length; i++) {
      indicesPointer[i] = indices[i];
    }
    numIndices = indices.length;
  }
  final result = sdlRenderGeometry(
    renderer,
    texture ?? nullptr,
    verticesPointer,
    numVertices,
    indicesPointer,
    numIndices,
  );
  verticesPointer.callocFree();
  if (indicesPointer != nullptr) {
    indicesPointer.callocFree();
  }
  return result;
}

///
/// Render a list of triangles, optionally using a texture and indices into the
/// vertex arrays.
///
/// Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and
/// SDL_SetTextureAlphaMod are ignored).
///
/// \param renderer the rendering context.
/// \param texture (optional) The SDL texture to use.
/// \param xy vertex positions.
/// \param xy_stride byte size to move from one element to the next element.
/// \param color vertex colors (as SDL_FColor).
/// \param color_stride byte size to move from one element to the next element.
/// \param uv vertex normalized texture coordinates.
/// \param uv_stride byte size to move from one element to the next element.
/// \param num_vertices number of vertices.
/// \param indices (optional) An array of indices into the 'vertices' arrays,
/// if NULL all vertices will be rendered in sequential order.
/// \param num_indices number of indices.
/// \param size_indices index size: 1 (byte), 2 (short), 4 (int).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RenderGeometry
/// \sa SDL_SetRenderTextureAddressMode
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenderGeometryRaw(SDL_Renderer *renderer, SDL_Texture *texture, const float *xy, int xy_stride, const SDL_FColor *color, int color_stride, const float *uv, int uv_stride, int num_vertices, const void *indices, int num_indices, int size_indices)
/// ```
///
/// See also:
/// - [SDL_RenderGeometryRaw - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderGeometryRaw)
///
/// {@category render}
bool sdlxRenderGeometryRaw(
  Pointer<SdlRenderer> renderer,
  List<SdlxFPoint> positions, {
  Pointer<SdlTexture>? texture,
  List<SdlxFColor>? colors,
  List<SdlxFPoint>? texCoords,
  List<int>? indices,
}) {
  if (positions.isEmpty) {
    return true;
  }
  final positionsPointer = positions.callocXy();
  Pointer<SdlFColor> colorsPointer = nullptr;
  Pointer<Float> texCoordsPointer = nullptr;
  Pointer<Int32> indicesPointer = nullptr;
  var numIndices = 0;
  if (colors != null) {
    colorsPointer = colors.calloc();
  }
  if (texCoords != null) {
    texCoordsPointer = texCoords.callocXy();
  }
  if (indices != null) {
    numIndices = indices.length;
    indicesPointer = ffi.calloc<Int32>(numIndices);
    indicesPointer.asTypedList(numIndices).setAll(0, indices);
  }
  final result = sdlRenderGeometryRaw(
    renderer,
    texture ?? nullptr,
    positionsPointer,
    sizeOf<Float>() * 2,
    colorsPointer,
    sizeOf<SdlFColor>(),
    texCoordsPointer,
    sizeOf<Float>() * 2,
    positions.length,
    indicesPointer.cast<Void>(),
    numIndices,
    sizeOf<Int32>(),
  );
  positionsPointer.callocFree();
  if (colorsPointer != nullptr) {
    colorsPointer.callocFree();
  }
  if (texCoordsPointer != nullptr) {
    texCoordsPointer.callocFree();
  }
  if (indicesPointer != nullptr) {
    indicesPointer.callocFree();
  }
  return result;
}

///
/// Get the texture addressing mode used in SDL_RenderGeometry().
///
/// \param renderer the rendering context.
/// \param u_mode a pointer filled in with the SDL_TextureAddressMode to use
/// for horizontal texture coordinates in SDL_RenderGeometry(),
/// may be NULL.
/// \param v_mode a pointer filled in with the SDL_TextureAddressMode to use
/// for vertical texture coordinates in SDL_RenderGeometry(), may
/// be NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_SetRenderTextureAddressMode
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderTextureAddressMode(SDL_Renderer *renderer, SDL_TextureAddressMode *u_mode, SDL_TextureAddressMode *v_mode)
/// ```
///
/// See also:
/// - [SDL_GetRenderTextureAddressMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderTextureAddressMode)
///
/// {@category render}
({int uMode, int vMode})? sdlxGetRenderTextureAddressMode(
  Pointer<SdlRenderer> renderer,
) {
  var uMode = 0;
  var vMode = 0;
  final uModePointer = ffi.calloc<Int32>();
  final vModePointer = ffi.calloc<Int32>();
  final result = sdlGetRenderTextureAddressMode(
    renderer,
    uModePointer,
    vModePointer,
  );
  if (result) {
    uMode = uModePointer.value;
    vMode = vModePointer.value;
  }
  uModePointer.callocFree();
  vModePointer.callocFree();
  if (!result) {
    return null;
  }
  return (uMode: uMode, vMode: vMode);
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
///
/// See also:
/// - [SDL_RenderReadPixels - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_RenderReadPixels)
///
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
/// Get VSync of the given renderer.
///
/// \param renderer the renderer to toggle.
/// \param vsync an int filled with the current vertical refresh sync interval.
/// See SDL_SetRenderVSync() for the meaning of the value.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetRenderVSync
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetRenderVSync(SDL_Renderer *renderer, int *vsync)
/// ```
///
/// See also:
/// - [SDL_GetRenderVSync - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetRenderVSync)
///
/// {@category render}
int? sdlxGetRenderVSync(Pointer<SdlRenderer> renderer) {
  var vsync = 0;
  final vsyncPointer = ffi.calloc<Int32>();
  final result = sdlGetRenderVSync(renderer, vsyncPointer);
  if (result) {
    vsync = vsyncPointer.value;
  }
  vsyncPointer.callocFree();
  if (!result) {
    return null;
  }
  return vsync;
}

///
/// Get default texture scale mode of the given renderer.
///
/// \param renderer the renderer to get data from.
/// \param scale_mode a SDL_ScaleMode filled with current default scale mode.
/// See SDL_SetDefaultTextureScaleMode() for the meaning of
/// the value.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should only be called on the main thread.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_SetDefaultTextureScaleMode
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetDefaultTextureScaleMode(SDL_Renderer *renderer, SDL_ScaleMode *scale_mode)
/// ```
///
/// See also:
/// - [SDL_GetDefaultTextureScaleMode - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetDefaultTextureScaleMode)
///
/// {@category render}
int? sdlxGetDefaultTextureScaleMode(Pointer<SdlRenderer> renderer) {
  var scaleMode = 0;
  final scaleModePointer = ffi.calloc<Int32>();
  final result = sdlGetDefaultTextureScaleMode(renderer, scaleModePointer);
  if (result) {
    scaleMode = scaleModePointer.value;
  }
  scaleModePointer.callocFree();
  if (!result) {
    return null;
  }
  return scaleMode;
}

///
/// Create custom GPU render state.
///
/// \param renderer the renderer to use.
/// \param createinfo a struct describing the GPU render state to create.
/// \returns a custom GPU render state or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety This function should be called on the thread that created the
/// renderer.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_SetGPURenderStateFragmentUniforms
/// \sa SDL_SetGPURenderState
/// \sa SDL_DestroyGPURenderState
///
/// ```c
/// extern SDL_DECLSPEC SDL_GPURenderState * SDLCALL SDL_CreateGPURenderState(SDL_Renderer *renderer, const SDL_GPURenderStateCreateInfo *createinfo)
/// ```
///
/// See also:
/// - [SDL_CreateGPURenderState - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CreateGPURenderState)
///
/// {@category render}
Pointer<SdlGpuRenderState> sdlxCreateGpuRenderState(
  Pointer<SdlRenderer> renderer,
  SdlxGpuRenderStateCreateInfo createinfo,
) {
  final createInfoPointer = createinfo.calloc();
  final result = sdlCreateGpuRenderState(renderer, createInfoPointer);
  createInfoPointer.callocAllFree();
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
///
/// See also:
/// - [SDL_SetGPURenderStateSamplerBindings - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateSamplerBindings)
///
/// {@category render}
bool sdlxSetGpuRenderStateSamplerBindings(
  Pointer<SdlGpuRenderState> state,
  List<SdlxGpuTextureSamplerBinding> samplerBindings,
) {
  var result = false;
  if (samplerBindings.isNotEmpty) {
    final samplerBindingsPointer = samplerBindings.calloc();
    result = sdlSetGpuRenderStateSamplerBindings(
      state,
      samplerBindings.length,
      samplerBindingsPointer,
    );
    samplerBindingsPointer.callocFree();
  }
  return result;
}

///
/// Set storage textures variables in a custom GPU render state.
///
/// The data is copied and will be binded using
/// SDL_BindGPUFragmentStorageTextures() during draw call execution.
///
/// \param state the state to modify.
/// \param num_storage_textures The number of storage textures to bind.
/// \param storage_textures Storage textures to bind.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// renderer.
///
/// \since This function is available since SDL 3.6.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPURenderStateStorageTextures(SDL_GPURenderState *state, int num_storage_textures, SDL_GPUTexture *const *storage_textures)
/// ```
///
/// See also:
/// - [SDL_SetGPURenderStateStorageTextures - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateStorageTextures)
///
/// {@category render}
bool sdlxSetGpuRenderStateStorageTextures(
  Pointer<SdlGpuRenderState> state,
  List<Pointer<SdlGpuTexture>> storageTextures,
) {
  var result = false;
  if (storageTextures.isNotEmpty) {
    final storageTexturesPointer = ffi.calloc<Pointer<SdlGpuTexture>>(
      storageTextures.length,
    );
    for (var i = 0; i < storageTextures.length; i++) {
      storageTexturesPointer[i] = storageTextures[i];
    }
    result = sdlSetGpuRenderStateStorageTextures(
      state,
      storageTextures.length,
      storageTexturesPointer,
    );
    storageTexturesPointer.callocFree();
  }
  return result;
}

///
/// Set storage buffers variables in a custom GPU render state.
///
/// The data is copied and will be binded using
/// SDL_BindGPUFragmentStorageBuffers() during draw call execution.
///
/// \param state the state to modify.
/// \param num_storage_buffers The number of storage buffers to bind.
/// \param storage_buffers Storage buffers to bind.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function should be called on the thread that created the
/// renderer.
///
/// \since This function is available since SDL 3.6.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGPURenderStateStorageBuffers(SDL_GPURenderState *state, int num_storage_buffers, SDL_GPUBuffer *const *storage_buffers)
/// ```
///
/// See also:
/// - [SDL_SetGPURenderStateStorageBuffers - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateStorageBuffers)
///
/// {@category render}
bool sdlxSetGpuRenderStateStorageBuffers(
  Pointer<SdlGpuRenderState> state,
  List<Pointer<SdlGpuBuffer>> storageBuffers,
) {
  var result = false;
  if (storageBuffers.isNotEmpty) {
    final storageBuffersPointer = ffi.calloc<Pointer<SdlGpuBuffer>>(
      storageBuffers.length,
    );
    for (var i = 0; i < storageBuffers.length; i++) {
      storageBuffersPointer[i] = storageBuffers[i];
    }
    result = sdlSetGpuRenderStateStorageBuffers(
      state,
      storageBuffers.length,
      storageBuffersPointer,
    );
    storageBuffersPointer.callocFree();
  }
  return result;
}
