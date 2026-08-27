part of '../../../sdl.dart';

class SdlxWindowEvent extends SdlxEvent {
  SdlxWindowEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.data1 = 0,
    this.data2 = 0,
  });

  int windowId;
  int data1;
  int data2;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.window.type = type;
    pointer.ref.window.reserved = reserved;
    pointer.ref.window.timestamp = timestamp;
    pointer.ref.window.windowId = windowId;
    pointer.ref.window.data1 = data1;
    pointer.ref.window.data2 = data2;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.window.type;
    reserved = pointer.ref.window.reserved;
    timestamp = pointer.ref.window.timestamp;
    windowId = pointer.ref.window.windowId;
    data1 = pointer.ref.window.data1;
    data2 = pointer.ref.window.data2;
  }

  static SdlxWindowEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxWindowEvent()..loadFromPointer(pointer);
}
