// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Opens up a read-only container for the application's filesystem.
///
/// \param override a path to override the backend's default title root.
/// \param props a property list that may contain backend-specific information.
/// \returns a title storage container on success or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseStorage
/// \sa SDL_GetStorageFileSize
/// \sa SDL_OpenUserStorage
/// \sa SDL_ReadStorageFile
///
/// ```c
/// extern SDL_DECLSPEC SDL_Storage * SDLCALL SDL_OpenTitleStorage(const char *override, SDL_PropertiesID props)
/// ```
Pointer<SdlStorage> sdlOpenTitleStorage(String? override, int props) {
  final sdlOpenTitleStorageLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlStorage> Function(Pointer<Utf8> override, Uint32 props),
      Pointer<SdlStorage> Function(
          Pointer<Utf8> override, int props)>('SDL_OpenTitleStorage');
  final overridePointer = override != null ? override.toNativeUtf8() : nullptr;
  final result = sdlOpenTitleStorageLookupFunction(overridePointer, props);
  calloc.free(overridePointer);
  return result;
}

///
/// Opens up a container for a user's unique read/write filesystem.
///
/// While title storage can generally be kept open throughout runtime, user
/// storage should only be opened when the client is ready to read/write files.
/// This allows the backend to properly batch file operations and flush them
/// when the container has been closed; ensuring safe and optimal save I/O.
///
/// \param org the name of your organization.
/// \param app the name of your application.
/// \param props a property list that may contain backend-specific information.
/// \returns a user storage container on success or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseStorage
/// \sa SDL_GetStorageFileSize
/// \sa SDL_GetStorageSpaceRemaining
/// \sa SDL_OpenTitleStorage
/// \sa SDL_ReadStorageFile
/// \sa SDL_StorageReady
/// \sa SDL_WriteStorageFile
///
/// ```c
/// extern SDL_DECLSPEC SDL_Storage * SDLCALL SDL_OpenUserStorage(const char *org, const char *app, SDL_PropertiesID props)
/// ```
Pointer<SdlStorage> sdlOpenUserStorage(String? org, String? app, int props) {
  final sdlOpenUserStorageLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlStorage> Function(
          Pointer<Utf8> org, Pointer<Utf8> app, Uint32 props),
      Pointer<SdlStorage> Function(Pointer<Utf8> org, Pointer<Utf8> app,
          int props)>('SDL_OpenUserStorage');
  final orgPointer = org != null ? org.toNativeUtf8() : nullptr;
  final appPointer = app != null ? app.toNativeUtf8() : nullptr;
  final result =
      sdlOpenUserStorageLookupFunction(orgPointer, appPointer, props);
  calloc.free(orgPointer);
  calloc.free(appPointer);
  return result;
}

///
/// Opens up a container for local filesystem storage.
///
/// This is provided for development and tools. Portable applications should
/// use SDL_OpenTitleStorage() for access to game data and
/// SDL_OpenUserStorage() for access to user data.
///
/// \param path the base path prepended to all storage paths, or NULL for no
/// base path.
/// \returns a filesystem storage container on success or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseStorage
/// \sa SDL_GetStorageFileSize
/// \sa SDL_GetStorageSpaceRemaining
/// \sa SDL_OpenTitleStorage
/// \sa SDL_OpenUserStorage
/// \sa SDL_ReadStorageFile
/// \sa SDL_WriteStorageFile
///
/// ```c
/// extern SDL_DECLSPEC SDL_Storage * SDLCALL SDL_OpenFileStorage(const char *path)
/// ```
Pointer<SdlStorage> sdlOpenFileStorage(String? path) {
  final sdlOpenFileStorageLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlStorage> Function(Pointer<Utf8> path),
      Pointer<SdlStorage> Function(Pointer<Utf8> path)>('SDL_OpenFileStorage');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result = sdlOpenFileStorageLookupFunction(pathPointer);
  calloc.free(pathPointer);
  return result;
}

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
Pointer<SdlStorage> sdlOpenStorage(
    Pointer<SdlStorageInterface> iface, Pointer<NativeType> userdata) {
  final sdlOpenStorageLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlStorage> Function(
          Pointer<SdlStorageInterface> iface, Pointer<NativeType> userdata),
      Pointer<SdlStorage> Function(Pointer<SdlStorageInterface> iface,
          Pointer<NativeType> userdata)>('SDL_OpenStorage');
  return sdlOpenStorageLookupFunction(iface, userdata);
}

///
/// Closes and frees a storage container.
///
/// \param storage a storage container to close.
/// \returns true if the container was freed with no errors, false otherwise;
/// call SDL_GetError() for more information. Even if the function
/// returns an error, the container data will be freed; the error is
/// only for informational purposes.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenFileStorage
/// \sa SDL_OpenStorage
/// \sa SDL_OpenTitleStorage
/// \sa SDL_OpenUserStorage
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CloseStorage(SDL_Storage *storage)
/// ```
bool sdlCloseStorage(Pointer<SdlStorage> storage) {
  final sdlCloseStorageLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage),
      int Function(Pointer<SdlStorage> storage)>('SDL_CloseStorage');
  return sdlCloseStorageLookupFunction(storage) == 1;
}

///
/// Checks if the storage container is ready to use.
///
/// This function should be called in regular intervals until it returns true -
/// however, it is not recommended to spinwait on this call, as the backend may
/// depend on a synchronous message loop.
///
/// \param storage a storage container to query.
/// \returns true if the container is ready, false otherwise.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_StorageReady(SDL_Storage *storage)
/// ```
bool sdlStorageReady(Pointer<SdlStorage> storage) {
  final sdlStorageReadyLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage),
      int Function(Pointer<SdlStorage> storage)>('SDL_StorageReady');
  return sdlStorageReadyLookupFunction(storage) == 1;
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
bool sdlGetStorageFileSize(
    Pointer<SdlStorage> storage, String? path, Pointer<Uint64> length) {
  final sdlGetStorageFileSizeLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage, Pointer<Utf8> path,
          Pointer<Uint64> length),
      int Function(Pointer<SdlStorage> storage, Pointer<Utf8> path,
          Pointer<Uint64> length)>('SDL_GetStorageFileSize');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result =
      sdlGetStorageFileSizeLookupFunction(storage, pathPointer, length) == 1;
  calloc.free(pathPointer);
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
bool sdlReadStorageFile(Pointer<SdlStorage> storage, String? path,
    Pointer<NativeType> destination, int length) {
  final sdlReadStorageFileLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage, Pointer<Utf8> path,
          Pointer<NativeType> destination, Uint64 length),
      int Function(Pointer<SdlStorage> storage, Pointer<Utf8> path,
          Pointer<NativeType> destination, int length)>('SDL_ReadStorageFile');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result = sdlReadStorageFileLookupFunction(
          storage, pathPointer, destination, length) ==
      1;
  calloc.free(pathPointer);
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
bool sdlWriteStorageFile(Pointer<SdlStorage> storage, String? path,
    Pointer<NativeType> source, int length) {
  final sdlWriteStorageFileLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage, Pointer<Utf8> path,
          Pointer<NativeType> source, Uint64 length),
      int Function(Pointer<SdlStorage> storage, Pointer<Utf8> path,
          Pointer<NativeType> source, int length)>('SDL_WriteStorageFile');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result =
      sdlWriteStorageFileLookupFunction(storage, pathPointer, source, length) ==
          1;
  calloc.free(pathPointer);
  return result;
}

///
/// Create a directory in a writable storage container.
///
/// \param storage a storage container.
/// \param path the path of the directory to create.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StorageReady
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CreateStorageDirectory(SDL_Storage *storage, const char *path)
/// ```
bool sdlCreateStorageDirectory(Pointer<SdlStorage> storage, String? path) {
  final sdlCreateStorageDirectoryLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage, Pointer<Utf8> path),
      int Function(Pointer<SdlStorage> storage,
          Pointer<Utf8> path)>('SDL_CreateStorageDirectory');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result =
      sdlCreateStorageDirectoryLookupFunction(storage, pathPointer) == 1;
  calloc.free(pathPointer);
  return result;
}

///
/// Enumerate a directory in a storage container through a callback function.
///
/// This function provides every directory entry through an app-provided
/// callback, called once for each directory entry, until all results have been
/// provided or the callback returns either SDL_ENUM_SUCCESS or
/// SDL_ENUM_FAILURE.
///
/// This will return false if there was a system problem in general, or if a
/// callback returns SDL_ENUM_FAILURE. A successful return means a callback
/// returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries
/// were enumerated.
///
/// If `path` is NULL, this is treated as a request to enumerate the root of
/// the storage container's tree. An empty string also works for this.
///
/// \param storage a storage container.
/// \param path the path of the directory to enumerate, or NULL for the root.
/// \param callback a function that is called for each entry in the directory.
/// \param userdata a pointer that is passed to `callback`.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StorageReady
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_EnumerateStorageDirectory(SDL_Storage *storage, const char *path, SDL_EnumerateDirectoryCallback callback, void *userdata)
/// ```
bool sdlEnumerateStorageDirectory(
    Pointer<SdlStorage> storage,
    String? path,
    Pointer<NativeFunction<SdlEnumerateDirectoryCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlEnumerateStorageDirectoryLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlStorage> storage,
          Pointer<Utf8> path,
          Pointer<NativeFunction<SdlEnumerateDirectoryCallback>> callback,
          Pointer<NativeType> userdata),
      int Function(
          Pointer<SdlStorage> storage,
          Pointer<Utf8> path,
          Pointer<NativeFunction<SdlEnumerateDirectoryCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_EnumerateStorageDirectory');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result = sdlEnumerateStorageDirectoryLookupFunction(
          storage, pathPointer, callback, userdata) ==
      1;
  calloc.free(pathPointer);
  return result;
}

///
/// Remove a file or an empty directory in a writable storage container.
///
/// \param storage a storage container.
/// \param path the path of the directory to enumerate.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StorageReady
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RemoveStoragePath(SDL_Storage *storage, const char *path)
/// ```
bool sdlRemoveStoragePath(Pointer<SdlStorage> storage, String? path) {
  final sdlRemoveStoragePathLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage, Pointer<Utf8> path),
      int Function(Pointer<SdlStorage> storage,
          Pointer<Utf8> path)>('SDL_RemoveStoragePath');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result = sdlRemoveStoragePathLookupFunction(storage, pathPointer) == 1;
  calloc.free(pathPointer);
  return result;
}

///
/// Rename a file or directory in a writable storage container.
///
/// \param storage a storage container.
/// \param oldpath the old path.
/// \param newpath the new path.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StorageReady
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RenameStoragePath(SDL_Storage *storage, const char *oldpath, const char *newpath)
/// ```
bool sdlRenameStoragePath(
    Pointer<SdlStorage> storage, String? oldpath, String? newpath) {
  final sdlRenameStoragePathLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage, Pointer<Utf8> oldpath,
          Pointer<Utf8> newpath),
      int Function(Pointer<SdlStorage> storage, Pointer<Utf8> oldpath,
          Pointer<Utf8> newpath)>('SDL_RenameStoragePath');
  final oldpathPointer = oldpath != null ? oldpath.toNativeUtf8() : nullptr;
  final newpathPointer = newpath != null ? newpath.toNativeUtf8() : nullptr;
  final result = sdlRenameStoragePathLookupFunction(
          storage, oldpathPointer, newpathPointer) ==
      1;
  calloc.free(oldpathPointer);
  calloc.free(newpathPointer);
  return result;
}

///
/// Copy a file in a writable storage container.
///
/// \param storage a storage container.
/// \param oldpath the old path.
/// \param newpath the new path.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StorageReady
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CopyStorageFile(SDL_Storage *storage, const char *oldpath, const char *newpath)
/// ```
bool sdlCopyStorageFile(
    Pointer<SdlStorage> storage, String? oldpath, String? newpath) {
  final sdlCopyStorageFileLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage, Pointer<Utf8> oldpath,
          Pointer<Utf8> newpath),
      int Function(Pointer<SdlStorage> storage, Pointer<Utf8> oldpath,
          Pointer<Utf8> newpath)>('SDL_CopyStorageFile');
  final oldpathPointer = oldpath != null ? oldpath.toNativeUtf8() : nullptr;
  final newpathPointer = newpath != null ? newpath.toNativeUtf8() : nullptr;
  final result = sdlCopyStorageFileLookupFunction(
          storage, oldpathPointer, newpathPointer) ==
      1;
  calloc.free(oldpathPointer);
  calloc.free(newpathPointer);
  return result;
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
bool sdlGetStoragePathInfo(
    Pointer<SdlStorage> storage, String? path, Pointer<SdlPathInfo> info) {
  final sdlGetStoragePathInfoLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlStorage> storage, Pointer<Utf8> path,
          Pointer<SdlPathInfo> info),
      int Function(Pointer<SdlStorage> storage, Pointer<Utf8> path,
          Pointer<SdlPathInfo> info)>('SDL_GetStoragePathInfo');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result =
      sdlGetStoragePathInfoLookupFunction(storage, pathPointer, info) == 1;
  calloc.free(pathPointer);
  return result;
}

///
/// Queries the remaining space in a storage container.
///
/// \param storage a storage container to query.
/// \returns the amount of remaining space, in bytes.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_StorageReady
/// \sa SDL_WriteStorageFile
///
/// ```c
/// extern SDL_DECLSPEC Uint64 SDLCALL SDL_GetStorageSpaceRemaining(SDL_Storage *storage)
/// ```
int sdlGetStorageSpaceRemaining(Pointer<SdlStorage> storage) {
  final sdlGetStorageSpaceRemainingLookupFunction = libSdl3.lookupFunction<
      Uint64 Function(Pointer<SdlStorage> storage),
      int Function(
          Pointer<SdlStorage> storage)>('SDL_GetStorageSpaceRemaining');
  return sdlGetStorageSpaceRemainingLookupFunction(storage);
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
Pointer<Pointer<Int8>> sdlGlobStorageDirectory(Pointer<SdlStorage> storage,
    String? path, String? pattern, int flags, Pointer<Int32> count) {
  final sdlGlobStorageDirectoryLookupFunction = libSdl3.lookupFunction<
      Pointer<Pointer<Int8>> Function(
          Pointer<SdlStorage> storage,
          Pointer<Utf8> path,
          Pointer<Utf8> pattern,
          Uint32 flags,
          Pointer<Int32> count),
      Pointer<Pointer<Int8>> Function(
          Pointer<SdlStorage> storage,
          Pointer<Utf8> path,
          Pointer<Utf8> pattern,
          int flags,
          Pointer<Int32> count)>('SDL_GlobStorageDirectory');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final patternPointer = pattern != null ? pattern.toNativeUtf8() : nullptr;
  final result = sdlGlobStorageDirectoryLookupFunction(
      storage, pathPointer, patternPointer, flags, count);
  calloc.free(pathPointer);
  calloc.free(patternPointer);
  return result;
}
