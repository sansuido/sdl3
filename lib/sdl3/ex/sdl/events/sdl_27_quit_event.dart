part of '../../../sdl.dart';

class SdlxQuitEvent extends SdlxEvent {
  SdlxQuitEvent({
    super.type = SDL_EVENT_QUIT,
    super.reserved = 0,
    super.timestamp = 0,
  });

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.quit.type = type;
    pointer.ref.quit.reserved = reserved;
    pointer.ref.quit.timestamp = timestamp;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.quit.type;
    reserved = pointer.ref.quit.reserved;
    timestamp = pointer.ref.quit.timestamp;
  }

  static SdlxQuitEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxQuitEvent()..loadFromPointer(pointer);
}
