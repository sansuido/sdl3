import 'dart:ffi';
import 'dart:math' as math show Rectangle;
import 'package:ffi/ffi.dart';
import '../../generated/lib_sdl_mouse.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/lib_sdl_surface.dart';
import '../dart/rectangle.dart';
import 'sdl_rect.dart';

extension SdlSurfaceEx on SdlSurface {
  static Pointer<SdlSurface> loadBmp(String file) {
    return sdlLoadBmp(file);
  }
}

extension SdlSurfacePointerEx on Pointer<SdlSurface> {
  // lib_sdl_mouse.dart
  Pointer<SdlCursor> createColorCursor(int hotX, int hotY) {
    return sdlCreateColorCursor(this, hotX, hotY);
  }

  // lib_sdl_surface.dart

  // sdlCreateRgbSurface
  // sdlCreateRgbSurfaceWithFormat
  // sdlCreateRgbSurfaceFrom
  // sdlCreateRgbSurfaceWithFormatFrom

  bool destroy() {
    if (this != nullptr) {
      // 228
      sdlDestroySurface(this);
      return true;
    }
    return false;
  }

  int setPalette(Pointer<SdlPalette> palette) {
    // 250
    return sdlSetSurfacePalette(this, palette);
  }

  int lock() {
    // 283
    return sdlLockSurface(this);
  }

  void unlock() {
    // 302
    sdlUnlockSurface(this);
  }

  Pointer<SdlSurface> loadBmpIo(Pointer<SdlIoStream> src, bool freesrc) {
    // 334
    return sdlLoadBmpIo(src, freesrc);
  }

  int saveBmpIo(Pointer<SdlIoStream> dst, bool freedst) {
    // 365
    return sdlSaveBmpIo(this, dst, freedst);
  }

  int setRre(int flag) {
    // 395
    return sdlSetSurfaceRle(this, flag);
  }

  bool hasRre() {
    // 417
    return sdlSurfaceHasRle(this);
  }

  int setColorKey(int flag, int key) {
    // 451
    return sdlSetSurfaceColorKey(this, flag, key);
  }

  bool hadColorKey() {
    // 475
    return sdlSurfaceHasColorKey(this);
  }

  int? getColorKey() {
    int? result;
    var keyPointer = calloc<Uint32>();
    // 503
    if (sdlGetSurfaceColorKey(this, keyPointer) == 0) {
      result = keyPointer.value;
    }
    calloc.free(keyPointer);
    return result;
  }

  int setColorMod(int r, int g, int b) {
    // 535
    return sdlSetSurfaceColorMod(this, r, g, b);
  }

  int? getColorMod() {
    int? result;
    var rPointer = calloc<Uint8>();
    var gPointer = calloc<Uint8>();
    var bPointer = calloc<Uint8>();
    // 561
    if (sdlGetSurfaceColorMod(this, rPointer, gPointer, bPointer) == 0) {
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
    // 592
    return sdlSetSurfaceAlphaMod(this, alpha);
  }

  int? getAlphaMod() {
    int? result;
    var alphaPointer = calloc<Uint8>();
    // 616
    if (sdlGetSurfaceAlphaMod(this, alphaPointer) == 0) {
      result = alphaPointer.value;
    }
    calloc.free(alphaPointer);
    return result;
  }

  int setBlendMode(int blendMode) {
    // 643
    return sdlSetSurfaceBlendMode(this, blendMode);
  }

  int? getBlendMode() {
    int? result;
    var blendModePointer = calloc<Int32>();
    // 666
    if (sdlGetSurfaceBlendMode(this, blendModePointer) == 0) {
      result = blendModePointer.value;
    }
    calloc.free(blendModePointer);
    return result;
  }

  bool setClipRect([math.Rectangle<double>? rect]) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    // 698
    var result = sdlSetSurfaceClipRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  math.Rectangle<double> getClipRect() {
    var rectPointer = calloc<SdlRect>();
    // 725
    sdlGetSurfaceClipRect(this, rectPointer);
    var result = rectPointer.create();
    calloc.free(rectPointer);
    return result;
  }

  Pointer<SdlSurface> duplicate() {
    // 745
    return sdlDuplicateSurface(this);
  }

  // sdlConvertPixels
  // sdlPremultiplyAlpha

  int fillRect(math.Rectangle<double>? rect, int color) {
    int result;
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    result = sdlFillSurfaceRect(this, rectPointer, color);
    calloc.free(rectPointer);
    return result;
  }

  int fillRects(List<math.Rectangle<double>> rects, int color) {
    var rectsPointer = rects.callocInt();
    // 976
    var result = sdlFillSurfaceRects(this, rectsPointer, rects.length, color);
    calloc.free(rectsPointer);
    return result;
  }

  int upperBlit(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
  }) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    // 999
    var result = sdlBlitSurface(this, srcrectPointer, dst, dstrectPointer);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    return result;
  }

  int lowerBlit(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
  }) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    // 1034
    var result =
        sdlBlitSurfaceUnchecked(this, srcrectPointer, dst, dstrectPointer);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    return result;
  }

  int softStretch(Pointer<SdlSurface> dst,
      {math.Rectangle<double>? srcrect,
      math.Rectangle<double>? dstrect,
      int scaleMode = 0}) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    // 1055
    var result =
        sdlSoftStretch(this, srcrectPointer, dst, dstrectPointer, scaleMode);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    return result;
  }

  int upperBlitScaled(Pointer<SdlSurface> dst,
      {math.Rectangle<double>? srcrect,
      math.Rectangle<double>? dstrect,
      int scaleMode = 0}) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    // 1102
    var result = sdlBlitSurfaceScaled(
        this, srcrectPointer, dst, dstrectPointer, scaleMode);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    return result;
  }

  int lowerBlitScaled(Pointer<SdlSurface> dst,
      {math.Rectangle<double>? srcrect,
      math.Rectangle<double>? dstrect,
      int scaleMode = 0}) {
    Pointer<SdlRect> srcrectPointer = nullptr;
    Pointer<SdlRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.callocInt();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.callocInt();
    }
    // 1137
    var result = sdlBlitSurfaceUncheckedScaled(
        this, srcrectPointer, dst, dstrectPointer, scaleMode);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    return result;
  }

  // sdlSetYuvConversionMode
  // sdlGetYuvConversionMode
  // sdlGetYuvConversionModeForResolution

  // lib_sdl_ex.dart
  //Pointer<SdlSurface> loadBmp(String file) {
  //  return sdlLoadBmp(file);
  //}

  int saveBmp(String file) {
    return sdlSaveBmp(this, file);
  }

  int blit(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
  }) {
    return upperBlit(dst, srcrect: srcrect, dstrect: dstrect);
  }

  int blitScaled(
    Pointer<SdlSurface> dst, {
    math.Rectangle<double>? srcrect,
    math.Rectangle<double>? dstrect,
  }) {
    return upperBlitScaled(dst, srcrect: srcrect, dstrect: dstrect);
  }
}
