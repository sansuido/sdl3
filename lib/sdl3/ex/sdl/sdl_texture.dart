import 'dart:ffi';
import 'dart:math' show Point;
import 'package:ffi/ffi.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/lib_sdl_render.dart';

extension SdlTexturePointerEx on Pointer<SdlTexture> {
  // lib_sdl_renderer.dart

  ///
  /// Get the size of a texture, as floating point values.
  ///
  /// \param texture the texture to query.
  /// \param w a pointer filled in with the width of the texture in pixels. This
  /// argument can be NULL if you don't need this information.
  /// \param h a pointer filled in with the height of the texture in pixels. This
  /// argument can be NULL if you don't need this information.
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL SDL_GetTextureSize(SDL_Texture *texture, float *w, float *h)
  /// ```
  Point<double>? getSize() {
    Point<double>? result;
    var wPointer = calloc<Float>();
    var hPointer = calloc<Float>();
    if (sdlGetTextureSize(this, wPointer, hPointer) == 0) {
      result = Point(wPointer.value.toDouble(), hPointer.value.toDouble());
    }
    calloc.free(wPointer);
    calloc.free(hPointer);
    return result;
  }

  int setColorMod(int r, int g, int b) {
    // 398
    return sdlSetTextureColorMod(this, r, g, b);
  }

  int? getColorMod() {
    int? result;
    var rPointer = calloc<Uint8>();
    var gPointer = calloc<Uint8>();
    var bPointer = calloc<Uint8>();
    // 424
    if (sdlGetTextureColorMod(this, rPointer, gPointer, bPointer) == 0) {
      result = 0;
      result += rPointer.value << 16;
      result += gPointer.value << 8;
      result += bPointer.value << 0;
    }
    calloc.free(rPointer);
    calloc.free(gPointer);
    calloc.free(bPointer);
    return result;
  }

  int setAlphaMod(int alpha) {
    // 458
    return sdlSetTextureAlphaMod(this, alpha);
  }

  int? getAlphaMod() {
    int? result;
    var alphaPointer = calloc<Uint8>();
    // 482
    if (sdlGetTextureAlphaMod(this, alphaPointer) == 0) {
      result = alphaPointer.value;
    }
    calloc.free(alphaPointer);
    return result;
  }

  int setBlendMode(int blendMode) {
    // 509
    return sdlSetTextureBlendMode(this, blendMode);
  }

  int? getBlendMode() {
    int? result;
    var blendModePointer = calloc<Uint32>();
    // 532
    if (sdlGetTextureBlendMode(this, blendModePointer) == 0) {
      result = blendModePointer.value;
    }
    calloc.free(blendModePointer);
    return result;
  }

  int setScaleMode(int scaleMode) {
    // 557
    return sdlSetTextureScaleMode(this, scaleMode);
  }

  int? getScaleMode() {
    int? result;
    var scaleModePointer = calloc<Int32>();
    // 579
    if (sdlGetTextureScaleMode(this, scaleModePointer) == 0) {
      result = scaleModePointer.value;
    }
    calloc.free(scaleModePointer);
    return result;
  }

  int update(Pointer<SdlRect> rect, Pointer<NativeType> pixels, int pitch) {
    // 664
    return sdlUpdateTexture(this, rect, pixels, pitch);
  }

  int updateYuv(Pointer<SdlRect> rect, Pointer<Uint8> yplane, int ypitch,
      Pointer<Uint8> uplane, int upitch, Pointer<Uint8> vplane, int vpitch) {
    // 704
    return sdlUpdateYuvTexture(
        this, rect, yplane, ypitch, uplane, upitch, vplane, vpitch);
  }

  int updateNv(Pointer<SdlRect> rect, Pointer<Uint8> yplane, int ypitch,
      Pointer<Uint8> uVplane, int uVpitch) {
    // 759
    return sdlUpdateNvTexture(this, rect, yplane, ypitch, uVplane, uVpitch);
  }

  int lock(Pointer<SdlRect> rect, Pointer<Pointer<NativeType>> pixels,
      Pointer<Int32> pitch) {
    // 810
    return sdlLockTexture(this, rect, pixels, pitch);
  }

  int lockToSurface(
      Pointer<SdlRect> rect, Pointer<Pointer<SdlSurface>> surface) {
    // 858
    return sdlLockTextureToSurface(this, rect, surface);
  }

  void unlock() {
    // 888
    sdlUnlockTexture(this);
  }

  bool destroy() {
    if (this != nullptr) {
      // 2413
      sdlDestroyTexture(this);
      return true;
    }
    return false;
  }
}
