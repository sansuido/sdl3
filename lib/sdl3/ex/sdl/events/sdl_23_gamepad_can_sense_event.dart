part of '../../../sdl.dart';

class SdlxGamepadCapSenseEvent extends SdlxEvent {
  SdlxGamepadCapSenseEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.capsense = 0,
    this.down = false,
  });

  factory SdlxGamepadCapSenseEvent.touch({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int capsense = 0,
    bool down = false,
  }) => SdlxGamepadCapSenseEvent(
    type: SDL_EVENT_GAMEPAD_CAPSENSE_TOUCH,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    capsense: capsense,
    down: down,
  );

  factory SdlxGamepadCapSenseEvent.release({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int capsense = 0,
    bool down = false,
  }) => SdlxGamepadCapSenseEvent(
    type: SDL_EVENT_GAMEPAD_CAPSENSE_RELEASE,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    capsense: capsense,
    down: down,
  );

  int which;
  int capsense;
  bool down;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gcapsense.type = type;
    pointer.ref.gcapsense.reserved = reserved;
    pointer.ref.gcapsense.timestamp = timestamp;
    pointer.ref.gcapsense.which = which;
    pointer.ref.gcapsense.capsense = capsense;
    pointer.ref.gcapsense.down = down;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gcapsense.type;
    reserved = pointer.ref.gcapsense.reserved;
    timestamp = pointer.ref.gcapsense.timestamp;
    which = pointer.ref.gcapsense.which;
    capsense = pointer.ref.gcapsense.capsense;
    down = pointer.ref.gcapsense.down;
  }

  static SdlxGamepadCapSenseEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadCapSenseEvent()..loadFromPointer(pointer);
}
