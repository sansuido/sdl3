part of '../sdl_events.dart';

class SdlxKeyboardDeviceEvent extends SdlxEvent {
  SdlxKeyboardDeviceEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
  });

  factory SdlxKeyboardDeviceEvent.added({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxKeyboardDeviceEvent(
    type: SDL_EVENT_KEYBOARD_ADDED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );
  factory SdlxKeyboardDeviceEvent.removed({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
  }) => SdlxKeyboardDeviceEvent(
    type: SDL_EVENT_KEYBOARD_REMOVED,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
  );

  int which;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.kdevice.type = type;
    pointer.ref.kdevice.reserved = reserved;
    pointer.ref.kdevice.timestamp = timestamp;
    pointer.ref.kdevice.which = which;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.kdevice.type;
    reserved = pointer.ref.kdevice.reserved;
    timestamp = pointer.ref.kdevice.timestamp;
    which = pointer.ref.kdevice.which;
  }

  static SdlxKeyboardDeviceEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxKeyboardDeviceEvent()..loadFromPointer(pointer);
}
