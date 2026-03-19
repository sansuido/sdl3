part of '../../sdl.dart';

class SdlxFColor {
  SdlxFColor({this.r = 0, this.g = 0, this.b = 0, this.a = 1.0});

  double r;
  double g;
  double b;
  double a;

  Pointer<SdlFColor> calloc() {
    final pointer = ffi.calloc<SdlFColor>();
    pointer.ref.r = r;
    pointer.ref.g = g;
    pointer.ref.b = b;
    pointer.ref.a = a;
    return pointer;
  }
}
