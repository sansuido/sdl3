import 'dart:ffi';
//import '../../generated/const_sdl.dart';
import '../../generated/lib_sdl_image.dart';
import '../../generated/lib_sdl_mixer.dart';
import '../../generated/lib_sdl_rwops.dart';
import '../../generated/lib_sdl_ttf.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/struct_sdl_image.dart';
import '../../generated/struct_sdl_mixer.dart';
import '../../generated/struct_sdl_ttf.dart';

extension SdlRWopsEx on SdlRWops {
  // lib_sdl_rwops.dart
  static Pointer<SdlRWops> fromFile(String file, String mode) {
    // 71
    return sdlRwFromFile(file, mode);
  }

  static Pointer<SdlRWops> fromMem(Pointer<NativeType> mem, int size) {
    // 129
    return sdlRwFromMem(mem, size);
  }

  static Pointer<SdlRWops> fromConstMem(Pointer<NativeType> mem, int size) {
    // 172
    return sdlRwFromConstMem(mem, size);
  }

  static Pointer<SdlRWops> create() {
    // 206
    return sdlCreateRw();
  }
}

extension SdlRWopsPointerEx on Pointer<SdlRWops> {
  // lib_sdl_audio.dart

  // lib_sdl_image.dart
  int isAvif() {
    // 546
    return imgIsAvif(this);
  }

  int isIco() {
    // 597
    return imgIsIco(this);
  }

  int isCur() {
    // 648
    return imgIsCur(this);
  }

  int isBmp() {
    // 699
    return imgIsBmp(this);
  }

  int isGif() {
    // 750
    return imgIsGif(this);
  }

  int isJpg() {
    // 801
    return imgIsJpg(this);
  }

  int isJxl() {
    // 852
    return imgIsJxl(this);
  }

  int isLbm() {
    // 903
    return imgIsLbm(this);
  }

  int isPcx() {
    // 954
    return imgIsPcx(this);
  }

  int isPng() {
    // 1005
    return imgIsPng(this);
  }

  int isPnm() {
    // 1056
    return imgIsPnm(this);
  }

  int isSvg() {
    // 1107
    return imgIsSvg(this);
  }

  int isQoi() {
    // 1158
    return imgIsQoi(this);
  }

  int isTif() {
    // 1209
    return imgIsTif(this);
  }

  int isXcf() {
    // 1260
    return imgIsXcf(this);
  }

  int isXpm() {
    // 1311
    return imgIsXpm(this);
  }

  int isXv() {
    // 1362
    return imgIsXv(this);
  }

  int isWebp() {
    // 1413
    return imgIsWebp(this);
  }

  Pointer<SdlSurface> loadAvif() {
    // 1455
    return imgLoadAvifRw(this);
  }

  Pointer<SdlSurface> loadIco() {
    // 1497
    return imgLoadIcoRw(this);
  }

  Pointer<SdlSurface> loadCur() {
    // 1539
    return imgLoadCurRw(this);
  }

  Pointer<SdlSurface> loadBmp() {
    // 1581
    return imgLoadBmpRw(this);
  }

  Pointer<SdlSurface> loadGif() {
    // 1623
    return imgLoadGifRw(this);
  }

  Pointer<SdlSurface> loadJpg() {
    // 1665
    return imgLoadJpgRw(this);
  }

  Pointer<SdlSurface> loadJxl() {
    // 1707
    return imgLoadJxlRw(this);
  }

  Pointer<SdlSurface> loadLbm() {
    // 1749
    return imgLoadLbmRw(this);
  }

  Pointer<SdlSurface> loadPcx() {
    // 1791
    return imgLoadPcxRw(this);
  }

  Pointer<SdlSurface> loadPng() {
    // 1833
    return imgLoadPngRw(this);
  }

  Pointer<SdlSurface> loadPnm() {
    // 1875
    return imgLoadPnmRw(this);
  }

  Pointer<SdlSurface> loadSvg() {
    // 1917
    return imgLoadSvgRw(this);
  }

  Pointer<SdlSurface> loadQoi() {
    // 1959
    return imgLoadQoiRw(this);
  }

  Pointer<SdlSurface> loadTga() {
    // 2001
    return imgLoadTgaRw(this);
  }

  Pointer<SdlSurface> loadTif() {
    // 2043
    return imgLoadTifRw(this);
  }

  Pointer<SdlSurface> loadXcf() {
    // 2085
    return imgLoadXcfRw(this);
  }

  Pointer<SdlSurface> loadXpm() {
    // 2127
    return imgLoadXpmRw(this);
  }

  Pointer<SdlSurface> loadXv() {
    // 2169
    return imgLoadXvRw(this);
  }

  Pointer<SdlSurface> loadWebp() {
    // 2211
    return imgLoadWebpRw(this);
  }

  Pointer<SdlSurface> loadSizedSvgRw(int width, int height) {
    // 2240
    return imgLoadSizedSvgRw(this, width, height);
  }

  Pointer<ImgAnimation> loadAnimationRw(bool freesrc) {
    // 2471
    return imgLoadAnimationRw(this, freesrc);
  }

  Pointer<ImgAnimation> loadAnimationTypedRw(bool freesrc, String type) {
    // 2510
    return imgLoadAnimationTypedRw(this, freesrc, type);
  }

  Pointer<ImgAnimation> loadGifAnimation() {
    // 2568
    return imgLoadGifAnimationRw(this);
  }

  // lib_sdl_mixer.dart
  Pointer<MixChunk> loadWav(bool freesrc) {
    // 490
    return mixLoadWavRw(this, freesrc);
  }

  Pointer<MixMusic> loadMus(bool freesrc) {
    // 636
    return mixLoadMusRw(this, freesrc);
  }

  Pointer<MixMusic> loadMusType(int type, bool freesrc) {
    // 701
    return mixLoadMusTypeRw(this, type, freesrc);
  }

  // lib_sdl_rwops.dart
  void destroy() {
    // 238
    sdlDestroyRw(this);
  }

  int size() {
    // 260
    return sdlRWsize(this);
  }

  int seek(int offset, int whence) {
    // 305
    return sdlRWseek(this, offset, whence);
  }

  int tell() {
    // 341
    return sdlRWtell(this);
  }

  int read(Pointer<NativeType> ptr, int size) {
    // 381
    return sdlRWread(this, ptr, size);
  }

  int write(Pointer<NativeType> ptr, int size) {
    // 424
    return sdlRWwrite(this, ptr, size);
  }

  int close() {
    // 464
    return sdlRWclose(this);
  }

  Pointer<NativeType> loadFile(Pointer<Uint32> datasize, bool freesrc) {
    // 490
    return sdlLoadFileRw(this, datasize, freesrc);
  }

  // lib_sdl_ttf.dart
  Pointer<TtfFont> openFont(bool freesrc, int ptsize) {
    // 225
    return ttfOpenFontRw(this, freesrc, ptsize);
  }

  Pointer<TtfFont> openFontIndex(bool freesrc, int ptsize, int index) {
    // 265
    return ttfOpenFontIndexRw(this, freesrc, ptsize, index);
  }

  Pointer<TtfFont> openFontDpi(bool freesrc, int ptsize, int hdpi, int vdpi) {
    // 384
    return ttfOpenFontDpirw(this, freesrc, ptsize, hdpi, vdpi);
  }

  Pointer<TtfFont> openFontIndexDpi(
      bool freesrc, int ptsize, int index, int hdpi, int vdpi) {
    // 429
    return ttfOpenFontIndexDpirw(this, freesrc, ptsize, index, hdpi, vdpi);
  }
}
