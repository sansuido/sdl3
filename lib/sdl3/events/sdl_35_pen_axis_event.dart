part of '../sdl_events.dart';

class SdlxPenAxisEvent extends SdlxEvent {
  const SdlxPenAxisEvent({
    super.type = SDL_EVENT_PEN_AXIS,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
    this.axis = 0,
    this.value = 0,
    this.deviceType = 0,
  });

  factory SdlxPenAxisEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenAxisEvent(
        type: pointer.ref.paxis.type,
        reserved: pointer.ref.paxis.reserved,
        timestamp: pointer.ref.paxis.timestamp,
        windowId: pointer.ref.paxis.windowId,
        which: pointer.ref.paxis.which,
        penState: pointer.ref.paxis.penState,
        x: pointer.ref.paxis.x,
        y: pointer.ref.paxis.y,
        axis: pointer.ref.paxis.axis,
        value: pointer.ref.paxis.value,
        deviceType: pointer.ref.paxis.deviceType,
      );

  final int windowId;
  final int which;
  final int penState;
  final double x;
  final double y;
  final int axis;
  final double value;
  final int deviceType;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.paxis.type = type;
    pointer.ref.paxis.reserved = reserved;
    pointer.ref.paxis.timestamp = timestamp;
    pointer.ref.paxis.windowId = windowId;
    pointer.ref.paxis.which = which;
    pointer.ref.paxis.penState = penState;
    pointer.ref.paxis.x = x;
    pointer.ref.paxis.y = y;
    pointer.ref.paxis.axis = axis;
    pointer.ref.paxis.value = value;
    pointer.ref.paxis.deviceType = deviceType;
    return pointer;
  }
}
