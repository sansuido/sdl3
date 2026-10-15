part of '../sdl_events.dart';

class SdlxMouseDeviceEvent extends SdlxEvent {
  const SdlxMouseDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  factory SdlxMouseDeviceEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseDeviceEvent(
        type: pointer.ref.mdevice.type,
        reserved: pointer.ref.mdevice.reserved,
        timestamp: pointer.ref.mdevice.timestamp,
        which: pointer.ref.mdevice.which,
      );

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

  final int which;

  @override
  Pointer<SdlEvent> toNative([Allocator allocator = ffi.calloc]) {
    final pointer = allocator<SdlEvent>();
    pointer.ref.mdevice.type = type;
    pointer.ref.mdevice.reserved = reserved;
    pointer.ref.mdevice.timestamp = timestamp;
    pointer.ref.mdevice.which = which;
    return pointer;
  }
}
