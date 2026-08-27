part of '../../../sdl.dart';

class SdlxTouchFingerEvent extends SdlxEvent {
  SdlxTouchFingerEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.touchId = 0,
    this.fingerId = 0,
    this.x = 0,
    this.y = 0,
    this.dx = 0,
    this.dy = 0,
    this.pressure = 0,
    this.windowId = 0,
  });

  factory SdlxTouchFingerEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int touchId = 0,
    int fingerId = 0,
    double x = 0,
    double y = 0,
    double dx = 0,
    double dy = 0,
    double pressure = 0,
    int windowId = 0,
  }) => SdlxTouchFingerEvent(
    type: SDL_EVENT_FINGER_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    touchId: touchId,
    fingerId: fingerId,
    x: x,
    y: y,
    dx: dx,
    dy: dy,
    pressure: pressure,
    windowId: windowId,
  );

  factory SdlxTouchFingerEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int touchId = 0,
    int fingerId = 0,
    double x = 0,
    double y = 0,
    double dx = 0,
    double dy = 0,
    double pressure = 0,
    int windowId = 0,
  }) => SdlxTouchFingerEvent(
    type: SDL_EVENT_FINGER_UP,
    reserved: reserved,
    timestamp: timestamp,
    touchId: touchId,
    fingerId: fingerId,
    x: x,
    y: y,
    dx: dx,
    dy: dy,
    pressure: pressure,
    windowId: windowId,
  );

  factory SdlxTouchFingerEvent.motion({
    int reserved = 0,
    int timestamp = 0,
    int touchId = 0,
    int fingerId = 0,
    double x = 0,
    double y = 0,
    double dx = 0,
    double dy = 0,
    double pressure = 0,
    int windowId = 0,
  }) => SdlxTouchFingerEvent(
    type: SDL_EVENT_FINGER_MOTION,
    reserved: reserved,
    timestamp: timestamp,
    touchId: touchId,
    fingerId: fingerId,
    x: x,
    y: y,
    dx: dx,
    dy: dy,
    pressure: pressure,
    windowId: windowId,
  );

  factory SdlxTouchFingerEvent.canceled({
    int reserved = 0,
    int timestamp = 0,
    int touchId = 0,
    int fingerId = 0,
    double x = 0,
    double y = 0,
    double dx = 0,
    double dy = 0,
    double pressure = 0,
    int windowId = 0,
  }) => SdlxTouchFingerEvent(
    type: SDL_EVENT_FINGER_CANCELED,
    reserved: reserved,
    timestamp: timestamp,
    touchId: touchId,
    fingerId: fingerId,
    x: x,
    y: y,
    dx: dx,
    dy: dy,
    pressure: pressure,
    windowId: windowId,
  );

  int touchId;
  int fingerId;
  double x;
  double y;
  double dx;
  double dy;
  double pressure;
  int windowId;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.tfinger.type = type;
    pointer.ref.tfinger.reserved = reserved;
    pointer.ref.tfinger.timestamp = timestamp;
    pointer.ref.tfinger.touchId = touchId;
    pointer.ref.tfinger.fingerId = fingerId;
    pointer.ref.tfinger.x = x;
    pointer.ref.tfinger.y = y;
    pointer.ref.tfinger.dx = dx;
    pointer.ref.tfinger.dy = dy;
    pointer.ref.tfinger.pressure = pressure;
    pointer.ref.tfinger.windowId = windowId;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.tfinger.type;
    reserved = pointer.ref.tfinger.reserved;
    timestamp = pointer.ref.tfinger.timestamp;
    touchId = pointer.ref.tfinger.touchId;
    fingerId = pointer.ref.tfinger.fingerId;
    x = pointer.ref.tfinger.x;
    y = pointer.ref.tfinger.y;
    dx = pointer.ref.tfinger.dx;
    dy = pointer.ref.tfinger.dy;
    pressure = pointer.ref.tfinger.pressure;
    windowId = pointer.ref.tfinger.windowId;
  }

  static SdlxTouchFingerEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxTouchFingerEvent()..loadFromPointer(pointer);
}
