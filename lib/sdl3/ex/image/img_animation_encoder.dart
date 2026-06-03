part of '../../sdl_image.dart';

extension ImgAnimationEncoderEx on ImgAnimationEncoder {
  // lis_sdl_image.dart
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
  static Pointer<ImgAnimationEncoder> create(String file) =>
      imgCreateAnimationEncoder(file);

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
  static Pointer<ImgAnimationEncoder> createIo(
    Pointer<SdlIoStream> dst,
    String type, {
    bool closeio = false,
  }) => imgCreateAnimationEncoderIo(dst, closeio, type);

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
  static Pointer<ImgAnimationEncoder> createWithProperties(int props) =>
      imgCreateAnimationEncoderWithProperties(props);
}

extension ImgAnimationEncoderPointerEx on Pointer<ImgAnimationEncoder> {
  // lis_sdl_image.dart

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
  bool addFrame(Pointer<SdlSurface> surface, int duration) =>
      imgAddAnimationEncoderFrame(this, surface, duration);

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
  bool close() => imgCloseAnimationEncoder(this);
}
