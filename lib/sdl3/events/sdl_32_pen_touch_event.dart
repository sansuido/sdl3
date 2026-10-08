part of '../sdl_events.dart';

class SdlxPenTouchEvent extends SdlxEvent {
  const SdlxPenTouchEvent({
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
    this.devideType = 0,
  });

  factory SdlxPenTouchEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenTouchEvent(
        type: pointer.ref.ptouch.type,
        reserved: pointer.ref.ptouch.reserved,
        timestamp: pointer.ref.ptouch.timestamp,
        windowId: pointer.ref.ptouch.windowId,
        which: pointer.ref.ptouch.which,
        penState: pointer.ref.ptouch.penState,
        x: pointer.ref.ptouch.x,
        y: pointer.ref.ptouch.y,
        eraser: pointer.ref.ptouch.eraser,
        down: pointer.ref.ptouch.down,
        devideType: pointer.ref.ptouch.deviceType,
      );

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
    int devideType = 0,
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
    devideType: devideType,
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
    int devideType = 0,
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
    devideType: devideType,
  );

  final int windowId;
  final int which;
  final int penState;
  final double x;
  final double y;
  final bool eraser;
  final bool down;
  final int devideType;

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
    pointer.ref.ptouch.deviceType = devideType;
    return pointer;
  }
}
