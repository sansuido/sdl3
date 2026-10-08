part of '../sdl_events.dart';

class SdlxRenderEvent extends SdlxEvent {
  const SdlxRenderEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
  });

  factory SdlxRenderEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxRenderEvent(
        type: pointer.ref.render.type,
        reserved: pointer.ref.render.reserved,
        timestamp: pointer.ref.render.timestamp,
        windowId: pointer.ref.render.windowId,
      );

  factory SdlxRenderEvent.targetsReset({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
  }) => SdlxRenderEvent(
    type: SDL_EVENT_RENDER_TARGETS_RESET,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
  );

  factory SdlxRenderEvent.deviceReset({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
  }) => SdlxRenderEvent(
    type: SDL_EVENT_RENDER_DEVICE_RESET,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
  );

  factory SdlxRenderEvent.deviceLost({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
  }) => SdlxRenderEvent(
    type: SDL_EVENT_RENDER_DEVICE_LOST,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
  );

  final int windowId;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.render.type = type;
    pointer.ref.render.reserved = reserved;
    pointer.ref.render.timestamp = timestamp;
    pointer.ref.render.windowId = windowId;
    return pointer;
  }
}
