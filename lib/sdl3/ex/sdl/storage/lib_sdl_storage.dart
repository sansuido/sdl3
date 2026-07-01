part of '../../../sdl.dart';

///
/// Opens up a container using a client-provided storage interface.
///
/// Applications do not need to use this function unless they are providing
/// their own SDL_Storage implementation. If you just need an SDL_Storage, you
/// should use the built-in implementations in SDL, like SDL_OpenTitleStorage()
/// or SDL_OpenUserStorage().
///
/// This function makes a copy of `iface` and the caller does not need to keep
/// it around after this call.
///
/// \param iface the interface that implements this storage, initialized using
/// SDL_INIT_INTERFACE().
/// \param userdata the pointer that will be passed to the interface functions.
/// \returns a storage container on success or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseStorage
/// \sa SDL_GetStorageFileSize
/// \sa SDL_GetStorageSpaceRemaining
/// \sa SDL_INIT_INTERFACE
/// \sa SDL_ReadStorageFile
/// \sa SDL_StorageReady
/// \sa SDL_WriteStorageFile
///
/// ```c
/// extern SDL_DECLSPEC SDL_Storage * SDLCALL SDL_OpenStorage(const SDL_StorageInterface *iface, void *userdata)
/// ```
/// {@category storage}
Pointer<SdlStorage> sdlxOpenStorage(
  SdlxStorageInterface iface,
  Pointer<Void> userdata,
) {
  final ifacePointer = iface.calloc();
  final result = sdlOpenStorage(ifacePointer, userdata);
  ifacePointer.callocFree();
  return result;
}

///
/// Query the size of a file within a storage container.
///
/// \param storage a storage container to query.
/// \param path the relative path of the file to query.
/// \param length a pointer to be filled with the file's length.
/// \returns true if the file could be queried or false on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ReadStorageFile
/// \sa SDL_StorageReady
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetStorageFileSize(SDL_Storage *storage, const char *path, Uint64 *length)
/// ```
/// {@category storage}
int? sdlxGetStorageFileSize(Pointer<SdlStorage> storage, String path) {
  int? result;
  final lengthPointer = ffi.calloc<Uint64>();
  final bl = sdlGetStorageFileSize(storage, path, lengthPointer);
  if (bl) {
    result = lengthPointer.value;
  }
  lengthPointer.callocFree();
  return result;
}

///
/// Synchronously read a file from a storage container into a client-provided
/// buffer.
///
/// The value of `length` must match the length of the file exactly; call
/// SDL_GetStorageFileSize() to get this value. This behavior may be relaxed in
/// a future release.
///
/// \param storage a storage container to read from.
/// \param path the relative path of the file to read.
/// \param destination a client-provided buffer to read the file into.
/// \param length the length of the destination buffer.
/// \returns true if the file was read or false on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetStorageFileSize
/// \sa SDL_StorageReady
/// \sa SDL_WriteStorageFile
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReadStorageFile(SDL_Storage *storage, const char *path, void *destination, Uint64 length)
/// ```
/// {@category storage}
Uint8List? sdlxReadStorageFile(Pointer<SdlStorage> storage, String path) {
  Uint8List? result;
  final length = sdlxGetStorageFileSize(storage, path);
  if (length != null) {
    final destinationPointer = ffi.calloc<Uint8>(length);
    final bl = sdlReadStorageFile(
      storage,
      path,
      destinationPointer.cast<Void>(),
      length,
    );
    if (bl) {
      result = Uint8List.fromList(destinationPointer.asTypedList(length));
    }
    destinationPointer.callocFree();
  }
  return result;
}

///
/// Synchronously write a file from client memory into a storage container.
///
/// \param storage a storage container to write to.
/// \param path the relative path of the file to write.
/// \param source a client-provided buffer to write from.
/// \param length the length of the source buffer.
/// \returns true if the file was written or false on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetStorageSpaceRemaining
/// \sa SDL_ReadStorageFile
/// \sa SDL_StorageReady
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WriteStorageFile(SDL_Storage *storage, const char *path, const void *source, Uint64 length)
/// ```
/// {@category storage}
bool sdlxWriteStorageFile(
  Pointer<SdlStorage> storage,
  String path,
  Uint8List source,
) {
  final sourcePointer = ffi.calloc<Uint8>(source.length);
  sourcePointer.asTypedList(source.length).setRange(0, source.length, source);
  final bl = sdlWriteStorageFile(
    storage,
    path,
    sourcePointer.cast<Void>(),
    source.length,
  );
  sourcePointer.callocFree();
  return bl;
}

///
/// Get information about a filesystem path in a storage container.
///
/// \param storage a storage container.
/// \param path the path to query.
/// \param info a pointer filled in with information about the path, or NULL to
/// check for the existence of a file.
/// \returns true on success or false if the file doesn't exist, or another
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StorageReady
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetStoragePathInfo(SDL_Storage *storage, const char *path, SDL_PathInfo *info)
/// ```
/// {@category storage}
bool sdlxGetStoragePathInfo(
  Pointer<SdlStorage> storage,
  String path,
  SdlxPathInfo info,
) {
  final infoPointer = info.calloc();
  final result = sdlGetStoragePathInfo(storage, path, infoPointer);
  if (result) {
    info.loadFromPointer(infoPointer);
  }
  infoPointer.callocFree();
  return result;
}

///
/// Enumerate a directory tree, filtered by pattern, and return a list.
///
/// Files are filtered out if they don't match the string in `pattern`, which
/// may contain wildcard characters `*` (match everything) and `?` (match one
/// character). If pattern is NULL, no filtering is done and all results are
/// returned. Subdirectories are permitted, and are specified with a path
/// separator of '/'. Wildcard characters `*` and `?` never match a path
/// separator.
///
/// `flags` may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching
/// case-insensitive.
///
/// The returned array is always NULL-terminated, for your iterating
/// convenience, but if `count` is non-NULL, on return it will contain the
/// number of items in the array, not counting the NULL terminator.
///
/// If `path` is NULL, this is treated as a request to enumerate the root of
/// the storage container's tree. An empty string also works for this.
///
/// \param storage a storage container.
/// \param path the path of the directory to enumerate, or NULL for the root.
/// \param pattern the pattern that files in the directory must match. Can be
/// NULL.
/// \param flags `SDL_GLOB_*` bitflags that affect this search.
/// \param count on return, will be set to the number of items in the returned
/// array. Can be NULL.
/// \returns an array of strings on success or NULL on failure; call
/// SDL_GetError() for more information. The caller should pass the
/// returned pointer to SDL_free when done with it. This is a single
/// allocation that should be freed with SDL_free() when it is no
/// longer needed.
///
/// \threadsafety It is safe to call this function from any thread, assuming
/// the `storage` object is thread-safe.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC char ** SDLCALL SDL_GlobStorageDirectory(SDL_Storage *storage, const char *path, const char *pattern, SDL_GlobFlags flags, int *count)
/// ```
/// {@category storage}
List<String> sdlxGlobStorageDirectory(
  Pointer<SdlStorage> storage,
  String path, {
  String? pattern,
  int flags = 0,
}) {
  final result = <String>[];
  final countPointer = ffi.calloc<Int32>();
  final stringsPointer = sdlGlobStorageDirectory(
    storage,
    path,
    pattern,
    flags,
    countPointer,
  );
  if (stringsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(stringsPointer[i].cast<Utf8>().toDartString());
    }
    sdlFree(stringsPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}
