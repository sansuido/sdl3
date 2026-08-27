part of '../../../sdl.dart';

class SdlxTextInputEvent extends SdlxEvent {
  SdlxTextInputEvent({
    super.type = SDL_EVENT_TEXT_INPUT,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.text = '',
  });

  int windowId;
  String text;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.text.type = type;
    pointer.ref.text.reserved = reserved;
    pointer.ref.text.timestamp = timestamp;
    pointer.ref.text.windowId = windowId;
    if (text.isNotEmpty) {
      pointer.ref.text.text = text.toNativeUtf8();
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.text.type;
    reserved = pointer.ref.text.reserved;
    timestamp = pointer.ref.text.timestamp;
    windowId = pointer.ref.text.windowId;
    if (pointer.ref.text.text != nullptr) {
      text = pointer.ref.text.text.toDartString();
    }
  }

  static SdlxTextInputEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxTextInputEvent()..loadFromPointer(pointer);
}
