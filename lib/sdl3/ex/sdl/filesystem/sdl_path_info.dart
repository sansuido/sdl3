part of '../../../sdl.dart';

class SdlxPathInfo {
  SdlxPathInfo({
    this.type = 0,
    this.size = 0,
    this.createTime = 0,
    this.modifyTime = 0,
    this.accessTime = 0,
  });

  int type;
  int size;
  int createTime;
  int modifyTime;
  int accessTime;

  Pointer<SdlPathInfo> calloc() {
    final pointer = ffi.calloc<SdlPathInfo>();
    pointer.ref.type = type;
    pointer.ref.size = size;
    pointer.ref.createTime = createTime;
    pointer.ref.modifyTime = modifyTime;
    pointer.ref.accessTime = accessTime;
    return pointer;
  }

  void loadFromPointer(Pointer<SdlPathInfo> pointer) {
    type = pointer.ref.type;
    size = pointer.ref.size;
    createTime = pointer.ref.createTime;
    modifyTime = pointer.ref.modifyTime;
    accessTime = pointer.ref.accessTime;
  }
}
