part of '../sdl_events.dart';

class SdlxQuitEvent extends SdlxEvent {
  const SdlxQuitEvent({
    super.type = SDL_EVENT_QUIT,
    super.reserved = 0,
    super.timestamp = 0,
  });

  factory SdlxQuitEvent.fromPointer(Pointer<SdlEvent> pointer) => SdlxQuitEvent(
    type: pointer.ref.quit.type,
    reserved: pointer.ref.quit.reserved,
    timestamp: pointer.ref.quit.timestamp,
  );

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.quit.type = type;
    pointer.ref.quit.reserved = reserved;
    pointer.ref.quit.timestamp = timestamp;
    return pointer;
  }
}
