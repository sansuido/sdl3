part of '../sdl_events.dart';

class SdlxTextEditingCandidatesEvent extends SdlxEvent {
  SdlxTextEditingCandidatesEvent({
    super.type = SDL_EVENT_TEXT_EDITING_CANDIDATES,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    List<String>? candidates,
    this.selectedCandidate = 0,
    this.horizontal = false,
  }) {
    this.candidates = candidates ?? [];
  }
  int windowId;
  late List<String> candidates;
  int selectedCandidate;
  bool horizontal;

  @override
  bool isTargetWindow(int targetId, {bool ifNoWindow = true}) =>
      windowId == targetId;

  @override
  Pointer<SdlEvent> calloc() {
    final pointer = ffi.calloc<SdlEvent>();
    pointer.ref.editCandidates.type = type;
    pointer.ref.editCandidates.reserved = reserved;
    pointer.ref.editCandidates.timestamp = timestamp;
    pointer.ref.editCandidates.windowId = windowId;
    if (candidates.isNotEmpty) {
      final candidatesPointer = ffi.calloc<Pointer<Int8>>(candidates.length);
      for (var i = 0; i < candidates.length; i++) {
        candidatesPointer[i] = candidates[i].toNativeUtf8().cast<Int8>();
      }
      pointer.ref.editCandidates.candidates = candidatesPointer;
      pointer.ref.editCandidates.numCandidates = candidates.length;
    }
    pointer.ref.editCandidates.selectedCandidate = selectedCandidate;
    pointer.ref.editCandidates.horizontal = horizontal;
    return pointer;
  }

  @override
  void loadFromPointer(Pointer<SdlEvent> pointer) {
    type = pointer.ref.editCandidates.type;
    reserved = pointer.ref.editCandidates.reserved;
    timestamp = pointer.ref.editCandidates.timestamp;
    for (var i = 0; i < pointer.ref.editCandidates.numCandidates; i++) {
      if (pointer.ref.editCandidates.candidates[i] != nullptr) {
        candidates.add(
          pointer.ref.editCandidates.candidates[i]
              .cast<ffi.Utf8>()
              .toDartString(),
        );
      }
    }
    windowId = pointer.ref.editCandidates.windowId;
    selectedCandidate = pointer.ref.editCandidates.selectedCandidate;
    horizontal = pointer.ref.editCandidates.horizontal;
  }

  static SdlxTextEditingCandidatesEvent fromPointer(
    Pointer<SdlEvent> pointer,
  ) => SdlxTextEditingCandidatesEvent()..loadFromPointer(pointer);
}
