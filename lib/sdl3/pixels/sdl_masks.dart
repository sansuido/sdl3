part of '../sdl_pixels.dart';

class SdlxMasks {
  const SdlxMasks({
    this.bpp = 0,
    this.rmask = 0,
    this.gmask = 0,
    this.bmask = 0,
    this.amask = 0,
  });
  final int bpp;
  final int rmask;
  final int gmask;
  final int bmask;
  final int amask;
}
