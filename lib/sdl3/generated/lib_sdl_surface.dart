// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Allocate a new RGB surface with a specific pixel format.
///
/// \param width the width of the surface
/// \param height the height of the surface
/// \param format the SDL_PixelFormatEnum for the new surface's pixel format.
/// \returns the new SDL_Surface structure that is created or NULL if it fails;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateSurfaceFrom
/// \sa SDL_DestroySurface
///
/// ```c
/// extern DECLSPEC SDL_Surface *SDLCALL SDL_CreateSurface(int width, int height, SDL_PixelFormatEnum format)
/// ```
Pointer<SdlSurface> sdlCreateSurface(int width, int height, int format) {
  final sdlCreateSurfaceLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSurface> Function(Int32 width, Int32 height, Int32 format),
      Pointer<SdlSurface> Function(
          int width, int height, int format)>('SDL_CreateSurface');
  return sdlCreateSurfaceLookupFunction(width, height, format);
}

///
/// Allocate a new RGB surface with a specific pixel format and existing pixel
/// data.
///
/// No copy is made of the pixel data. Pixel data is not managed automatically;
/// you must free the surface before you free the pixel data.
///
/// Pitch is the offset in bytes from one row of pixels to the next, e.g.
/// `width*4` for `SDL_PIXELFORMAT_RGBA8888`.
///
/// You may pass NULL for pixels and 0 for pitch to create a surface that you
/// will fill in with valid values later.
///
/// \param pixels a pointer to existing pixel data
/// \param width the width of the surface
/// \param height the height of the surface
/// \param pitch the number of bytes between each row, including padding
/// \param format the SDL_PixelFormatEnum for the new surface's pixel format.
/// \returns the new SDL_Surface structure that is created or NULL if it fails;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateSurface
/// \sa SDL_DestroySurface
///
/// ```c
/// extern DECLSPEC SDL_Surface *SDLCALL SDL_CreateSurfaceFrom(void *pixels, int width, int height, int pitch, SDL_PixelFormatEnum format)
/// ```
Pointer<SdlSurface> sdlCreateSurfaceFrom(
    Pointer<NativeType> pixels, int width, int height, int pitch, int format) {
  final sdlCreateSurfaceFromLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSurface> Function(Pointer<NativeType> pixels, Int32 width,
          Int32 height, Int32 pitch, Int32 format),
      Pointer<SdlSurface> Function(Pointer<NativeType> pixels, int width,
          int height, int pitch, int format)>('SDL_CreateSurfaceFrom');
  return sdlCreateSurfaceFromLookupFunction(
      pixels, width, height, pitch, format);
}

///
/// Free an RGB surface.
///
/// It is safe to pass NULL to this function.
///
/// \param surface the SDL_Surface to free.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateSurface
/// \sa SDL_CreateSurfaceFrom
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroySurface(SDL_Surface *surface)
/// ```
void sdlDestroySurface(Pointer<SdlSurface> surface) {
  final sdlDestroySurfaceLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlSurface> surface),
      void Function(Pointer<SdlSurface> surface)>('SDL_DestroySurface');
  return sdlDestroySurfaceLookupFunction(surface);
}

///
/// Get the properties associated with a surface.
///
/// The following properties are understood by SDL:
///
/// - `SDL_PROP_SURFACE_COLORSPACE_NUMBER`: an SDL_ColorSpace value describing
/// the surface colorspace, defaults to SDL_COLORSPACE_SRGB_LINEAR for
/// floating point formats, SDL_COLORSPACE_HDR10 for 10-bit formats,
/// SDL_COLORSPACE_SRGB for other RGB surfaces and SDL_COLORSPACE_BT709_FULL
/// for YUV surfaces.
/// - `SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating point
/// surfaces, this defines the value of 100% diffuse white, with higher
/// values being displayed in the High Dynamic Range headroom. This defaults
/// to 203 for HDR10 surfaces and 1.0 for floating point surfaces.
/// - `SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT`: for HDR10 and floating point
/// surfaces, this defines the maximum dynamic range used by the content, in
/// terms of the SDR white point. This defaults to 0.0, which disables tone
/// mapping.
/// - `SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING`: the tone mapping operator
/// used when compressing from a surface with high dynamic range to another
/// with lower dynamic range. Currently this supports "chrome", which uses
/// the same tone mapping that Chrome uses for HDR content, the form "*=N",
/// where N is a floating point scale factor applied in linear space, and
/// "none", which disables tone mapping. This defaults to "chrome".
///
/// \param surface the SDL_Surface structure to query
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern DECLSPEC SDL_PropertiesID SDLCALL SDL_GetSurfaceProperties(SDL_Surface *surface)
/// ```
int sdlGetSurfaceProperties(Pointer<SdlSurface> surface) {
  final sdlGetSurfacePropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlSurface> surface),
      int Function(Pointer<SdlSurface> surface)>('SDL_GetSurfaceProperties');
  return sdlGetSurfacePropertiesLookupFunction(surface);
}

///
/// Set the colorspace used by a surface.
///
/// Setting the colorspace doesn't change the pixels, only how they are
/// interpreted in color operations.
///
/// \param surface the SDL_Surface structure to update
/// \param colorspace an SDL_ColorSpace value describing the surface colorspace
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetSurfaceColorspace(SDL_Surface *surface, SDL_Colorspace colorspace)
/// ```
int sdlSetSurfaceColorspace(Pointer<SdlSurface> surface, int colorspace) {
  final sdlSetSurfaceColorspaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Int32 colorspace),
      int Function(Pointer<SdlSurface> surface,
          int colorspace)>('SDL_SetSurfaceColorspace');
  return sdlSetSurfaceColorspaceLookupFunction(surface, colorspace);
}

///
/// Get the colorspace used by a surface.
///
/// The colorspace defaults to SDL_COLORSPACE_SRGB_LINEAR for floating point
/// formats, SDL_COLORSPACE_HDR10 for 10-bit formats, SDL_COLORSPACE_SRGB for
/// other RGB surfaces and SDL_COLORSPACE_BT709_FULL for YUV textures.
///
/// \param surface the SDL_Surface structure to query
/// \param colorspace a pointer filled in with an SDL_ColorSpace value
/// describing the surface colorspace
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetSurfaceColorspace(SDL_Surface *surface, SDL_Colorspace *colorspace)
/// ```
int sdlGetSurfaceColorspace(
    Pointer<SdlSurface> surface, Pointer<Int32> colorspace) {
  final sdlGetSurfaceColorspaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<Int32> colorspace),
      int Function(Pointer<SdlSurface> surface,
          Pointer<Int32> colorspace)>('SDL_GetSurfaceColorspace');
  return sdlGetSurfaceColorspaceLookupFunction(surface, colorspace);
}

///
/// Set the palette used by a surface.
///
/// A single palette can be shared with many surfaces.
///
/// \param surface the SDL_Surface structure to update
/// \param palette the SDL_Palette structure to use
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetSurfacePalette(SDL_Surface *surface, SDL_Palette *palette)
/// ```
int sdlSetSurfacePalette(
    Pointer<SdlSurface> surface, Pointer<SdlPalette> palette) {
  final sdlSetSurfacePaletteLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<SdlPalette> palette),
      int Function(Pointer<SdlSurface> surface,
          Pointer<SdlPalette> palette)>('SDL_SetSurfacePalette');
  return sdlSetSurfacePaletteLookupFunction(surface, palette);
}

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
/// \param surface the SDL_Surface structure to be locked
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_MUSTLOCK
/// \sa SDL_UnlockSurface
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_LockSurface(SDL_Surface *surface)
/// ```
int sdlLockSurface(Pointer<SdlSurface> surface) {
  final sdlLockSurfaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface),
      int Function(Pointer<SdlSurface> surface)>('SDL_LockSurface');
  return sdlLockSurfaceLookupFunction(surface);
}

///
/// Release a surface after directly accessing the pixels.
///
/// \param surface the SDL_Surface structure to be unlocked
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockSurface
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_UnlockSurface(SDL_Surface *surface)
/// ```
void sdlUnlockSurface(Pointer<SdlSurface> surface) {
  final sdlUnlockSurfaceLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlSurface> surface),
      void Function(Pointer<SdlSurface> surface)>('SDL_UnlockSurface');
  return sdlUnlockSurfaceLookupFunction(surface);
}

///
/// Load a BMP image from a seekable SDL data stream.
///
/// The new surface should be freed with SDL_DestroySurface(). Not doing so
/// will result in a memory leak.
///
/// \param src the data stream for the surface
/// \param closeio if SDL_TRUE, calls SDL_CloseIO() on `src` before returning,
/// even in the case of an error
/// \returns a pointer to a new SDL_Surface structure or NULL if there was an
/// error; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroySurface
/// \sa SDL_LoadBMP
/// \sa SDL_SaveBMP_IO
///
/// ```c
/// extern DECLSPEC SDL_Surface *SDLCALL SDL_LoadBMP_IO(SDL_IOStream *src, SDL_bool closeio)
/// ```
Pointer<SdlSurface> sdlLoadBmpIo(Pointer<SdlIoStream> src, bool closeio) {
  final sdlLoadBmpIoLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSurface> Function(Pointer<SdlIoStream> src, Int32 closeio),
      Pointer<SdlSurface> Function(
          Pointer<SdlIoStream> src, int closeio)>('SDL_LoadBMP_IO');
  return sdlLoadBmpIoLookupFunction(src, closeio ? 1 : 0);
}

///
/// Load a BMP image from a file.
///
/// The new surface should be freed with SDL_DestroySurface(). Not doing so
/// will result in a memory leak.
///
/// \param file the BMP file to load
/// \returns a pointer to a new SDL_Surface structure or NULL if there was an
/// error; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroySurface
/// \sa SDL_LoadBMP_IO
/// \sa SDL_SaveBMP
///
/// ```c
/// extern DECLSPEC SDL_Surface *SDLCALL SDL_LoadBMP(const char *file)
/// ```
Pointer<SdlSurface> sdlLoadBmp(String? file) {
  final sdlLoadBmpLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSurface> Function(Pointer<Utf8> file),
      Pointer<SdlSurface> Function(Pointer<Utf8> file)>('SDL_LoadBMP');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlLoadBmpLookupFunction(filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Save a surface to a seekable SDL data stream in BMP format.
///
/// Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
/// BMP directly. Other RGB formats with 8-bit or higher get converted to a
/// 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
/// surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
/// not supported.
///
/// \param surface the SDL_Surface structure containing the image to be saved
/// \param dst a data stream to save to
/// \param closeio if SDL_TRUE, calls SDL_CloseIO() on `dst` before returning,
/// even in the case of an error
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LoadBMP_IO
/// \sa SDL_SaveBMP
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SaveBMP_IO(SDL_Surface *surface, SDL_IOStream *dst, SDL_bool closeio)
/// ```
int sdlSaveBmpIo(
    Pointer<SdlSurface> surface, Pointer<SdlIoStream> dst, bool closeio) {
  final sdlSaveBmpIoLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlSurface> surface, Pointer<SdlIoStream> dst, Int32 closeio),
      int Function(Pointer<SdlSurface> surface, Pointer<SdlIoStream> dst,
          int closeio)>('SDL_SaveBMP_IO');
  return sdlSaveBmpIoLookupFunction(surface, dst, closeio ? 1 : 0);
}

///
/// Save a surface to a file.
///
/// Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
/// BMP directly. Other RGB formats with 8-bit or higher get converted to a
/// 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
/// surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
/// not supported.
///
/// \param surface the SDL_Surface structure containing the image to be saved
/// \param file a file to save to
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LoadBMP
/// \sa SDL_SaveBMP_IO
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SaveBMP(SDL_Surface *surface, const char *file)
/// ```
int sdlSaveBmp(Pointer<SdlSurface> surface, String? file) {
  final sdlSaveBmpLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
      int Function(
          Pointer<SdlSurface> surface, Pointer<Utf8> file)>('SDL_SaveBMP');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlSaveBmpLookupFunction(surface, filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Set the RLE acceleration hint for a surface.
///
/// If RLE is enabled, color key and alpha blending blits are much faster, but
/// the surface must be locked before directly accessing the pixels.
///
/// \param surface the SDL_Surface structure to optimize
/// \param flag 0 to disable, non-zero to enable RLE acceleration
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BlitSurface
/// \sa SDL_LockSurface
/// \sa SDL_UnlockSurface
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetSurfaceRLE(SDL_Surface *surface, int flag)
/// ```
int sdlSetSurfaceRle(Pointer<SdlSurface> surface, int flag) {
  final sdlSetSurfaceRleLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Int32 flag),
      int Function(Pointer<SdlSurface> surface, int flag)>('SDL_SetSurfaceRLE');
  return sdlSetSurfaceRleLookupFunction(surface, flag);
}

///
/// Returns whether the surface is RLE enabled
///
/// It is safe to pass a NULL `surface` here; it will return SDL_FALSE.
///
/// \param surface the SDL_Surface structure to query
/// \returns SDL_TRUE if the surface is RLE enabled, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetSurfaceRLE
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_SurfaceHasRLE(SDL_Surface *surface)
/// ```
bool sdlSurfaceHasRle(Pointer<SdlSurface> surface) {
  final sdlSurfaceHasRleLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface),
      int Function(Pointer<SdlSurface> surface)>('SDL_SurfaceHasRLE');
  return sdlSurfaceHasRleLookupFunction(surface) == 1;
}

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
/// RLE acceleration can substantially speed up blitting of images with large
/// horizontal runs of transparent pixels. See SDL_SetSurfaceRLE() for details.
///
/// \param surface the SDL_Surface structure to update
/// \param flag SDL_TRUE to enable color key, SDL_FALSE to disable color key
/// \param key the transparent pixel
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetSurfaceColorKey
/// \sa SDL_SurfaceHasColorKey
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetSurfaceColorKey(SDL_Surface *surface, int flag, Uint32 key)
/// ```
int sdlSetSurfaceColorKey(Pointer<SdlSurface> surface, int flag, int key) {
  final sdlSetSurfaceColorKeyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Int32 flag, Uint32 key),
      int Function(Pointer<SdlSurface> surface, int flag,
          int key)>('SDL_SetSurfaceColorKey');
  return sdlSetSurfaceColorKeyLookupFunction(surface, flag, key);
}

///
/// Returns whether the surface has a color key
///
/// It is safe to pass a NULL `surface` here; it will return SDL_FALSE.
///
/// \param surface the SDL_Surface structure to query
/// \returns SDL_TRUE if the surface has a color key, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetSurfaceColorKey
/// \sa SDL_GetSurfaceColorKey
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_SurfaceHasColorKey(SDL_Surface *surface)
/// ```
bool sdlSurfaceHasColorKey(Pointer<SdlSurface> surface) {
  final sdlSurfaceHasColorKeyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface),
      int Function(Pointer<SdlSurface> surface)>('SDL_SurfaceHasColorKey');
  return sdlSurfaceHasColorKeyLookupFunction(surface) == 1;
}

///
/// Get the color key (transparent pixel) for a surface.
///
/// The color key is a pixel of the format used by the surface, as generated by
/// SDL_MapRGB().
///
/// If the surface doesn't have color key enabled this function returns -1.
///
/// \param surface the SDL_Surface structure to query
/// \param key a pointer filled in with the transparent pixel
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetSurfaceColorKey
/// \sa SDL_SurfaceHasColorKey
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetSurfaceColorKey(SDL_Surface *surface, Uint32 *key)
/// ```
int sdlGetSurfaceColorKey(Pointer<SdlSurface> surface, Pointer<Uint32> key) {
  final sdlGetSurfaceColorKeyLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<Uint32> key),
      int Function(Pointer<SdlSurface> surface,
          Pointer<Uint32> key)>('SDL_GetSurfaceColorKey');
  return sdlGetSurfaceColorKeyLookupFunction(surface, key);
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
/// \param surface the SDL_Surface structure to update
/// \param r the red color value multiplied into blit operations
/// \param g the green color value multiplied into blit operations
/// \param b the blue color value multiplied into blit operations
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetSurfaceColorMod
/// \sa SDL_SetSurfaceAlphaMod
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetSurfaceColorMod(SDL_Surface *surface, Uint8 r, Uint8 g, Uint8 b)
/// ```
int sdlSetSurfaceColorMod(Pointer<SdlSurface> surface, int r, int g, int b) {
  final sdlSetSurfaceColorModLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Uint8 r, Uint8 g, Uint8 b),
      int Function(Pointer<SdlSurface> surface, int r, int g,
          int b)>('SDL_SetSurfaceColorMod');
  return sdlSetSurfaceColorModLookupFunction(surface, r, g, b);
}

///
/// Get the additional color value multiplied into blit operations.
///
/// \param surface the SDL_Surface structure to query
/// \param r a pointer filled in with the current red color value
/// \param g a pointer filled in with the current green color value
/// \param b a pointer filled in with the current blue color value
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetSurfaceAlphaMod
/// \sa SDL_SetSurfaceColorMod
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetSurfaceColorMod(SDL_Surface *surface, Uint8 *r, Uint8 *g, Uint8 *b)
/// ```
int sdlGetSurfaceColorMod(Pointer<SdlSurface> surface, Pointer<Uint8> r,
    Pointer<Uint8> g, Pointer<Uint8> b) {
  final sdlGetSurfaceColorModLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<Uint8> r,
          Pointer<Uint8> g, Pointer<Uint8> b),
      int Function(Pointer<SdlSurface> surface, Pointer<Uint8> r,
          Pointer<Uint8> g, Pointer<Uint8> b)>('SDL_GetSurfaceColorMod');
  return sdlGetSurfaceColorModLookupFunction(surface, r, g, b);
}

///
/// Set an additional alpha value used in blit operations.
///
/// When this surface is blitted, during the blit operation the source alpha
/// value is modulated by this alpha value according to the following formula:
///
/// `srcA = srcA * (alpha / 255)`
///
/// \param surface the SDL_Surface structure to update
/// \param alpha the alpha value multiplied into blit operations
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetSurfaceAlphaMod
/// \sa SDL_SetSurfaceColorMod
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetSurfaceAlphaMod(SDL_Surface *surface, Uint8 alpha)
/// ```
int sdlSetSurfaceAlphaMod(Pointer<SdlSurface> surface, int alpha) {
  final sdlSetSurfaceAlphaModLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Uint8 alpha),
      int Function(
          Pointer<SdlSurface> surface, int alpha)>('SDL_SetSurfaceAlphaMod');
  return sdlSetSurfaceAlphaModLookupFunction(surface, alpha);
}

///
/// Get the additional alpha value used in blit operations.
///
/// \param surface the SDL_Surface structure to query
/// \param alpha a pointer filled in with the current alpha value
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetSurfaceColorMod
/// \sa SDL_SetSurfaceAlphaMod
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetSurfaceAlphaMod(SDL_Surface *surface, Uint8 *alpha)
/// ```
int sdlGetSurfaceAlphaMod(Pointer<SdlSurface> surface, Pointer<Uint8> alpha) {
  final sdlGetSurfaceAlphaModLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<Uint8> alpha),
      int Function(Pointer<SdlSurface> surface,
          Pointer<Uint8> alpha)>('SDL_GetSurfaceAlphaMod');
  return sdlGetSurfaceAlphaModLookupFunction(surface, alpha);
}

///
/// Set the blend mode used for blit operations.
///
/// To copy a surface to another surface (or texture) without blending with the
/// existing data, the blendmode of the SOURCE surface should be set to
/// `SDL_BLENDMODE_NONE`.
///
/// \param surface the SDL_Surface structure to update
/// \param blendMode the SDL_BlendMode to use for blit blending
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetSurfaceBlendMode
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetSurfaceBlendMode(SDL_Surface *surface, SDL_BlendMode blendMode)
/// ```
int sdlSetSurfaceBlendMode(Pointer<SdlSurface> surface, int blendMode) {
  final sdlSetSurfaceBlendModeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Int32 blendMode),
      int Function(Pointer<SdlSurface> surface,
          int blendMode)>('SDL_SetSurfaceBlendMode');
  return sdlSetSurfaceBlendModeLookupFunction(surface, blendMode);
}

///
/// Get the blend mode used for blit operations.
///
/// \param surface the SDL_Surface structure to query
/// \param blendMode a pointer filled in with the current SDL_BlendMode
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetSurfaceBlendMode
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetSurfaceBlendMode(SDL_Surface *surface, SDL_BlendMode *blendMode)
/// ```
int sdlGetSurfaceBlendMode(
    Pointer<SdlSurface> surface, Pointer<Int32> blendMode) {
  final sdlGetSurfaceBlendModeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<Int32> blendMode),
      int Function(Pointer<SdlSurface> surface,
          Pointer<Int32> blendMode)>('SDL_GetSurfaceBlendMode');
  return sdlGetSurfaceBlendModeLookupFunction(surface, blendMode);
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
/// \param surface the SDL_Surface structure to be clipped
/// \param rect the SDL_Rect structure representing the clipping rectangle, or
/// NULL to disable clipping
/// \returns SDL_TRUE if the rectangle intersects the surface, otherwise
/// SDL_FALSE and blits will be completely clipped.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetSurfaceClipRect
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_SetSurfaceClipRect(SDL_Surface *surface, const SDL_Rect *rect)
/// ```
bool sdlSetSurfaceClipRect(Pointer<SdlSurface> surface, Pointer<SdlRect> rect) {
  final sdlSetSurfaceClipRectLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<SdlRect> rect),
      int Function(Pointer<SdlSurface> surface,
          Pointer<SdlRect> rect)>('SDL_SetSurfaceClipRect');
  return sdlSetSurfaceClipRectLookupFunction(surface, rect) == 1;
}

///
/// Get the clipping rectangle for a surface.
///
/// When `surface` is the destination of a blit, only the area within the clip
/// rectangle is drawn into.
///
/// \param surface the SDL_Surface structure representing the surface to be
/// clipped
/// \param rect an SDL_Rect structure filled in with the clipping rectangle for
/// the surface
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetSurfaceClipRect
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetSurfaceClipRect(SDL_Surface *surface, SDL_Rect *rect)
/// ```
int sdlGetSurfaceClipRect(Pointer<SdlSurface> surface, Pointer<SdlRect> rect) {
  final sdlGetSurfaceClipRectLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Pointer<SdlRect> rect),
      int Function(Pointer<SdlSurface> surface,
          Pointer<SdlRect> rect)>('SDL_GetSurfaceClipRect');
  return sdlGetSurfaceClipRectLookupFunction(surface, rect);
}

///
/// Flip a surface vertically or horizontally.
///
/// \param surface the surface to flip
/// \param flip the direction to flip
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
/// /
/// ```c
/// extern DECLSPEC int SDLCALL SDL_FlipSurface(SDL_Surface *surface, SDL_FlipMode flip)
/// ```
int sdlFlipSurface(Pointer<SdlSurface> surface, int flip) {
  final sdlFlipSurfaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> surface, Int32 flip),
      int Function(Pointer<SdlSurface> surface, int flip)>('SDL_FlipSurface');
  return sdlFlipSurfaceLookupFunction(surface, flip);
}

///
/// Creates a new surface identical to the existing surface.
///
/// The returned surface should be freed with SDL_DestroySurface().
///
/// \param surface the surface to duplicate.
/// \returns a copy of the surface, or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroySurface
/// /
/// ```c
/// extern DECLSPEC SDL_Surface *SDLCALL SDL_DuplicateSurface(SDL_Surface *surface)
/// ```
Pointer<SdlSurface> sdlDuplicateSurface(Pointer<SdlSurface> surface) {
  final sdlDuplicateSurfaceLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSurface> Function(Pointer<SdlSurface> surface),
      Pointer<SdlSurface> Function(
          Pointer<SdlSurface> surface)>('SDL_DuplicateSurface');
  return sdlDuplicateSurfaceLookupFunction(surface);
}

///
/// Copy an existing surface to a new surface of the specified format.
///
/// This function is used to optimize images for faster *repeat* blitting. This
/// is accomplished by converting the original and storing the result as a new
/// surface. The new, optimized surface can then be used as the source for
/// future blits, making them faster.
///
/// \param surface the existing SDL_Surface structure to convert
/// \param format the SDL_PixelFormat structure that the new surface is
/// optimized for
/// \returns the new SDL_Surface structure that is created or NULL if it fails;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ConvertSurfaceFormat
/// \sa SDL_ConvertSurfaceFormatAndColorspace
/// \sa SDL_CreatePixelFormat
/// \sa SDL_DestroySurface
///
/// ```c
/// extern DECLSPEC SDL_Surface *SDLCALL SDL_ConvertSurface(SDL_Surface *surface, const SDL_PixelFormat *format)
/// ```
Pointer<SdlSurface> sdlConvertSurface(
    Pointer<SdlSurface> surface, Pointer<SdlPixelFormat> format) {
  final sdlConvertSurfaceLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSurface> Function(
          Pointer<SdlSurface> surface, Pointer<SdlPixelFormat> format),
      Pointer<SdlSurface> Function(Pointer<SdlSurface> surface,
          Pointer<SdlPixelFormat> format)>('SDL_ConvertSurface');
  return sdlConvertSurfaceLookupFunction(surface, format);
}

///
/// Copy an existing surface to a new surface of the specified format.
///
/// This function operates just like SDL_ConvertSurface(), but accepts an
/// SDL_PixelFormatEnum value instead of an SDL_PixelFormat structure. As such,
/// it might be easier to call but it doesn't have access to palette
/// information for the destination surface, in case that would be important.
///
/// \param surface the existing SDL_Surface structure to convert
/// \param pixel_format the new pixel format
/// \returns the new SDL_Surface structure that is created or NULL if it fails;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ConvertSurface
/// \sa SDL_ConvertSurfaceFormatAndColorspace
/// \sa SDL_DestroySurface
///
/// ```c
/// extern DECLSPEC SDL_Surface *SDLCALL SDL_ConvertSurfaceFormat(SDL_Surface *surface, SDL_PixelFormatEnum pixel_format)
/// ```
Pointer<SdlSurface> sdlConvertSurfaceFormat(
    Pointer<SdlSurface> surface, int pixelFormat) {
  final sdlConvertSurfaceFormatLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSurface> Function(
          Pointer<SdlSurface> surface, Int32 pixelFormat),
      Pointer<SdlSurface> Function(Pointer<SdlSurface> surface,
          int pixelFormat)>('SDL_ConvertSurfaceFormat');
  return sdlConvertSurfaceFormatLookupFunction(surface, pixelFormat);
}

///
/// Copy an existing surface to a new surface of the specified format and
/// colorspace.
///
/// This function converts an existing surface to a new format and colorspace
/// and returns the new surface. This will perform any pixel format and
/// colorspace conversion needed.
///
/// \param surface the existing SDL_Surface structure to convert
/// \param pixel_format the new pixel format
/// \param colorspace the new colorspace
/// \param props an SDL_PropertiesID with additional color properties, or 0
/// \returns the new SDL_Surface structure that is created or NULL if it fails;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ConvertSurface
/// \sa SDL_ConvertSurfaceFormat
/// \sa SDL_DestroySurface
///
/// ```c
/// extern DECLSPEC SDL_Surface *SDLCALL SDL_ConvertSurfaceFormatAndColorspace(SDL_Surface *surface, SDL_PixelFormatEnum pixel_format, SDL_Colorspace colorspace, SDL_PropertiesID props)
/// ```
Pointer<SdlSurface> sdlConvertSurfaceFormatAndColorspace(
    Pointer<SdlSurface> surface, int pixelFormat, int colorspace, int props) {
  final sdlConvertSurfaceFormatAndColorspaceLookupFunction =
      libSdl3.lookupFunction<
          Pointer<SdlSurface> Function(Pointer<SdlSurface> surface,
              Int32 pixelFormat, Int32 colorspace, Uint32 props),
          Pointer<SdlSurface> Function(
              Pointer<SdlSurface> surface,
              int pixelFormat,
              int colorspace,
              int props)>('SDL_ConvertSurfaceFormatAndColorspace');
  return sdlConvertSurfaceFormatAndColorspaceLookupFunction(
      surface, pixelFormat, colorspace, props);
}

///
/// Copy a block of pixels of one format to another format.
///
/// \param width the width of the block to copy, in pixels
/// \param height the height of the block to copy, in pixels
/// \param src_format an SDL_PixelFormatEnum value of the `src` pixels format
/// \param src a pointer to the source pixels
/// \param src_pitch the pitch of the source pixels, in bytes
/// \param dst_format an SDL_PixelFormatEnum value of the `dst` pixels format
/// \param dst a pointer to be filled in with new pixel data
/// \param dst_pitch the pitch of the destination pixels, in bytes
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ConvertPixelsAndColorspace
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_ConvertPixels(int width, int height, SDL_PixelFormatEnum src_format, const void *src, int src_pitch, SDL_PixelFormatEnum dst_format, void *dst, int dst_pitch)
/// ```
int sdlConvertPixels(
    int width,
    int height,
    int srcFormat,
    Pointer<NativeType> src,
    int srcPitch,
    int dstFormat,
    Pointer<NativeType> dst,
    int dstPitch) {
  final sdlConvertPixelsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Int32 width,
          Int32 height,
          Int32 srcFormat,
          Pointer<NativeType> src,
          Int32 srcPitch,
          Int32 dstFormat,
          Pointer<NativeType> dst,
          Int32 dstPitch),
      int Function(
          int width,
          int height,
          int srcFormat,
          Pointer<NativeType> src,
          int srcPitch,
          int dstFormat,
          Pointer<NativeType> dst,
          int dstPitch)>('SDL_ConvertPixels');
  return sdlConvertPixelsLookupFunction(
      width, height, srcFormat, src, srcPitch, dstFormat, dst, dstPitch);
}

///
/// Copy a block of pixels of one format and colorspace to another format and
/// colorspace.
///
/// \param width the width of the block to copy, in pixels
/// \param height the height of the block to copy, in pixels
/// \param src_format an SDL_PixelFormatEnum value of the `src` pixels format
/// \param src_colorspace an SDL_ColorSpace value describing the colorspace of
/// the `src` pixels
/// \param src_properties an SDL_PropertiesID with additional source color
/// properties, or 0
/// \param src a pointer to the source pixels
/// \param src_pitch the pitch of the source pixels, in bytes
/// \param dst_format an SDL_PixelFormatEnum value of the `dst` pixels format
/// \param dst_colorspace an SDL_ColorSpace value describing the colorspace of
/// the `dst` pixels
/// \param dst_properties an SDL_PropertiesID with additional destination color
/// properties, or 0
/// \param dst a pointer to be filled in with new pixel data
/// \param dst_pitch the pitch of the destination pixels, in bytes
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ConvertPixels
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_ConvertPixelsAndColorspace(int width, int height, SDL_PixelFormatEnum src_format, SDL_Colorspace src_colorspace, SDL_PropertiesID src_properties, const void *src, int src_pitch, SDL_PixelFormatEnum dst_format, SDL_Colorspace dst_colorspace, SDL_PropertiesID dst_properties, void *dst, int dst_pitch)
/// ```
int sdlConvertPixelsAndColorspace(
    int width,
    int height,
    int srcFormat,
    int srcColorspace,
    int srcProperties,
    Pointer<NativeType> src,
    int srcPitch,
    int dstFormat,
    int dstColorspace,
    int dstProperties,
    Pointer<NativeType> dst,
    int dstPitch) {
  final sdlConvertPixelsAndColorspaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Int32 width,
          Int32 height,
          Int32 srcFormat,
          Int32 srcColorspace,
          Uint32 srcProperties,
          Pointer<NativeType> src,
          Int32 srcPitch,
          Int32 dstFormat,
          Int32 dstColorspace,
          Uint32 dstProperties,
          Pointer<NativeType> dst,
          Int32 dstPitch),
      int Function(
          int width,
          int height,
          int srcFormat,
          int srcColorspace,
          int srcProperties,
          Pointer<NativeType> src,
          int srcPitch,
          int dstFormat,
          int dstColorspace,
          int dstProperties,
          Pointer<NativeType> dst,
          int dstPitch)>('SDL_ConvertPixelsAndColorspace');
  return sdlConvertPixelsAndColorspaceLookupFunction(
      width,
      height,
      srcFormat,
      srcColorspace,
      srcProperties,
      src,
      srcPitch,
      dstFormat,
      dstColorspace,
      dstProperties,
      dst,
      dstPitch);
}

///
/// Premultiply the alpha on a block of pixels.
///
/// This is safe to use with src == dst, but not for other overlapping areas.
///
/// This function is currently only implemented for SDL_PIXELFORMAT_ARGB8888.
///
/// \param width the width of the block to convert, in pixels
/// \param height the height of the block to convert, in pixels
/// \param src_format an SDL_PixelFormatEnum value of the `src` pixels format
/// \param src a pointer to the source pixels
/// \param src_pitch the pitch of the source pixels, in bytes
/// \param dst_format an SDL_PixelFormatEnum value of the `dst` pixels format
/// \param dst a pointer to be filled in with premultiplied pixel data
/// \param dst_pitch the pitch of the destination pixels, in bytes
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_PremultiplyAlpha(int width, int height, SDL_PixelFormatEnum src_format, const void *src, int src_pitch, SDL_PixelFormatEnum dst_format, void *dst, int dst_pitch)
/// ```
int sdlPremultiplyAlpha(
    int width,
    int height,
    int srcFormat,
    Pointer<NativeType> src,
    int srcPitch,
    int dstFormat,
    Pointer<NativeType> dst,
    int dstPitch) {
  final sdlPremultiplyAlphaLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Int32 width,
          Int32 height,
          Int32 srcFormat,
          Pointer<NativeType> src,
          Int32 srcPitch,
          Int32 dstFormat,
          Pointer<NativeType> dst,
          Int32 dstPitch),
      int Function(
          int width,
          int height,
          int srcFormat,
          Pointer<NativeType> src,
          int srcPitch,
          int dstFormat,
          Pointer<NativeType> dst,
          int dstPitch)>('SDL_PremultiplyAlpha');
  return sdlPremultiplyAlphaLookupFunction(
      width, height, srcFormat, src, srcPitch, dstFormat, dst, dstPitch);
}

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
/// \param dst the SDL_Surface structure that is the drawing target
/// \param rect the SDL_Rect structure representing the rectangle to fill, or
/// NULL to fill the entire surface
/// \param color the color to fill with
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_FillSurfaceRects
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_FillSurfaceRect(SDL_Surface *dst, const SDL_Rect *rect, Uint32 color)
/// ```
int sdlFillSurfaceRect(
    Pointer<SdlSurface> dst, Pointer<SdlRect> rect, int color) {
  final sdlFillSurfaceRectLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlSurface> dst, Pointer<SdlRect> rect, Uint32 color),
      int Function(Pointer<SdlSurface> dst, Pointer<SdlRect> rect,
          int color)>('SDL_FillSurfaceRect');
  return sdlFillSurfaceRectLookupFunction(dst, rect, color);
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
/// \param dst the SDL_Surface structure that is the drawing target
/// \param rects an array of SDL_Rects representing the rectangles to fill.
/// \param count the number of rectangles in the array
/// \param color the color to fill with
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_FillSurfaceRect
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_FillSurfaceRects(SDL_Surface *dst, const SDL_Rect *rects, int count, Uint32 color)
/// ```
int sdlFillSurfaceRects(
    Pointer<SdlSurface> dst, Pointer<SdlRect> rects, int count, int color) {
  final sdlFillSurfaceRectsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> dst, Pointer<SdlRect> rects,
          Int32 count, Uint32 color),
      int Function(Pointer<SdlSurface> dst, Pointer<SdlRect> rects, int count,
          int color)>('SDL_FillSurfaceRects');
  return sdlFillSurfaceRectsLookupFunction(dst, rects, count, color);
}

///
/// Performs a fast blit from the source surface to the destination surface.
///
/// This assumes that the source and destination rectangles are the same size.
/// If either `srcrect` or `dstrect` are NULL, the entire surface (`src` or
/// `dst`) is copied. The final blit rectangles are saved in `srcrect` and
/// `dstrect` after all clipping is performed.
///
/// The blit function should not be called on a locked surface.
///
/// The blit semantics for surfaces with and without blending and colorkey are
/// defined as follows:
///
/// ```c
/// RGBA->RGB:
/// Source surface blend mode set to SDL_BLENDMODE_BLEND:
/// alpha-blend (using the source alpha-channel and per-surface alpha)
/// SDL_SRCCOLORKEY ignored.
/// Source surface blend mode set to SDL_BLENDMODE_NONE:
/// copy RGB.
/// if SDL_SRCCOLORKEY set, only copy the pixels matching the
/// RGB values of the source color key, ignoring alpha in the
/// comparison.
///
/// RGB->RGBA:
/// Source surface blend mode set to SDL_BLENDMODE_BLEND:
/// alpha-blend (using the source per-surface alpha)
/// Source surface blend mode set to SDL_BLENDMODE_NONE:
/// copy RGB, set destination alpha to source per-surface alpha value.
/// both:
/// if SDL_SRCCOLORKEY set, only copy the pixels matching the
/// source color key.
///
/// RGBA->RGBA:
/// Source surface blend mode set to SDL_BLENDMODE_BLEND:
/// alpha-blend (using the source alpha-channel and per-surface alpha)
/// SDL_SRCCOLORKEY ignored.
/// Source surface blend mode set to SDL_BLENDMODE_NONE:
/// copy all of RGBA to the destination.
/// if SDL_SRCCOLORKEY set, only copy the pixels matching the
/// RGB values of the source color key, ignoring alpha in the
/// comparison.
///
/// RGB->RGB:
/// Source surface blend mode set to SDL_BLENDMODE_BLEND:
/// alpha-blend (using the source per-surface alpha)
/// Source surface blend mode set to SDL_BLENDMODE_NONE:
/// copy RGB.
/// both:
/// if SDL_SRCCOLORKEY set, only copy the pixels matching the
/// source color key.
/// ```
///
/// \param src the SDL_Surface structure to be copied from
/// \param srcrect the SDL_Rect structure representing the rectangle to be
/// copied, or NULL to copy the entire surface
/// \param dst the SDL_Surface structure that is the blit target
/// \param dstrect the SDL_Rect structure representing the x and y position in
/// the destination surface. On input the width and height are
/// ignored (taken from srcrect), and on output this is filled
/// in with the actual rectangle used after clipping.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BlitSurfaceScaled
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_BlitSurface(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
/// ```
int sdlBlitSurface(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
    Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect) {
  final sdlBlitSurfaceLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect),
      int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect)>('SDL_BlitSurface');
  return sdlBlitSurfaceLookupFunction(src, srcrect, dst, dstrect);
}

///
/// Perform low-level surface blitting only.
///
/// This is a semi-private blit function and it performs low-level surface
/// blitting, assuming the input rectangles have already been clipped.
///
/// \param src the SDL_Surface structure to be copied from
/// \param srcrect the SDL_Rect structure representing the rectangle to be
/// copied, or NULL to copy the entire surface
/// \param dst the SDL_Surface structure that is the blit target
/// \param dstrect the SDL_Rect structure representing the target rectangle in
/// the destination surface
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BlitSurface
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_BlitSurfaceUnchecked(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect)
/// ```
int sdlBlitSurfaceUnchecked(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
    Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect) {
  final sdlBlitSurfaceUncheckedLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect),
      int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect)>('SDL_BlitSurfaceUnchecked');
  return sdlBlitSurfaceUncheckedLookupFunction(src, srcrect, dst, dstrect);
}

///
/// Perform stretch blit between two surfaces of the same format.
///
/// Using SDL_SCALEMODE_NEAREST: fast, low quality. Using SDL_SCALEMODE_LINEAR:
/// bilinear scaling, slower, better quality, only 32BPP.
///
/// \param src the SDL_Surface structure to be copied from
/// \param srcrect the SDL_Rect structure representing the rectangle to be
/// copied
/// \param dst the SDL_Surface structure that is the blit target
/// \param dstrect the SDL_Rect structure representing the target rectangle in
/// the destination surface
/// \param scaleMode scale algorithm to be used
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BlitSurfaceScaled
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SoftStretch(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect, SDL_ScaleMode scaleMode)
/// ```
int sdlSoftStretch(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
    Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect, int scaleMode) {
  final sdlSoftStretchLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect, Int32 scaleMode),
      int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          int scaleMode)>('SDL_SoftStretch');
  return sdlSoftStretchLookupFunction(src, srcrect, dst, dstrect, scaleMode);
}

///
/// Perform a scaled blit to a destination surface, which may be of a different
/// format.
///
/// \param src the SDL_Surface structure to be copied from
/// \param srcrect the SDL_Rect structure representing the rectangle to be
/// copied
/// \param dst the SDL_Surface structure that is the blit target
/// \param dstrect the SDL_Rect structure representing the target rectangle in
/// the destination surface, filled with the actual rectangle
/// used after clipping
/// \param scaleMode scale algorithm to be used
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BlitSurface
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_BlitSurfaceScaled(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect, SDL_ScaleMode scaleMode)
/// ```
int sdlBlitSurfaceScaled(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
    Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect, int scaleMode) {
  final sdlBlitSurfaceScaledLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect, Int32 scaleMode),
      int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          int scaleMode)>('SDL_BlitSurfaceScaled');
  return sdlBlitSurfaceScaledLookupFunction(
      src, srcrect, dst, dstrect, scaleMode);
}

///
/// Perform low-level surface scaled blitting only.
///
/// This is a semi-private function and it performs low-level surface blitting,
/// assuming the input rectangles have already been clipped.
///
/// \param src the SDL_Surface structure to be copied from
/// \param srcrect the SDL_Rect structure representing the rectangle to be
/// copied
/// \param dst the SDL_Surface structure that is the blit target
/// \param dstrect the SDL_Rect structure representing the target rectangle in
/// the destination surface
/// \param scaleMode scale algorithm to be used
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BlitSurfaceScaled
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_BlitSurfaceUncheckedScaled(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect, SDL_ScaleMode scaleMode)
/// ```
int sdlBlitSurfaceUncheckedScaled(
    Pointer<SdlSurface> src,
    Pointer<SdlRect> srcrect,
    Pointer<SdlSurface> dst,
    Pointer<SdlRect> dstrect,
    int scaleMode) {
  final sdlBlitSurfaceUncheckedScaledLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSurface> src, Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst, Pointer<SdlRect> dstrect, Int32 scaleMode),
      int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          int scaleMode)>('SDL_BlitSurfaceUncheckedScaled');
  return sdlBlitSurfaceUncheckedScaledLookupFunction(
      src, srcrect, dst, dstrect, scaleMode);
}

///
/// Retrieves a single pixel from a surface.
///
/// This function prioritizes correctness over speed: it is suitable for unit
/// tests, but is not intended for use in a game engine.
///
/// Like SDL_GetRGBA, this uses the entire 0..255 range when converting color
/// components from pixel formats with less than 8 bits per RGB component.
///
/// \param surface the surface to read
/// \param x the horizontal coordinate, 0 <= x < width
/// \param y the vertical coordinate, 0 <= y < height
/// \param r a pointer filled in with the red channel, 0-255, or NULL to ignore
/// this channel
/// \param g a pointer filled in with the green channel, 0-255, or NULL to
/// ignore this channel
/// \param b a pointer filled in with the blue channel, 0-255, or NULL to
/// ignore this channel
/// \param a a pointer filled in with the alpha channel, 0-255, or NULL to
/// ignore this channel
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_ReadSurfacePixel(SDL_Surface *surface, int x, int y, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a)
/// ```
int sdlReadSurfacePixel(Pointer<SdlSurface> surface, int x, int y,
    Pointer<Uint8> r, Pointer<Uint8> g, Pointer<Uint8> b, Pointer<Uint8> a) {
  final sdlReadSurfacePixelLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlSurface> surface,
          Int32 x,
          Int32 y,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a),
      int Function(
          Pointer<SdlSurface> surface,
          int x,
          int y,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a)>('SDL_ReadSurfacePixel');
  return sdlReadSurfacePixelLookupFunction(surface, x, y, r, g, b, a);
}
