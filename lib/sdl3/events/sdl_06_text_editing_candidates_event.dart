part of '../sdl_events.dart';

class SdlxTextEditingCandidatesEvent extends SdlxEvent {
  const SdlxTextEditingCandidatesEvent({
    super.type = SDL_EVENT_TEXT_EDITING_CANDIDATES,
    super.reserved = 0,
    super.timestamp = 0,
    this.windowId = 0,
    this.candidates = const [],
    this.selectedCandidate = 0,
    this.horizontal = false,
  });

  factory SdlxTextEditingCandidatesEvent.fromPointer(
    Pointer<SdlEvent> pointer,
  ) {
    final ref = pointer.ref.editCandidates;
    final candidateList = <String>[];
    if (ref.candidates != nullptr && ref.numCandidates > 0) {
      for (var i = 0; i < ref.numCandidates; i++) {
        final ptr = ref.candidates[i];
        if (ptr != nullptr) {
          candidateList.add(ptr.cast<ffi.Utf8>().toDartString());
        }
      }
    }

    return SdlxTextEditingCandidatesEvent(
      type: ref.type,
      reserved: ref.reserved,
      timestamp: ref.timestamp,
      windowId: ref.windowId,
      candidates: List.unmodifiable(candidateList),
      selectedCandidate: ref.selectedCandidate,
      horizontal: ref.horizontal,
    );
  }

  final int windowId;
  final List<String> candidates;
  final int selectedCandidate;
  final bool horizontal;

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
}
