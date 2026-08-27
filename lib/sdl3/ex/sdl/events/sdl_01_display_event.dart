part of '../../../sdl.dart';

class SdlxDisplayEvent extends SdlxEvent {
  SdlxDisplayEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.displayId = 0,
    this.data1 = 0,
    this.data2 = 0,
  });

  int displayId;
  int data1;
  int data2;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.display.type = type;
    pointer.ref.display.reserved = reserved;
    pointer.ref.display.timestamp = timestamp;
    pointer.ref.display.displayId = displayId;
    pointer.ref.display.data1 = data1;
    pointer.ref.display.data2 = data2;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.display.type;
    reserved = pointer.ref.display.reserved;
    timestamp = pointer.ref.display.timestamp;
    displayId = pointer.ref.display.displayId;
    data1 = pointer.ref.display.data1;
    data2 = pointer.ref.display.data2;
  }

  static SdlxDisplayEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxDisplayEvent()..loadFromPointer(pointer.cast<SdlEvent>());
}
