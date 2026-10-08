part of '../sdl_events.dart';

class SdlxPenButtonEvent extends SdlxEvent {
  const SdlxPenButtonEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.penState = 0,
    this.x = 0,
    this.y = 0,
    this.button = 0,
    this.down = false,
    this.devideType = 0,
  });

  factory SdlxPenButtonEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxPenButtonEvent(
        type: pointer.ref.pbutton.type,
        reserved: pointer.ref.pbutton.reserved,
        timestamp: pointer.ref.pbutton.timestamp,
        windowId: pointer.ref.pbutton.windowId,
        which: pointer.ref.pbutton.which,
        penState: pointer.ref.pbutton.penState,
        x: pointer.ref.pbutton.x,
        y: pointer.ref.pbutton.y,
        button: pointer.ref.pbutton.button,
        down: pointer.ref.pbutton.down,
        devideType: pointer.ref.pbutton.deviceType,
      );

  factory SdlxPenButtonEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    double x = 0,
    double y = 0,
    int button = 0,
    bool down = false,
    int devideType = 0,
  }) => SdlxPenButtonEvent(
    type: SDL_EVENT_PEN_BUTTON_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    x: x,
    y: y,
    button: button,
    down: down,
    devideType: devideType,
  );

  factory SdlxPenButtonEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int penState = 0,
    double x = 0,
    double y = 0,
    int button = 0,
    bool down = false,
    int devideType = 0,
  }) => SdlxPenButtonEvent(
    type: SDL_EVENT_PEN_BUTTON_UP,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    penState: penState,
    x: x,
    y: y,
    button: button,
    down: down,
    devideType: devideType,
  );

  final int windowId;
  final int which;
  final int penState;
  final double x;
  final double y;
  final int button;
  final bool down;
  final int devideType;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.pbutton.type = type;
    pointer.ref.pbutton.reserved = reserved;
    pointer.ref.pbutton.timestamp = timestamp;
    pointer.ref.pbutton.windowId = windowId;
    pointer.ref.pbutton.which = which;
    pointer.ref.pbutton.penState = penState;
    pointer.ref.pbutton.x = x;
    pointer.ref.pbutton.y = y;
    pointer.ref.pbutton.button = button;
    pointer.ref.pbutton.down = down;
    pointer.ref.pbutton.deviceType = devideType;
    return pointer;
  }
}
