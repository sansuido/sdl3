// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

///
/// Get the human readable name of a pixel format.
///
/// \param format the pixel format to query.
/// \returns the human readable name of the specified pixel format or
/// "SDL_PIXELFORMAT_UNKNOWN" if the format isn't recognized.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetPixelFormatName(SDL_PixelFormat format)
/// ```
/// {@category pixels}
String? sdlGetPixelFormatName(int format) {
  final sdlGetPixelFormatNameLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Utf8> Function(Int32 format),
        Pointer<Utf8> Function(int format)
      >('SDL_GetPixelFormatName');
  final result = sdlGetPixelFormatNameLookupFunction(format);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

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
bool sdlGetMasksForPixelFormat(
  int format,
  Pointer<Int32> bpp,
  Pointer<Uint32> rmask,
  Pointer<Uint32> gmask,
  Pointer<Uint32> bmask,
  Pointer<Uint32> amask,
) {
  final sdlGetMasksForPixelFormatLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Int32 format,
          Pointer<Int32> bpp,
          Pointer<Uint32> rmask,
          Pointer<Uint32> gmask,
          Pointer<Uint32> bmask,
          Pointer<Uint32> amask,
        ),
        int Function(
          int format,
          Pointer<Int32> bpp,
          Pointer<Uint32> rmask,
          Pointer<Uint32> gmask,
          Pointer<Uint32> bmask,
          Pointer<Uint32> amask,
        )
      >('SDL_GetMasksForPixelFormat');
  return sdlGetMasksForPixelFormatLookupFunction(
        format,
        bpp,
        rmask,
        gmask,
        bmask,
        amask,
      ) ==
      1;
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
int sdlGetPixelFormatForMasks(
  int bpp,
  int rmask,
  int gmask,
  int bmask,
  int amask,
) {
  final sdlGetPixelFormatForMasksLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(
          Int32 bpp,
          Uint32 rmask,
          Uint32 gmask,
          Uint32 bmask,
          Uint32 amask,
        ),
        int Function(int bpp, int rmask, int gmask, int bmask, int amask)
      >('SDL_GetPixelFormatForMasks');
  return sdlGetPixelFormatForMasksLookupFunction(
    bpp,
    rmask,
    gmask,
    bmask,
    amask,
  );
}

///
/// Create an SDL_PixelFormatDetails structure corresponding to a pixel format.
///
/// Returned structure may come from a shared global cache (i.e. not newly
/// allocated), and hence should not be modified, especially the palette. Weird
/// errors such as `Blit combination not supported` may occur.
///
/// \param format one of the SDL_PixelFormat values.
/// \returns a pointer to a SDL_PixelFormatDetails structure or NULL on
/// failure; call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC const SDL_PixelFormatDetails * SDLCALL SDL_GetPixelFormatDetails(SDL_PixelFormat format)
/// ```
/// {@category pixels}
Pointer<SdlPixelFormatDetails> sdlGetPixelFormatDetails(int format) {
  final sdlGetPixelFormatDetailsLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlPixelFormatDetails> Function(Int32 format),
        Pointer<SdlPixelFormatDetails> Function(int format)
      >('SDL_GetPixelFormatDetails');
  return sdlGetPixelFormatDetailsLookupFunction(format);
}

///
/// Create a palette structure with the specified number of color entries.
///
/// The palette entries are initialized to white.
///
/// \param ncolors represents the number of color entries in the color palette.
/// \returns a new SDL_Palette structure on success or NULL on failure (e.g. if
/// there wasn't enough memory); call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DestroyPalette
/// \sa SDL_SetPaletteColors
/// \sa SDL_SetSurfacePalette
///
/// ```c
/// extern SDL_DECLSPEC SDL_Palette * SDLCALL SDL_CreatePalette(int ncolors)
/// ```
/// {@category pixels}
Pointer<SdlPalette> sdlCreatePalette(int ncolors) {
  final sdlCreatePaletteLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlPalette> Function(Int32 ncolors),
        Pointer<SdlPalette> Function(int ncolors)
      >('SDL_CreatePalette');
  return sdlCreatePaletteLookupFunction(ncolors);
}

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
bool sdlSetPaletteColors(
  Pointer<SdlPalette> palette,
  Pointer<SdlColor> colors,
  int firstcolor,
  int ncolors,
) {
  final sdlSetPaletteColorsLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlPalette> palette,
          Pointer<SdlColor> colors,
          Int32 firstcolor,
          Int32 ncolors,
        ),
        int Function(
          Pointer<SdlPalette> palette,
          Pointer<SdlColor> colors,
          int firstcolor,
          int ncolors,
        )
      >('SDL_SetPaletteColors');
  return sdlSetPaletteColorsLookupFunction(
        palette,
        colors,
        firstcolor,
        ncolors,
      ) ==
      1;
}

///
/// Free a palette created with SDL_CreatePalette().
///
/// \param palette the SDL_Palette structure to be freed.
///
/// \threadsafety It is safe to call this function from any thread, as long as
/// the palette is not modified or destroyed in another thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreatePalette
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyPalette(SDL_Palette *palette)
/// ```
/// {@category pixels}
void sdlDestroyPalette(Pointer<SdlPalette> palette) {
  final sdlDestroyPaletteLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlPalette> palette),
        void Function(Pointer<SdlPalette> palette)
      >('SDL_DestroyPalette');
  return sdlDestroyPaletteLookupFunction(palette);
}

///
/// Map an RGB triple to an opaque pixel value for a given pixel format.
///
/// This function maps the RGB color value to the specified pixel format and
/// returns the pixel value best approximating the given RGB color value for
/// the given pixel format.
///
/// If the format has a palette (8-bit) the index of the closest matching color
/// in the palette will be returned.
///
/// If the specified pixel format has an alpha component it will be returned as
/// all 1 bits (fully opaque).
///
/// If the pixel format bpp (color depth) is less than 32-bpp then the unused
/// upper bits of the return value can safely be ignored (e.g., with a 16-bpp
/// format the return value can be assigned to a Uint16, and similarly a Uint8
/// for an 8-bpp format).
///
/// \param format a pointer to SDL_PixelFormatDetails describing the pixel
/// format.
/// \param palette an optional palette for indexed formats, may be NULL.
/// \param r the red component of the pixel in the range 0-255.
/// \param g the green component of the pixel in the range 0-255.
/// \param b the blue component of the pixel in the range 0-255.
/// \returns a pixel value.
///
/// \threadsafety It is safe to call this function from any thread, as long as
/// the palette is not modified.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPixelFormatDetails
/// \sa SDL_GetRGB
/// \sa SDL_MapRGBA
/// \sa SDL_MapSurfaceRGB
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_MapRGB(const SDL_PixelFormatDetails *format, const SDL_Palette *palette, Uint8 r, Uint8 g, Uint8 b)
/// ```
/// {@category pixels}
int sdlMapRgb(
  Pointer<SdlPixelFormatDetails> format,
  Pointer<SdlPalette> palette,
  int r,
  int g,
  int b,
) {
  final sdlMapRgbLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(
          Pointer<SdlPixelFormatDetails> format,
          Pointer<SdlPalette> palette,
          Uint8 r,
          Uint8 g,
          Uint8 b,
        ),
        int Function(
          Pointer<SdlPixelFormatDetails> format,
          Pointer<SdlPalette> palette,
          int r,
          int g,
          int b,
        )
      >('SDL_MapRGB');
  return sdlMapRgbLookupFunction(format, palette, r, g, b);
}

///
/// Map an RGBA quadruple to a pixel value for a given pixel format.
///
/// This function maps the RGBA color value to the specified pixel format and
/// returns the pixel value best approximating the given RGBA color value for
/// the given pixel format.
///
/// If the specified pixel format has no alpha component the alpha value will
/// be ignored (as it will be in formats with a palette).
///
/// If the format has a palette (8-bit) the index of the closest matching color
/// in the palette will be returned.
///
/// If the pixel format bpp (color depth) is less than 32-bpp then the unused
/// upper bits of the return value can safely be ignored (e.g., with a 16-bpp
/// format the return value can be assigned to a Uint16, and similarly a Uint8
/// for an 8-bpp format).
///
/// \param format a pointer to SDL_PixelFormatDetails describing the pixel
/// format.
/// \param palette an optional palette for indexed formats, may be NULL.
/// \param r the red component of the pixel in the range 0-255.
/// \param g the green component of the pixel in the range 0-255.
/// \param b the blue component of the pixel in the range 0-255.
/// \param a the alpha component of the pixel in the range 0-255.
/// \returns a pixel value.
///
/// \threadsafety It is safe to call this function from any thread, as long as
/// the palette is not modified.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetPixelFormatDetails
/// \sa SDL_GetRGBA
/// \sa SDL_MapRGB
/// \sa SDL_MapSurfaceRGBA
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_MapRGBA(const SDL_PixelFormatDetails *format, const SDL_Palette *palette, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
/// ```
/// {@category pixels}
int sdlMapRgba(
  Pointer<SdlPixelFormatDetails> format,
  Pointer<SdlPalette> palette,
  int r,
  int g,
  int b,
  int a,
) {
  final sdlMapRgbaLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(
          Pointer<SdlPixelFormatDetails> format,
          Pointer<SdlPalette> palette,
          Uint8 r,
          Uint8 g,
          Uint8 b,
          Uint8 a,
        ),
        int Function(
          Pointer<SdlPixelFormatDetails> format,
          Pointer<SdlPalette> palette,
          int r,
          int g,
          int b,
          int a,
        )
      >('SDL_MapRGBA');
  return sdlMapRgbaLookupFunction(format, palette, r, g, b, a);
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
void sdlGetRgb(
  int pixelvalue,
  Pointer<SdlPixelFormatDetails> format,
  Pointer<SdlPalette> palette,
  Pointer<Uint8> r,
  Pointer<Uint8> g,
  Pointer<Uint8> b,
) {
  final sdlGetRgbLookupFunction = _libSdl
      .lookupFunction<
        Void Function(
          Uint32 pixelvalue,
          Pointer<SdlPixelFormatDetails> format,
          Pointer<SdlPalette> palette,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
        ),
        void Function(
          int pixelvalue,
          Pointer<SdlPixelFormatDetails> format,
          Pointer<SdlPalette> palette,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
        )
      >('SDL_GetRGB');
  return sdlGetRgbLookupFunction(pixelvalue, format, palette, r, g, b);
}

///
/// Get RGBA values from a pixel in the specified format.
///
/// This function uses the entire 8-bit [0..255] range when converting color
/// components from pixel formats with less than 8-bits per RGB component
/// (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff,
/// 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
///
/// If the surface has no alpha component, the alpha will be returned as 0xff
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
void sdlGetRgba(
  int pixelvalue,
  Pointer<SdlPixelFormatDetails> format,
  Pointer<SdlPalette> palette,
  Pointer<Uint8> r,
  Pointer<Uint8> g,
  Pointer<Uint8> b,
  Pointer<Uint8> a,
) {
  final sdlGetRgbaLookupFunction = _libSdl
      .lookupFunction<
        Void Function(
          Uint32 pixelvalue,
          Pointer<SdlPixelFormatDetails> format,
          Pointer<SdlPalette> palette,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a,
        ),
        void Function(
          int pixelvalue,
          Pointer<SdlPixelFormatDetails> format,
          Pointer<SdlPalette> palette,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a,
        )
      >('SDL_GetRGBA');
  return sdlGetRgbaLookupFunction(pixelvalue, format, palette, r, g, b, a);
}
