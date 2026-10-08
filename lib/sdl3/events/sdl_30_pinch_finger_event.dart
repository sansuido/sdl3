part of '../sdl_events.dart';

class SdlxPinchFingerEvent extends SdlxEvent {
  const SdlxPinchFingerEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.scale = 0,
    this.windowId = 0,
    this.spanX = 0,
    this.spanY = 0,
    this.focusX = 0,
    this.focusY = 0,
  });

  factory SdlxPinchFingerEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPinchFingerEvent(
        type: pointer.ref.pinch.type,
        reserved: pointer.ref.pinch.reserved,
        timestamp: pointer.ref.pinch.timestamp,
        scale: pointer.ref.pinch.scale,
        windowId: pointer.ref.pinch.windowId,
      );

  factory SdlxPinchFingerEvent.begin({
    int reserved = 0,
    int timestamp = 0,
    double scale = 0,
    int windowId = 0,
    double spanX = 0,
    double spanY = 0,
    double focusX = 0,
    double focusY = 0,
  }) => SdlxPinchFingerEvent(
    type: SDL_EVENT_PINCH_BEGIN,
    reserved: reserved,
    timestamp: timestamp,
    scale: scale,
    windowId: windowId,
    spanX: spanX,
    spanY: spanY,
    focusX: focusX,
    focusY: focusY,
  );

  factory SdlxPinchFingerEvent.update({
    int reserved = 0,
    int timestamp = 0,
    double scale = 0,
    int windowId = 0,
    double spanX = 0,
    double spanY = 0,
    double focusX = 0,
    double focusY = 0,
  }) => SdlxPinchFingerEvent(
    type: SDL_EVENT_PINCH_UPDATE,
    reserved: reserved,
    timestamp: timestamp,
    scale: scale,
    windowId: windowId,
    spanX: spanX,
    spanY: spanY,
    focusX: focusX,
    focusY: focusY,
  );

  factory SdlxPinchFingerEvent.end({
    int reserved = 0,
    int timestamp = 0,
    double scale = 0,
    int windowId = 0,
    double spanX = 0,
    double spanY = 0,
    double focusX = 0,
    double focusY = 0,
  }) => SdlxPinchFingerEvent(
    type: SDL_EVENT_PINCH_END,
    reserved: reserved,
    timestamp: timestamp,
    scale: scale,
    windowId: windowId,
    spanX: spanX,
    spanY: spanY,
    focusX: focusX,
    focusY: focusY,
  );

  final double scale;
  final int windowId;
  final double spanX;
  final double spanY;
  final double focusX;
  final double focusY;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.pinch.type = type;
    pointer.ref.pinch.reserved = reserved;
    pointer.ref.pinch.timestamp = timestamp;
    pointer.ref.pinch.scale = scale;
    pointer.ref.pinch.windowId = windowId;
    return pointer;
  }
}
