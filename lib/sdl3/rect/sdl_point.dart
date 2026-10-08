part of '../sdl_rect.dart';

class SdlxPoint {
  const SdlxPoint(this.x, this.y);

  factory SdlxPoint.fromPointer(Pointer<SdlPoint> pointer) =>
      SdlxPoint(pointer.ref.x, pointer.ref.y);

  final int x;
  final int y;

  SdlxFPoint toFloat() => SdlxFPoint(x.toDouble(), y.toDouble());

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
