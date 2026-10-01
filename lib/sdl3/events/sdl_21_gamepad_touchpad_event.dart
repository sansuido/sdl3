part of '../sdl_events.dart';

class SdlxGamepadTouchpadEvent extends SdlxEvent {
  SdlxGamepadTouchpadEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.touchpad = 0,
    this.finger = 0,
    this.x = 0,
    this.y = 0,
    this.pressure = 0,
  });

  factory SdlxGamepadTouchpadEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int touchpad = 0,
    int finger = 0,
    double x = 0,
    double y = 0,
    double pressure = 0,
  }) => SdlxGamepadTouchpadEvent(
    type: SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    touchpad: touchpad,
    finger: finger,
    x: x,
    y: y,
    pressure: pressure,
  );

  factory SdlxGamepadTouchpadEvent.motion({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int touchpad = 0,
    int finger = 0,
    double x = 0,
    double y = 0,
    double pressure = 0,
  }) => SdlxGamepadTouchpadEvent(
    type: SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    touchpad: touchpad,
    finger: finger,
    x: x,
    y: y,
    pressure: pressure,
  );

  factory SdlxGamepadTouchpadEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int which = 0,
    int touchpad = 0,
    int finger = 0,
    double x = 0,
    double y = 0,
    double pressure = 0,
  }) => SdlxGamepadTouchpadEvent(
    type: SDL_EVENT_GAMEPAD_TOUCHPAD_UP,
    reserved: reserved,
    timestamp: timestamp,
    which: which,
    touchpad: touchpad,
    finger: finger,
    x: x,
    y: y,
    pressure: pressure,
  );

  int which;
  int touchpad;
  int finger;
  double x;
  double y;
  double pressure;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gtouchpad.type = type;
    pointer.ref.gtouchpad.reserved = reserved;
    pointer.ref.gtouchpad.timestamp = timestamp;
    pointer.ref.gtouchpad.which = which;
    pointer.ref.gtouchpad.touchpad = touchpad;
    pointer.ref.gtouchpad.finger = finger;
    pointer.ref.gtouchpad.x = x;
    pointer.ref.gtouchpad.y = y;
    pointer.ref.gtouchpad.pressure = pressure;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gtouchpad.type;
    reserved = pointer.ref.gtouchpad.reserved;
    timestamp = pointer.ref.gtouchpad.timestamp;
    which = pointer.ref.gtouchpad.which;
    touchpad = pointer.ref.gtouchpad.touchpad;
    finger = pointer.ref.gtouchpad.finger;
    x = pointer.ref.gtouchpad.x;
    y = pointer.ref.gtouchpad.y;
    pressure = pointer.ref.gtouchpad.pressure;
  }

  static SdlxGamepadTouchpadEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadTouchpadEvent()..loadFromPointer(pointer);
}
