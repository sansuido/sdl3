part of '../../sdl_ttf.dart';

class TtfxSubString {
  TtfxSubString({
    this.flags = 0,
    this.offset = 0,
    this.length = 0,
    this.lineIndex = 0,
    this.clusterIndex = 0,
    SdlxRect? rect,
  }) {
    this.rect = rect ?? SdlxRect();
  }
  int flags;
  int offset;
  int length;
  int lineIndex;
  int clusterIndex;
  late SdlxRect rect;

  Pointer<TtfSubString> calloc() {
    final pointer = ffi.calloc<TtfSubString>();
    pointer.ref.flags = flags;
    pointer.ref.offset = offset;
    pointer.ref.length = length;
    pointer.ref.lineIndex = lineIndex;
    pointer.ref.clusterIndex = clusterIndex;
    pointer.ref.rect.x = rect.x;
    pointer.ref.rect.y = rect.y;
    pointer.ref.rect.w = rect.w;
    pointer.ref.rect.h = rect.h;
    return pointer;
  }

  void loadFromPointer(Pointer<TtfSubString> pointer) {
    flags = pointer.ref.flags;
    offset = pointer.ref.offset;
    length = pointer.ref.length;
    lineIndex = pointer.ref.lineIndex;
    clusterIndex = pointer.ref.clusterIndex;
    rect.x = pointer.ref.rect.x;
    rect.y = pointer.ref.rect.y;
    rect.w = pointer.ref.rect.w;
    rect.h = pointer.ref.rect.h;
  }
}
