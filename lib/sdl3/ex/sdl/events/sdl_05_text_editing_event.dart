part of '../../../sdl.dart';

class SdlxTextEditingEvent extends SdlxEvent {
  SdlxTextEditingEvent({
    super.type = SDL_EVENT_TEXT_EDITING,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.text = '',
    this.start = 0,
    this.length = 0,
  });

  int windowId;
  String text;
  int start;
  int length;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.edit.type = type;
    pointer.ref.edit.reserved = reserved;
    pointer.ref.edit.timestamp = timestamp;
    pointer.ref.edit.windowId = windowId;
    if (text.isNotEmpty) {
      pointer.ref.edit.text = text.toNativeUtf8();
    }
    pointer.ref.edit.start = start;
    pointer.ref.edit.length = length;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.edit.type;
    reserved = pointer.ref.edit.reserved;
    timestamp = pointer.ref.edit.timestamp;
    windowId = pointer.ref.edit.windowId;
    if (pointer.ref.edit.text != nullptr) {
      text = pointer.ref.edit.text.toDartString();
    }
    start = pointer.ref.edit.start;
    length = pointer.ref.edit.length;
  }

  static SdlxTextEditingEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxTextEditingEvent()..loadFromPointer(pointer);
}
