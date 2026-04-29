part of '../../sdl.dart';

/*
// SDL_CursorFrameInfo
/// {@category mouse}
final class SdlCursorFrameInfo extends Struct {
  // [0]+(8)
  external Pointer<SdlSurface> surface;
  // [8]+(4)
  @Uint32()
  external int duration;
  // [] +(4)
  @Uint32()
  external int blank_1;
}
*/

class SdlxCursorFrameInfo {
  SdlxCursorFrameInfo({Pointer<SdlSurface>? surface, this.duration = 0}) {
    this.surface = surface ?? nullptr;
  }

  late Pointer<SdlSurface> surface;
  int duration;

  void loadFromPointer(Pointer<SdlCursorFrameInfo> pointer) {
    surface = pointer.ref.surface;
    duration = pointer.ref.duration;
  }

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
