part of '../../../sdl.dart';

class SdlxColor {
  SdlxColor(this.r, this.g, this.b, [this.a = 255]);

  int r;
  int g;
  int b;
  int a;

  Pointer<SdlColor> calloc() {
    final pointer = ffi.calloc<SdlColor>();
    pointer.ref.r = r;
    pointer.ref.g = g;
    pointer.ref.b = b;
    pointer.ref.a = a;
    return pointer;
  }
}
