// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
part of '../sdl.dart';

///
/// Allocate a new surface with a specific pixel format.
///
/// The pixels of the new surface are initialized to zero.
///
/// \param width the width of the surface.
/// \param height the height of the surface.
/// \param format the SDL_PixelFormat for the new surface's pixel format.
/// \returns the new SDL_Surface structure that is created or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateSurfaceFrom
/// \sa SDL_DestroySurface
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_CreateSurface(int width, int height, SDL_PixelFormat format)
/// ```
/// {@category surface}
Pointer<SdlSurface> sdlCreateSurface(int width, int height, int format) {
  final sdlCreateSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(Int32 width, Int32 height, Int32 format),
        Pointer<SdlSurface> Function(int width, int height, int format)
      >('SDL_CreateSurface');
  return sdlCreateSurfaceLookupFunction(width, height, format);
}

///
/// Allocate a new surface with a specific pixel format and existing pixel
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
/// \param width the width of the surface.
/// \param height the height of the surface.
/// \param format the SDL_PixelFormat for the new surface's pixel format.
/// \param pixels a pointer to existing pixel data.
/// \param pitch the number of bytes between each row, including padding.
/// \returns the new SDL_Surface structure that is created or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateSurface
/// \sa SDL_DestroySurface
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_CreateSurfaceFrom(int width, int height, SDL_PixelFormat format, void *pixels, int pitch)
/// ```
/// {@category surface}
Pointer<SdlSurface> sdlCreateSurfaceFrom(
  int width,
  int height,
  int format,
  Pointer<NativeType> pixels,
  int pitch,
) {
  final sdlCreateSurfaceFromLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Int32 width,
          Int32 height,
          Int32 format,
          Pointer<NativeType> pixels,
          Int32 pitch,
        ),
        Pointer<SdlSurface> Function(
          int width,
          int height,
          int format,
          Pointer<NativeType> pixels,
          int pitch,
        )
      >('SDL_CreateSurfaceFrom');
  return sdlCreateSurfaceFromLookupFunction(
    width,
    height,
    format,
    pixels,
    pitch,
  );
}

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
void sdlDestroySurface(Pointer<SdlSurface> surface) {
  final sdlDestroySurfaceLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlSurface> surface),
        void Function(Pointer<SdlSurface> surface)
      >('SDL_DestroySurface');
  return sdlDestroySurfaceLookupFunction(surface);
}

///
/// Get the properties associated with a surface.
///
/// The following properties are understood by SDL:
///
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
/// - `SDL_PROP_SURFACE_HOTSPOT_X_NUMBER`: the hotspot pixel offset from the
/// left edge of the image, if this surface is being used as a cursor.
/// - `SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER`: the hotspot pixel offset from the
/// top edge of the image, if this surface is being used as a cursor.
///
/// \param surface the SDL_Surface structure to query.
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetSurfaceProperties(SDL_Surface *surface)
/// ```
/// {@category surface}
int sdlGetSurfaceProperties(Pointer<SdlSurface> surface) {
  final sdlGetSurfacePropertiesLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlSurface> surface),
        int Function(Pointer<SdlSurface> surface)
      >('SDL_GetSurfaceProperties');
  return sdlGetSurfacePropertiesLookupFunction(surface);
}

///
/// Set the colorspace used by a surface.
///
/// Setting the colorspace doesn't change the pixels, only how they are
/// interpreted in color operations.
///
/// \param surface the SDL_Surface structure to update.
/// \param colorspace an SDL_Colorspace value describing the surface
/// colorspace.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetSurfaceColorspace
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetSurfaceColorspace(SDL_Surface *surface, SDL_Colorspace colorspace)
/// ```
/// {@category surface}
bool sdlSetSurfaceColorspace(Pointer<SdlSurface> surface, int colorspace) {
  final sdlSetSurfaceColorspaceLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Int32 colorspace),
        int Function(Pointer<SdlSurface> surface, int colorspace)
      >('SDL_SetSurfaceColorspace');
  return sdlSetSurfaceColorspaceLookupFunction(surface, colorspace) == 1;
}

///
/// Get the colorspace used by a surface.
///
/// The colorspace defaults to SDL_COLORSPACE_SRGB_LINEAR for floating point
/// formats, SDL_COLORSPACE_HDR10 for 10-bit formats, SDL_COLORSPACE_SRGB for
/// other RGB surfaces and SDL_COLORSPACE_BT709_FULL for YUV textures.
///
/// \param surface the SDL_Surface structure to query.
/// \returns the colorspace used by the surface, or SDL_COLORSPACE_UNKNOWN if
/// the surface is NULL.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetSurfaceColorspace
///
/// ```c
/// extern SDL_DECLSPEC SDL_Colorspace SDLCALL SDL_GetSurfaceColorspace(SDL_Surface *surface)
/// ```
/// {@category surface}
int sdlGetSurfaceColorspace(Pointer<SdlSurface> surface) {
  final sdlGetSurfaceColorspaceLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Pointer<SdlSurface> surface),
        int Function(Pointer<SdlSurface> surface)
      >('SDL_GetSurfaceColorspace');
  return sdlGetSurfaceColorspaceLookupFunction(surface);
}

///
/// Create a palette and associate it with a surface.
///
/// This function creates a palette compatible with the provided surface. The
/// palette is then returned for you to modify, and the surface will
/// automatically use the new palette in future operations. You do not need to
/// destroy the returned palette, it will be freed when the reference count
/// reaches 0, usually when the surface is destroyed.
///
/// Bitmap surfaces (with format SDL_PIXELFORMAT_INDEX1LSB or
/// SDL_PIXELFORMAT_INDEX1MSB) will have the palette initialized with 0 as
/// white and 1 as black. Other surfaces will get a palette initialized with
/// white in every entry.
///
/// If this function is called for a surface that already has a palette, a new
/// palette will be created to replace it.
///
/// \param surface the SDL_Surface structure to update.
/// \returns a new SDL_Palette structure on success or NULL on failure (e.g. if
/// the surface didn't have an index format); call SDL_GetError() for
/// more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetPaletteColors
///
/// ```c
/// extern SDL_DECLSPEC SDL_Palette * SDLCALL SDL_CreateSurfacePalette(SDL_Surface *surface)
/// ```
/// {@category surface}
Pointer<SdlPalette> sdlCreateSurfacePalette(Pointer<SdlSurface> surface) {
  final sdlCreateSurfacePaletteLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlPalette> Function(Pointer<SdlSurface> surface),
        Pointer<SdlPalette> Function(Pointer<SdlSurface> surface)
      >('SDL_CreateSurfacePalette');
  return sdlCreateSurfacePaletteLookupFunction(surface);
}

///
/// Set the palette used by a surface.
///
/// Setting the palette keeps an internal reference to the palette, which can
/// be safely destroyed afterwards.
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
bool sdlSetSurfacePalette(
  Pointer<SdlSurface> surface,
  Pointer<SdlPalette> palette,
) {
  final sdlSetSurfacePaletteLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlPalette> palette,
        ),
        int Function(Pointer<SdlSurface> surface, Pointer<SdlPalette> palette)
      >('SDL_SetSurfacePalette');
  return sdlSetSurfacePaletteLookupFunction(surface, palette) == 1;
}

///
/// Get the palette used by a surface.
///
/// \param surface the SDL_Surface structure to query.
/// \returns a pointer to the palette used by the surface, or NULL if there is
/// no palette used.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetSurfacePalette
///
/// ```c
/// extern SDL_DECLSPEC SDL_Palette * SDLCALL SDL_GetSurfacePalette(SDL_Surface *surface)
/// ```
/// {@category surface}
Pointer<SdlPalette> sdlGetSurfacePalette(Pointer<SdlSurface> surface) {
  final sdlGetSurfacePaletteLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlPalette> Function(Pointer<SdlSurface> surface),
        Pointer<SdlPalette> Function(Pointer<SdlSurface> surface)
      >('SDL_GetSurfacePalette');
  return sdlGetSurfacePaletteLookupFunction(surface);
}

///
/// Add an alternate version of a surface.
///
/// This function adds an alternate version of this surface, usually used for
/// content with high DPI representations like cursors or icons. The size,
/// format, and content do not need to match the original surface, and these
/// alternate versions will not be updated when the original surface changes.
///
/// This function adds a reference to the alternate version, so you should call
/// SDL_DestroySurface() on the image after this call.
///
/// \param surface the SDL_Surface structure to update.
/// \param image a pointer to an alternate SDL_Surface to associate with this
/// surface.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RemoveSurfaceAlternateImages
/// \sa SDL_GetSurfaceImages
/// \sa SDL_SurfaceHasAlternateImages
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_AddSurfaceAlternateImage(SDL_Surface *surface, SDL_Surface *image)
/// ```
/// {@category surface}
bool sdlAddSurfaceAlternateImage(
  Pointer<SdlSurface> surface,
  Pointer<SdlSurface> image,
) {
  final sdlAddSurfaceAlternateImageLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<SdlSurface> image),
        int Function(Pointer<SdlSurface> surface, Pointer<SdlSurface> image)
      >('SDL_AddSurfaceAlternateImage');
  return sdlAddSurfaceAlternateImageLookupFunction(surface, image) == 1;
}

///
/// Return whether a surface has alternate versions available.
///
/// \param surface the SDL_Surface structure to query.
/// \returns true if alternate versions are available or false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddSurfaceAlternateImage
/// \sa SDL_RemoveSurfaceAlternateImages
/// \sa SDL_GetSurfaceImages
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SurfaceHasAlternateImages(SDL_Surface *surface)
/// ```
/// {@category surface}
bool sdlSurfaceHasAlternateImages(Pointer<SdlSurface> surface) {
  final sdlSurfaceHasAlternateImagesLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface),
        int Function(Pointer<SdlSurface> surface)
      >('SDL_SurfaceHasAlternateImages');
  return sdlSurfaceHasAlternateImagesLookupFunction(surface) == 1;
}

///
/// Get an array including all versions of a surface.
///
/// This returns all versions of a surface, with the surface being queried as
/// the first element in the returned array.
///
/// Freeing the array of surfaces does not affect the surfaces in the array.
/// They are still referenced by the surface being queried and will be cleaned
/// up normally.
///
/// \param surface the SDL_Surface structure to query.
/// \param count a pointer filled in with the number of surface pointers
/// returned, may be NULL.
/// \returns a NULL terminated array of SDL_Surface pointers or NULL on
/// failure; call SDL_GetError() for more information. This should be
/// freed with SDL_free() when it is no longer needed.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddSurfaceAlternateImage
/// \sa SDL_RemoveSurfaceAlternateImages
/// \sa SDL_SurfaceHasAlternateImages
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface ** SDLCALL SDL_GetSurfaceImages(SDL_Surface *surface, int *count)
/// ```
/// {@category surface}
Pointer<Pointer<SdlSurface>> sdlGetSurfaceImages(
  Pointer<SdlSurface> surface,
  Pointer<Int32> count,
) {
  final sdlGetSurfaceImagesLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Pointer<SdlSurface>> Function(
          Pointer<SdlSurface> surface,
          Pointer<Int32> count,
        ),
        Pointer<Pointer<SdlSurface>> Function(
          Pointer<SdlSurface> surface,
          Pointer<Int32> count,
        )
      >('SDL_GetSurfaceImages');
  return sdlGetSurfaceImagesLookupFunction(surface, count);
}

///
/// Remove all alternate versions of a surface.
///
/// This function removes a reference from all the alternative versions,
/// destroying them if this is the last reference to them.
///
/// \param surface the SDL_Surface structure to update.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddSurfaceAlternateImage
/// \sa SDL_GetSurfaceImages
/// \sa SDL_SurfaceHasAlternateImages
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_RemoveSurfaceAlternateImages(SDL_Surface *surface)
/// ```
/// {@category surface}
void sdlRemoveSurfaceAlternateImages(Pointer<SdlSurface> surface) {
  final sdlRemoveSurfaceAlternateImagesLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlSurface> surface),
        void Function(Pointer<SdlSurface> surface)
      >('SDL_RemoveSurfaceAlternateImages');
  return sdlRemoveSurfaceAlternateImagesLookupFunction(surface);
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
bool sdlLockSurface(Pointer<SdlSurface> surface) {
  final sdlLockSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface),
        int Function(Pointer<SdlSurface> surface)
      >('SDL_LockSurface');
  return sdlLockSurfaceLookupFunction(surface) == 1;
}

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
void sdlUnlockSurface(Pointer<SdlSurface> surface) {
  final sdlUnlockSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlSurface> surface),
        void Function(Pointer<SdlSurface> surface)
      >('SDL_UnlockSurface');
  return sdlUnlockSurfaceLookupFunction(surface);
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
Pointer<SdlSurface> sdlLoadBmpIo(Pointer<SdlIoStream> src, bool closeio) {
  final sdlLoadBmpIoLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src, Uint8 closeio),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src, int closeio)
      >('SDL_LoadBMP_IO');
  return sdlLoadBmpIoLookupFunction(src, closeio ? 1 : 0);
}

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
Pointer<SdlSurface> sdlLoadBmp(String? file) {
  final sdlLoadBmpLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<Utf8> file),
        Pointer<SdlSurface> Function(Pointer<Utf8> file)
      >('SDL_LoadBMP');
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
bool sdlSaveBmpIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final sdlSaveBmpIoLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          int closeio,
        )
      >('SDL_SaveBMP_IO');
  return sdlSaveBmpIoLookupFunction(surface, dst, closeio ? 1 : 0) == 1;
}

///
/// Save a surface to a file in BMP format.
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
bool sdlSaveBmp(Pointer<SdlSurface> surface, String? file) {
  final sdlSaveBmpLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('SDL_SaveBMP');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlSaveBmpLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Load a PNG image from a seekable SDL data stream.
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
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_DestroySurface
/// \sa SDL_LoadPNG
/// \sa SDL_SavePNG_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_LoadPNG_IO(SDL_IOStream *src, bool closeio)
/// ```
/// {@category surface}
Pointer<SdlSurface> sdlLoadPngIo(Pointer<SdlIoStream> src, bool closeio) {
  final sdlLoadPngIoLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src, Uint8 closeio),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src, int closeio)
      >('SDL_LoadPNG_IO');
  return sdlLoadPngIoLookupFunction(src, closeio ? 1 : 0);
}

///
/// Load a PNG image from a file.
///
/// The new surface should be freed with SDL_DestroySurface(). Not doing so
/// will result in a memory leak.
///
/// \param file the PNG file to load.
/// \returns a pointer to a new SDL_Surface structure or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_DestroySurface
/// \sa SDL_LoadPNG_IO
/// \sa SDL_SavePNG
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_LoadPNG(const char *file)
/// ```
/// {@category surface}
Pointer<SdlSurface> sdlLoadPng(String? file) {
  final sdlLoadPngLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<Utf8> file),
        Pointer<SdlSurface> Function(Pointer<Utf8> file)
      >('SDL_LoadPNG');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlLoadPngLookupFunction(filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Save a surface to a seekable SDL data stream in PNG format.
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
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_LoadPNG_IO
/// \sa SDL_SavePNG
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SavePNG_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category surface}
bool sdlSavePngIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final sdlSavePngIoLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          int closeio,
        )
      >('SDL_SavePNG_IO');
  return sdlSavePngIoLookupFunction(surface, dst, closeio ? 1 : 0) == 1;
}

///
/// Save a surface to a file in PNG format.
///
/// \param surface the SDL_Surface structure containing the image to be saved.
/// \param file a file to save to.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_LoadPNG
/// \sa SDL_SavePNG_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SavePNG(SDL_Surface *surface, const char *file)
/// ```
/// {@category surface}
bool sdlSavePng(Pointer<SdlSurface> surface, String? file) {
  final sdlSavePngLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('SDL_SavePNG');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlSavePngLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

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
bool sdlSetSurfaceRle(Pointer<SdlSurface> surface, bool enabled) {
  final sdlSetSurfaceRleLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Uint8 enabled),
        int Function(Pointer<SdlSurface> surface, int enabled)
      >('SDL_SetSurfaceRLE');
  return sdlSetSurfaceRleLookupFunction(surface, enabled ? 1 : 0) == 1;
}

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
bool sdlSurfaceHasRle(Pointer<SdlSurface> surface) {
  final sdlSurfaceHasRleLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface),
        int Function(Pointer<SdlSurface> surface)
      >('SDL_SurfaceHasRLE');
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
bool sdlSetSurfaceColorKey(Pointer<SdlSurface> surface, bool enabled, int key) {
  final sdlSetSurfaceColorKeyLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Uint8 enabled, Uint32 key),
        int Function(Pointer<SdlSurface> surface, int enabled, int key)
      >('SDL_SetSurfaceColorKey');
  return sdlSetSurfaceColorKeyLookupFunction(surface, enabled ? 1 : 0, key) ==
      1;
}

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
bool sdlSurfaceHasColorKey(Pointer<SdlSurface> surface) {
  final sdlSurfaceHasColorKeyLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface),
        int Function(Pointer<SdlSurface> surface)
      >('SDL_SurfaceHasColorKey');
  return sdlSurfaceHasColorKeyLookupFunction(surface) == 1;
}

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
bool sdlGetSurfaceColorKey(Pointer<SdlSurface> surface, Pointer<Uint32> key) {
  final sdlGetSurfaceColorKeyLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Uint32> key),
        int Function(Pointer<SdlSurface> surface, Pointer<Uint32> key)
      >('SDL_GetSurfaceColorKey');
  return sdlGetSurfaceColorKeyLookupFunction(surface, key) == 1;
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
bool sdlSetSurfaceColorMod(Pointer<SdlSurface> surface, int r, int g, int b) {
  final sdlSetSurfaceColorModLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Uint8 r, Uint8 g, Uint8 b),
        int Function(Pointer<SdlSurface> surface, int r, int g, int b)
      >('SDL_SetSurfaceColorMod');
  return sdlSetSurfaceColorModLookupFunction(surface, r, g, b) == 1;
}

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
bool sdlGetSurfaceColorMod(
  Pointer<SdlSurface> surface,
  Pointer<Uint8> r,
  Pointer<Uint8> g,
  Pointer<Uint8> b,
) {
  final sdlGetSurfaceColorModLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
        )
      >('SDL_GetSurfaceColorMod');
  return sdlGetSurfaceColorModLookupFunction(surface, r, g, b) == 1;
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
bool sdlSetSurfaceAlphaMod(Pointer<SdlSurface> surface, int alpha) {
  final sdlSetSurfaceAlphaModLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Uint8 alpha),
        int Function(Pointer<SdlSurface> surface, int alpha)
      >('SDL_SetSurfaceAlphaMod');
  return sdlSetSurfaceAlphaModLookupFunction(surface, alpha) == 1;
}

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
bool sdlGetSurfaceAlphaMod(Pointer<SdlSurface> surface, Pointer<Uint8> alpha) {
  final sdlGetSurfaceAlphaModLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Uint8> alpha),
        int Function(Pointer<SdlSurface> surface, Pointer<Uint8> alpha)
      >('SDL_GetSurfaceAlphaMod');
  return sdlGetSurfaceAlphaModLookupFunction(surface, alpha) == 1;
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
bool sdlSetSurfaceBlendMode(Pointer<SdlSurface> surface, int blendMode) {
  final sdlSetSurfaceBlendModeLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Uint32 blendMode),
        int Function(Pointer<SdlSurface> surface, int blendMode)
      >('SDL_SetSurfaceBlendMode');
  return sdlSetSurfaceBlendModeLookupFunction(surface, blendMode) == 1;
}

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
bool sdlGetSurfaceBlendMode(
  Pointer<SdlSurface> surface,
  Pointer<Uint32> blendMode,
) {
  final sdlGetSurfaceBlendModeLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Uint32> blendMode),
        int Function(Pointer<SdlSurface> surface, Pointer<Uint32> blendMode)
      >('SDL_GetSurfaceBlendMode');
  return sdlGetSurfaceBlendModeLookupFunction(surface, blendMode) == 1;
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
bool sdlSetSurfaceClipRect(Pointer<SdlSurface> surface, Pointer<SdlRect> rect) {
  final sdlSetSurfaceClipRectLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<SdlRect> rect),
        int Function(Pointer<SdlSurface> surface, Pointer<SdlRect> rect)
      >('SDL_SetSurfaceClipRect');
  return sdlSetSurfaceClipRectLookupFunction(surface, rect) == 1;
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
bool sdlGetSurfaceClipRect(Pointer<SdlSurface> surface, Pointer<SdlRect> rect) {
  final sdlGetSurfaceClipRectLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<SdlRect> rect),
        int Function(Pointer<SdlSurface> surface, Pointer<SdlRect> rect)
      >('SDL_GetSurfaceClipRect');
  return sdlGetSurfaceClipRectLookupFunction(surface, rect) == 1;
}

///
/// Flip a surface vertically or horizontally.
///
/// \param surface the surface to flip.
/// \param flip the direction to flip.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_FlipSurface(SDL_Surface *surface, SDL_FlipMode flip)
/// ```
/// {@category surface}
bool sdlFlipSurface(Pointer<SdlSurface> surface, int flip) {
  final sdlFlipSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Int32 flip),
        int Function(Pointer<SdlSurface> surface, int flip)
      >('SDL_FlipSurface');
  return sdlFlipSurfaceLookupFunction(surface, flip) == 1;
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
Pointer<SdlSurface> sdlDuplicateSurface(Pointer<SdlSurface> surface) {
  final sdlDuplicateSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlSurface> surface),
        Pointer<SdlSurface> Function(Pointer<SdlSurface> surface)
      >('SDL_DuplicateSurface');
  return sdlDuplicateSurfaceLookupFunction(surface);
}

///
/// Creates a new surface identical to the existing surface, scaled to the
/// desired size.
///
/// The returned surface should be freed with SDL_DestroySurface().
///
/// \param surface the surface to duplicate and scale.
/// \param width the width of the new surface.
/// \param height the height of the new surface.
/// \param scaleMode the SDL_ScaleMode to be used.
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
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_ScaleSurface(SDL_Surface *surface, int width, int height, SDL_ScaleMode scaleMode)
/// ```
/// {@category surface}
Pointer<SdlSurface> sdlScaleSurface(
  Pointer<SdlSurface> surface,
  int width,
  int height,
  int scaleMode,
) {
  final sdlScaleSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<SdlSurface> surface,
          Int32 width,
          Int32 height,
          Int32 scaleMode,
        ),
        Pointer<SdlSurface> Function(
          Pointer<SdlSurface> surface,
          int width,
          int height,
          int scaleMode,
        )
      >('SDL_ScaleSurface');
  return sdlScaleSurfaceLookupFunction(surface, width, height, scaleMode);
}

///
/// Copy an existing surface to a new surface of the specified format.
///
/// This function is used to optimize images for faster *repeat* blitting. This
/// is accomplished by converting the original and storing the result as a new
/// surface. The new, optimized surface can then be used as the source for
/// future blits, making them faster.
///
/// If you are converting to an indexed surface and want to map colors to a
/// palette, you can use SDL_ConvertSurfaceAndColorspace() instead.
///
/// If the original surface has alternate images, the new surface will have a
/// reference to them as well.
///
/// \param surface the existing SDL_Surface structure to convert.
/// \param format the new pixel format.
/// \returns the new SDL_Surface structure that is created or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ConvertSurfaceAndColorspace
/// \sa SDL_DestroySurface
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_ConvertSurface(SDL_Surface *surface, SDL_PixelFormat format)
/// ```
/// {@category surface}
Pointer<SdlSurface> sdlConvertSurface(Pointer<SdlSurface> surface, int format) {
  final sdlConvertSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlSurface> surface, Int32 format),
        Pointer<SdlSurface> Function(Pointer<SdlSurface> surface, int format)
      >('SDL_ConvertSurface');
  return sdlConvertSurfaceLookupFunction(surface, format);
}

///
/// Copy an existing surface to a new surface of the specified format and
/// colorspace.
///
/// This function converts an existing surface to a new format and colorspace
/// and returns the new surface. This will perform any pixel format and
/// colorspace conversion needed.
///
/// If the original surface has alternate images, the new surface will have a
/// reference to them as well.
///
/// \param surface the existing SDL_Surface structure to convert.
/// \param format the new pixel format.
/// \param palette an optional palette to use for indexed formats, may be NULL.
/// \param colorspace the new colorspace.
/// \param props an SDL_PropertiesID with additional color properties, or 0.
/// \returns the new SDL_Surface structure that is created or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ConvertSurface
/// \sa SDL_DestroySurface
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL SDL_ConvertSurfaceAndColorspace(SDL_Surface *surface, SDL_PixelFormat format, SDL_Palette *palette, SDL_Colorspace colorspace, SDL_PropertiesID props)
/// ```
/// {@category surface}
Pointer<SdlSurface> sdlConvertSurfaceAndColorspace(
  Pointer<SdlSurface> surface,
  int format,
  Pointer<SdlPalette> palette,
  int colorspace,
  int props,
) {
  final sdlConvertSurfaceAndColorspaceLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<SdlSurface> surface,
          Int32 format,
          Pointer<SdlPalette> palette,
          Int32 colorspace,
          Uint32 props,
        ),
        Pointer<SdlSurface> Function(
          Pointer<SdlSurface> surface,
          int format,
          Pointer<SdlPalette> palette,
          int colorspace,
          int props,
        )
      >('SDL_ConvertSurfaceAndColorspace');
  return sdlConvertSurfaceAndColorspaceLookupFunction(
    surface,
    format,
    palette,
    colorspace,
    props,
  );
}

///
/// Copy a block of pixels of one format to another format.
///
/// \param width the width of the block to copy, in pixels.
/// \param height the height of the block to copy, in pixels.
/// \param src_format an SDL_PixelFormat value of the `src` pixels format.
/// \param src a pointer to the source pixels.
/// \param src_pitch the pitch of the source pixels, in bytes.
/// \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
/// \param dst a pointer to be filled in with new pixel data.
/// \param dst_pitch the pitch of the destination pixels, in bytes.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety The same destination pixels should not be used from two
/// threads at once. It is safe to use the same source pixels
/// from multiple threads.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ConvertPixelsAndColorspace
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ConvertPixels(int width, int height, SDL_PixelFormat src_format, const void *src, int src_pitch, SDL_PixelFormat dst_format, void *dst, int dst_pitch)
/// ```
/// {@category surface}
bool sdlConvertPixels(
  int width,
  int height,
  int srcFormat,
  Pointer<NativeType> src,
  int srcPitch,
  int dstFormat,
  Pointer<NativeType> dst,
  int dstPitch,
) {
  final sdlConvertPixelsLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Int32 width,
          Int32 height,
          Int32 srcFormat,
          Pointer<NativeType> src,
          Int32 srcPitch,
          Int32 dstFormat,
          Pointer<NativeType> dst,
          Int32 dstPitch,
        ),
        int Function(
          int width,
          int height,
          int srcFormat,
          Pointer<NativeType> src,
          int srcPitch,
          int dstFormat,
          Pointer<NativeType> dst,
          int dstPitch,
        )
      >('SDL_ConvertPixels');
  return sdlConvertPixelsLookupFunction(
        width,
        height,
        srcFormat,
        src,
        srcPitch,
        dstFormat,
        dst,
        dstPitch,
      ) ==
      1;
}

///
/// Copy a block of pixels of one format and colorspace to another format and
/// colorspace.
///
/// \param width the width of the block to copy, in pixels.
/// \param height the height of the block to copy, in pixels.
/// \param src_format an SDL_PixelFormat value of the `src` pixels format.
/// \param src_colorspace an SDL_Colorspace value describing the colorspace of
/// the `src` pixels.
/// \param src_properties an SDL_PropertiesID with additional source color
/// properties, or 0.
/// \param src a pointer to the source pixels.
/// \param src_pitch the pitch of the source pixels, in bytes.
/// \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
/// \param dst_colorspace an SDL_Colorspace value describing the colorspace of
/// the `dst` pixels.
/// \param dst_properties an SDL_PropertiesID with additional destination color
/// properties, or 0.
/// \param dst a pointer to be filled in with new pixel data.
/// \param dst_pitch the pitch of the destination pixels, in bytes.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety The same destination pixels should not be used from two
/// threads at once. It is safe to use the same source pixels
/// from multiple threads.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ConvertPixels
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ConvertPixelsAndColorspace(int width, int height, SDL_PixelFormat src_format, SDL_Colorspace src_colorspace, SDL_PropertiesID src_properties, const void *src, int src_pitch, SDL_PixelFormat dst_format, SDL_Colorspace dst_colorspace, SDL_PropertiesID dst_properties, void *dst, int dst_pitch)
/// ```
/// {@category surface}
bool sdlConvertPixelsAndColorspace(
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
  int dstPitch,
) {
  final sdlConvertPixelsAndColorspaceLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
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
          Int32 dstPitch,
        ),
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
          int dstPitch,
        )
      >('SDL_ConvertPixelsAndColorspace');
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
        dstPitch,
      ) ==
      1;
}

///
/// Premultiply the alpha on a block of pixels.
///
/// This is safe to use with src == dst, but not for other overlapping areas.
///
/// \param width the width of the block to convert, in pixels.
/// \param height the height of the block to convert, in pixels.
/// \param src_format an SDL_PixelFormat value of the `src` pixels format.
/// \param src a pointer to the source pixels.
/// \param src_pitch the pitch of the source pixels, in bytes.
/// \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
/// \param dst a pointer to be filled in with premultiplied pixel data.
/// \param dst_pitch the pitch of the destination pixels, in bytes.
/// \param linear true to convert from sRGB to linear space for the alpha
/// multiplication, false to do multiplication in sRGB space.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety The same destination pixels should not be used from two
/// threads at once. It is safe to use the same source pixels
/// from multiple threads.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_PremultiplyAlpha(int width, int height, SDL_PixelFormat src_format, const void *src, int src_pitch, SDL_PixelFormat dst_format, void *dst, int dst_pitch, bool linear)
/// ```
/// {@category surface}
bool sdlPremultiplyAlpha(
  int width,
  int height,
  int srcFormat,
  Pointer<NativeType> src,
  int srcPitch,
  int dstFormat,
  Pointer<NativeType> dst,
  int dstPitch,
  bool linear,
) {
  final sdlPremultiplyAlphaLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Int32 width,
          Int32 height,
          Int32 srcFormat,
          Pointer<NativeType> src,
          Int32 srcPitch,
          Int32 dstFormat,
          Pointer<NativeType> dst,
          Int32 dstPitch,
          Uint8 linear,
        ),
        int Function(
          int width,
          int height,
          int srcFormat,
          Pointer<NativeType> src,
          int srcPitch,
          int dstFormat,
          Pointer<NativeType> dst,
          int dstPitch,
          int linear,
        )
      >('SDL_PremultiplyAlpha');
  return sdlPremultiplyAlphaLookupFunction(
        width,
        height,
        srcFormat,
        src,
        srcPitch,
        dstFormat,
        dst,
        dstPitch,
        linear ? 1 : 0,
      ) ==
      1;
}

///
/// Premultiply the alpha in a surface.
///
/// This is safe to use with src == dst, but not for other overlapping areas.
///
/// \param surface the surface to modify.
/// \param linear true to convert from sRGB to linear space for the alpha
/// multiplication, false to do multiplication in sRGB space.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_PremultiplySurfaceAlpha(SDL_Surface *surface, bool linear)
/// ```
/// {@category surface}
bool sdlPremultiplySurfaceAlpha(Pointer<SdlSurface> surface, bool linear) {
  final sdlPremultiplySurfaceAlphaLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Uint8 linear),
        int Function(Pointer<SdlSurface> surface, int linear)
      >('SDL_PremultiplySurfaceAlpha');
  return sdlPremultiplySurfaceAlphaLookupFunction(surface, linear ? 1 : 0) == 1;
}

///
/// Clear a surface with a specific color, with floating point precision.
///
/// This function handles all surface formats, and ignores any clip rectangle.
///
/// If the surface is YUV, the color is assumed to be in the sRGB colorspace,
/// otherwise the color is assumed to be in the colorspace of the suface.
///
/// \param surface the SDL_Surface to clear.
/// \param r the red component of the pixel, normally in the range 0-1.
/// \param g the green component of the pixel, normally in the range 0-1.
/// \param b the blue component of the pixel, normally in the range 0-1.
/// \param a the alpha component of the pixel, normally in the range 0-1.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ClearSurface(SDL_Surface *surface, float r, float g, float b, float a)
/// ```
/// {@category surface}
bool sdlClearSurface(
  Pointer<SdlSurface> surface,
  double r,
  double g,
  double b,
  double a,
) {
  final sdlClearSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Float r,
          Float g,
          Float b,
          Float a,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          double r,
          double g,
          double b,
          double a,
        )
      >('SDL_ClearSurface');
  return sdlClearSurfaceLookupFunction(surface, r, g, b, a) == 1;
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
bool sdlFillSurfaceRect(
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> rect,
  int color,
) {
  final sdlFillSurfaceRectLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> rect,
          Uint32 color,
        ),
        int Function(Pointer<SdlSurface> dst, Pointer<SdlRect> rect, int color)
      >('SDL_FillSurfaceRect');
  return sdlFillSurfaceRectLookupFunction(dst, rect, color) == 1;
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
bool sdlFillSurfaceRects(
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> rects,
  int count,
  int color,
) {
  final sdlFillSurfaceRectsLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> rects,
          Int32 count,
          Uint32 color,
        ),
        int Function(
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> rects,
          int count,
          int color,
        )
      >('SDL_FillSurfaceRects');
  return sdlFillSurfaceRectsLookupFunction(dst, rects, count, color) == 1;
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
bool sdlBlitSurface(
  Pointer<SdlSurface> src,
  Pointer<SdlRect> srcrect,
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> dstrect,
) {
  final sdlBlitSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        ),
        int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        )
      >('SDL_BlitSurface');
  return sdlBlitSurfaceLookupFunction(src, srcrect, dst, dstrect) == 1;
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
bool sdlBlitSurfaceUnchecked(
  Pointer<SdlSurface> src,
  Pointer<SdlRect> srcrect,
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> dstrect,
) {
  final sdlBlitSurfaceUncheckedLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        ),
        int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        )
      >('SDL_BlitSurfaceUnchecked');
  return sdlBlitSurfaceUncheckedLookupFunction(src, srcrect, dst, dstrect) == 1;
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
bool sdlBlitSurfaceScaled(
  Pointer<SdlSurface> src,
  Pointer<SdlRect> srcrect,
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> dstrect,
  int scaleMode,
) {
  final sdlBlitSurfaceScaledLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          Int32 scaleMode,
        ),
        int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          int scaleMode,
        )
      >('SDL_BlitSurfaceScaled');
  return sdlBlitSurfaceScaledLookupFunction(
        src,
        srcrect,
        dst,
        dstrect,
        scaleMode,
      ) ==
      1;
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
bool sdlBlitSurfaceUncheckedScaled(
  Pointer<SdlSurface> src,
  Pointer<SdlRect> srcrect,
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> dstrect,
  int scaleMode,
) {
  final sdlBlitSurfaceUncheckedScaledLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          Int32 scaleMode,
        ),
        int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          int scaleMode,
        )
      >('SDL_BlitSurfaceUncheckedScaled');
  return sdlBlitSurfaceUncheckedScaledLookupFunction(
        src,
        srcrect,
        dst,
        dstrect,
        scaleMode,
      ) ==
      1;
}

///
/// Perform a stretched pixel copy from one surface to another.
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
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_BlitSurfaceScaled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_StretchSurface(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect, SDL_ScaleMode scaleMode)
/// ```
/// {@category surface}
bool sdlStretchSurface(
  Pointer<SdlSurface> src,
  Pointer<SdlRect> srcrect,
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> dstrect,
  int scaleMode,
) {
  final sdlStretchSurfaceLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          Int32 scaleMode,
        ),
        int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
          int scaleMode,
        )
      >('SDL_StretchSurface');
  return sdlStretchSurfaceLookupFunction(
        src,
        srcrect,
        dst,
        dstrect,
        scaleMode,
      ) ==
      1;
}

///
/// Perform a tiled blit to a destination surface, which may be of a different
/// format.
///
/// The pixels in `srcrect` will be repeated as many times as needed to
/// completely fill `dstrect`.
///
/// \param src the SDL_Surface structure to be copied from.
/// \param srcrect the SDL_Rect structure representing the rectangle to be
/// copied, or NULL to copy the entire surface.
/// \param dst the SDL_Surface structure that is the blit target.
/// \param dstrect the SDL_Rect structure representing the target rectangle in
/// the destination surface, or NULL to fill the entire surface.
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
/// extern SDL_DECLSPEC bool SDLCALL SDL_BlitSurfaceTiled(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, const SDL_Rect *dstrect)
/// ```
/// {@category surface}
bool sdlBlitSurfaceTiled(
  Pointer<SdlSurface> src,
  Pointer<SdlRect> srcrect,
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> dstrect,
) {
  final sdlBlitSurfaceTiledLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        ),
        int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        )
      >('SDL_BlitSurfaceTiled');
  return sdlBlitSurfaceTiledLookupFunction(src, srcrect, dst, dstrect) == 1;
}

///
/// Perform a scaled and tiled blit to a destination surface, which may be of a
/// different format.
///
/// The pixels in `srcrect` will be scaled and repeated as many times as needed
/// to completely fill `dstrect`.
///
/// \param src the SDL_Surface structure to be copied from.
/// \param srcrect the SDL_Rect structure representing the rectangle to be
/// copied, or NULL to copy the entire surface.
/// \param scale the scale used to transform srcrect into the destination
/// rectangle, e.g. a 32x32 texture with a scale of 2 would fill
/// 64x64 tiles.
/// \param scaleMode scale algorithm to be used.
/// \param dst the SDL_Surface structure that is the blit target.
/// \param dstrect the SDL_Rect structure representing the target rectangle in
/// the destination surface, or NULL to fill the entire surface.
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
/// extern SDL_DECLSPEC bool SDLCALL SDL_BlitSurfaceTiledWithScale(SDL_Surface *src, const SDL_Rect *srcrect, float scale, SDL_ScaleMode scaleMode, SDL_Surface *dst, const SDL_Rect *dstrect)
/// ```
/// {@category surface}
bool sdlBlitSurfaceTiledWithScale(
  Pointer<SdlSurface> src,
  Pointer<SdlRect> srcrect,
  double scale,
  int scaleMode,
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> dstrect,
) {
  final sdlBlitSurfaceTiledWithScaleLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Float scale,
          Int32 scaleMode,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        ),
        int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          double scale,
          int scaleMode,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        )
      >('SDL_BlitSurfaceTiledWithScale');
  return sdlBlitSurfaceTiledWithScaleLookupFunction(
        src,
        srcrect,
        scale,
        scaleMode,
        dst,
        dstrect,
      ) ==
      1;
}

///
/// Perform a scaled blit using the 9-grid algorithm to a destination surface,
/// which may be of a different format.
///
/// The pixels in the source surface are split into a 3x3 grid, using the
/// different corner sizes for each corner, and the sides and center making up
/// the remaining pixels. The corners are then scaled using `scale` and fit
/// into the corners of the destination rectangle. The sides and center are
/// then stretched into place to cover the remaining destination rectangle.
///
/// \param src the SDL_Surface structure to be copied from.
/// \param srcrect the SDL_Rect structure representing the rectangle to be used
/// for the 9-grid, or NULL to use the entire surface.
/// \param left_width the width, in pixels, of the left corners in `srcrect`.
/// \param right_width the width, in pixels, of the right corners in `srcrect`.
/// \param top_height the height, in pixels, of the top corners in `srcrect`.
/// \param bottom_height the height, in pixels, of the bottom corners in
/// `srcrect`.
/// \param scale the scale used to transform the corner of `srcrect` into the
/// corner of `dstrect`, or 0.0f for an unscaled blit.
/// \param scaleMode scale algorithm to be used.
/// \param dst the SDL_Surface structure that is the blit target.
/// \param dstrect the SDL_Rect structure representing the target rectangle in
/// the destination surface, or NULL to fill the entire surface.
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
/// extern SDL_DECLSPEC bool SDLCALL SDL_BlitSurface9Grid(SDL_Surface *src, const SDL_Rect *srcrect, int left_width, int right_width, int top_height, int bottom_height, float scale, SDL_ScaleMode scaleMode, SDL_Surface *dst, const SDL_Rect *dstrect)
/// ```
/// {@category surface}
bool sdlBlitSurface9Grid(
  Pointer<SdlSurface> src,
  Pointer<SdlRect> srcrect,
  int leftWidth,
  int rightWidth,
  int topHeight,
  int bottomHeight,
  double scale,
  int scaleMode,
  Pointer<SdlSurface> dst,
  Pointer<SdlRect> dstrect,
) {
  final sdlBlitSurface9GridLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          Int32 leftWidth,
          Int32 rightWidth,
          Int32 topHeight,
          Int32 bottomHeight,
          Float scale,
          Int32 scaleMode,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        ),
        int Function(
          Pointer<SdlSurface> src,
          Pointer<SdlRect> srcrect,
          int leftWidth,
          int rightWidth,
          int topHeight,
          int bottomHeight,
          double scale,
          int scaleMode,
          Pointer<SdlSurface> dst,
          Pointer<SdlRect> dstrect,
        )
      >('SDL_BlitSurface9Grid');
  return sdlBlitSurface9GridLookupFunction(
        src,
        srcrect,
        leftWidth,
        rightWidth,
        topHeight,
        bottomHeight,
        scale,
        scaleMode,
        dst,
        dstrect,
      ) ==
      1;
}

///
/// Map an RGB triple to an opaque pixel value for a surface.
///
/// This function maps the RGB color value to the specified pixel format and
/// returns the pixel value best approximating the given RGB color value for
/// the given pixel format.
///
/// If the surface has a palette, the index of the closest matching color in
/// the palette will be returned.
///
/// If the surface pixel format has an alpha component it will be returned as
/// all 1 bits (fully opaque).
///
/// If the pixel format bpp (color depth) is less than 32-bpp then the unused
/// upper bits of the return value can safely be ignored (e.g., with a 16-bpp
/// format the return value can be assigned to a Uint16, and similarly a Uint8
/// for an 8-bpp format).
///
/// \param surface the surface to use for the pixel format and palette.
/// \param r the red component of the pixel in the range 0-255.
/// \param g the green component of the pixel in the range 0-255.
/// \param b the blue component of the pixel in the range 0-255.
/// \returns a pixel value.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_MapSurfaceRGBA
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_MapSurfaceRGB(SDL_Surface *surface, Uint8 r, Uint8 g, Uint8 b)
/// ```
/// {@category surface}
int sdlMapSurfaceRgb(Pointer<SdlSurface> surface, int r, int g, int b) {
  final sdlMapSurfaceRgbLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlSurface> surface, Uint8 r, Uint8 g, Uint8 b),
        int Function(Pointer<SdlSurface> surface, int r, int g, int b)
      >('SDL_MapSurfaceRGB');
  return sdlMapSurfaceRgbLookupFunction(surface, r, g, b);
}

///
/// Map an RGBA quadruple to a pixel value for a surface.
///
/// This function maps the RGBA color value to the specified pixel format and
/// returns the pixel value best approximating the given RGBA color value for
/// the given pixel format.
///
/// If the surface pixel format has no alpha component the alpha value will be
/// ignored (as it will be in formats with a palette).
///
/// If the surface has a palette, the index of the closest matching color in
/// the palette will be returned.
///
/// If the pixel format bpp (color depth) is less than 32-bpp then the unused
/// upper bits of the return value can safely be ignored (e.g., with a 16-bpp
/// format the return value can be assigned to a Uint16, and similarly a Uint8
/// for an 8-bpp format).
///
/// \param surface the surface to use for the pixel format and palette.
/// \param r the red component of the pixel in the range 0-255.
/// \param g the green component of the pixel in the range 0-255.
/// \param b the blue component of the pixel in the range 0-255.
/// \param a the alpha component of the pixel in the range 0-255.
/// \returns a pixel value.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_MapSurfaceRGB
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_MapSurfaceRGBA(SDL_Surface *surface, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
/// ```
/// {@category surface}
int sdlMapSurfaceRgba(Pointer<SdlSurface> surface, int r, int g, int b, int a) {
  final sdlMapSurfaceRgbaLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(
          Pointer<SdlSurface> surface,
          Uint8 r,
          Uint8 g,
          Uint8 b,
          Uint8 a,
        ),
        int Function(Pointer<SdlSurface> surface, int r, int g, int b, int a)
      >('SDL_MapSurfaceRGBA');
  return sdlMapSurfaceRgbaLookupFunction(surface, r, g, b, a);
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
/// \param surface the surface to read.
/// \param x the horizontal coordinate, 0 <= x < width.
/// \param y the vertical coordinate, 0 <= y < height.
/// \param r a pointer filled in with the red channel, 0-255, or NULL to ignore
/// this channel.
/// \param g a pointer filled in with the green channel, 0-255, or NULL to
/// ignore this channel.
/// \param b a pointer filled in with the blue channel, 0-255, or NULL to
/// ignore this channel.
/// \param a a pointer filled in with the alpha channel, 0-255, or NULL to
/// ignore this channel.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadSurfacePixel(SDL_Surface *surface, int x, int y, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a)
/// ```
/// {@category surface}
bool sdlReadSurfacePixel(
  Pointer<SdlSurface> surface,
  int x,
  int y,
  Pointer<Uint8> r,
  Pointer<Uint8> g,
  Pointer<Uint8> b,
  Pointer<Uint8> a,
) {
  final sdlReadSurfacePixelLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Int32 x,
          Int32 y,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          int x,
          int y,
          Pointer<Uint8> r,
          Pointer<Uint8> g,
          Pointer<Uint8> b,
          Pointer<Uint8> a,
        )
      >('SDL_ReadSurfacePixel');
  return sdlReadSurfacePixelLookupFunction(surface, x, y, r, g, b, a) == 1;
}

///
/// Retrieves a single pixel from a surface.
///
/// This function prioritizes correctness over speed: it is suitable for unit
/// tests, but is not intended for use in a game engine.
///
/// \param surface the surface to read.
/// \param x the horizontal coordinate, 0 <= x < width.
/// \param y the vertical coordinate, 0 <= y < height.
/// \param r a pointer filled in with the red channel, normally in the range
/// 0-1, or NULL to ignore this channel.
/// \param g a pointer filled in with the green channel, normally in the range
/// 0-1, or NULL to ignore this channel.
/// \param b a pointer filled in with the blue channel, normally in the range
/// 0-1, or NULL to ignore this channel.
/// \param a a pointer filled in with the alpha channel, normally in the range
/// 0-1, or NULL to ignore this channel.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadSurfacePixelFloat(SDL_Surface *surface, int x, int y, float *r, float *g, float *b, float *a)
/// ```
/// {@category surface}
bool sdlReadSurfacePixelFloat(
  Pointer<SdlSurface> surface,
  int x,
  int y,
  Pointer<Float> r,
  Pointer<Float> g,
  Pointer<Float> b,
  Pointer<Float> a,
) {
  final sdlReadSurfacePixelFloatLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Int32 x,
          Int32 y,
          Pointer<Float> r,
          Pointer<Float> g,
          Pointer<Float> b,
          Pointer<Float> a,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          int x,
          int y,
          Pointer<Float> r,
          Pointer<Float> g,
          Pointer<Float> b,
          Pointer<Float> a,
        )
      >('SDL_ReadSurfacePixelFloat');
  return sdlReadSurfacePixelFloatLookupFunction(surface, x, y, r, g, b, a) == 1;
}

///
/// Writes a single pixel to a surface.
///
/// This function prioritizes correctness over speed: it is suitable for unit
/// tests, but is not intended for use in a game engine.
///
/// Like SDL_MapRGBA, this uses the entire 0..255 range when converting color
/// components from pixel formats with less than 8 bits per RGB component.
///
/// \param surface the surface to write.
/// \param x the horizontal coordinate, 0 <= x < width.
/// \param y the vertical coordinate, 0 <= y < height.
/// \param r the red channel value, 0-255.
/// \param g the green channel value, 0-255.
/// \param b the blue channel value, 0-255.
/// \param a the alpha channel value, 0-255.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteSurfacePixel(SDL_Surface *surface, int x, int y, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
/// ```
/// {@category surface}
bool sdlWriteSurfacePixel(
  Pointer<SdlSurface> surface,
  int x,
  int y,
  int r,
  int g,
  int b,
  int a,
) {
  final sdlWriteSurfacePixelLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Int32 x,
          Int32 y,
          Uint8 r,
          Uint8 g,
          Uint8 b,
          Uint8 a,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          int x,
          int y,
          int r,
          int g,
          int b,
          int a,
        )
      >('SDL_WriteSurfacePixel');
  return sdlWriteSurfacePixelLookupFunction(surface, x, y, r, g, b, a) == 1;
}

///
/// Writes a single pixel to a surface.
///
/// This function prioritizes correctness over speed: it is suitable for unit
/// tests, but is not intended for use in a game engine.
///
/// \param surface the surface to write.
/// \param x the horizontal coordinate, 0 <= x < width.
/// \param y the vertical coordinate, 0 <= y < height.
/// \param r the red channel value, normally in the range 0-1.
/// \param g the green channel value, normally in the range 0-1.
/// \param b the blue channel value, normally in the range 0-1.
/// \param a the alpha channel value, normally in the range 0-1.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety This function is not thread safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteSurfacePixelFloat(SDL_Surface *surface, int x, int y, float r, float g, float b, float a)
/// ```
/// {@category surface}
bool sdlWriteSurfacePixelFloat(
  Pointer<SdlSurface> surface,
  int x,
  int y,
  double r,
  double g,
  double b,
  double a,
) {
  final sdlWriteSurfacePixelFloatLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Int32 x,
          Int32 y,
          Float r,
          Float g,
          Float b,
          Float a,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          int x,
          int y,
          double r,
          double g,
          double b,
          double a,
        )
      >('SDL_WriteSurfacePixelFloat');
  return sdlWriteSurfacePixelFloatLookupFunction(surface, x, y, r, g, b, a) ==
      1;
}
