part of '../sdl_events.dart';

class SdlxJoyBatteryEvent extends SdlxEvent {
  SdlxJoyBatteryEvent({
    super.type = SDL_EVENT_JOYSTICK_BATTERY_UPDATED,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.state = 0,
    this.percent = 0,
  });

  int which;
  int state;
  int percent;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jbattery.type = type;
    pointer.ref.jbattery.reserved = reserved;
    pointer.ref.jbattery.timestamp = timestamp;
    pointer.ref.jbattery.which = which;
    pointer.ref.jbattery.state = state;
    pointer.ref.jbattery.percent = percent;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jbattery.type;
    reserved = pointer.ref.jbattery.reserved;
    timestamp = pointer.ref.jbattery.timestamp;
    which = pointer.ref.jbattery.which;
    state = pointer.ref.jbattery.state;
    percent = pointer.ref.jbattery.percent;
  }

  static SdlxJoyBatteryEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyBatteryEvent()..loadFromPointer(pointer);
}
