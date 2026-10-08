part of '../sdl_events.dart';

class SdlxJoyButtonEvent extends SdlxEvent {
  const SdlxJoyButtonEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.button = 0,
    this.down = false,
  });

  factory SdlxJoyButtonEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyButtonEvent(
        type: pointer.ref.jbutton.type,
        reserved: pointer.ref.jbutton.reserved,
        timestamp: pointer.ref.jbutton.timestamp,
        which: pointer.ref.jbutton.which,
        button: pointer.ref.jbutton.button,
        down: pointer.ref.jbutton.down,
      );

  factory SdlxJoyButtonEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int button = 0,
    bool down = false,
  }) => SdlxJoyButtonEvent(
    type: SDL_EVENT_JOYSTICK_BUTTON_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    button: button,
    down: down,
  );

  factory SdlxJoyButtonEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int button = 0,
    bool down = false,
  }) => SdlxJoyButtonEvent(
    type: SDL_EVENT_JOYSTICK_BUTTON_UP,
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
    pointer.ref.jbutton.type = type;
    pointer.ref.jbutton.reserved = reserved;
    pointer.ref.jbutton.timestamp = timestamp;
    pointer.ref.jbutton.which = which;
    pointer.ref.jbutton.button = button;
    pointer.ref.jbutton.down = down;
    return pointer;
  }
}
