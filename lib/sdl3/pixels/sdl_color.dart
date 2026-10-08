part of '../sdl_pixels.dart';

class SdlxColor {
  const SdlxColor(this.r, this.g, this.b, [this.a = 255]);

  final int r;
  final int g;
  final int b;
  final int a;

  Pointer<SdlColor> calloc() {
    final pointer = ffi.calloc<SdlColor>();
    pointer.ref.r = r;
    pointer.ref.g = g;
    pointer.ref.b = b;
    pointer.ref.a = a;
    return pointer;
  }
}
