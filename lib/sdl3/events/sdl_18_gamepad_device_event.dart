part of '../sdl_events.dart';

class SdlxGamepadDeviceEvent extends SdlxEvent {
  SdlxGamepadDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  factory SdlxGamepadDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxGamepadDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxGamepadDeviceEvent.remapped({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_REMAPPED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxGamepadDeviceEvent.updateComplete({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_UPDATE_COMPLETE,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  factory SdlxGamepadDeviceEvent.handleUpdated({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxGamepadDeviceEvent(
    type: SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gdevice.type = type;
    pointer.ref.gdevice.reserved = reserved;
    pointer.ref.gdevice.timestamp = timestamp;
    pointer.ref.gdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gdevice.type;
    reserved = pointer.ref.gdevice.reserved;
    timestamp = pointer.ref.gdevice.timestamp;
    which = pointer.ref.gdevice.which;
  }

  static SdlxGamepadDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadDeviceEvent()..loadFromPointer(pointer);
}
