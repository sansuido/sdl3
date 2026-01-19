// ignore_for_file: avoid_positional_boolean_parameters

part of '../../sdl.dart';

extension SdlRendererFromImagePointerEx on Pointer<SdlRenderer> {
  // lib_sdl_image.dart

  ///
  /// Load an image from a filesystem path into a texture.
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
  /// \param renderer the SDL_Renderer to use to create the texture.
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
  Pointer<SdlTexture> loadTexture(String file) => imgLoadTexture(this, file);

  ///
  /// Load an image from an SDL data source into a texture.
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
  /// \param renderer the SDL_Renderer to use to create the texture.
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
  Pointer<SdlTexture> loadTextureIo(Pointer<SdlIoStream> src, bool freesrc) =>
      imgLoadTextureIo(this, src, freesrc);

  ///
  /// Load an image from an SDL data source into a texture.
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
  /// \param renderer the SDL_Renderer to use to create the texture.
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
  Pointer<SdlTexture> loadTextureTypedIo(
    Pointer<SdlIoStream> src,
    bool freesrc,
    String type,
  ) => imgLoadTextureTypedIo(this, src, freesrc, type);
}
