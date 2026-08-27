part of '../../../sdl.dart';

class SdlxUserEvent extends SdlxEvent {
  SdlxUserEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.code = 0,
    Pointer<Void>? data1,
    Pointer<Void>? data2,
  }) {
    this.data1 = data1 ?? nullptr;
    this.data2 = data2 ?? nullptr;
  }

  int windowId;
  int code;
  late Pointer<Void> data1;
  late Pointer<Void> data2;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.user.type = type;
    pointer.ref.user.reserved = reserved;
    pointer.ref.user.timestamp = timestamp;
    pointer.ref.user.windowId = windowId;
    pointer.ref.user.code = code;
    pointer.ref.user.data1 = data1;
    pointer.ref.user.data2 = data2;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.user.type;
    reserved = pointer.ref.user.reserved;
    timestamp = pointer.ref.user.timestamp;
    windowId = pointer.ref.user.windowId;
    code = pointer.ref.user.code;
    data1 = pointer.ref.user.data1;
    data2 = pointer.ref.user.data2;
  }

  static SdlxUserEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxUserEvent()..loadFromPointer(pointer);
}
