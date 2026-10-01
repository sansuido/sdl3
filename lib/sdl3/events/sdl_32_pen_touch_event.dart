part of '../sdl_events.dart';

class SdlxPenTouchEvent extends SdlxEvent {
  SdlxPenTouchEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
    this.eraser = false,
    this.down = false,
  });

  factory SdlxPenTouchEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    double x = 0,
    double y = 0,
    bool eraser = false,
    bool down = false,
  }) => SdlxPenTouchEvent(
    type: SDL_EVENT_PEN_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    x: x,
    y: y,
    eraser: eraser,
    down: down,
  );

  factory SdlxPenTouchEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    double x = 0,
    double y = 0,
    bool eraser = false,
    bool down = false,
  }) => SdlxPenTouchEvent(
    type: SDL_EVENT_PEN_UP,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    x: x,
    y: y,
    eraser: eraser,
    down: down,
  );

  int windowId;
  int which;
  int penState;
  double x;
  double y;
  bool eraser;
  bool down;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.ptouch.type = type;
    pointer.ref.ptouch.reserved = reserved;
    pointer.ref.ptouch.timestamp = timestamp;
    pointer.ref.ptouch.windowId = windowId;
    pointer.ref.ptouch.which = which;
    pointer.ref.ptouch.penState = penState;
    pointer.ref.ptouch.x = x;
    pointer.ref.ptouch.y = y;
    pointer.ref.ptouch.eraser = eraser;
    pointer.ref.ptouch.down = down;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.ptouch.type;
    reserved = pointer.ref.ptouch.reserved;
    timestamp = pointer.ref.ptouch.timestamp;
    windowId = pointer.ref.ptouch.windowId;
    which = pointer.ref.ptouch.which;
    penState = pointer.ref.ptouch.penState;
    x = pointer.ref.ptouch.x;
    y = pointer.ref.ptouch.y;
    eraser = pointer.ref.ptouch.eraser;
    down = pointer.ref.ptouch.down;
  }

  static SdlxPenTouchEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenTouchEvent()..loadFromPointer(pointer);
}
