// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Get the human readable name of a pixel format.
///
/// \param format the pixel format to query
/// \returns the human readable name of the specified pixel format or
/// `SDL_PIXELFORMAT_UNKNOWN` if the format isn't recognized.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC const char* SDLCALL SDL_GetPixelFormatName(SDL_PixelFormatEnum format)
/// ```
String? sdlGetPixelFormatName(int format) {
  final sdlGetPixelFormatNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 format),
      Pointer<Utf8> Function(int format)>('SDL_GetPixelFormatName');
  final result = sdlGetPixelFormatNameLookupFunction(format);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
///
/// \param format one of the SDL_PixelFormatEnum values
/// \param bpp a bits per pixel value; usually 15, 16, or 32
/// \param Rmask a pointer filled in with the red mask for the format
/// \param Gmask a pointer filled in with the green mask for the format
/// \param Bmask a pointer filled in with the blue mask for the format
/// \param Amask a pointer filled in with the alpha mask for the format
/// \returns SDL_TRUE on success or SDL_FALSE if the conversion wasn't
/// possible; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPixelFormatEnumForMasks
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_GetMasksForPixelFormatEnum(SDL_PixelFormatEnum format, int *bpp, Uint32 * Rmask, Uint32 * Gmask, Uint32 * Bmask, Uint32 * Amask)
/// ```
bool sdlGetMasksForPixelFormatEnum(
    int format,
    Pointer<Int32> bpp,
    Pointer<Uint32> rmask,
    Pointer<Uint32> gmask,
    Pointer<Uint32> bmask,
    Pointer<Uint32> amask) {
  final sdlGetMasksForPixelFormatEnumLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 format, Pointer<Int32> bpp, Pointer<Uint32> rmask,
          Pointer<Uint32> gmask, Pointer<Uint32> bmask, Pointer<Uint32> amask),
      int Function(
          int format,
          Pointer<Int32> bpp,
          Pointer<Uint32> rmask,
          Pointer<Uint32> gmask,
          Pointer<Uint32> bmask,
          Pointer<Uint32> amask)>('SDL_GetMasksForPixelFormatEnum');
  return sdlGetMasksForPixelFormatEnumLookupFunction(
          format, bpp, rmask, gmask, bmask, amask) ==
      1;
}

///
/// Convert a bpp value and RGBA masks to an enumerated pixel format.
///
/// This will return `SDL_PIXELFORMAT_UNKNOWN` if the conversion wasn't
/// possible.
///
/// \param bpp a bits per pixel value; usually 15, 16, or 32
/// \param Rmask the red mask for the format
/// \param Gmask the green mask for the format
/// \param Bmask the blue mask for the format
/// \param Amask the alpha mask for the format
/// \returns the SDL_PixelFormatEnum value corresponding to the format masks,
/// or SDL_PIXELFORMAT_UNKNOWN if there isn't a match.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetMasksForPixelFormatEnum
///
/// ```c
/// extern DECLSPEC SDL_PixelFormatEnum SDLCALL SDL_GetPixelFormatEnumForMasks(int bpp, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask)
/// ```
int sdlGetPixelFormatEnumForMasks(
    int bpp, int rmask, int gmask, int bmask, int amask) {
  final sdlGetPixelFormatEnumForMasksLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Int32 bpp, Uint32 rmask, Uint32 gmask, Uint32 bmask, Uint32 amask),
      int Function(int bpp, int rmask, int gmask, int bmask,
          int amask)>('SDL_GetPixelFormatEnumForMasks');
  return sdlGetPixelFormatEnumForMasksLookupFunction(
      bpp, rmask, gmask, bmask, amask);
}

///
/// Create an SDL_PixelFormat structure corresponding to a pixel format.
///
/// Returned structure may come from a shared global cache (i.e. not newly
/// allocated), and hence should not be modified, especially the palette. Weird
/// errors such as `Blit combination not supported` may occur.
///
/// \param pixel_format one of the SDL_PixelFormatEnum values
/// \returns the new SDL_PixelFormat structure or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroyPixelFormat
///
/// ```c
/// extern DECLSPEC SDL_PixelFormat * SDLCALL SDL_CreatePixelFormat(SDL_PixelFormatEnum pixel_format)
/// ```
Pointer<SdlPixelFormat> sdlCreatePixelFormat(int pixelFormat) {
  final sdlCreatePixelFormatLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlPixelFormat> Function(Int32 pixelFormat),
      Pointer<SdlPixelFormat> Function(
          int pixelFormat)>('SDL_CreatePixelFormat');
  return sdlCreatePixelFormatLookupFunction(pixelFormat);
}

///
/// Free an SDL_PixelFormat structure allocated by SDL_CreatePixelFormat().
///
/// \param format the SDL_PixelFormat structure to free
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreatePixelFormat
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroyPixelFormat(SDL_PixelFormat *format)
/// ```
void sdlDestroyPixelFormat(Pointer<SdlPixelFormat> format) {
  final sdlDestroyPixelFormatLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlPixelFormat> format),
      void Function(Pointer<SdlPixelFormat> format)>('SDL_DestroyPixelFormat');
  return sdlDestroyPixelFormatLookupFunction(format);
}

///
/// Create a palette structure with the specified number of color entries.
///
/// The palette entries are initialized to white.
///
/// \param ncolors represents the number of color entries in the color palette
/// \returns a new SDL_Palette structure on success or NULL on failure (e.g. if
/// there wasn't enough memory); call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroyPalette
///
/// ```c
/// extern DECLSPEC SDL_Palette *SDLCALL SDL_CreatePalette(int ncolors)
/// ```
Pointer<SdlPalette> sdlCreatePalette(int ncolors) {
  final sdlCreatePaletteLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlPalette> Function(Int32 ncolors),
      Pointer<SdlPalette> Function(int ncolors)>('SDL_CreatePalette');
  return sdlCreatePaletteLookupFunction(ncolors);
}

///
/// Set the palette for a pixel format structure.
///
/// \param format the SDL_PixelFormat structure that will use the palette
/// \param palette the SDL_Palette structure that will be used
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreatePalette
/// \sa SDL_DestroyPalette
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetPixelFormatPalette(SDL_PixelFormat * format, SDL_Palette *palette)
/// ```
int sdlSetPixelFormatPalette(
    Pointer<SdlPixelFormat> format, Pointer<SdlPalette> palette) {
  final sdlSetPixelFormatPaletteLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlPixelFormat> format, Pointer<SdlPalette> palette),
      int Function(Pointer<SdlPixelFormat> format,
          Pointer<SdlPalette> palette)>('SDL_SetPixelFormatPalette');
  return sdlSetPixelFormatPaletteLookupFunction(format, palette);
}

///
/// Set a range of colors in a palette.
///
/// \param palette the SDL_Palette structure to modify
/// \param colors an array of SDL_Color structures to copy into the palette
/// \param firstcolor the index of the first palette entry to modify
/// \param ncolors the number of entries to modify
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreatePalette
/// \sa SDL_CreateSurface
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetPaletteColors(SDL_Palette * palette, const SDL_Color * colors, int firstcolor, int ncolors)
/// ```
int sdlSetPaletteColors(Pointer<SdlPalette> palette, Pointer<SdlColor> colors,
    int firstcolor, int ncolors) {
  final sdlSetPaletteColorsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlPalette> palette, Pointer<SdlColor> colors,
          Int32 firstcolor, Int32 ncolors),
      int Function(Pointer<SdlPalette> palette, Pointer<SdlColor> colors,
          int firstcolor, int ncolors)>('SDL_SetPaletteColors');
  return sdlSetPaletteColorsLookupFunction(
      palette, colors, firstcolor, ncolors);
}

///
/// Free a palette created with SDL_CreatePalette().
///
/// \param palette the SDL_Palette structure to be freed
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreatePalette
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroyPalette(SDL_Palette * palette)
/// ```
void sdlDestroyPalette(Pointer<SdlPalette> palette) {
  final sdlDestroyPaletteLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlPalette> palette),
      void Function(Pointer<SdlPalette> palette)>('SDL_DestroyPalette');
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
/// \param format an SDL_PixelFormat structure describing the pixel format
/// \param r the red component of the pixel in the range 0-255
/// \param g the green component of the pixel in the range 0-255
/// \param b the blue component of the pixel in the range 0-255
/// \returns a pixel value
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetRGB
/// \sa SDL_GetRGBA
/// \sa SDL_MapRGBA
///
/// ```c
/// extern DECLSPEC Uint32 SDLCALL SDL_MapRGB(const SDL_PixelFormat * format, Uint8 r, Uint8 g, Uint8 b)
/// ```
int sdlMapRgb(Pointer<SdlPixelFormat> format, int r, int g, int b) {
  final sdlMapRgbLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<SdlPixelFormat> format, Uint8 r, Uint8 g, Uint8 b),
      int Function(
          Pointer<SdlPixelFormat> format, int r, int g, int b)>('SDL_MapRGB');
  return sdlMapRgbLookupFunction(format, r, g, b);
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
/// \param format an SDL_PixelFormat structure describing the format of the
/// pixel
/// \param r the red component of the pixel in the range 0-255
/// \param g the green component of the pixel in the range 0-255
/// \param b the blue component of the pixel in the range 0-255
/// \param a the alpha component of the pixel in the range 0-255
/// \returns a pixel value
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetRGB
/// \sa SDL_GetRGBA
/// \sa SDL_MapRGB
///
/// ```c
/// extern DECLSPEC Uint32 SDLCALL SDL_MapRGBA(const SDL_PixelFormat * format, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
/// ```
int sdlMapRgba(Pointer<SdlPixelFormat> format, int r, int g, int b, int a) {
  final sdlMapRgbaLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Pointer<SdlPixelFormat> format, Uint8 r, Uint8 g, Uint8 b, Uint8 a),
      int Function(Pointer<SdlPixelFormat> format, int r, int g, int b,
          int a)>('SDL_MapRGBA');
  return sdlMapRgbaLookupFunction(format, r, g, b, a);
}

///
/// Get RGB values from a pixel in the specified format.
///
/// This function uses the entire 8-bit [0..255] range when converting color
/// components from pixel formats with less than 8-bits per RGB component
/// (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff,
/// 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
///
/// \param pixel a pixel value
/// \param format an SDL_PixelFormat structure describing the format of the
/// pixel
/// \param r a pointer filled in with the red component
/// \param g a pointer filled in with the green component
/// \param b a pointer filled in with the blue component
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetRGBA
/// \sa SDL_MapRGB
/// \sa SDL_MapRGBA
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_GetRGB(Uint32 pixel, const SDL_PixelFormat * format, Uint8 * r, Uint8 * g, Uint8 * b)
/// ```
void sdlGetRgb(int pixel, Pointer<SdlPixelFormat> format, Pointer<Uint8> r,
    Pointer<Uint8> g, Pointer<Uint8> b) {
  final sdlGetRgbLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint32 pixel, Pointer<SdlPixelFormat> format,
          Pointer<Uint8> r, Pointer<Uint8> g, Pointer<Uint8> b),
      void Function(int pixel, Pointer<SdlPixelFormat> format, Pointer<Uint8> r,
          Pointer<Uint8> g, Pointer<Uint8> b)>('SDL_GetRGB');
  return sdlGetRgbLookupFunction(pixel, format, r, g, b);
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
/// \param pixel a pixel value
/// \param format an SDL_PixelFormat structure describing the format of the
/// pixel
/// \param r a pointer filled in with the red component
/// \param g a pointer filled in with the green component
/// \param b a pointer filled in with the blue component
/// \param a a pointer filled in with the alpha component
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetRGB
/// \sa SDL_MapRGB
/// \sa SDL_MapRGBA
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_GetRGBA(Uint32 pixel, const SDL_PixelFormat * format, Uint8 * r, Uint8 * g, Uint8 * b, Uint8 * a)
/// ```
void sdlGetRgba(int pixel, Pointer<SdlPixelFormat> format, Pointer<Uint8> r,
    Pointer<Uint8> g, Pointer<Uint8> b, Pointer<Uint8> a) {
  final sdlGetRgbaLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Uint32 pixel,
          Pointer<SdlPixelFormat> format,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a),
      void Function(int pixel, Pointer<SdlPixelFormat> format, Pointer<Uint8> r,
          Pointer<Uint8> g, Pointer<Uint8> b, Pointer<Uint8> a)>('SDL_GetRGBA');
  return sdlGetRgbaLookupFunction(pixel, format, r, g, b, a);
}
