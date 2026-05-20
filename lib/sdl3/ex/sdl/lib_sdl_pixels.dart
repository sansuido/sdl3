part of '../../sdl.dart';

///
/// Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
///
/// \param format one of the SDL_PixelFormat values.
/// \param bpp a bits per pixel value; usually 15, 16, or 32.
/// \param Rmask a pointer filled in with the red mask for the format.
/// \param Gmask a pointer filled in with the green mask for the format.
/// \param Bmask a pointer filled in with the blue mask for the format.
/// \param Amask a pointer filled in with the alpha mask for the format.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPixelFormatForMasks
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetMasksForPixelFormat(SDL_PixelFormat format, int *bpp, Uint32 *Rmask, Uint32 *Gmask, Uint32 *Bmask, Uint32 *Amask)
/// ```
/// {@category pixels}
bool sdlxGetMasksForPixelFormat(int format, SdlxMasks masks) {
  final bppPointer = ffi.calloc<Int32>();
  final rmaskPointer = ffi.calloc<Uint32>();
  final gmaskPointer = ffi.calloc<Uint32>();
  final bmaskPointer = ffi.calloc<Uint32>();
  final amaskPointer = ffi.calloc<Uint32>();
  final result = sdlGetMasksForPixelFormat(
    format,
    bppPointer,
    rmaskPointer,
    gmaskPointer,
    bmaskPointer,
    amaskPointer,
  );
  if (result) {
    masks
      ..bpp = bppPointer.value
      ..rmask = rmaskPointer.value
      ..gmask = gmaskPointer.value
      ..bmask = bmaskPointer.value
      ..amask = amaskPointer.value;
  }
  bppPointer.callocFree();
  rmaskPointer.callocFree();
  gmaskPointer.callocFree();
  bmaskPointer.callocFree();
  amaskPointer.callocFree();
  return result;
}

///
/// Convert a bpp value and RGBA masks to an enumerated pixel format.
///
/// This will return `SDL_PIXELFORMAT_UNKNOWN` if the conversion wasn't
/// possible.
///
/// \param bpp a bits per pixel value; usually 15, 16, or 32.
/// \param Rmask the red mask for the format.
/// \param Gmask the green mask for the format.
/// \param Bmask the blue mask for the format.
/// \param Amask the alpha mask for the format.
/// \returns the SDL_PixelFormat value corresponding to the format masks, or
/// SDL_PIXELFORMAT_UNKNOWN if there isn't a match.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetMasksForPixelFormat
///
/// ```c
/// extern SDL_DECLSPEC SDL_PixelFormat SDLCALL SDL_GetPixelFormatForMasks(int bpp, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask)
/// ```
/// {@category pixels}
int sdlxGetPixelFormatForMasks(SdlxMasks masks) => sdlGetPixelFormatForMasks(
  masks.bpp,
  masks.rmask,
  masks.gmask,
  masks.bmask,
  masks.amask,
);

///
/// Set a range of colors in a palette.
///
/// \param palette the SDL_Palette structure to modify.
/// \param colors an array of SDL_Color structures to copy into the palette.
/// \param firstcolor the index of the first palette entry to modify.
/// \param ncolors the number of entries to modify.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread, as long as
/// the palette is not modified or destroyed in another thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetPaletteColors(SDL_Palette *palette, const SDL_Color *colors, int firstcolor, int ncolors)
/// ```
/// {@category pixels}
bool sdlxSetPaletteColors(
  Pointer<SdlPalette> palette,
  List<SdlxColor> colors,
  int firstcolor,
) {
  final colorsPointer = ffi.calloc<SdlColor>(colors.length);
  for (var i = 0; i < colors.length; i++) {
    colorsPointer[i].r = colors[i].r;
    colorsPointer[i].g = colors[i].g;
    colorsPointer[i].b = colors[i].b;
    colorsPointer[i].a = colors[i].a;
  }
  final result = sdlSetPaletteColors(
    palette,
    colorsPointer,
    firstcolor,
    colors.length,
  );
  colorsPointer.callocFree();
  return result;
}

///
/// Get RGB values from a pixel in the specified format.
///
/// This function uses the entire 8-bit [0..255] range when converting color
/// components from pixel formats with less than 8-bits per RGB component
/// (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff,
/// 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
///
/// \param pixelvalue a pixel value.
/// \param format a pointer to SDL_PixelFormatDetails describing the pixel
/// format.
/// \param palette an optional palette for indexed formats, may be NULL.
/// \param r a pointer filled in with the red component, may be NULL.
/// \param g a pointer filled in with the green component, may be NULL.
/// \param b a pointer filled in with the blue component, may be NULL.
///
/// \threadsafety It is safe to call this function from any thread, as long as
/// the palette is not modified.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPixelFormatDetails
/// \sa SDL_GetRGBA
/// \sa SDL_MapRGB
/// \sa SDL_MapRGBA
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GetRGB(Uint32 pixelvalue, const SDL_PixelFormatDetails *format, const SDL_Palette *palette, Uint8 *r, Uint8 *g, Uint8 *b)
/// ```
/// {@category pixels}
void sdlxGetRgb(
  int pixelvalue,
  Pointer<SdlPixelFormatDetails> format,
  Pointer<SdlPalette> palette,
  SdlxColor color,
) {
  final rPointer = ffi.calloc<Uint8>();
  final gPointer = ffi.calloc<Uint8>();
  final bPointer = ffi.calloc<Uint8>();
  sdlGetRgb(pixelvalue, format, palette, rPointer, gPointer, bPointer);
  color
    ..r = rPointer.value
    ..g = gPointer.value
    ..b = bPointer.value;
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
}

///
/// Get RGBA values from a pixel in the specified format.
///
/// This function uses the entire 8-bit [0..255] range when converting color
/// components from pixel formats with less than 8-bits per RGB component
/// (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff,
/// 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
///
/// If the format has no alpha component, the alpha will be returned as 0xff
/// (100% opaque).
///
/// \param pixelvalue a pixel value.
/// \param format a pointer to SDL_PixelFormatDetails describing the pixel
/// format.
/// \param palette an optional palette for indexed formats, may be NULL.
/// \param r a pointer filled in with the red component, may be NULL.
/// \param g a pointer filled in with the green component, may be NULL.
/// \param b a pointer filled in with the blue component, may be NULL.
/// \param a a pointer filled in with the alpha component, may be NULL.
///
/// \threadsafety It is safe to call this function from any thread, as long as
/// the palette is not modified.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPixelFormatDetails
/// \sa SDL_GetRGB
/// \sa SDL_MapRGB
/// \sa SDL_MapRGBA
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GetRGBA(Uint32 pixelvalue, const SDL_PixelFormatDetails *format, const SDL_Palette *palette, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a)
/// ```
/// {@category pixels}
void sdlxGetRgba(
  int pixelvalue,
  Pointer<SdlPixelFormatDetails> format,
  Pointer<SdlPalette> palette,
  SdlxColor color,
) {
  final rPointer = ffi.calloc<Uint8>();
  final gPointer = ffi.calloc<Uint8>();
  final bPointer = ffi.calloc<Uint8>();
  final aPointer = ffi.calloc<Uint8>();
  sdlGetRgba(
    pixelvalue,
    format,
    palette,
    rPointer,
    gPointer,
    bPointer,
    aPointer,
  );
  color
    ..r = rPointer.value
    ..g = gPointer.value
    ..b = bPointer.value
    ..a = aPointer.value;
  rPointer.callocFree();
  gPointer.callocFree();
  bPointer.callocFree();
  aPointer.callocFree();
}
