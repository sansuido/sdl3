part of '../sdl_ttf.dart';

class TtfxSubString {
  TtfxSubString({
    this.flags = 0,
    this.offset = 0,
    this.length = 0,
    this.lineIndex = 0,
    this.clusterIndex = 0,
    this.rect = const SdlxRect(),
  });

  factory TtfxSubString.fromPointer(Pointer<TtfSubString> pointer) =>
      TtfxSubString(
        flags: pointer.ref.flags,
        offset: pointer.ref.offset,
        length: pointer.ref.length,
        lineIndex: pointer.ref.lineIndex,
        clusterIndex: pointer.ref.clusterIndex,
        rect: SdlxRect(
          pointer.ref.rect.x,
          pointer.ref.rect.y,
          pointer.ref.rect.w,
          pointer.ref.rect.h,
        ),
      );

  final int flags;
  final int offset;
  final int length;
  final int lineIndex;
  final int clusterIndex;
  final SdlxRect rect;

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
}
