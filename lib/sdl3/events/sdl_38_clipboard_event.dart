part of '../sdl_events.dart';

class SdlxClipboardEvent extends SdlxEvent {
  SdlxClipboardEvent({
    super.type = SDL_EVENT_CLIPBOARD_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.owner = false,
    List<String>? mimeTypes,
  }) {
    this.mimeTypes = mimeTypes ?? [];
  }
  bool owner;
  late List<String> mimeTypes;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.clipboard.type = type;
    pointer.ref.clipboard.reserved = reserved;
    pointer.ref.clipboard.timestamp = timestamp;
    pointer.ref.clipboard.owner = owner;
    if (mimeTypes.isNotEmpty) {
      final mimeTypesPointer = ffi.calloc<Pointer<Int8>>(mimeTypes.length);
      for (var i = 0; i < mimeTypes.length; i++) {
        mimeTypesPointer[i] = mimeTypes[i].toNativeUtf8().cast<Int8>();
      }
      pointer.ref.clipboard.mimeTypes = mimeTypesPointer;
      pointer.ref.clipboard.numMimeTypes = mimeTypes.length;
    }
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.clipboard.type;
    reserved = pointer.ref.clipboard.reserved;
    timestamp = pointer.ref.clipboard.timestamp;
    owner = pointer.ref.clipboard.owner;
    for (var i = 0; i < pointer.ref.clipboard.numMimeTypes; i++) {
      if (pointer.ref.clipboard.mimeTypes[i] != nullptr) {
        mimeTypes.add(
          pointer.ref.clipboard.mimeTypes[i].cast<ffi.Utf8>().toDartString(),
        );
      }
    }
  }

  static SdlxClipboardEvent fromPointer(Pointer<SdlEvent> pointer) =>
      SdlxClipboardEvent()..loadFromPointer(pointer);
}
