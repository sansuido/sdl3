part of '../sdl_events.dart';

class SdlxGamepadButtonEvent extends SdlxEvent {
  const SdlxGamepadButtonEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.button = 0,
    this.down = false,
  });

  factory SdlxGamepadButtonEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadButtonEvent(
        type: pointer.ref.gbutton.type,
        reserved: pointer.ref.gbutton.reserved,
        timestamp: pointer.ref.gbutton.timestamp,
        which: pointer.ref.gbutton.which,
        button: pointer.ref.gbutton.button,
        down: pointer.ref.gbutton.down,
      );

  factory SdlxGamepadButtonEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int button = 0,
    bool down = false,
  }) => SdlxGamepadButtonEvent(
    type: SDL_EVENT_GAMEPAD_BUTTON_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    button: button,
    down: down,
  );

  factory SdlxGamepadButtonEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int button = 0,
    bool down = false,
  }) => SdlxGamepadButtonEvent(
    type: SDL_EVENT_GAMEPAD_BUTTON_UP,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    button: button,
    down: down,
  );

  final int which;
  final int button;
  final bool down;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gbutton.type = type;
    pointer.ref.gbutton.reserved = reserved;
    pointer.ref.gbutton.timestamp = timestamp;
    pointer.ref.gbutton.which = which;
    pointer.ref.gbutton.button = button;
    pointer.ref.gbutton.down = down;
    return pointer;
  }
}
