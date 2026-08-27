part of '../../../sdl.dart';

class SdlxJoyAxisEvent extends SdlxEvent {
  SdlxJoyAxisEvent({
    super.type = SDL_EVENT_JOYSTICK_AXIS_MOTION,
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
    pointer.ref.jaxis.type = type;
    pointer.ref.jaxis.reserved = reserved;
    pointer.ref.jaxis.timestamp = timestamp;
    pointer.ref.jaxis.which = which;
    pointer.ref.jaxis.axis = axis;
    pointer.ref.jaxis.value = value;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jaxis.type;
    reserved = pointer.ref.jaxis.reserved;
    timestamp = pointer.ref.jaxis.timestamp;
    which = pointer.ref.jaxis.which;
    axis = pointer.ref.jaxis.axis;
    value = pointer.ref.jaxis.value;
  }

  static SdlxJoyAxisEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyAxisEvent()..loadFromPointer(pointer);
}
