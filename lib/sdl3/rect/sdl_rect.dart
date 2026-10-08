part of '../sdl_rect.dart';

class SdlxRect {
  const SdlxRect([this.x = 0, this.y = 0, this.w = 0, this.h = 0]);

  factory SdlxRect.fromPointer(Pointer<SdlRect> pointer) =>
      SdlxRect(pointer.ref.x, pointer.ref.y, pointer.ref.w, pointer.ref.h);

  final int x;
  final int y;
  final int w;
  final int h;

  SdlxFRect toFloat() =>
      SdlxFRect(x.toDouble(), y.toDouble(), w.toDouble(), h.toDouble());

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
