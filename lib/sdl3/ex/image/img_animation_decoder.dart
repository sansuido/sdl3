part of '../../sdl_image.dart';

extension ImgAnimationDecoderEx on ImgAnimationDecoder {
  // lis_sdl_image.dart

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
  static Pointer<ImgAnimationDecoder> create(String file) =>
      imgCreateAnimationDecoder(file);

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
  static Pointer<ImgAnimationDecoder> createIo(
    Pointer<SdlIoStream> src,
    String type, {
    bool closeio = false,
  }) => imgCreateAnimationDecoderIo(src, closeio, type);

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
  static Pointer<ImgAnimationDecoder> createWithProperties(int props) =>
      imgCreateAnimationDecoderWithProperties(props);
}

extension ImgAnimationDecoderPointerEx on Pointer<ImgAnimationDecoder> {
  // lis_sdl_image.dart

  ///
  /// Get the properties of an animation decoder.
  ///
  /// This function returns the properties of the animation decoder, which holds
  /// information about the underlying image such as description, copyright text
  /// and loop count.
  ///
  /// `IMG_PROP_METADATA_LOOP_COUNT_NUMBER`, if present, specifies the number of
  /// times to play the animation, with 0 meaning loop continuously.
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
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL IMG_GetAnimationDecoderProperties(IMG_AnimationDecoder *decoder)
  /// ```
  /// {@category image}
  int getProperties() => imgGetAnimationDecoderProperties(this);

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
  bool getFrame(ImgxAnimationDecoderFrame frame) =>
      imgxGetAnimationDecoderFrame(this, frame);

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
  int getStatus() => imgGetAnimationDecoderStatus(this);

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
  bool reset() => imgResetAnimationDecoder(this);

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
  bool close() => imgCloseAnimationDecoder(this);
}
