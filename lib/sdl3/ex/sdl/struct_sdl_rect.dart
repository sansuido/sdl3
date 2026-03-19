part of '../../sdl.dart';

class SdlxRect {
  SdlxRect({this.x = 0, this.y = 0, this.w = 0, this.h = 0});
  int x;
  int y;
  int w;
  int h;
  Pointer<SdlRect> calloc() {
    final pointer = ffi.calloc<SdlRect>();
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.w = w;
    pointer.ref.h = h;
    return pointer;
  }
}
