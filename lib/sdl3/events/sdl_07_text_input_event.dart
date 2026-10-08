part of '../sdl_events.dart';

class SdlxTextInputEvent extends SdlxEvent {
  const SdlxTextInputEvent({
    super.type = SDL_EVENT_TEXT_INPUT,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.text = '',
  });

  factory SdlxTextInputEvent.fromPointer(Pointer<SdlEvent> pointer) {
    final text = pointer.ref.text.text != nullptr
        ? pointer.ref.text.text.cast<ffi.Utf8>().toDartString()
        : '';
    return SdlxTextInputEvent(
      type: pointer.ref.text.type,
      reserved: pointer.ref.text.reserved,
      timestamp: pointer.ref.text.timestamp,
      windowId: pointer.ref.text.windowId,
      text: text,
    );
  }

  final int windowId;
  final String text;

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
}
