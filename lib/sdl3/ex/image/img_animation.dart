part of '../../sdl_image.dart';

extension ImgAnimationPointerEx on Pointer<ImgAnimation> {
  // lis_sdl_image.dart

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
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL IMG_FreeAnimation(IMG_Animation *anim)
  /// ```
  /// {@category image}
  void free() {
    imgFreeAnimation(this);
  }
}
