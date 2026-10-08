part of '../sdl_events.dart';

class SdlxTextEditingEvent extends SdlxEvent {
  const SdlxTextEditingEvent({
    super.type = SDL_EVENT_TEXT_EDITING,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.text = '',
    this.start = 0,
    this.length = 0,
  });

  factory SdlxTextEditingEvent.fromPointer(Pointer<SdlEvent> pointer) {
    final text = pointer.ref.edit.text != nullptr
        ? pointer.ref.edit.text.cast<ffi.Utf8>().toDartString()
        : '';
    return SdlxTextEditingEvent(
      type: pointer.ref.edit.type,
      reserved: pointer.ref.edit.reserved,
      timestamp: pointer.ref.edit.timestamp,
      windowId: pointer.ref.edit.windowId,
      text: text,
      start: pointer.ref.edit.start,
      length: pointer.ref.edit.length,
    );
  }

  final int windowId;
  final String text;
  final int start;
  final int length;

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
}
