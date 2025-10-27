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
/// Get the image currently in the clipboard.
///
/// When done with the returned surface, the app should dispose of it with a
/// call to SDL_DestroySurface().
///
/// \returns a new SDL surface, or NULL if no supported image is available.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Surface * SDLCALL IMG_GetClipboardImage(void)
/// ```
/// {@category image}
Pointer<SdlSurface> imgGetClipboardImage() {
  final imgGetClipboardImageLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlSurface> Function(),
        Pointer<SdlSurface> Function()
      >('IMG_GetClipboardImage');
  return imgGetClipboardImageLookupFunction();
}

///
/// Detect ANI animated cursor data on a readable/seekable SDL_IOStream.
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
/// \returns true if this is ANI animated cursor data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_isANI(SDL_IOStream *src)
/// ```
/// {@category image}
bool imgIsAni(Pointer<SdlIoStream> src) {
  final imgIsAniLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlIoStream> src),
        int Function(Pointer<SdlIoStream> src)
      >('IMG_isANI');
  return imgIsAniLookupFunction(src) == 1;
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
/// \returns true if this is AVIF data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is CUR data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is BMP data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is GIF data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is ICO data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is JPG data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is JXL data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is LBM data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is PCX data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is PNG data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is PNM data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is QOI data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is SVG data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is TIFF data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is WEBP data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
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
/// \returns true if this is XCF data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXPM
/// \sa IMG_isXV
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
/// \returns true if this is XPM data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXV
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
/// \returns true if this is XV data, false otherwise.
///
/// \since This function is available since SDL_image 3.0.0.
///
/// \sa IMG_isANI
/// \sa IMG_isAVIF
/// \sa IMG_isBMP
/// \sa IMG_isCUR
/// \sa IMG_isGIF
/// \sa IMG_isICO
/// \sa IMG_isJPG
/// \sa IMG_isJXL
/// \sa IMG_isLBM
/// \sa IMG_isPCX
/// \sa IMG_isPNG
/// \sa IMG_isPNM
/// \sa IMG_isQOI
/// \sa IMG_isSVG
/// \sa IMG_isTIF
/// \sa IMG_isWEBP
/// \sa IMG_isXCF
/// \sa IMG_isXPM
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSizedSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadSVG_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXPM_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXV_IO
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
/// \sa IMG_LoadBMP_IO
/// \sa IMG_LoadCUR_IO
/// \sa IMG_LoadGIF_IO
/// \sa IMG_LoadICO_IO
/// \sa IMG_LoadJPG_IO
/// \sa IMG_LoadJXL_IO
/// \sa IMG_LoadLBM_IO
/// \sa IMG_LoadPCX_IO
/// \sa IMG_LoadPNG_IO
/// \sa IMG_LoadPNM_IO
/// \sa IMG_LoadQOI_IO
/// \sa IMG_LoadSVG_IO
/// \sa IMG_LoadTGA_IO
/// \sa IMG_LoadTIF_IO
/// \sa IMG_LoadWEBP_IO
/// \sa IMG_LoadXCF_IO
/// \sa IMG_LoadXPM_IO
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
/// \sa IMG_SaveCUR
/// \sa IMG_SaveGIF
/// \sa IMG_SaveICO
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
/// \sa IMG_SaveCUR_IO
/// \sa IMG_SaveGIF_IO
/// \sa IMG_SaveICO_IO
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
/// Save an SDL_Surface into a CUR image file.
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
/// \sa IMG_SaveCUR_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveCUR(SDL_Surface *surface, const char *file)
/// ```
/// {@category image}
bool imgSaveCur(Pointer<SdlSurface> surface, String? file) {
  final imgSaveCurLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('IMG_SaveCUR');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveCurLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into CUR image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveCUR() instead.
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
/// \sa IMG_SaveCUR
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveCUR_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSaveCurIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSaveCurIoLookupFunction = _libImage
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
      >('IMG_SaveCUR_IO');
  return imgSaveCurIoLookupFunction(surface, dst, closeio ? 1 : 0) == 1;
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
/// Save an SDL_Surface into a ICO image file.
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
/// \sa IMG_SaveICO_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveICO(SDL_Surface *surface, const char *file)
/// ```
/// {@category image}
bool imgSaveIco(Pointer<SdlSurface> surface, String? file) {
  final imgSaveIcoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<SdlSurface> surface, Pointer<Utf8> file),
        int Function(Pointer<SdlSurface> surface, Pointer<Utf8> file)
      >('IMG_SaveICO');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveIcoLookupFunction(surface, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an SDL_Surface into ICO image data, via an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveICO() instead.
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
/// \sa IMG_SaveICO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveICO_IO(SDL_Surface *surface, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSaveIcoIo(
  Pointer<SdlSurface> surface,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSaveIcoIoLookupFunction = _libImage
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
      >('IMG_SaveICO_IO');
  return imgSaveIcoIoLookupFunction(surface, dst, closeio ? 1 : 0) == 1;
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
/// \sa IMG_CreateAnimatedCursor
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadANIAnimation_IO
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
/// \sa IMG_CreateAnimatedCursor
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadANIAnimation_IO
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
/// Load an animation from an SDL_IOStream.
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
/// \sa IMG_CreateAnimatedCursor
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadANIAnimation_IO
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
/// Load an ANI animation directly from an SDL_IOStream.
///
/// If you know you definitely have an ANI image, you can call this function,
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
/// \sa IMG_isANI
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadAPNGAnimation_IO
/// \sa IMG_LoadAVIFAnimation_IO
/// \sa IMG_LoadGIFAnimation_IO
/// \sa IMG_LoadWEBPAnimation_IO
/// \sa IMG_FreeAnimation
///
/// ```c
/// extern SDL_DECLSPEC IMG_Animation *SDLCALL IMG_LoadANIAnimation_IO(SDL_IOStream *src)
/// ```
/// {@category image}
Pointer<ImgAnimation> imgLoadAniAnimationIo(Pointer<SdlIoStream> src) {
  final imgLoadAniAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src),
        Pointer<ImgAnimation> Function(Pointer<SdlIoStream> src)
      >('IMG_LoadANIAnimation_IO');
  return imgLoadAniAnimationIoLookupFunction(src);
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
/// \sa IMG_isPNG
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadANIAnimation_IO
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
/// \sa IMG_isAVIF
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadANIAnimation_IO
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
/// \sa IMG_isGIF
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadANIAnimation_IO
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
/// \sa IMG_isWEBP
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
/// \sa IMG_LoadANIAnimation_IO
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
/// Save an animation to a file.
///
/// For formats that accept a quality, a default quality of 90 will be used.
///
/// \param anim the animation to save.
/// \param file path on the filesystem containing an animated image.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveAnimationTyped_IO
/// \sa IMG_SaveANIAnimation_IO
/// \sa IMG_SaveAPNGAnimation_IO
/// \sa IMG_SaveAVIFAnimation_IO
/// \sa IMG_SaveGIFAnimation_IO
/// \sa IMG_SaveWEBPAnimation_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveAnimation(IMG_Animation *anim, const char *file)
/// ```
/// {@category image}
bool imgSaveAnimation(Pointer<ImgAnimation> anim, String? file) {
  final imgSaveAnimationLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<ImgAnimation> anim, Pointer<Utf8> file),
        int Function(Pointer<ImgAnimation> anim, Pointer<Utf8> file)
      >('IMG_SaveAnimation');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgSaveAnimationLookupFunction(anim, filePointer) == 1;
  calloc.free(filePointer);
  return result;
}

///
/// Save an animation to an SDL_IOStream.
///
/// If you just want to save to a filename, you can use IMG_SaveAnimation()
/// instead.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// For formats that accept a quality, a default quality of 90 will be used.
///
/// \param anim the animation to save.
/// \param dst an SDL_IOStream that data will be written to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param type a filename extension that represent this data ("GIF", etc).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveAnimation
/// \sa IMG_SaveANIAnimation_IO
/// \sa IMG_SaveAPNGAnimation_IO
/// \sa IMG_SaveAVIFAnimation_IO
/// \sa IMG_SaveGIFAnimation_IO
/// \sa IMG_SaveWEBPAnimation_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveAnimationTyped_IO(IMG_Animation *anim, SDL_IOStream *dst, bool closeio, const char *type)
/// ```
/// {@category image}
bool imgSaveAnimationTypedIo(
  Pointer<ImgAnimation> anim,
  Pointer<SdlIoStream> dst,
  bool closeio,
  String? type,
) {
  final imgSaveAnimationTypedIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Pointer<Utf8> type,
        ),
        int Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          int closeio,
          Pointer<Utf8> type,
        )
      >('IMG_SaveAnimationTyped_IO');
  final typePointer = type != null ? type.toNativeUtf8() : nullptr;
  final result =
      imgSaveAnimationTypedIoLookupFunction(
        anim,
        dst,
        closeio ? 1 : 0,
        typePointer,
      ) ==
      1;
  calloc.free(typePointer);
  return result;
}

///
/// Save an animation in ANI format to an SDL_IOStream.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param anim the animation to save.
/// \param dst an SDL_IOStream from which data will be written to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveAnimation
/// \sa IMG_SaveAnimationTyped_IO
/// \sa IMG_SaveAPNGAnimation_IO
/// \sa IMG_SaveAVIFAnimation_IO
/// \sa IMG_SaveGIFAnimation_IO
/// \sa IMG_SaveWEBPAnimation_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveANIAnimation_IO(IMG_Animation *anim, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSaveAniAnimationIo(
  Pointer<ImgAnimation> anim,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSaveAniAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
        ),
        int Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          int closeio,
        )
      >('IMG_SaveANIAnimation_IO');
  return imgSaveAniAnimationIoLookupFunction(anim, dst, closeio ? 1 : 0) == 1;
}

///
/// Save an animation in APNG format to an SDL_IOStream.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param anim the animation to save.
/// \param dst an SDL_IOStream from which data will be written to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveAnimation
/// \sa IMG_SaveAnimationTyped_IO
/// \sa IMG_SaveANIAnimation_IO
/// \sa IMG_SaveAVIFAnimation_IO
/// \sa IMG_SaveGIFAnimation_IO
/// \sa IMG_SaveWEBPAnimation_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveAPNGAnimation_IO(IMG_Animation *anim, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSaveApngAnimationIo(
  Pointer<ImgAnimation> anim,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSaveApngAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
        ),
        int Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          int closeio,
        )
      >('IMG_SaveAPNGAnimation_IO');
  return imgSaveApngAnimationIoLookupFunction(anim, dst, closeio ? 1 : 0) == 1;
}

///
/// Save an animation in AVIF format to an SDL_IOStream.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param anim the animation to save.
/// \param dst an SDL_IOStream from which data will be written to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \param quality the desired quality, ranging between 0 (lowest) and 100
/// (highest).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveAnimation
/// \sa IMG_SaveAnimationTyped_IO
/// \sa IMG_SaveANIAnimation_IO
/// \sa IMG_SaveAPNGAnimation_IO
/// \sa IMG_SaveGIFAnimation_IO
/// \sa IMG_SaveWEBPAnimation_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveAVIFAnimation_IO(IMG_Animation *anim, SDL_IOStream *dst, bool closeio, int quality)
/// ```
/// {@category image}
bool imgSaveAvifAnimationIo(
  Pointer<ImgAnimation> anim,
  Pointer<SdlIoStream> dst,
  bool closeio,
  int quality,
) {
  final imgSaveAvifAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Int32 quality,
        ),
        int Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          int closeio,
          int quality,
        )
      >('IMG_SaveAVIFAnimation_IO');
  return imgSaveAvifAnimationIoLookupFunction(
        anim,
        dst,
        closeio ? 1 : 0,
        quality,
      ) ==
      1;
}

///
/// Save an animation in GIF format to an SDL_IOStream.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param anim the animation to save.
/// \param dst an SDL_IOStream from which data will be written to.
/// \param closeio true to close/free the SDL_IOStream before returning, false
/// to leave it open.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_SaveAnimation
/// \sa IMG_SaveAnimationTyped_IO
/// \sa IMG_SaveANIAnimation_IO
/// \sa IMG_SaveAPNGAnimation_IO
/// \sa IMG_SaveAVIFAnimation_IO
/// \sa IMG_SaveWEBPAnimation_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveGIFAnimation_IO(IMG_Animation *anim, SDL_IOStream *dst, bool closeio)
/// ```
/// {@category image}
bool imgSaveGifAnimationIo(
  Pointer<ImgAnimation> anim,
  Pointer<SdlIoStream> dst,
  bool closeio,
) {
  final imgSaveGifAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
        ),
        int Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          int closeio,
        )
      >('IMG_SaveGIFAnimation_IO');
  return imgSaveGifAnimationIoLookupFunction(anim, dst, closeio ? 1 : 0) == 1;
}

///
/// Save an animation in WEBP format to an SDL_IOStream.
///
/// If `closeio` is true, `dst` will be closed before returning, whether this
/// function succeeds or not.
///
/// \param anim the animation to save.
/// \param dst an SDL_IOStream from which data will be written to.
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
/// \sa IMG_SaveAnimation
/// \sa IMG_SaveAnimationTyped_IO
/// \sa IMG_SaveANIAnimation_IO
/// \sa IMG_SaveAPNGAnimation_IO
/// \sa IMG_SaveAVIFAnimation_IO
/// \sa IMG_SaveGIFAnimation_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_SaveWEBPAnimation_IO(IMG_Animation *anim, SDL_IOStream *dst, bool closeio, int quality)
/// ```
/// {@category image}
bool imgSaveWebpAnimationIo(
  Pointer<ImgAnimation> anim,
  Pointer<SdlIoStream> dst,
  bool closeio,
  int quality,
) {
  final imgSaveWebpAnimationIoLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Int32 quality,
        ),
        int Function(
          Pointer<ImgAnimation> anim,
          Pointer<SdlIoStream> dst,
          int closeio,
          int quality,
        )
      >('IMG_SaveWEBPAnimation_IO');
  return imgSaveWebpAnimationIoLookupFunction(
        anim,
        dst,
        closeio ? 1 : 0,
        quality,
      ) ==
      1;
}

///
/// Create an animated cursor from an animation.
///
/// \param anim an animation to use to create an animated cursor.
/// \param hot_x the x position of the cursor hot spot.
/// \param hot_y the y position of the cursor hot spot.
/// \returns the new cursor on success or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_LoadAnimation
/// \sa IMG_LoadAnimation_IO
/// \sa IMG_LoadAnimationTyped_IO
///
/// ```c
/// extern SDL_DECLSPEC SDL_Cursor * SDLCALL IMG_CreateAnimatedCursor(IMG_Animation *anim, int hot_x, int hot_y)
/// ```
/// {@category image}
Pointer<SdlCursor> imgCreateAnimatedCursor(
  Pointer<ImgAnimation> anim,
  int hotX,
  int hotY,
) {
  final imgCreateAnimatedCursorLookupFunction = _libImage
      .lookupFunction<
        Pointer<SdlCursor> Function(
          Pointer<ImgAnimation> anim,
          Int32 hotX,
          Int32 hotY,
        ),
        Pointer<SdlCursor> Function(
          Pointer<ImgAnimation> anim,
          int hotX,
          int hotY,
        )
      >('IMG_CreateAnimatedCursor');
  return imgCreateAnimatedCursorLookupFunction(anim, hotX, hotY);
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
/// \sa IMG_LoadANIAnimation_IO
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
/// Create an encoder to save a series of images to a file.
///
/// These animation types are currently supported:
///
/// - ANI
/// - APNG
/// - AVIFS
/// - GIF
/// - WEBP
///
/// The file type is determined from the file extension, e.g. "file.webp" will
/// be encoded using WEBP.
///
/// \param file the file where the animation will be saved.
/// \returns a new IMG_AnimationEncoder, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationEncoder_IO
/// \sa IMG_CreateAnimationEncoderWithProperties
/// \sa IMG_AddAnimationEncoderFrame
/// \sa IMG_CloseAnimationEncoder
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationEncoder * SDLCALL IMG_CreateAnimationEncoder(const char *file)
/// ```
/// {@category image}
Pointer<ImgAnimationEncoder> imgCreateAnimationEncoder(String? file) {
  final imgCreateAnimationEncoderLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationEncoder> Function(Pointer<Utf8> file),
        Pointer<ImgAnimationEncoder> Function(Pointer<Utf8> file)
      >('IMG_CreateAnimationEncoder');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgCreateAnimationEncoderLookupFunction(filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Create an encoder to save a series of images to an IOStream.
///
/// These animation types are currently supported:
///
/// - ANI
/// - APNG
/// - AVIFS
/// - GIF
/// - WEBP
///
/// If `closeio` is true, `dst` will be closed before returning if this
/// function fails, or when the animation encoder is closed if this function
/// succeeds.
///
/// \param dst an SDL_IOStream that will be used to save the stream.
/// \param closeio true to close the SDL_IOStream when done, false to leave it
/// open.
/// \param type a filename extension that represent this data ("WEBP", etc).
/// \returns a new IMG_AnimationEncoder, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationEncoder
/// \sa IMG_CreateAnimationEncoderWithProperties
/// \sa IMG_AddAnimationEncoderFrame
/// \sa IMG_CloseAnimationEncoder
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationEncoder * SDLCALL IMG_CreateAnimationEncoder_IO(SDL_IOStream *dst, bool closeio, const char *type)
/// ```
/// {@category image}
Pointer<ImgAnimationEncoder> imgCreateAnimationEncoderIo(
  Pointer<SdlIoStream> dst,
  bool closeio,
  String? type,
) {
  final imgCreateAnimationEncoderIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationEncoder> Function(
          Pointer<SdlIoStream> dst,
          Uint8 closeio,
          Pointer<Utf8> type,
        ),
        Pointer<ImgAnimationEncoder> Function(
          Pointer<SdlIoStream> dst,
          int closeio,
          Pointer<Utf8> type,
        )
      >('IMG_CreateAnimationEncoder_IO');
  final typePointer = type != null ? type.toNativeUtf8() : nullptr;
  final result = imgCreateAnimationEncoderIoLookupFunction(
    dst,
    closeio ? 1 : 0,
    typePointer,
  );
  calloc.free(typePointer);
  return result;
}

///
/// Create an animation encoder with the specified properties.
///
/// These animation types are currently supported:
///
/// - ANI
/// - APNG
/// - AVIFS
/// - GIF
/// - WEBP
///
/// These are the supported properties:
///
/// - `IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING`: the file to save, if
/// an SDL_IOStream isn't being used. This is required if
/// `IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER` isn't set.
/// - `IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_POINTER`: an SDL_IOStream
/// that will be used to save the stream. This should not be closed until the
/// animation encoder is closed. This is required if
/// `IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING` isn't set.
/// - `IMG_PROP_ANIMATION_ENCODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN`: true if
/// closing the animation encoder should also close the associated
/// SDL_IOStream.
/// - `IMG_PROP_ANIMATION_ENCODER_CREATE_TYPE_STRING`: the output file type,
/// e.g. "webp", defaults to the file extension if
/// `IMG_PROP_ANIMATION_ENCODER_CREATE_FILENAME_STRING` is set.
/// - `IMG_PROP_ANIMATION_ENCODER_CREATE_QUALITY_NUMBER`: the compression
/// quality, in the range of 0 to 100. The higher the number, the higher the
/// quality and file size. This defaults to a balanced value for compression
/// and quality.
/// - `IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_NUMERATOR_NUMBER`: the
/// numerator of the fraction used to multiply the pts to convert it to
/// seconds. This defaults to 1.
/// - `IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER`: the
/// denominator of the fraction used to multiply the pts to convert it to
/// seconds. This defaults to 1000.
///
/// \param props the properties of the animation encoder.
/// \returns a new IMG_AnimationEncoder, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationEncoder
/// \sa IMG_CreateAnimationEncoder_IO
/// \sa IMG_AddAnimationEncoderFrame
/// \sa IMG_CloseAnimationEncoder
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationEncoder * SDLCALL IMG_CreateAnimationEncoderWithProperties(SDL_PropertiesID props)
/// ```
/// {@category image}
Pointer<ImgAnimationEncoder> imgCreateAnimationEncoderWithProperties(
  int props,
) {
  final imgCreateAnimationEncoderWithPropertiesLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationEncoder> Function(Uint32 props),
        Pointer<ImgAnimationEncoder> Function(int props)
      >('IMG_CreateAnimationEncoderWithProperties');
  return imgCreateAnimationEncoderWithPropertiesLookupFunction(props);
}

///
/// Add a frame to an animation encoder.
///
/// \param encoder the receiving images.
/// \param surface the surface to add as the next frame in the animation.
/// \param duration the duration of the frame, usually in milliseconds but can
/// be other units if the
/// `IMG_PROP_ANIMATION_ENCODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER`
/// property is set when creating the encoder.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationEncoder
/// \sa IMG_CreateAnimationEncoder_IO
/// \sa IMG_CreateAnimationEncoderWithProperties
/// \sa IMG_CloseAnimationEncoder
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_AddAnimationEncoderFrame(IMG_AnimationEncoder *encoder, SDL_Surface *surface, Uint64 duration)
/// ```
/// {@category image}
bool imgAddAnimationEncoderFrame(
  Pointer<ImgAnimationEncoder> encoder,
  Pointer<SdlSurface> surface,
  int duration,
) {
  final imgAddAnimationEncoderFrameLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimationEncoder> encoder,
          Pointer<SdlSurface> surface,
          Uint64 duration,
        ),
        int Function(
          Pointer<ImgAnimationEncoder> encoder,
          Pointer<SdlSurface> surface,
          int duration,
        )
      >('IMG_AddAnimationEncoderFrame');
  return imgAddAnimationEncoderFrameLookupFunction(
        encoder,
        surface,
        duration,
      ) ==
      1;
}

///
/// Close an animation encoder, finishing any encoding.
///
/// Calling this function frees the animation encoder, and returns the final
/// status of the encoding process.
///
/// \param encoder the encoder to close.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationEncoder
/// \sa IMG_CreateAnimationEncoder_IO
/// \sa IMG_CreateAnimationEncoderWithProperties
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_CloseAnimationEncoder(IMG_AnimationEncoder *encoder)
/// ```
/// {@category image}
bool imgCloseAnimationEncoder(Pointer<ImgAnimationEncoder> encoder) {
  final imgCloseAnimationEncoderLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<ImgAnimationEncoder> encoder),
        int Function(Pointer<ImgAnimationEncoder> encoder)
      >('IMG_CloseAnimationEncoder');
  return imgCloseAnimationEncoderLookupFunction(encoder) == 1;
}

///
/// Create a decoder to read a series of images from a file.
///
/// These animation types are currently supported:
///
/// - ANI
/// - APNG
/// - AVIFS
/// - GIF
/// - WEBP
///
/// The file type is determined from the file extension, e.g. "file.webp" will
/// be decoded using WEBP.
///
/// \param file the file containing a series of images.
/// \returns a new IMG_AnimationDecoder, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationDecoder_IO
/// \sa IMG_CreateAnimationDecoderWithProperties
/// \sa IMG_GetAnimationDecoderFrame
/// \sa IMG_ResetAnimationDecoder
/// \sa IMG_CloseAnimationDecoder
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationDecoder * SDLCALL IMG_CreateAnimationDecoder(const char *file)
/// ```
/// {@category image}
Pointer<ImgAnimationDecoder> imgCreateAnimationDecoder(String? file) {
  final imgCreateAnimationDecoderLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationDecoder> Function(Pointer<Utf8> file),
        Pointer<ImgAnimationDecoder> Function(Pointer<Utf8> file)
      >('IMG_CreateAnimationDecoder');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = imgCreateAnimationDecoderLookupFunction(filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Create a decoder to read a series of images from an IOStream.
///
/// These animation types are currently supported:
///
/// - ANI
/// - APNG
/// - AVIFS
/// - GIF
/// - WEBP
///
/// If `closeio` is true, `src` will be closed before returning if this
/// function fails, or when the animation decoder is closed if this function
/// succeeds.
///
/// \param src an SDL_IOStream containing a series of images.
/// \param closeio true to close the SDL_IOStream when done, false to leave it
/// open.
/// \param type a filename extension that represent this data ("WEBP", etc).
/// \returns a new IMG_AnimationDecoder, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationDecoder
/// \sa IMG_CreateAnimationDecoderWithProperties
/// \sa IMG_GetAnimationDecoderFrame
/// \sa IMG_ResetAnimationDecoder
/// \sa IMG_CloseAnimationDecoder
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationDecoder * SDLCALL IMG_CreateAnimationDecoder_IO(SDL_IOStream *src, bool closeio, const char *type)
/// ```
/// {@category image}
Pointer<ImgAnimationDecoder> imgCreateAnimationDecoderIo(
  Pointer<SdlIoStream> src,
  bool closeio,
  String? type,
) {
  final imgCreateAnimationDecoderIoLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationDecoder> Function(
          Pointer<SdlIoStream> src,
          Uint8 closeio,
          Pointer<Utf8> type,
        ),
        Pointer<ImgAnimationDecoder> Function(
          Pointer<SdlIoStream> src,
          int closeio,
          Pointer<Utf8> type,
        )
      >('IMG_CreateAnimationDecoder_IO');
  final typePointer = type != null ? type.toNativeUtf8() : nullptr;
  final result = imgCreateAnimationDecoderIoLookupFunction(
    src,
    closeio ? 1 : 0,
    typePointer,
  );
  calloc.free(typePointer);
  return result;
}

///
/// Create an animation decoder with the specified properties.
///
/// These animation types are currently supported:
///
/// - ANI
/// - APNG
/// - AVIFS
/// - GIF
/// - WEBP
///
/// These are the supported properties:
///
/// - `IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING`: the file to load, if
/// an SDL_IOStream isn't being used. This is required if
/// `IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER` isn't set.
/// - `IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_POINTER`: an SDL_IOStream
/// containing a series of images. This should not be closed until the
/// animation decoder is closed. This is required if
/// `IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING` isn't set.
/// - `IMG_PROP_ANIMATION_DECODER_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN`: true if
/// closing the animation decoder should also close the associated
/// SDL_IOStream.
/// - `IMG_PROP_ANIMATION_DECODER_CREATE_TYPE_STRING`: the input file type,
/// e.g. "webp", defaults to the file extension if
/// `IMG_PROP_ANIMATION_DECODER_CREATE_FILENAME_STRING` is set.
///
/// \param props the properties of the animation decoder.
/// \returns a new IMG_AnimationDecoder, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationDecoder
/// \sa IMG_CreateAnimationDecoder_IO
/// \sa IMG_GetAnimationDecoderFrame
/// \sa IMG_ResetAnimationDecoder
/// \sa IMG_CloseAnimationDecoder
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationDecoder * SDLCALL IMG_CreateAnimationDecoderWithProperties(SDL_PropertiesID props)
/// ```
/// {@category image}
Pointer<ImgAnimationDecoder> imgCreateAnimationDecoderWithProperties(
  int props,
) {
  final imgCreateAnimationDecoderWithPropertiesLookupFunction = _libImage
      .lookupFunction<
        Pointer<ImgAnimationDecoder> Function(Uint32 props),
        Pointer<ImgAnimationDecoder> Function(int props)
      >('IMG_CreateAnimationDecoderWithProperties');
  return imgCreateAnimationDecoderWithPropertiesLookupFunction(props);
}

///
/// Get the properties of an animation decoder.
///
/// This function returns the properties of the animation decoder, which holds
/// information about the underlying image such as description, copyright text
/// and loop count.
///
/// \param decoder the animation decoder.
/// \returns the properties ID of the animation decoder, or 0 if there are no
/// properties; call SDL_GetError() for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationDecoder
/// \sa IMG_CreateAnimationDecoder_IO
/// \sa IMG_CreateAnimationDecoderWithProperties
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL IMG_GetAnimationDecoderProperties(IMG_AnimationDecoder* decoder)
/// ```
/// {@category image}
int imgGetAnimationDecoderProperties(Pointer<ImgAnimationDecoder> decoder) {
  final imgGetAnimationDecoderPropertiesLookupFunction = _libImage
      .lookupFunction<
        Uint32 Function(Pointer<ImgAnimationDecoder> decoder),
        int Function(Pointer<ImgAnimationDecoder> decoder)
      >('IMG_GetAnimationDecoderProperties');
  return imgGetAnimationDecoderPropertiesLookupFunction(decoder);
}

///
/// Get the next frame in an animation decoder.
///
/// This function decodes the next frame in the animation decoder, returning it
/// as an SDL_Surface. The returned surface should be freed with
/// SDL_FreeSurface() when no longer needed.
///
/// If the animation decoder has no more frames or an error occurred while
/// decoding the frame, this function returns false. In that case, please call
/// SDL_GetError() for more information. If SDL_GetError() returns an empty
/// string, that means there are no more available frames. If SDL_GetError()
/// returns a valid string, that means the decoding failed.
///
/// \param decoder the animation decoder.
/// \param frame a pointer filled in with the SDL_Surface for the next frame in
/// the animation.
/// \param duration the duration of the frame, usually in milliseconds but can
/// be other units if the
/// `IMG_PROP_ANIMATION_DECODER_CREATE_TIMEBASE_DENOMINATOR_NUMBER`
/// property is set when creating the decoder.
/// \returns true on success or false on failure and when no more frames are
/// available; call IMG_GetAnimationDecoderStatus() or SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationDecoder
/// \sa IMG_CreateAnimationDecoder_IO
/// \sa IMG_CreateAnimationDecoderWithProperties
/// \sa IMG_GetAnimationDecoderStatus
/// \sa IMG_ResetAnimationDecoder
/// \sa IMG_CloseAnimationDecoder
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_GetAnimationDecoderFrame(IMG_AnimationDecoder *decoder, SDL_Surface **frame, Uint64 *duration)
/// ```
/// {@category image}
bool imgGetAnimationDecoderFrame(
  Pointer<ImgAnimationDecoder> decoder,
  Pointer<Pointer<SdlSurface>> frame,
  Pointer<Uint64> duration,
) {
  final imgGetAnimationDecoderFrameLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(
          Pointer<ImgAnimationDecoder> decoder,
          Pointer<Pointer<SdlSurface>> frame,
          Pointer<Uint64> duration,
        ),
        int Function(
          Pointer<ImgAnimationDecoder> decoder,
          Pointer<Pointer<SdlSurface>> frame,
          Pointer<Uint64> duration,
        )
      >('IMG_GetAnimationDecoderFrame');
  return imgGetAnimationDecoderFrameLookupFunction(decoder, frame, duration) ==
      1;
}

///
/// Get the decoder status indicating the current state of the decoder.
///
/// \param decoder the decoder to get the status of.
/// \returns the status of the underlying decoder, or
/// IMG_DECODER_STATUS_INVALID if the given decoder is invalid.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_GetAnimationDecoderFrame
///
/// ```c
/// extern SDL_DECLSPEC IMG_AnimationDecoderStatus SDLCALL IMG_GetAnimationDecoderStatus(IMG_AnimationDecoder *decoder)
/// ```
/// {@category image}
int imgGetAnimationDecoderStatus(Pointer<ImgAnimationDecoder> decoder) {
  final imgGetAnimationDecoderStatusLookupFunction = _libImage
      .lookupFunction<
        Int32 Function(Pointer<ImgAnimationDecoder> decoder),
        int Function(Pointer<ImgAnimationDecoder> decoder)
      >('IMG_GetAnimationDecoderStatus');
  return imgGetAnimationDecoderStatusLookupFunction(decoder);
}

///
/// Reset an animation decoder.
///
/// Calling this function resets the animation decoder, allowing it to start
/// from the beginning again. This is useful if you want to decode the frame
/// sequence again without creating a new decoder.
///
/// \param decoder the decoder to reset.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationDecoder
/// \sa IMG_CreateAnimationDecoder_IO
/// \sa IMG_CreateAnimationDecoderWithProperties
/// \sa IMG_GetAnimationDecoderFrame
/// \sa IMG_CloseAnimationDecoder
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_ResetAnimationDecoder(IMG_AnimationDecoder *decoder)
/// ```
/// {@category image}
bool imgResetAnimationDecoder(Pointer<ImgAnimationDecoder> decoder) {
  final imgResetAnimationDecoderLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<ImgAnimationDecoder> decoder),
        int Function(Pointer<ImgAnimationDecoder> decoder)
      >('IMG_ResetAnimationDecoder');
  return imgResetAnimationDecoderLookupFunction(decoder) == 1;
}

///
/// Close an animation decoder, finishing any decoding.
///
/// Calling this function frees the animation decoder, and returns the final
/// status of the decoding process.
///
/// \param decoder the decoder to close.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL_image 3.4.0.
///
/// \sa IMG_CreateAnimationDecoder
/// \sa IMG_CreateAnimationDecoder_IO
/// \sa IMG_CreateAnimationDecoderWithProperties
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL IMG_CloseAnimationDecoder(IMG_AnimationDecoder *decoder)
/// ```
/// {@category image}
bool imgCloseAnimationDecoder(Pointer<ImgAnimationDecoder> decoder) {
  final imgCloseAnimationDecoderLookupFunction = _libImage
      .lookupFunction<
        Uint8 Function(Pointer<ImgAnimationDecoder> decoder),
        int Function(Pointer<ImgAnimationDecoder> decoder)
      >('IMG_CloseAnimationDecoder');
  return imgCloseAnimationDecoderLookupFunction(decoder) == 1;
}
