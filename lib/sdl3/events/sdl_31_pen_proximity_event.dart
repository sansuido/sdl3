part of '../sdl_events.dart';

class SdlxPenProximityEvent extends SdlxEvent {
  const SdlxPenProximityEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.deviceType = 0,
  });

  factory SdlxPenProximityEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenProximityEvent(
        type: pointer.ref.pproximity.type,
        reserved: pointer.ref.pproximity.reserved,
        timestamp: pointer.ref.pproximity.timestamp,
        windowId: pointer.ref.pproximity.windowId,
        which: pointer.ref.pproximity.which,
        penState: pointer.ref.pproximity.penState,
        deviceType: pointer.ref.pproximity.deviceType,
      );

  factory SdlxPenProximityEvent.onIn({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    int deviceType = 0,
  }) => SdlxPenProximityEvent(
    type: SDL_EVENT_PEN_PROXIMITY_IN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    deviceType: deviceType,
  );

  factory SdlxPenProximityEvent.onOut({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    int deviceType = 0,
  }) => SdlxPenProximityEvent(
    type: SDL_EVENT_PEN_PROXIMITY_OUT,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    deviceType: deviceType,
  );

  final int windowId;
  final int which;
  final int penState;
  final int deviceType;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.pproximity.type = type;
    pointer.ref.pproximity.reserved = reserved;
    pointer.ref.pproximity.timestamp = timestamp;
    pointer.ref.pproximity.windowId = windowId;
    pointer.ref.pproximity.which = which;
    pointer.ref.pproximity.penState = penState;
    pointer.ref.pproximity.deviceType = deviceType;
    return pointer;
  }
}
