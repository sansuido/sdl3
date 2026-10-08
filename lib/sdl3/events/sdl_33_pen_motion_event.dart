part of '../sdl_events.dart';

class SdlxPenMotionEvent extends SdlxEvent {
  const SdlxPenMotionEvent({
    super.type = SDL_EVENT_PEN_MOTION,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
    this.deviceType = 0,
  });

  factory SdlxPenMotionEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenMotionEvent(
        type: pointer.ref.pmotion.type,
        reserved: pointer.ref.pmotion.reserved,
        timestamp: pointer.ref.pmotion.timestamp,
        windowId: pointer.ref.pmotion.windowId,
        which: pointer.ref.pmotion.which,
        penState: pointer.ref.pmotion.penState,
        x: pointer.ref.pmotion.x,
        y: pointer.ref.pmotion.y,
        deviceType: pointer.ref.pmotion.deviceType,
      );

  final int windowId;
  final int which;
  final int penState;
  final double x;
  final double y;
  final int deviceType;

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
    pointer.ref.pmotion.deviceType = deviceType;
    return pointer;
  }
}
