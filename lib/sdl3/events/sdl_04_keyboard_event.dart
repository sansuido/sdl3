part of '../sdl_events.dart';

class SdlxKeyboardEvent extends SdlxEvent {
  const SdlxKeyboardEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.which = 0,
    this.scancode = 0,
    this.key = 0,
    this.mod = 0,
    this.raw = 0,
    this.down = false,
    this.repeat = false,
  });

  factory SdlxKeyboardEvent.fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxKeyboardEvent(
        type: pointer.ref.key.type,
        reserved: pointer.ref.key.reserved,
        timestamp: pointer.ref.key.timestamp,
        windowId: pointer.ref.key.windowId,
        which: pointer.ref.key.which,
        scancode: pointer.ref.key.scancode,
        key: pointer.ref.key.key,
        mod: pointer.ref.key.mod,
        raw: pointer.ref.key.raw,
        down: pointer.ref.key.down,
        repeat: pointer.ref.key.repeat,
      );

  factory SdlxKeyboardEvent.down({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int scancode = 0,
    int key = 0,
    int mod = 0,
    int raw = 0,
    bool down = false,
    bool repeat = false,
  }) => SdlxKeyboardEvent(
    type: SDL_EVENT_KEY_DOWN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    scancode: scancode,
    key: key,
    mod: mod,
    raw: raw,
    down: down,
    repeat: repeat,
  );

  factory SdlxKeyboardEvent.up({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    int which = 0,
    int scancode = 0,
    int key = 0,
    int mod = 0,
    int raw = 0,
    bool down = false,
    bool repeat = false,
  }) => SdlxKeyboardEvent(
    type: SDL_EVENT_KEY_UP,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    which: which,
    scancode: scancode,
    key: key,
    mod: mod,
    raw: raw,
    down: down,
    repeat: repeat,
  );

  final int windowId;
  final int which;
  final int scancode;
  final int key;
  final int mod;
  final int raw;
  final bool down;
  final bool repeat;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.key.type = type;
    pointer.ref.key.reserved = reserved;
    pointer.ref.key.timestamp = timestamp;
    pointer.ref.key.windowId = windowId;
    pointer.ref.key.which = which;
    pointer.ref.key.scancode = scancode;
    pointer.ref.key.key = key;
    pointer.ref.key.mod = mod;
    pointer.ref.key.raw = raw;
    pointer.ref.key.down = down;
    pointer.ref.key.repeat = repeat;
    return pointer;
  }
}
