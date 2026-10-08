part of '../sdl_events.dart';

class SdlxClipboardEvent extends SdlxEvent {
  const SdlxClipboardEvent({
    super.type = SDL_EVENT_CLIPBOARD_UPDATE,
    super.reserved = 0,
    super.timestamp = 0,
    this.owner = false,
    this.mimeTypes = const [],
  });

  factory SdlxClipboardEvent.fromPointer(Pointer<SdlEvent> pointer) {
    final ref = pointer.ref.clipboard;

    final mimeTypeList = <String>[];
    if (ref.mimeTypes != nullptr && ref.numMimeTypes > 0) {
      for (var i = 0; i < ref.numMimeTypes; i++) {
        final ptr = ref.mimeTypes[i];
        if (ptr != nullptr) {
          mimeTypeList.add(ptr.cast<ffi.Utf8>().toDartString());
        }
      }
    }

    return SdlxClipboardEvent(
      type: ref.type,
      reserved: ref.reserved,
      timestamp: ref.timestamp,
      owner: ref.owner,
      mimeTypes: List.unmodifiable(mimeTypeList),
    );
  }

  final bool owner;
  final List<String> mimeTypes;

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
}
