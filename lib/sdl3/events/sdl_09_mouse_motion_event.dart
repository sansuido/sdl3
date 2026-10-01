part of '../sdl_events.dart';

class SdlxMouseMotionEvent extends SdlxEvent {
  SdlxMouseMotionEvent({
    super.type = SDL_EVENT_MOUSE_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.state = 0,
    this.x = 0,
    this.y = 0,
    this.xrel = 0,
    this.yrel = 0,
  });

  int windowId;
  int which;
  int state;
  double x;
  double y;
  double xrel;
  double yrel;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.motion.type = type;
    pointer.ref.motion.reserved = reserved;
    pointer.ref.motion.timestamp = timestamp;
    pointer.ref.motion.windowId = windowId;
    pointer.ref.motion.which = which;
    pointer.ref.motion.state = state;
    pointer.ref.motion.x = x;
    pointer.ref.motion.y = y;
    pointer.ref.motion.xrel = xrel;
    pointer.ref.motion.yrel = yrel;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.motion.type;
    reserved = pointer.ref.motion.reserved;
    timestamp = pointer.ref.motion.timestamp;
    windowId = pointer.ref.motion.windowId;
    which = pointer.ref.motion.which;
    state = pointer.ref.motion.state;
    x = pointer.ref.motion.x;
    y = pointer.ref.motion.y;
    xrel = pointer.ref.motion.xrel;
    yrel = pointer.ref.motion.yrel;
  }

  static SdlxMouseMotionEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseMotionEvent()..loadFromPointer(pointer);
}
