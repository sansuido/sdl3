part of '../../sdl.dart';

class SdlxRect {
  SdlxRect({this.x = 0, this.y = 0, this.w = 0, this.h = 0});
  int x;
  int y;
  int w;
  int h;

  SdlxFRect toFloat() => SdlxFRect(
    x: x.toDouble(),
    y: y.toDouble(),
    w: w.toDouble(),
    h: h.toDouble(),
  );

  void loadFromPointer(Pointer<SdlRect> pointer) {
    x = pointer.ref.x;
    y = pointer.ref.y;
    w = pointer.ref.w;
    h = pointer.ref.h;
  }

  Pointer<SdlRect> calloc() {
    final pointer = ffi.calloc<SdlRect>();
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.w = w;
    pointer.ref.h = h;
    return pointer;
  }
}

extension SdlxRectListExtension on List<SdlxRect> {
  Pointer<SdlRect> calloc() {
    final buffersPointer = ffi.calloc<SdlRect>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.x = this[n].x;
      bufferPointer.ref.y = this[n].y;
      bufferPointer.ref.w = this[n].w;
      bufferPointer.ref.h = this[n].h;
    }
    return buffersPointer;
  }
}
