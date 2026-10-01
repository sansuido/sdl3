part of '../sdl_events.dart';

class SdlxGamepadAxisEvent extends SdlxEvent {
  SdlxGamepadAxisEvent({
    super.type = SDL_EVENT_GAMEPAD_AXIS_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.axis = 0,
    this.value = 0,
  });

  int which;
  int axis;
  int value;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.gaxis.type = type;
    pointer.ref.gaxis.reserved = reserved;
    pointer.ref.gaxis.timestamp = timestamp;
    pointer.ref.gaxis.which = which;
    pointer.ref.gaxis.axis = axis;
    pointer.ref.gaxis.value = value;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.gaxis.type;
    reserved = pointer.ref.gaxis.reserved;
    timestamp = pointer.ref.gaxis.timestamp;
    which = pointer.ref.gaxis.which;
    axis = pointer.ref.gaxis.axis;
    value = pointer.ref.gaxis.value;
  }

  static SdlxGamepadAxisEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxGamepadAxisEvent()..loadFromPointer(pointer);
}
