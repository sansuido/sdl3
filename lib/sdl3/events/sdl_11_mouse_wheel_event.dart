part of '../sdl_events.dart';

class SdlxMouseWheelEvent extends SdlxEvent {
  SdlxMouseWheelEvent({
    super.type = SDL_EVENT_MOUSE_WHEEL,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.x = 0,
    this.y = 0,
    this.direction = 0,
    this.mouseX = 0,
    this.mouseY = 0,
    this.integerX = 0,
    this.integerY = 0,
  });

  int windowId;
  int which;
  double x;
  double y;
  int direction;
  double mouseX;
  double mouseY;
  int integerX;
  int integerY;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.wheel.type = type;
    pointer.ref.wheel.reserved = reserved;
    pointer.ref.wheel.timestamp = timestamp;
    pointer.ref.wheel.windowId = windowId;
    pointer.ref.wheel.which = which;
    pointer.ref.wheel.x = x;
    pointer.ref.wheel.y = y;
    pointer.ref.wheel.direction = direction;
    pointer.ref.wheel.mouseX = mouseX;
    pointer.ref.wheel.mouseY = mouseY;
    pointer.ref.wheel.integerX = integerX;
    pointer.ref.wheel.integerY = integerY;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.wheel.type;
    reserved = pointer.ref.wheel.reserved;
    timestamp = pointer.ref.wheel.timestamp;
    windowId = pointer.ref.wheel.windowId;
    which = pointer.ref.wheel.which;
    x = pointer.ref.wheel.x;
    y = pointer.ref.wheel.y;
    direction = pointer.ref.wheel.direction;
    mouseX = pointer.ref.wheel.mouseX;
    mouseY = pointer.ref.wheel.mouseY;
    integerX = pointer.ref.wheel.integerX;
    integerY = pointer.ref.wheel.integerY;
  }

  static SdlxMouseWheelEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxMouseWheelEvent()..loadFromPointer(pointer);
}
