part of '../sdl_events.dart';

class SdlxPenMotionEvent extends SdlxEvent {
  SdlxPenMotionEvent({
    super.type = SDL_EVENT_PEN_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
  });
  int windowId;
  int which;
  int penState;
  double x;
  double y;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.pmotion.type = type;
    pointer.ref.pmotion.reserved = reserved;
    pointer.ref.pmotion.timestamp = timestamp;
    pointer.ref.pmotion.windowId = windowId;
    pointer.ref.pmotion.which = which;
    pointer.ref.pmotion.penState = penState;
    pointer.ref.pmotion.x = x;
    pointer.ref.pmotion.y = y;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.pmotion.type;
    reserved = pointer.ref.pmotion.reserved;
    timestamp = pointer.ref.pmotion.timestamp;
    windowId = pointer.ref.pmotion.windowId;
    which = pointer.ref.pmotion.which;
    penState = pointer.ref.pmotion.penState;
    x = pointer.ref.pmotion.x;
    y = pointer.ref.pmotion.y;
  }

  static SdlxPenMotionEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenMotionEvent()..loadFromPointer(pointer);
}
