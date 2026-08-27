part of '../../../sdl.dart';

class SdlxJoyBallEvent extends SdlxEvent {
  SdlxJoyBallEvent({
    super.type = SDL_EVENT_JOYSTICK_BALL_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.which = 0,
    this.ball = 0,
    this.xrel = 0,
    this.yrel = 0,
  });

  int which;
  int ball;
  int xrel;
  int yrel;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.jball.type = type;
    pointer.ref.jball.reserved = reserved;
    pointer.ref.jball.timestamp = timestamp;
    pointer.ref.jball.which = which;
    pointer.ref.jball.ball = ball;
    pointer.ref.jball.xrel = xrel;
    pointer.ref.jball.yrel = yrel;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.jball.type;
    reserved = pointer.ref.jball.reserved;
    timestamp = pointer.ref.jball.timestamp;
    which = pointer.ref.jball.which;
    ball = pointer.ref.jball.ball;
    xrel = pointer.ref.jball.xrel;
    yrel = pointer.ref.jball.yrel;
  }

  static SdlxJoyBallEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxJoyBallEvent()..loadFromPointer(pointer);
}
