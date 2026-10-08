part of '../sdl_filesystem.dart';

class SdlxPathInfo {
  const SdlxPathInfo({
    this.type = 0,
    this.size = 0,
    this.createTime = 0,
    this.modifyTime = 0,
    this.accessTime = 0,
  });

  factory SdlxPathInfo.fromPointer(Pointer<SdlPathInfo> pointer) =>
      SdlxPathInfo(
        type: pointer.ref.type,
        size: pointer.ref.size,
        createTime: pointer.ref.createTime,
        modifyTime: pointer.ref.modifyTime,
        accessTime: pointer.ref.accessTime,
      );

  final int type;
  final int size;
  final int createTime;
  final int modifyTime;
  final int accessTime;

  Pointer<SdlPathInfo> calloc() {
    final pointer = ffi.calloc<SdlPathInfo>();
    pointer.ref.type = type;
    pointer.ref.size = size;
    pointer.ref.createTime = createTime;
    pointer.ref.modifyTime = modifyTime;
    pointer.ref.accessTime = accessTime;
    return pointer;
  }
}
