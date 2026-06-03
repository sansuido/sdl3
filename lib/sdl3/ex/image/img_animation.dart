part of '../../sdl_image.dart';

extension ImgAnimationEx on ImgAnimation {
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
  static Pointer<ImgAnimation> load(String file) => imgLoadAnimation(file);

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
  static Pointer<ImgAnimation> loadIo(
    Pointer<SdlIoStream> src, {
    bool closeio = false,
  }) => imgLoadAnimationIo(src, closeio);

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
  static Pointer<ImgAnimation> loadTypeIo(
    Pointer<SdlIoStream> src,
    String type, {
    bool closeio = false,
  }) => imgLoadAnimationTypedIo(src, closeio, type);

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
  static Pointer<ImgAnimation> loadAniIo(Pointer<SdlIoStream> src) =>
      imgLoadAniAnimationIo(src);

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
  static Pointer<ImgAnimation> loadApngIo(Pointer<SdlIoStream> src) =>
      imgLoadApngAnimationIo(src);

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
  static Pointer<ImgAnimation> loadAvifIo(Pointer<SdlIoStream> src) =>
      imgLoadAvifAnimationIo(src);

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
  static Pointer<ImgAnimation> loadGifIo(Pointer<SdlIoStream> src) =>
      imgLoadGifAnimationIo(src);

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
  static Pointer<ImgAnimation> loadWebpIo(Pointer<SdlIoStream> src) =>
      imgLoadWebpAnimationIo(src);
}

extension ImgAnimationPointerEx on Pointer<ImgAnimation> {
  // lis_sdl_image.dart

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
  bool save(String file) {
    final filePointer = file.toNativeUtf8();
    final result = imgSaveAnimation(this, file);
    malloc.free(filePointer);
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
  bool saveTypeIo(
    Pointer<SdlIoStream> dst,
    String type, {
    bool closeio = false,
  }) => imgSaveAnimationTypedIo(this, dst, closeio, type);

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
  bool saveIo(Pointer<SdlIoStream> dst, {bool closeio = false}) =>
      imgSaveAniAnimationIo(this, dst, closeio);

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
  bool saveApngIo(Pointer<SdlIoStream> dst, {bool closeio = false}) =>
      imgSaveApngAnimationIo(this, dst, closeio);

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
  bool saveAvifIo(
    Pointer<SdlIoStream> dst,
    int quality, {
    bool closeio = false,
  }) => imgSaveAvifAnimationIo(this, dst, closeio, quality);

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
  bool saveGifIo(Pointer<SdlIoStream> dst, {bool closeio = false}) =>
      imgSaveGifAnimationIo(this, dst, closeio);

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
  bool saveWebpIo(
    Pointer<SdlIoStream> dst,
    int quality, {
    bool closeio = false,
  }) => imgSaveWebpAnimationIo(this, dst, closeio, quality);

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
  Pointer<SdlCursor> createCursor(int hotX, int hotY) =>
      imgCreateAnimatedCursor(this, hotX, hotY);

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
  void free() {
    imgFreeAnimation(this);
  }
}
