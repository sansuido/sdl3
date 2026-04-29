part of '../../sdl.dart';

class SdlxPoint {
  SdlxPoint(this.x, this.y);
  int x;
  int y;

  SdlxFPoint toFloat() => SdlxFPoint(x.toDouble(), y.toDouble());

  void loadFromPointer(Pointer<SdlPoint> pointer) {
    x = pointer.ref.x;
    y = pointer.ref.y;
  }

  Pointer<SdlPoint> calloc() {
    final pointer = ffi.calloc<SdlPoint>();
    pointer.ref.x = x;
    pointer.ref.y = y;
    return pointer;
  }
}

extension SdlxPointListExtension on List<SdlxPoint> {
  Pointer<SdlPoint> calloc() {
    final buffersPointer = ffi.calloc<SdlPoint>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.x = this[n].x;
      bufferPointer.ref.y = this[n].y;
    }
    return buffersPointer;
  }
}
