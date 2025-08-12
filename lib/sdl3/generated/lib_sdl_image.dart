// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
part of '../sdl_image.dart';

///
/// This function gets the version of the dynamically linked SDL_image library.
///
/// \returns SDL_image version.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL IMG_Version(void)
/// ```
/// {@category image}
int imgVersion() {
  final imgVersionLookupFunction = _libImage
      .lookupFunction<Int32 Function(), int Function()>('IMG_Version');
  return imgVersionLookupFunction();
}

///
/// Load an image from an SDL data source into a software surface.
///
/// An SDL_Surface is a buffer of pixels in memory accessible by the CPU. Use
/// this if you plan to hand the data to something else or manipulate it
/// further in code.
///
/// There are no guarantees about what format the new SDL_Surface data will be;
/// in many cases, SDL_image will attempt to supply a surface that exactly
/// matches the provided image, but in others it might have to convert (either
/// because the image is in a format that SDL doesn't directly support or
/// because it's compressed data that could reasonably uncompress to various
/// formats and SDL_image had to pick one). You can inspect an SDL_Surface for
/// its specifics, and use SDL_ConvertSurface to then migrate to any supported
/// format.
///
/// If the image format supports a transparent pixel, SDL will set the colorkey
/// for the surface. You can enable RLE acceleration on the surface afterwards
/// by calling: SDL_SetSurfaceColorKey(image, SDL_RLEACCEL,
/// image->format->colorkey);
///
/// If `closeio` is true, `src` will be closed before returning, whether this
/// function succeeds or not. SDL_image reads everything it needs from `src`
/// during this call in any case.
///
/// Even though this function accepts a file type, SDL_image may still try
/// other decoders that are capable of detecting file type from the contents of
/// the image data, but may rely on the caller-provided type string for formats
/// that it cannot autodetect. If `type` is NULL, SDL_image will rely solely on
/// its ability to guess the format.
///
/// There is a separate function to read files from disk without having to deal
/// with SDL_IOStream: `IMG_Load("filename.jpg")` will call this function and
/// manage those details for you, determining the file type from the filename's
/// extension.
///
/// There is also IMG_Load_IO(), which is equivalent to this function except
/// that it will rely on SDL_image to determine what type of data it is
/// loading, much like passing a NULL for type.
///
/// If you are using SDL's 2D rendering API, there is an equivalent call to
/// load images directly into an SDL_Texture for use by the GPU without using a
/// software surface: call IMG_LoadTextureTyped_IO() instead.
///
/// When done with the returned surface, the app should dispose of it with a
/// call to SDL_DestroySurface().
///
/// \param src an SDL_IOStream that data will be read from.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param type a filename extension that represent this data ("BMP", "GIF",
/// "PNG", etc).
/// \returns a new SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_Load
/// \sa IMG_Load_IO
/// \sa SDL_DestroySurface
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadTyped_IO(SDL_IOStream *src, bool closeio, const char *type)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadTypedIo(
  Pointer<SdlIoStream> src,
  bool closeio,
  String? type,
) {
  final imgLoadTypedIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<SdlIoStream> src,
          Uint8 closeio,
          Pointer<Utf8> type,
        ),
        Pointer<SdlSurface> Function(
          Pointer<SdlIoStream> src,
          int closeio,
          Pointer<Utf8> type,
        )
      >('IMG_LoadTyped_IO');
  final typePointer = type != null ? type.toNativeUtf8() : nullptr;
  final result = imgLoadTypedIoLookupFunction(
    src,
    closeio ? 1 : 0,
    typePointer,
  );
  calloc.free(typePointer);
  return result;
}

///
/// Load an image from a filesystem path into a software surface.
///
/// An SDL_Surface is a buffer of pixels in memory accessible by the CPU. Use
/// this if you plan to hand the data to something else or manipulate it
/// further in code.
///
/// There are no guarantees about what format the new SDL_Surface data will be;
/// in many cases, SDL_image will attempt to supply a surface that exactly
/// matches the provided image, but in others it might have to convert (either
/// because the image is in a format that SDL doesn't directly support or
/// because it's compressed data that could reasonably uncompress to various
/// formats and SDL_image had to pick one). You can inspect an SDL_Surface for
/// its specifics, and use SDL_ConvertSurface to then migrate to any supported
/// format.
///
/// If the image format supports a transparent pixel, SDL will set the colorkey
/// for the surface. You can enable RLE acceleration on the surface afterwards
/// by calling: SDL_SetSurfaceColorKey(image, SDL_RLEACCEL,
/// image->format->colorkey);
///
/// There is a separate function to read files from an SDL_IOStream, if you
/// need an i/o abstraction to provide data from anywhere instead of a simple
/// filesystem read; that function is IMG_Load_IO().
///
/// If you are using SDL's 2D rendering API, there is an equivalent call to
/// load images directly into an SDL_Texture for use by the GPU without using a
/// software surface: call IMG_LoadTexture() instead.
///
/// When done with the returned surface, the app should dispose of it with a
/// call to
/// [SDL_DestroySurface](https://wiki.libsdl.org/SDL3/SDL_DestroySurface)
/// ().
///
/// \param file a path on the filesystem to load an image from.
/// \returns a new SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadTyped_IO
/// \sa IMG_Load_IO
/// \sa SDL_DestroySurface
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_Load(const char *file)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoad(String? file) {
  final imgLoadLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<Utf8> file),
        Pointer<SdlSurface> Function(Pointer<Utf8> file)
      >('IMG_Load');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgLoadLookupFunction(filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Load an image from an SDL data source into a software surface.
///
/// An SDL_Surface is a buffer of pixels in memory accessible by the CPU. Use
/// this if you plan to hand the data to something else or manipulate it
/// further in code.
///
/// There are no guarantees about what format the new SDL_Surface data will be;
/// in many cases, SDL_image will attempt to supply a surface that exactly
/// matches the provided image, but in others it might have to convert (either
/// because the image is in a format that SDL doesn't directly support or
/// because it's compressed data that could reasonably uncompress to various
/// formats and SDL_image had to pick one). You can inspect an SDL_Surface for
/// its specifics, and use SDL_ConvertSurface to then migrate to any supported
/// format.
///
/// If the image format supports a transparent pixel, SDL will set the colorkey
/// for the surface. You can enable RLE acceleration on the surface afterwards
/// by calling: SDL_SetSurfaceColorKey(image, SDL_RLEACCEL,
/// image->format->colorkey);
///
/// If `closeio` is true, `src` will be closed before returning, whether this
/// function succeeds or not. SDL_image reads everything it needs from `src`
/// during this call in any case.
///
/// There is a separate function to read files from disk without having to deal
/// with SDL_IOStream: `IMG_Load("filename.jpg")` will call this function and
/// manage those details for you, determining the file type from the filename's
/// extension.
///
/// There is also IMG_LoadTyped_IO(), which is equivalent to this function
/// except a file extension (like "BMP", "JPG", etc) can be specified, in case
/// SDL_image cannot autodetect the file format.
///
/// If you are using SDL's 2D rendering API, there is an equivalent call to
/// load images directly into an SDL_Texture for use by the GPU without using a
/// software surface: call IMG_LoadTexture_IO() instead.
///
/// When done with the returned surface, the app should dispose of it with a
/// call to SDL_DestroySurface().
///
/// \param src an SDL_IOStream that data will be read from.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns a new SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_Load
/// \sa IMG_LoadTyped_IO
/// \sa SDL_DestroySurface
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_Load_IO(SDL_IOStream *src, bool closeio)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadIo(Pointer<SdlIoStream> src, bool closeio) {
  final imgLoadIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src, Uint8 closeio),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src, int closeio)
      >('IMG_Load_IO');
  return imgLoadIoLookupFunction(src, closeio ? 1 : 0);
}

///
/// Load an image from a filesystem path into a GPU texture.
///
/// An SDL_Texture represents an image in GPU memory, usable by SDL's 2D Render
/// API. This can be significantly more efficient than using a CPU-bound
/// SDL_Surface if you don't need to manipulate the image directly after
/// loading it.
///
/// If the loaded image has transparency or a colorkey, a texture with an alpha
/// channel will be created. Otherwise, SDL_image will attempt to create an
/// SDL_Texture in the most format that most reasonably represents the image
/// data (but in many cases, this will just end up being 32-bit RGB or 32-bit
/// RGBA).
///
/// There is a separate function to read files from an SDL_IOStream, if you
/// need an i/o abstraction to provide data from anywhere instead of a simple
/// filesystem read; that function is IMG_LoadTexture_IO().
///
/// If you would rather decode an image to an SDL_Surface (a buffer of pixels
/// in CPU memory), call IMG_Load() instead.
///
/// When done with the returned texture, the app should dispose of it with a
/// call to SDL_DestroyTexture().
///
/// \param renderer the SDL_Renderer to use to create the GPU texture.
/// \param file a path on the filesystem to load an image from.
/// \returns a new texture, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadTextureTyped_IO
/// \sa IMG_LoadTexture_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Texture * SDLCALL IMG_LoadTexture(SDL_Renderer *renderer, const char *file)
/// ```
/// {@category image}
Pointer<SdlTexture> imgLoadTexture(
  Pointer<SdlRenderer> renderer,
  String? file,
) {
  final imgLoadTextureLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlTexture> Function(
          Pointer<SdlRenderer> renderer,
          Pointer<Utf8> file,
        ),
        Pointer<SdlTexture> Function(
          Pointer<SdlRenderer> renderer,
          Pointer<Utf8> file,
        )
      >('IMG_LoadTexture');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgLoadTextureLookupFunction(renderer, filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Load an image from an SDL data source into a GPU texture.
///
/// An SDL_Texture represents an image in GPU memory, usable by SDL's 2D Render
/// API. This can be significantly more efficient than using a CPU-bound
/// SDL_Surface if you don't need to manipulate the image directly after
/// loading it.
///
/// If the loaded image has transparency or a colorkey, a texture with an alpha
/// channel will be created. Otherwise, SDL_image will attempt to create an
/// SDL_Texture in the most format that most reasonably represents the image
/// data (but in many cases, this will just end up being 32-bit RGB or 32-bit
/// RGBA).
///
/// If `closeio` is true, `src` will be closed before returning, whether this
/// function succeeds or not. SDL_image reads everything it needs from `src`
/// during this call in any case.
///
/// There is a separate function to read files from disk without having to deal
/// with SDL_IOStream: `IMG_LoadTexture(renderer, "filename.jpg")` will call
/// this function and manage those details for you, determining the file type
/// from the filename's extension.
///
/// There is also IMG_LoadTextureTyped_IO(), which is equivalent to this
/// function except a file extension (like "BMP", "JPG", etc) can be specified,
/// in case SDL_image cannot autodetect the file format.
///
/// If you would rather decode an image to an SDL_Surface (a buffer of pixels
/// in CPU memory), call IMG_Load() instead.
///
/// When done with the returned texture, the app should dispose of it with a
/// call to SDL_DestroyTexture().
///
/// \param renderer the SDL_Renderer to use to create the GPU texture.
/// \param src an SDL_IOStream that data will be read from.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns a new texture, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadTexture
/// \sa IMG_LoadTextureTyped_IO
/// \sa SDL_DestroyTexture
///
/// ```c
/// extern SDL_DECLSPEC SDL_Texture * SDLCALL IMG_LoadTexture_IO(SDL_Renderer *renderer, SDL_IOStream *src, bool closeio)
/// ```
/// {@category image}
Pointer<SdlTexture> imgLoadTextureIo(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlIoStream> src,
  bool closeio,
) {
  final imgLoadTextureIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlTexture> Function(
          Pointer<SdlRenderer> renderer,
          Pointer<SdlIoStream> src,
          Uint8 closeio,
        ),
        Pointer<SdlTexture> Function(
          Pointer<SdlRenderer> renderer,
          Pointer<SdlIoStream> src,
          int closeio,
        )
      >('IMG_LoadTexture_IO');
  return imgLoadTextureIoLookupFunction(renderer, src, closeio ? 1 : 0);
}

///
/// Load an image from an SDL data source into a GPU texture.
///
/// An SDL_Texture represents an image in GPU memory, usable by SDL's 2D Render
/// API. This can be significantly more efficient than using a CPU-bound
/// SDL_Surface if you don't need to manipulate the image directly after
/// loading it.
///
/// If the loaded image has transparency or a colorkey, a texture with an alpha
/// channel will be created. Otherwise, SDL_image will attempt to create an
/// SDL_Texture in the most format that most reasonably represents the image
/// data (but in many cases, this will just end up being 32-bit RGB or 32-bit
/// RGBA).
///
/// If `closeio` is true, `src` will be closed before returning, whether this
/// function succeeds or not. SDL_image reads everything it needs from `src`
/// during this call in any case.
///
/// Even though this function accepts a file type, SDL_image may still try
/// other decoders that are capable of detecting file type from the contents of
/// the image data, but may rely on the caller-provided type string for formats
/// that it cannot autodetect. If `type` is NULL, SDL_image will rely solely on
/// its ability to guess the format.
///
/// There is a separate function to read files from disk without having to deal
/// with SDL_IOStream: `IMG_LoadTexture("filename.jpg")` will call this
/// function and manage those details for you, determining the file type from
/// the filename's extension.
///
/// There is also IMG_LoadTexture_IO(), which is equivalent to this function
/// except that it will rely on SDL_image to determine what type of data it is
/// loading, much like passing a NULL for type.
///
/// If you would rather decode an image to an SDL_Surface (a buffer of pixels
/// in CPU memory), call IMG_LoadTyped_IO() instead.
///
/// When done with the returned texture, the app should dispose of it with a
/// call to SDL_DestroyTexture().
///
/// \param renderer the SDL_Renderer to use to create the GPU texture.
/// \param src an SDL_IOStream that data will be read from.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param type a filename extension that represent this data ("BMP", "GIF",
/// "PNG", etc).
/// \returns a new texture, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadTexture
/// \sa IMG_LoadTexture_IO
/// \sa SDL_DestroyTexture
///
/// ```c
/// extern SDL_DECLSPEC SDL_Texture * SDLCALL IMG_LoadTextureTyped_IO(SDL_Renderer *renderer, SDL_IOStream *src, bool closeio, const char *type)
/// ```
/// {@category image}
Pointer<SdlTexture> imgLoadTextureTypedIo(
  Pointer<SdlRenderer> renderer,
  Pointer<SdlIoStream> src,
  bool closeio,
  String? type,
) {
  final imgLoadTextureTypedIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlTexture> Function(
          Pointer<SdlRenderer> renderer,
          Pointer<SdlIoStream> src,
          Uint8 closeio,
          Pointer<Utf8> type,
        ),
        Pointer<SdlTexture> Function(
          Pointer<SdlRenderer> renderer,
          Pointer<SdlIoStream> src,
          int closeio,
          Pointer<Utf8> type,
        )
      >('IMG_LoadTextureTyped_IO');
  final typePointer = type != null ? type.toNativeUtf8() : nullptr;
  final result = imgLoadTextureTypedIoLookupFunction(
    renderer,
    src,
    closeio ? 1 : 0,
    typePointer,
  );
  calloc.free(typePointer);
  return result;
}

///
/// Detect AVIF image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is AVIF data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isAVIF(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsAvif(Pointer<SdlIoStream> src) {
  final imgIsAvifLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isAVIF');
  return imgIsAvifLookupFunction(src) == 1;
}

///
/// Detect ICO image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is ICO data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isICO(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsIco(Pointer<SdlIoStream> src) {
  final imgIsIcoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isICO');
  return imgIsIcoLookupFunction(src) == 1;
}

///
/// Detect CUR image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is CUR data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isCUR(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsCur(Pointer<SdlIoStream> src) {
  final imgIsCurLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isCUR');
  return imgIsCurLookupFunction(src) == 1;
}

///
/// Detect BMP image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is BMP data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isBMP(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsBmp(Pointer<SdlIoStream> src) {
  final imgIsBmpLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isBMP');
  return imgIsBmpLookupFunction(src) == 1;
}

///
/// Detect GIF image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is GIF data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isGIF(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsGif(Pointer<SdlIoStream> src) {
  final imgIsGifLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isGIF');
  return imgIsGifLookupFunction(src) == 1;
}

///
/// Detect JPG image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is JPG data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isJPG(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsJpg(Pointer<SdlIoStream> src) {
  final imgIsJpgLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isJPG');
  return imgIsJpgLookupFunction(src) == 1;
}

///
/// Detect JXL image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is JXL data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isJXL(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsJxl(Pointer<SdlIoStream> src) {
  final imgIsJxlLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isJXL');
  return imgIsJxlLookupFunction(src) == 1;
}

///
/// Detect LBM image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is LBM data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isLBM(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsLbm(Pointer<SdlIoStream> src) {
  final imgIsLbmLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isLBM');
  return imgIsLbmLookupFunction(src) == 1;
}

///
/// Detect PCX image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is PCX data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isPCX(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsPcx(Pointer<SdlIoStream> src) {
  final imgIsPcxLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isPCX');
  return imgIsPcxLookupFunction(src) == 1;
}

///
/// Detect PNG image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is PNG data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isPNG(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsPng(Pointer<SdlIoStream> src) {
  final imgIsPngLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isPNG');
  return imgIsPngLookupFunction(src) == 1;
}

///
/// Detect PNM image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is PNM data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isPNM(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsPnm(Pointer<SdlIoStream> src) {
  final imgIsPnmLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isPNM');
  return imgIsPnmLookupFunction(src) == 1;
}

///
/// Detect SVG image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is SVG data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isSVG(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsSvg(Pointer<SdlIoStream> src) {
  final imgIsSvgLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isSVG');
  return imgIsSvgLookupFunction(src) == 1;
}

///
/// Detect QOI image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is QOI data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isQOI(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsQoi(Pointer<SdlIoStream> src) {
  final imgIsQoiLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isQOI');
  return imgIsQoiLookupFunction(src) == 1;
}

///
/// Detect TIFF image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is TIFF data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isTIF(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsTif(Pointer<SdlIoStream> src) {
  final imgIsTifLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isTIF');
  return imgIsTifLookupFunction(src) == 1;
}

///
/// Detect XCF image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is XCF data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXPM
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isXCF(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsXcf(Pointer<SdlIoStream> src) {
  final imgIsXcfLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isXCF');
  return imgIsXcfLookupFunction(src) == 1;
}

///
/// Detect XPM image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is XPM data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXV
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isXPM(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsXpm(Pointer<SdlIoStream> src) {
  final imgIsXpmLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isXPM');
  return imgIsXpmLookupFunction(src) == 1;
}

///
/// Detect XV image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is XV data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isXV(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsXv(Pointer<SdlIoStream> src) {
  final imgIsXvLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isXV');
  return imgIsXvLookupFunction(src) == 1;
}

///
/// Detect WEBP image data on a readable/seekable SDL_IOStream.
///
/// This function attempts to determine if a file is a given filetype, reading
/// the least amount possible from the SDL_IOStream (usually a few bytes).
///
/// There is no distinction made between "not the filetype in question" and
/// basic i/o errors.
///
/// This function will always attempt to seek `src` back to where it started
/// when this function was called, but it will not report any errors in doing
/// so, but assuming seeking works, this means you can immediately use this
/// with a different IMG_isTYPE function, or load the image without further
/// seeking.
///
/// You do not need to call this function to load data; SDL_image can work to
/// determine file type in many cases in its standard load functions.
///
/// \param src a seekable/readable SDL_IOStream to provide image data.
/// \returns non-zero if this is WEBP data, zero otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isICO
/// \sa IMG_isCUR
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isWEBP(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsWebp(Pointer<SdlIoStream> src) {
  final imgIsWebpLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isWEBP');
  return imgIsWebpLookupFunction(src) == 1;
}

///
/// Load a AVIF image directly.
///
/// If you know you definitely have a AVIF image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadAVIF_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadAvifIo(Pointer<SdlIoStream> src) {
  final imgLoadAvifIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadAVIF_IO');
  return imgLoadAvifIoLookupFunction(src);
}

///
/// Load a ICO image directly.
///
/// If you know you definitely have a ICO image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadICO_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadIcoIo(Pointer<SdlIoStream> src) {
  final imgLoadIcoIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadICO_IO');
  return imgLoadIcoIoLookupFunction(src);
}

///
/// Load a CUR image directly.
///
/// If you know you definitely have a CUR image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadCUR_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadCurIo(Pointer<SdlIoStream> src) {
  final imgLoadCurIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadCUR_IO');
  return imgLoadCurIoLookupFunction(src);
}

///
/// Load a BMP image directly.
///
/// If you know you definitely have a BMP image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadBMP_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadBmpIo(Pointer<SdlIoStream> src) {
  final imgLoadBmpIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadBMP_IO');
  return imgLoadBmpIoLookupFunction(src);
}

///
/// Load a GIF image directly.
///
/// If you know you definitely have a GIF image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadGIF_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadGifIo(Pointer<SdlIoStream> src) {
  final imgLoadGifIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadGIF_IO');
  return imgLoadGifIoLookupFunction(src);
}

///
/// Load a JPG image directly.
///
/// If you know you definitely have a JPG image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadJPG_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadJpgIo(Pointer<SdlIoStream> src) {
  final imgLoadJpgIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadJPG_IO');
  return imgLoadJpgIoLookupFunction(src);
}

///
/// Load a JXL image directly.
///
/// If you know you definitely have a JXL image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadJXL_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadJxlIo(Pointer<SdlIoStream> src) {
  final imgLoadJxlIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadJXL_IO');
  return imgLoadJxlIoLookupFunction(src);
}

///
/// Load a LBM image directly.
///
/// If you know you definitely have a LBM image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadLBM_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadLbmIo(Pointer<SdlIoStream> src) {
  final imgLoadLbmIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadLBM_IO');
  return imgLoadLbmIoLookupFunction(src);
}

///
/// Load a PCX image directly.
///
/// If you know you definitely have a PCX image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadPCX_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadPcxIo(Pointer<SdlIoStream> src) {
  final imgLoadPcxIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadPCX_IO');
  return imgLoadPcxIoLookupFunction(src);
}

///
/// Load a PNG image directly.
///
/// If you know you definitely have a PNG image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadPNG_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadPngIo(Pointer<SdlIoStream> src) {
  final imgLoadPngIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadPNG_IO');
  return imgLoadPngIoLookupFunction(src);
}

///
/// Load a PNM image directly.
///
/// If you know you definitely have a PNM image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadPNM_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadPnmIo(Pointer<SdlIoStream> src) {
  final imgLoadPnmIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadPNM_IO');
  return imgLoadPnmIoLookupFunction(src);
}

///
/// Load a SVG image directly.
///
/// If you know you definitely have a SVG image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadSVG_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadSvgIo(Pointer<SdlIoStream> src) {
  final imgLoadSvgIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadSVG_IO');
  return imgLoadSvgIoLookupFunction(src);
}

///
/// Load a QOI image directly.
///
/// If you know you definitely have a QOI image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadQOI_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadQoiIo(Pointer<SdlIoStream> src) {
  final imgLoadQoiIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadQOI_IO');
  return imgLoadQoiIoLookupFunction(src);
}

///
/// Load a TGA image directly.
///
/// If you know you definitely have a TGA image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadTGA_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadTgaIo(Pointer<SdlIoStream> src) {
  final imgLoadTgaIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadTGA_IO');
  return imgLoadTgaIoLookupFunction(src);
}

///
/// Load a TIFF image directly.
///
/// If you know you definitely have a TIFF image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadTIF_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadTifIo(Pointer<SdlIoStream> src) {
  final imgLoadTifIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadTIF_IO');
  return imgLoadTifIoLookupFunction(src);
}

///
/// Load a XCF image directly.
///
/// If you know you definitely have a XCF image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadXCF_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadXcfIo(Pointer<SdlIoStream> src) {
  final imgLoadXcfIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadXCF_IO');
  return imgLoadXcfIoLookupFunction(src);
}

///
/// Load a XPM image directly.
///
/// If you know you definitely have a XPM image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXV_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadXPM_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadXpmIo(Pointer<SdlIoStream> src) {
  final imgLoadXpmIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadXPM_IO');
  return imgLoadXpmIoLookupFunction(src);
}

///
/// Load a XV image directly.
///
/// If you know you definitely have a XV image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadXV_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadXvIo(Pointer<SdlIoStream> src) {
  final imgLoadXvIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadXV_IO');
  return imgLoadXvIoLookupFunction(src);
}

///
/// Load a WEBP image directly.
///
/// If you know you definitely have a WEBP image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream to load image data from.
/// \returns SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAVIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadWEBP_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadWebpIo(Pointer<SdlIoStream> src) {
  final imgLoadWebpIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src),
        Pointer<SdlSurface> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadWEBP_IO');
  return imgLoadWebpIoLookupFunction(src);
}

///
/// Load an SVG image, scaled to a specific size.
///
/// Since SVG files are resolution-independent, you specify the size you would
/// like the output image to be and it will be generated at those dimensions.
///
/// Either width or height may be 0 and the image will be auto-sized to
/// preserve aspect ratio.
///
/// When done with the returned surface, the app should dispose of it with a
/// call to SDL_DestroySurface().
///
/// \param src an SDL_IOStream to load SVG data from.
/// \param width desired width of the generated surface, in pixels.
/// \param height desired height of the generated surface, in pixels.
/// \returns a new SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_LoadSizedSVG_IO(SDL_IOStream *src, int width, int height)
/// ```
/// {@category image}
Pointer<SdlSurface> imgLoadSizedSvgIo(
  Pointer<SdlIoStream> src,
  int width,
  int height,
) {
  final imgLoadSizedSvgIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(
          Pointer<SdlIoStream> src,
          Int32 width,
          Int32 height,
        ),
        Pointer<SdlSurface> Function(
          Pointer<SdlIoStream> src,
          int width,
          int height,
        )
      >('IMG_LoadSizedSVG_IO');
  return imgLoadSizedSvgIoLookupFunction(src, width, height);
}

///
/// Load an XPM image from a memory array.
///
/// The returned surface will be an 8bpp indexed surface, if possible,
/// otherwise it will be 32bpp. If you always want 32-bit data, use
/// IMG_ReadXPMFromArrayToRGB888() instead.
///
/// When done with the returned surface, the app should dispose of it with a
/// call to SDL_DestroySurface().
///
/// \param xpm a null-terminated array of strings that comprise XPM data.
/// \returns a new SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_ReadXPMFromArrayToRGB888
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_ReadXPMFromArray(char **xpm)
/// ```
/// {@category image}
Pointer<SdlSurface> imgReadXpmFromArray(Pointer<Pointer<Int8>> xpm) {
  final imgReadXpmFromArrayLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<Pointer<Int8>> xpm),
        Pointer<SdlSurface> Function(Pointer<Pointer<Int8>> xpm)
      >('IMG_ReadXPMFromArray');
  return imgReadXpmFromArrayLookupFunction(xpm);
}

///
/// Load an XPM image from a memory array.
///
/// The returned surface will always be a 32-bit RGB surface. If you want 8-bit
/// indexed colors (and the XPM data allows it), use IMG_ReadXPMFromArray()
/// instead.
///
/// When done with the returned surface, the app should dispose of it with a
/// call to SDL_DestroySurface().
///
/// \param xpm a null-terminated array of strings that comprise XPM data.
/// \returns a new SDL surface, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_ReadXPMFromArray
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_ReadXPMFromArrayToRGB888(char **xpm)
/// ```
/// {@category image}
Pointer<SdlSurface> imgReadXpmFromArrayToRgb888(Pointer<Pointer<Int8>> xpm) {
  final imgReadXpmFromArrayToRgb888LookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(Pointer<Pointer<Int8>> xpm),
        Pointer<SdlSurface> Function(Pointer<Pointer<Int8>> xpm)
      >('IMG_ReadXPMFromArrayToRGB888');
  return imgReadXpmFromArrayToRgb888LookupFunction(xpm);
}

///
/// Save an SDL_Surface into an image file.
///
/// If the file already exists, it will be overwritten.
///
/// For formats that accept a quality, a default quality of 90 will be used.
///
/// \param surface the SDL surface to save.
/// \param file path on the filesystem to write new file to.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveTyped_IO
/// \sa IMG_SaveAVIF
/// \sa IMG_SaveBMP
/// \sa IMG_SaveGIF
/// \sa IMG_SaveJPG
/// \sa IMG_SavePNG
/// \sa IMG_SaveTGA
/// \sa IMG_SaveWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_Save(SDL_Surface *surface, const char *file)
/// ```
/// {@category image}
bool imgSave(Pointer<SdlSurface> surface, String? file) {
  final imgSaveLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('IMG_Save');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into formatted image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_Save() instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// For formats that accept a quality, a default quality of 90 will be used.
///
/// \param surface the SDL surface to save.
/// \param dst the SDL_IOStream to save the image data to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param type a filename extension that represent this data ("BMP", "GIF",
/// "PNG", etc).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_Save
/// \sa IMG_SaveAVIF_IO
/// \sa IMG_SaveBMP_IO
/// \sa IMG_SaveGIF_IO
/// \sa IMG_SaveJPG_IO
/// \sa IMG_SavePNG_IO
/// \sa IMG_SaveTGA_IO
/// \sa IMG_SaveWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveTyped_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio, const char *type)
/// ```
/// {@category image}
bool imgSaveTypedIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
  String? type,
) {
  final imgSaveTypedIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Pointer<Utf8> type,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          int closeio,
          Pointer<Utf8> type,
        )
      >('IMG_SaveTyped_IO');
  final typePointer = type != null ? type.toNativeUtf8() : nullptr;
  final result =
      imgSaveTypedIoLookupFunction(
        surface,
        dst,
        closeio ? 1 : 0,
        typePointer,
      ) ==
      1;
  calloc.free(typePointer);
  return result;
}

///
/// Save an SDL_Surface into a AVIF image file.
///
/// If the file already exists, it will be overwritten.
///
/// \param surface the SDL surface to save.
/// \param file path on the filesystem to write new file to.
/// \param quality the desired quality, ranging between 0 (lowest) and 100
/// (highest).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_SaveAVIF_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveAVIF(SDL_Surface *surface, const char *file, int quality)
/// ```
/// {@category image}
bool imgSaveAvif(Pointer<SdlSurface> surface, String? file, int quality) {
  final imgSaveAvifLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<Utf8> file,
          Int32 quality,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<Utf8> file,
          int quality,
        )
      >('IMG_SaveAVIF');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveAvifLookupFunction(surface, filePointer, quality) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into AVIF image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveAVIF() instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param surface the SDL surface to save.
/// \param dst the SDL_IOStream to save the image data to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param quality the desired quality, ranging between 0 (lowest) and 100
/// (highest).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_SaveAVIF
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveAVIF_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio, int quality)
/// ```
/// {@category image}
bool imgSaveAvifIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
  int quality,
) {
  final imgSaveAvifIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Int32 quality,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          int closeio,
          int quality,
        )
      >('IMG_SaveAVIF_IO');
  return imgSaveAvifIoLookupFunction(surface, dst, closeio ? 1 : 0, quality) ==
      1;
}

///
/// Save an SDL_Surface into a BMP image file.
///
/// If the file already exists, it will be overwritten.
///
/// \param surface the SDL surface to save.
/// \param file path on the filesystem to write new file to.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveBMP_IO
/// \sa IMG_SaveAVIF
/// \sa IMG_SaveGIF
/// \sa IMG_SaveJPG
/// \sa IMG_SavePNG
/// \sa IMG_SaveTGA
/// \sa IMG_SaveWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveBMP(SDL_Surface *surface, const char *file)
/// ```
/// {@category image}
bool imgSaveBmp(Pointer<SdlSurface> surface, String? file) {
  final imgSaveBmpLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('IMG_SaveBMP');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveBmpLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into BMP image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveBMP() instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param surface the SDL surface to save.
/// \param dst the SDL_IOStream to save the image data to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveBMP
/// \sa IMG_SaveAVIF_IO
/// \sa IMG_SaveGIF_IO
/// \sa IMG_SaveJPG_IO
/// \sa IMG_SavePNG_IO
/// \sa IMG_SaveTGA_IO
/// \sa IMG_SaveWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveBMP_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSaveBmpIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSaveBmpIoLookupFunction = _libImage
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
      >('IMG_SaveBMP_IO');
  return imgSaveBmpIoLookupFunction(surface, dst, closeio ? 1 : 0) == 1;
}

///
/// Save an SDL_Surface into a GIF image file.
///
/// If the file already exists, it will be overwritten.
///
/// \param surface the SDL surface to save.
/// \param file path on the filesystem to write new file to.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveGIF_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveGIF(SDL_Surface *surface, const char *file)
/// ```
/// {@category image}
bool imgSaveGif(Pointer<SdlSurface> surface, String? file) {
  final imgSaveGifLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('IMG_SaveGIF');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveGifLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into GIF image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveGIF() instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param surface the SDL surface to save.
/// \param dst the SDL_IOStream to save the image data to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveGIF
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveGIF_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSaveGifIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSaveGifIoLookupFunction = _libImage
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
      >('IMG_SaveGIF_IO');
  return imgSaveGifIoLookupFunction(surface, dst, closeio ? 1 : 0) == 1;
}

///
/// Save an SDL_Surface into a JPEG image file.
///
/// If the file already exists, it will be overwritten.
///
/// \param surface the SDL surface to save.
/// \param file path on the filesystem to write new file to.
/// \param quality [0; 33] is Lowest quality, [34; 66] is Middle quality, [67;
/// 100] is Highest quality.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_SaveJPG_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveJPG(SDL_Surface *surface, const char *file, int quality)
/// ```
/// {@category image}
bool imgSaveJpg(Pointer<SdlSurface> surface, String? file, int quality) {
  final imgSaveJpgLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<Utf8> file,
          Int32 quality,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<Utf8> file,
          int quality,
        )
      >('IMG_SaveJPG');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveJpgLookupFunction(surface, filePointer, quality) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into JPEG image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveJPG() instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param surface the SDL surface to save.
/// \param dst the SDL_IOStream to save the image data to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param quality [0; 33] is Lowest quality, [34; 66] is Middle quality, [67;
/// 100] is Highest quality.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_SaveJPG
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveJPG_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio, int quality)
/// ```
/// {@category image}
bool imgSaveJpgIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
  int quality,
) {
  final imgSaveJpgIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Int32 quality,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          int closeio,
          int quality,
        )
      >('IMG_SaveJPG_IO');
  return imgSaveJpgIoLookupFunction(surface, dst, closeio ? 1 : 0, quality) ==
      1;
}

///
/// Save an SDL_Surface into a PNG image file.
///
/// If the file already exists, it will be overwritten.
///
/// \param surface the SDL surface to save.
/// \param file path on the filesystem to write new file to.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_SavePNG_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SavePNG(SDL_Surface *surface, const char *file)
/// ```
/// {@category image}
bool imgSavePng(Pointer<SdlSurface> surface, String? file) {
  final imgSavePngLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('IMG_SavePNG');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSavePngLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into PNG image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SavePNG() instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param surface the SDL surface to save.
/// \param dst the SDL_IOStream to save the image data to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_SavePNG
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SavePNG_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSavePngIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSavePngIoLookupFunction = _libImage
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
      >('IMG_SavePNG_IO');
  return imgSavePngIoLookupFunction(surface, dst, closeio ? 1 : 0) == 1;
}

///
/// Save an SDL_Surface into a TGA image file.
///
/// If the file already exists, it will be overwritten.
///
/// \param surface the SDL surface to save.
/// \param file path on the filesystem to write new file to.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveTGA_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveTGA(SDL_Surface *surface, const char *file)
/// ```
/// {@category image}
bool imgSaveTga(Pointer<SdlSurface> surface, String? file) {
  final imgSaveTgaLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('IMG_SaveTGA');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveTgaLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into TGA image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveTGA() instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param surface the SDL surface to save.
/// \param dst the SDL_IOStream to save the image data to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveTGA
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveTGA_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSaveTgaIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSaveTgaIoLookupFunction = _libImage
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
      >('IMG_SaveTGA_IO');
  return imgSaveTgaIoLookupFunction(surface, dst, closeio ? 1 : 0) == 1;
}

///
/// Save an SDL_Surface into a WEBP image file.
///
/// If the file already exists, it will be overwritten.
///
/// \param surface the SDL surface to save.
/// \param file path on the filesystem to write the new file to.
/// \param quality between 0 and 100. For lossy, 0 gives the smallest size and
/// 100 the largest. For lossless, this parameter is the amount
/// of effort put into the compression: 0 is the fastest but
/// gives larger files compared to the slowest, but best, 100.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveWEBP_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveWEBP(SDL_Surface *surface, const char *file, float quality)
/// ```
/// {@category image}
bool imgSaveWebp(Pointer<SdlSurface> surface, String? file, double quality) {
  final imgSaveWebpLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<Utf8> file,
          Float quality,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<Utf8> file,
          double quality,
        )
      >('IMG_SaveWEBP');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveWebpLookupFunction(surface, filePointer, quality) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into WEBP image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveWEBP() instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param surface the SDL surface to save.
/// \param dst the SDL_IOStream to save the image data to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param quality between 0 and 100. For lossy, 0 gives the smallest size and
/// 100 the largest. For lossless, this parameter is the amount
/// of effort put into the compression: 0 is the fastest but
/// gives larger files compared to the slowest, but best, 100.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveWEBP
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveWEBP_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio, float quality)
/// ```
/// {@category image}
bool imgSaveWebpIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
  double quality,
) {
  final imgSaveWebpIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Float quality,
        ),
        int Function(
          Pointer<SdlSurface> surface,
          Pointer<SdlIoStream> dst,
          int closeio,
          double quality,
        )
      >('IMG_SaveWEBP_IO');
  return imgSaveWebpIoLookupFunction(surface, dst, closeio ? 1 : 0, quality) ==
      1;
}

///
/// Load an animation from a file.
///
/// When done with the returned animation, the app should dispose of it with a
/// call to IMG_FreeAnimation().
///
/// \param file path on the filesystem containing an animated image.
/// \returns a new IMG_Animation, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadAPNGAnimation_IO
/// \sa IMG_LoadAVIFAnimation_IO
/// \sa IMG_LoadGIFAnimation_IO
/// \sa IMG_LoadWEBPAnimation_IO
/// \sa IMG_FreeAnimation
///
/// ```c
/// extern SDL_DECLSPEC IMG_Animation * SDLCALL IMG_LoadAnimation(const char *file)
/// ```
/// {@category image}
Pointer<ImgAnimation> imgLoadAnimation(String? file) {
  final imgLoadAnimationLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimation> Function(Pointer<Utf8> file),
        Pointer<ImgAnimation> Function(Pointer<Utf8> file)
      >('IMG_LoadAnimation');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgLoadAnimationLookupFunction(filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Load an animation from an SDL_IOStream.
///
/// If `closeio` is true, `src` will be closed before returning, whether this
/// function succeeds or not. SDL_image reads everything it needs from `src`
/// during this call in any case.
///
/// When done with the returned animation, the app should dispose of it with a
/// call to IMG_FreeAnimation().
///
/// \param src an SDL_IOStream that data will be read from.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns a new IMG_Animation, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadAPNGAnimation_IO
/// \sa IMG_LoadAVIFAnimation_IO
/// \sa IMG_LoadGIFAnimation_IO
/// \sa IMG_LoadWEBPAnimation_IO
/// \sa IMG_FreeAnimation
///
/// ```c
/// extern SDL_DECLSPEC IMG_Animation * SDLCALL IMG_LoadAnimation_IO(SDL_IOStream *src, bool closeio)
/// ```
/// {@category image}
Pointer<ImgAnimation> imgLoadAnimationIo(
  Pointer<SdlIoStream> src,
  bool closeio,
) {
  final imgLoadAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src, Uint8 closeio),
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src, int closeio)
      >('IMG_LoadAnimation_IO');
  return imgLoadAnimationIoLookupFunction(src, closeio ? 1 : 0);
}

///
/// Load an animation from an SDL datasource
///
/// Even though this function accepts a file type, SDL_image may still try
/// other decoders that are capable of detecting file type from the contents of
/// the image data, but may rely on the caller-provided type string for formats
/// that it cannot autodetect. If `type` is NULL, SDL_image will rely solely on
/// its ability to guess the format.
///
/// If `closeio` is true, `src` will be closed before returning, whether this
/// function succeeds or not. SDL_image reads everything it needs from `src`
/// during this call in any case.
///
/// When done with the returned animation, the app should dispose of it with a
/// call to IMG_FreeAnimation().
///
/// \param src an SDL_IOStream that data will be read from.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param type a filename extension that represent this data ("GIF", etc).
/// \returns a new IMG_Animation, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAPNGAnimation_IO
/// \sa IMG_LoadAVIFAnimation_IO
/// \sa IMG_LoadGIFAnimation_IO
/// \sa IMG_LoadWEBPAnimation_IO
/// \sa IMG_FreeAnimation
///
/// ```c
/// extern SDL_DECLSPEC IMG_Animation * SDLCALL IMG_LoadAnimationTyped_IO(SDL_IOStream *src, bool closeio, const char *type)
/// ```
/// {@category image}
Pointer<ImgAnimation> imgLoadAnimationTypedIo(
  Pointer<SdlIoStream> src,
  bool closeio,
  String? type,
) {
  final imgLoadAnimationTypedIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimation> Function(
          Pointer<SdlIoStream> src,
          Uint8 closeio,
          Pointer<Utf8> type,
        ),
        Pointer<ImgAnimation> Function(
          Pointer<SdlIoStream> src,
          int closeio,
          Pointer<Utf8> type,
        )
      >('IMG_LoadAnimationTyped_IO');
  final typePointer = type != null ? type.toNativeUtf8() : nullptr;
  final result = imgLoadAnimationTypedIoLookupFunction(
    src,
    closeio ? 1 : 0,
    typePointer,
  );
  calloc.free(typePointer);
  return result;
}

///
/// Dispose of an IMG_Animation and free its resources.
///
/// The provided `anim` pointer is not valid once this call returns.
///
/// \param anim IMG_Animation to dispose of.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadAPNGAnimation_IO
/// \sa IMG_LoadAVIFAnimation_IO
/// \sa IMG_LoadGIFAnimation_IO
/// \sa IMG_LoadWEBPAnimation_IO
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL IMG_FreeAnimation(IMG_Animation *anim)
/// ```
/// {@category image}
void imgFreeAnimation(Pointer<ImgAnimation> anim) {
  final imgFreeAnimationLookupFunction = _libImage
      .lookupFunction<
        Void Function(Pointer<ImgAnimation> anim),
        void Function(Pointer<ImgAnimation> anim)
      >('IMG_FreeAnimation');
  return imgFreeAnimationLookupFunction(anim);
}

///
/// Load an APNG animation directly from an SDL_IOStream.
///
/// If you know you definitely have an APNG image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally, it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// When done with the returned animation, the app should dispose of it with a
/// call to IMG_FreeAnimation().
///
/// \param src an SDL_IOStream from which data will be read.
/// \returns a new IMG_Animation, or NULL on error.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadAVIFAnimation_IO
/// \sa IMG_LoadGIFAnimation_IO
/// \sa IMG_LoadWEBPAnimation_IO
/// \sa IMG_FreeAnimation
///
/// ```c
/// extern SDL_DECLSPEC IMG_Animation *SDLCALL IMG_LoadAPNGAnimation_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<ImgAnimation> imgLoadApngAnimationIo(Pointer<SdlIoStream> src) {
  final imgLoadApngAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src),
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadAPNGAnimation_IO');
  return imgLoadApngAnimationIoLookupFunction(src);
}

///
/// Load an AVIF animation directly from an SDL_IOStream.
///
/// If you know you definitely have an AVIF animation, you can call this
/// function, which will skip SDL_image's file format detection routines.
/// Generally it's better to use the abstract interfaces; also, there is only
/// an SDL_IOStream interface available here.
///
/// When done with the returned animation, the app should dispose of it with a
/// call to IMG_FreeAnimation().
///
/// \param src an SDL_IOStream that data will be read from.
/// \returns a new IMG_Animation, or NULL on error.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadAPNGAnimation_IO
/// \sa IMG_LoadGIFAnimation_IO
/// \sa IMG_LoadWEBPAnimation_IO
/// \sa IMG_FreeAnimation
///
/// ```c
/// extern SDL_DECLSPEC IMG_Animation *SDLCALL IMG_LoadAVIFAnimation_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<ImgAnimation> imgLoadAvifAnimationIo(Pointer<SdlIoStream> src) {
  final imgLoadAvifAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src),
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadAVIFAnimation_IO');
  return imgLoadAvifAnimationIoLookupFunction(src);
}

///
/// Load a GIF animation directly.
///
/// If you know you definitely have a GIF image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream that data will be read from.
/// \returns a new IMG_Animation, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadAPNGAnimation_IO
/// \sa IMG_LoadAVIFAnimation_IO
/// \sa IMG_LoadWEBPAnimation_IO
/// \sa IMG_FreeAnimation
///
/// ```c
/// extern SDL_DECLSPEC IMG_Animation * SDLCALL IMG_LoadGIFAnimation_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<ImgAnimation> imgLoadGifAnimationIo(Pointer<SdlIoStream> src) {
  final imgLoadGifAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src),
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadGIFAnimation_IO');
  return imgLoadGifAnimationIoLookupFunction(src);
}

///
/// Load a WEBP animation directly.
///
/// If you know you definitely have a WEBP image, you can call this function,
/// which will skip SDL_image's file format detection routines. Generally it's
/// better to use the abstract interfaces; also, there is only an SDL_IOStream
/// interface available here.
///
/// \param src an SDL_IOStream that data will be read from.
/// \returns a new IMG_Animation, or NULL on error.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadAPNGAnimation_IO
/// \sa IMG_LoadAVIFAnimation_IO
/// \sa IMG_LoadGIFAnimation_IO
/// \sa IMG_FreeAnimation
///
/// ```c
/// extern SDL_DECLSPEC IMG_Animation * SDLCALL IMG_LoadWEBPAnimation_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<ImgAnimation> imgLoadWebpAnimationIo(Pointer<SdlIoStream> src) {
  final imgLoadWebpAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src),
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadWEBPAnimation_IO');
  return imgLoadWebpAnimationIoLookupFunction(src);
}

///
/// Create an animation stream and save it to a file.
///
/// The file type is determined from the file extension, e.g. "file.webp" will
/// be encoded using WEBP.
///
/// \param file the file where the animation will be saved.
/// \returns a new IMG_AnimationStream, or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationStream_IO
/// \sa IMG_CreateAnimationStreamWithProperties
/// \sa IMG_AddAnimationFrame
/// \sa IMG_CloseAnimationStream
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationStream * SDLCALL IMG_CreateAnimationStream(const char *file)
/// ```
/// {@category image}
Pointer<ImgAnimationStream> imgCreateAnimationStream(String? file) {
  final imgCreateAnimationStreamLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationStream> Function(Pointer<Utf8> file),
        Pointer<ImgAnimationStream> Function(Pointer<Utf8> file)
      >('IMG_CreateAnimationStream');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgCreateAnimationStreamLookupFunction(filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Create an animation stream and save it to an IOStream.
///
/// If `closeio` is true, `dst` will be closed before returning if this
/// function fails, or when the animation stream is closed if this function
/// succeeds.
///
/// \param dst an SDL_IOStream that will be used to save the stream.
/// \param closeio true to close the SDL_IOStream when done, false to leave it
/// open.
/// \param type a filename extension that represent this data ("WEBP", etc).
/// \returns a new IMG_AnimationStream, or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationStream
/// \sa IMG_CreateAnimationStreamWithProperties
/// \sa IMG_AddAnimationFrame
/// \sa IMG_CloseAnimationStream
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationStream * SDLCALL IMG_CreateAnimationStream_IO(SDL_IOStream *dst, bool closeio, const char *type)
/// ```
/// {@category image}
Pointer<ImgAnimationStream> imgCreateAnimationStreamIo(
  Pointer<SdlIoStream> dst,
  bool closeio,
  String? type,
) {
  final imgCreateAnimationStreamIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationStream> Function(
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Pointer<Utf8> type,
        ),
        Pointer<ImgAnimationStream> Function(
          Pointer<SdlIoStream> dst,
          int closeio,
          Pointer<Utf8> type,
        )
      >('IMG_CreateAnimationStream_IO');
  final typePointer = type != null ? type.toNativeUtf8() : nullptr;
  final result = imgCreateAnimationStreamIoLookupFunction(
    dst,
    closeio ? 1 : 0,
    typePointer,
  );
  calloc.free(typePointer);
  return result;
}

///
/// Create an animation stream with the specified properties.
///
/// These are the supported properties:
///
/// - `IMG_PROP_ANIMATION_STREAM_CREATE_FILENAME_STRING`: the file to save, if
/// an SDL_IOStream isn't being used. This is required if
/// `IMG_PROP_ANIMATION_STREAM_CREATE_IOSTREAM_POINTER` isn't set.
/// - `IMG_PROP_ANIMATION_STREAM_CREATE_IOSTREAM_POINTER`: an SDL_IOStream that
/// will be used to save the stream. This should not be closed until the
/// animation stream is closed. This is required if
/// `IMG_PROP_ANIMATION_STREAM_CREATE_FILENAME_STRING` isn't set.
/// - `IMG_PROP_ANIMATION_STREAM_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN`: true if
/// closing the animation stream should also close the associated
/// SDL_IOStream.
/// - `IMG_PROP_ANIMATION_STREAM_CREATE_TYPE_STRING`: the output file type,
/// e.g. "webp", defaults to the file extension if
/// `IMG_PROP_ANIMATION_STREAM_CREATE_FILENAME_STRING` is set.
/// - `IMG_PROP_ANIMATION_STREAM_CREATE_QUALITY_NUMBER`: the compression
/// quality, in the range of 0 to 100. The higher the number, the higher the
/// quality and file size. This defaults to a balanced value for compression
/// and quality.
/// - `IMG_PROP_ANIMATION_STREAM_CREATE_TIMEBASE_NUMERATOR_NUMBER`: the
/// numerator of the fraction used to multiply the pts to convert it to
/// seconds. This defaults to 1.
/// - `IMG_PROP_ANIMATION_STREAM_CREATE_TIMEBASE_DENOMINATOR_NUMBER`: the
/// denominator of the fraction used to multiply the pts to convert it to
/// seconds. This defaults to 1000.
///
/// \param props the properties of the animation stream.
/// \returns a new IMG_AnimationStream, or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationStream
/// \sa IMG_CreateAnimationStream_IO
/// \sa IMG_AddAnimationFrame
/// \sa IMG_CloseAnimationStream
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationStream * SDLCALL IMG_CreateAnimationStreamWithProperties(SDL_PropertiesID props)
/// ```
/// {@category image}
Pointer<ImgAnimationStream> imgCreateAnimationStreamWithProperties(int props) {
  final imgCreateAnimationStreamWithPropertiesLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationStream> Function(Uint32 props),
        Pointer<ImgAnimationStream> Function(int props)
      >('IMG_CreateAnimationStreamWithProperties');
  return imgCreateAnimationStreamWithPropertiesLookupFunction(props);
}

///
/// Add a frame to a stream of images being saved.
///
/// \param stream the stream receiving images.
/// \param surface the surface to add as the next frame in the animation.
/// \param pts the presentation timestamp of the frame, usually in milliseconds
/// but can be other units if the
/// `IMG_PROP_ANIMATION_STREAM_CREATE_TIMEBASE_DENOMINATOR_NUMBER`
/// property is set when creating the stream.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationStream
/// \sa IMG_CreateAnimationStream_IO
/// \sa IMG_CreateAnimationStreamWithProperties
/// \sa IMG_CloseAnimationStream
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_AddAnimationFrame(IMG_AnimationStream *stream, SDL_Surface *surface, Uint64 pts)
/// ```
/// {@category image}
bool imgAddAnimationFrame(
  Pointer<ImgAnimationStream> stream,
  Pointer<SdlSurface> surface,
  int pts,
) {
  final imgAddAnimationFrameLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimationStream> stream,
          Pointer<SdlSurface> surface,
          Uint64 pts,
        ),
        int Function(
          Pointer<ImgAnimationStream> stream,
          Pointer<SdlSurface> surface,
          int pts,
        )
      >('IMG_AddAnimationFrame');
  return imgAddAnimationFrameLookupFunction(stream, surface, pts) == 1;
}

///
/// Close an animation stream, finishing any encoding.
///
/// Calling this function frees the animation stream, and returns the final
/// status of the encoding process.
///
/// \param stream the stream to close.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationStream
/// \sa IMG_CreateAnimationStream_IO
/// \sa IMG_CreateAnimationStreamWithProperties
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_CloseAnimationStream(IMG_AnimationStream *stream)
/// ```
/// {@category image}
bool imgCloseAnimationStream(Pointer<ImgAnimationStream> stream) {
  final imgCloseAnimationStreamLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<ImgAnimationStream> stream),
        int Function(Pointer<ImgAnimationStream> stream)
      >('IMG_CloseAnimationStream');
  return imgCloseAnimationStreamLookupFunction(stream) == 1;
}
