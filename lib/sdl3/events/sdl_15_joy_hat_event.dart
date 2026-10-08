part of '../sdl_events.dart';

class SdlxJoyHatEvent extends SdlxEvent {
  const SdlxJoyHatEvent({
    super.type = SDL_EVENT_JOYSTICK_HAT_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.hat = 0,
    this.value = 0,
  });

  factory SdlxJoyHatEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyHatEvent(
        type: pointer.ref.jhat.type,
        reserved: pointer.ref.jhat.reserved,
        timestamp: pointer.ref.jhat.timestamp,
        which: pointer.ref.jhat.which,
        hat: pointer.ref.jhat.hat,
        value: pointer.ref.jhat.value,
      );

  final int which;
  final int hat;
  final int value;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jhat.type = type;
    pointer.ref.jhat.reserved = reserved;
    pointer.ref.jhat.timestamp = timestamp;
    pointer.ref.jhat.which = which;
    pointer.ref.jhat.hat = hat;
    pointer.ref.jhat.value = value;
    return pointer;
  }
}
