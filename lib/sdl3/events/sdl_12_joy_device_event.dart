part of '../sdl_events.dart';

class SdlxJoyDeviceEvent extends SdlxEvent {
  SdlxJoyDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  factory SdlxJoyDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxJoyDeviceEvent(
    type: SDL_EVENT_JOYSTICK_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxJoyDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxJoyDeviceEvent(
    type: SDL_EVENT_JOYSTICK_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxJoyDeviceEvent.updateComplete({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxJoyDeviceEvent(
    type: SDL_EVENT_JOYSTICK_UPDATE_COMPLETE,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jdevice.type = type;
    pointer.ref.jdevice.reserved = reserved;
    pointer.ref.jdevice.timestamp = timestamp;
    pointer.ref.jdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jdevice.type;
    reserved = pointer.ref.jdevice.reserved;
    timestamp = pointer.ref.jdevice.timestamp;
    which = pointer.ref.jdevice.which;
  }

  static SdlxJoyDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyDeviceEvent()..loadFromPointer(pointer);
}
