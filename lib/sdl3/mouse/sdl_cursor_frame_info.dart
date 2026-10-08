part of '../sdl_mouse.dart';

class SdlxCursorFrameInfo {
  SdlxCursorFrameInfo({Pointer<SdlSurface>? surface, this.duration = 0})
    : surface = surface ?? nullptr;

  factory SdlxCursorFrameInfo.fromPointer(
    Pointer<SdlCursorFrameInfo> pointer,
  ) => SdlxCursorFrameInfo(
    surface: pointer.ref.surface,
    duration: pointer.ref.duration,
  );

  final Pointer<SdlSurface> surface;
  final int duration;

  Pointer<SdlCursorFrameInfo> calloc() {
    final pointer = ffi.calloc<SdlCursorFrameInfo>();
    pointer.ref
      ..surface = surface
      ..duration = duration;
    return pointer;
  }
}

extension SdlxCursorFrameInfoListExtension on List<SdlxCursorFrameInfo> {
  Pointer<SdlCursorFrameInfo> calloc() {
    final buffersPointer = ffi.calloc<SdlCursorFrameInfo>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.surface = this[n].surface;
      bufferPointer.ref.duration = this[n].duration;
    }
    return buffersPointer;
  }
}
