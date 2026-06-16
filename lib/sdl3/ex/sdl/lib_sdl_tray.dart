part of '../../sdl.dart';

///
/// Returns a list of entries in the menu, in order.
///
/// \param menu The menu to get entries from.
/// \param count An optional pointer to obtain the number of entries in the
/// menu.
/// \returns a NULL-terminated list of entries within the given menu. The
/// pointer becomes invalid when any function that inserts or deletes
/// entries in the menu is called.
///
/// \threadsafety This function should be called on the thread that created the
/// tray.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RemoveTrayEntry
/// \sa SDL_InsertTrayEntryAt
///
/// ```c
/// extern SDL_DECLSPEC const SDL_TrayEntry ** SDLCALL SDL_GetTrayEntries(SDL_TrayMenu *menu, int *count)
/// ```
/// {@category tray}
List<Pointer<SdlTrayEntry>> sdlxGetTrayEntries(Pointer<SdlTrayMenu> menu) {
  final result = <Pointer<SdlTrayEntry>>[];
  final countPointer = ffi.calloc<Int32>();
  final trayEntriesPointer = sdlGetTrayEntries(menu, countPointer);
  if (trayEntriesPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(trayEntriesPointer[i]);
    }
  }
  countPointer.callocFree();
  return result;
}
