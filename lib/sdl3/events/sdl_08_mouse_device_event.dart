part of '../sdl_events.dart';

class SdlxMouseDeviceEvent extends SdlxEvent {
  SdlxMouseDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  factory SdlxMouseDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxMouseDeviceEvent(
    type: SDL_EVENT_MOUSE_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxMouseDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxMouseDeviceEvent(
    type: SDL_EVENT_MOUSE_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.mdevice.type = type;
    pointer.ref.mdevice.reserved = reserved;
    pointer.ref.mdevice.timestamp = timestamp;
    pointer.ref.mdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.mdevice.type;
    reserved = pointer.ref.mdevice.reserved;
    timestamp = pointer.ref.mdevice.timestamp;
    which = pointer.ref.mdevice.which;
  }

  static SdlxMouseDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseDeviceEvent()..loadFromPointer(pointer);
}
