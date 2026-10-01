part of '../sdl_events.dart';

class SdlxCommonEvent extends SdlxEvent {
  SdlxCommonEvent({super.type = 0, super.reserved = 0, super.timestamp = 0});

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.common.type = type;
    pointer.ref.common.reserved = reserved;
    pointer.ref.common.timestamp = timestamp;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.common.type;
    reserved = pointer.ref.common.reserved;
    timestamp = pointer.ref.common.timestamp;
  }

  static SdlxCommonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxCommonEvent()..loadFromPointer(pointer);
}
