part of '../../../sdl.dart';

extension SdlStorageEx on SdlStorage {
  ///
  /// Opens up a read-only container for the application's filesystem.
  ///
  /// By default, SDL_OpenTitleStorage uses the generic storage implementation.
  /// When the path override is not provided, the generic implementation will use
  /// the output of SDL_GetBasePath as the base path.
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
  /// {@category storage}
  static Pointer<SdlStorage> openTitle(String? override, int props) =>
      sdlOpenTitleStorage(override, props);

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
  /// {@category storage}
  static Pointer<SdlStorage> openUser(String? org, String? app, int props) =>
      sdlOpenUserStorage(org, app, props);

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
  /// {@category storage}
  static Pointer<SdlStorage> openFile(String path) => sdlOpenFileStorage(path);

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
  static Pointer<SdlStorage> open(
    SdlxStorageInterface iface,
    Pointer<Void> userdata,
  ) => sdlxOpenStorage(iface, userdata);
}

extension SdlStoragePointerEx on Pointer<SdlStorage> {
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
  /// {@category storage}
  bool close() => sdlCloseStorage(this);

  ///
  /// Checks if the storage container is ready to use.
  ///
  /// This function should be called in regular intervals until it returns true -
  /// however, it is not recommended to spinwait on this call, as the backend may
  /// depend on a synchronous message loop. You might instead poll this in your
  /// game's main loop while processing events and drawing a loading screen.
  ///
  /// \param storage a storage container to query.
  /// \returns true if the container is ready, false otherwise.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_StorageReady(SDL_Storage *storage)
  /// ```
  /// {@category storage}
  bool ready() => sdlStorageReady(this);

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
  int? getFileSize(String path) => sdlxGetStorageFileSize(this, path);

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
  Uint8List? readFile(String path) => sdlxReadStorageFile(this, path);

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
  bool writeFile(String path, Uint8List source) =>
      sdlxWriteStorageFile(this, path, source);

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
  /// {@category storage}
  bool createDirectory(String path) => sdlCreateStorageDirectory(this, path);

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
  /// {@category storage}
  bool enumerateDirectory(
    String path,
    Pointer<NativeFunction<SdlEnumerateDirectoryCallback>> callback,
    Pointer<Void> userdata,
  ) => sdlEnumerateStorageDirectory(this, path, callback, userdata);

  ///
  /// Remove a file or an empty directory in a writable storage container.
  ///
  /// \param storage a storage container.
  /// \param path the path to remove from the filesystem.
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
  /// {@category storage}
  bool removePath(String path) => sdlRemoveStoragePath(this, path);

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
  /// {@category storage}
  bool renamePath(String oldpath, String newpath) =>
      sdlRenameStoragePath(this, oldpath, newpath);

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
  /// {@category storage}
  bool copyFile(String oldpath, String newpath) =>
      sdlCopyStorageFile(this, oldpath, newpath);

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
  bool getPathInfo(String path, SdlxPathInfo info) =>
      sdlxGetStoragePathInfo(this, path, info);

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
  /// {@category storage}
  int getSpaceRemaining() => sdlGetStorageSpaceRemaining(this);

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
  List<String> globDirectory(String path, {String? pattern, int flags = 0}) =>
      sdlxGlobStorageDirectory(this, path, pattern: pattern, flags: flags);
}
