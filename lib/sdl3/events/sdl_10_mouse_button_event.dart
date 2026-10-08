part of '../sdl_events.dart';

class SdlxMouseButtonEvent extends SdlxEvent {
  const SdlxMouseButtonEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.button = 0,
    this.down = false,
    this.clicks = 0,
    this.x = 0,
    this.y = 0,
  });

  factory SdlxMouseButtonEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseButtonEvent(
        type: pointer.ref.button.type,
        reserved: pointer.ref.button.reserved,
        timestamp: pointer.ref.button.timestamp,
        windowId: pointer.ref.button.windowId,
        which: pointer.ref.button.which,
        button: pointer.ref.button.button,
        down: pointer.ref.button.down,
        clicks: pointer.ref.button.clicks,
        x: pointer.ref.button.x,
        y: pointer.ref.button.y,
      );

  factory SdlxMouseButtonEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int button = 0,
    bool down = false,
    int clicks = 0,
    double x = 0,
    double y = 0,
  }) => SdlxMouseButtonEvent(
    type: SDL_EVENT_MOUSE_BUTTON_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    button: button,
    down: down,
    clicks: clicks,
    x: x,
    y: y,
  );

  factory SdlxMouseButtonEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int button = 0,
    bool down = false,
    int clicks = 0,
    double x = 0,
    double y = 0,
  }) => SdlxMouseButtonEvent(
    type: SDL_EVENT_MOUSE_BUTTON_UP,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    button: button,
    down: down,
    clicks: clicks,
    x: x,
    y: y,
  );

  final int windowId;
  final int which;
  final int button;
  final bool down;
  final int clicks;
  final double x;
  final double y;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.button.type = type;
    pointer.ref.button.reserved = reserved;
    pointer.ref.button.timestamp = timestamp;
    pointer.ref.button.windowId = windowId;
    pointer.ref.button.which = which;
    pointer.ref.button.button = button;
    pointer.ref.button.down = down;
    pointer.ref.button.clicks = clicks;
    pointer.ref.button.x = x;
    pointer.ref.button.y = y;
    return pointer;
  }
}
