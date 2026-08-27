part of '../../../sdl.dart';

class SdlxDropEvent extends SdlxEvent {
  SdlxDropEvent({
    super.type = 0,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.x = 0,
    this.y = 0,
    this.source = '',
    this.data = '',
  });

  factory SdlxDropEvent.begin({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_BEGIN,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  factory SdlxDropEvent.file({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_FILE,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  factory SdlxDropEvent.text({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_TEXT,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  factory SdlxDropEvent.complete({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_COMPLETE,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  factory SdlxDropEvent.position({
    int reserved = 0,
    int timestamp = 0,
    int windowId = 0,
    double x = 0,
    double y = 0,
    String source = '',
    String data = '',
  }) => SdlxDropEvent(
    type: SDL_EVENT_DROP_POSITION,
    reserved: reserved,
    timestamp: timestamp,
    windowId: windowId,
    x: x,
    y: y,
    source: source,
    data: data,
  );

  int windowId;
  double x;
  double y;
  String source;
  String data;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.drop.type = type;
    pointer.ref.drop.reserved = reserved;
    pointer.ref.drop.timestamp = timestamp;
    pointer.ref.drop.windowId = windowId;
    pointer.ref.drop.x = x;
    pointer.ref.drop.y = y;
    if (source.isNotEmpty) {
      pointer.ref.drop.source = source.toNativeUtf8();
    }
    if (data.isNotEmpty) {
      pointer.ref.drop.data = data.toNativeUtf8();
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.drop.type;
    reserved = pointer.ref.drop.reserved;
    timestamp = pointer.ref.drop.timestamp;
    windowId = pointer.ref.drop.windowId;
    x = pointer.ref.drop.x;
    y = pointer.ref.drop.y;
    if (pointer.ref.drop.source != nullptr) {
      source = pointer.ref.drop.source.toDartString();
    }
    if (pointer.ref.drop.data != nullptr) {
      data = pointer.ref.drop.data.toDartString();
    }
  }

  static SdlxDropEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxDropEvent()..loadFromPointer(pointer);
}
