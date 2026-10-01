part of '../sdl_events.dart';

class SdlxMouseButtonEvent extends SdlxEvent {
  SdlxMouseButtonEvent({
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

  int windowId;
  int which;
  int button;
  bool down;
  int clicks;
  double x;
  double y;

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

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.button.type;
    reserved = pointer.ref.button.reserved;
    timestamp = pointer.ref.button.timestamp;
    windowId = pointer.ref.button.windowId;
    which = pointer.ref.button.which;
    button = pointer.ref.button.button;
    down = pointer.ref.button.down;
    clicks = pointer.ref.button.clicks;
    x = pointer.ref.button.x;
    y = pointer.ref.button.y;
  }

  static SdlxMouseButtonEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseButtonEvent()..loadFromPointer(pointer);
}
