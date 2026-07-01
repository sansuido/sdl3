part of '../../../sdl.dart';

extension SdlAsyncIoEx on SdlAsyncIo {
  ///
  /// Use this function to create a new SDL_AsyncIO object for reading from
  /// and/or writing to a named file.
  ///
  /// The `mode` string understands the following values:
  ///
  /// - "r": Open a file for reading only. It must exist.
  /// - "w": Open a file for writing only. It will create missing files or
  /// truncate existing ones.
  /// - "r+": Open a file for update both reading and writing. The file must
  /// exist.
  /// - "w+": Create an empty file for both reading and writing. If a file with
  /// the same name already exists its content is erased and the file is
  /// treated as a new empty file.
  ///
  /// There is no "b" mode, as there is only "binary" style I/O, and no "a" mode
  /// for appending, since you specify the position when starting a task.
  ///
  /// This function supports Unicode filenames, but they must be encoded in UTF-8
  /// format, regardless of the underlying operating system.
  ///
  /// This call is _not_ asynchronous; it will open the file before returning,
  /// under the assumption that doing so is generally a fast operation. Future
  /// reads and writes to the opened file will be async, however.
  ///
  /// \param file a UTF-8 string representing the filename to open.
  /// \param mode an ASCII string representing the mode to be used for opening
  /// the file.
  /// \returns a pointer to the SDL_AsyncIO structure that is created or NULL on
  /// failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_CloseAsyncIO
  /// \sa SDL_ReadAsyncIO
  /// \sa SDL_WriteAsyncIO
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_AsyncIO * SDLCALL SDL_AsyncIOFromFile(const char *file, const char *mode)
  /// ```
  /// {@category asyncio}
  static Pointer<SdlAsyncIo> fromFile(String file, String mode) =>
      sdlAsyncIoFromFile(file, mode);
}

extension SdlAsyncIoPointerEx on Pointer<SdlAsyncIo> {
  ///
  /// Use this function to get the size of the data stream in an SDL_AsyncIO.
  ///
  /// This call is _not_ asynchronous; it assumes that obtaining this info is a
  /// non-blocking operation in most reasonable cases.
  ///
  /// \param asyncio the SDL_AsyncIO to get the size of the data stream from.
  /// \returns the size of the data stream in the SDL_IOStream on success or a
  /// negative error code on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC Sint64 SDLCALL SDL_GetAsyncIOSize(SDL_AsyncIO *asyncio)
  /// ```
  /// {@category asyncio}
  int getSize() => sdlGetAsyncIoSize(this);

  ///
  /// Start an async read.
  ///
  /// This function reads up to `size` bytes from `offset` position in the data
  /// source to the area pointed at by `ptr`. This function may read less bytes
  /// than requested.
  ///
  /// This function returns as quickly as possible; it does not wait for the read
  /// to complete. On a successful return, this work will continue in the
  /// background. If the work begins, even failure is asynchronous: a failing
  /// return value from this function only means the work couldn't start at all.
  ///
  /// `ptr` must remain available until the work is done, and may be accessed by
  /// the system at any time until then. Do not allocate it on the stack, as this
  /// might take longer than the life of the calling function to complete!
  ///
  /// An SDL_AsyncIOQueue must be specified. The newly-created task will be added
  /// to it when it completes its work.
  ///
  /// \param asyncio a pointer to an SDL_AsyncIO structure.
  /// \param ptr a pointer to a buffer to read data into.
  /// \param offset the position to start reading in the data source.
  /// \param size the number of bytes to read from the data source.
  /// \param queue a queue to add the new SDL_AsyncIO to.
  /// \param userdata an app-defined pointer that will be provided with the task
  /// results.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_WriteAsyncIO
  /// \sa SDL_CreateAsyncIOQueue
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_ReadAsyncIO(SDL_AsyncIO *asyncio, void *ptr, Uint64 offset, Uint64 size, SDL_AsyncIOQueue *queue, void *userdata)
  /// ```
  /// {@category asyncio}
  bool read(
    Pointer<Void> ptr,
    int offset,
    int size,
    Pointer<SdlAsyncIoQueue> queue,
    Pointer<Void> userdata,
  ) => sdlReadAsyncIo(this, ptr, offset, size, queue, userdata);

  ///
  /// Start an async write.
  ///
  /// This function writes `size` bytes from `offset` position in the data source
  /// to the area pointed at by `ptr`.
  ///
  /// This function returns as quickly as possible; it does not wait for the
  /// write to complete. On a successful return, this work will continue in the
  /// background. If the work begins, even failure is asynchronous: a failing
  /// return value from this function only means the work couldn't start at all.
  ///
  /// `ptr` must remain available until the work is done, and may be accessed by
  /// the system at any time until then. Do not allocate it on the stack, as this
  /// might take longer than the life of the calling function to complete!
  ///
  /// An SDL_AsyncIOQueue must be specified. The newly-created task will be added
  /// to it when it completes its work.
  ///
  /// \param asyncio a pointer to an SDL_AsyncIO structure.
  /// \param ptr a pointer to a buffer to write data from.
  /// \param offset the position to start writing to the data source.
  /// \param size the number of bytes to write to the data source.
  /// \param queue a queue to add the new SDL_AsyncIO to.
  /// \param userdata an app-defined pointer that will be provided with the task
  /// results.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_ReadAsyncIO
  /// \sa SDL_CreateAsyncIOQueue
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_WriteAsyncIO(SDL_AsyncIO *asyncio, void *ptr, Uint64 offset, Uint64 size, SDL_AsyncIOQueue *queue, void *userdata)
  /// ```
  /// {@category asyncio}
  bool write(
    Pointer<Void> ptr,
    int offset,
    int size,
    Pointer<SdlAsyncIoQueue> queue,
    Pointer<Void> userdata,
  ) => sdlWriteAsyncIo(this, ptr, offset, size, queue, userdata);

  ///
  /// Close and free any allocated resources for an async I/O object.
  ///
  /// Closing a file is _also_ an asynchronous task! If a write failure were to
  /// happen during the closing process, for example, the task results will
  /// report it as usual.
  ///
  /// Closing a file that has been written to does not guarantee the data has
  /// made it to physical media; it may remain in the operating system's file
  /// cache, for later writing to disk. This means that a successfully-closed
  /// file can be lost if the system crashes or loses power in this small window.
  /// To prevent this, call this function with the `flush` parameter set to true.
  /// This will make the operation take longer, and perhaps increase system load
  /// in general, but a successful result guarantees that the data has made it to
  /// physical storage. Don't use this for temporary files, caches, and
  /// unimportant data, and definitely use it for crucial irreplaceable files,
  /// like game saves.
  ///
  /// This function guarantees that the close will happen after any other pending
  /// tasks to `asyncio`, so it's safe to open a file, start several operations,
  /// close the file immediately, then check for all results later. This function
  /// will not block until the tasks have completed.
  ///
  /// Once this function returns true, `asyncio` is no longer valid, regardless
  /// of any future outcomes. Any completed tasks might still contain this
  /// pointer in their SDL_AsyncIOOutcome data, in case the app was using this
  /// value to track information, but it should not be used again.
  ///
  /// If this function returns false, the close wasn't started at all, and it's
  /// safe to attempt to close again later.
  ///
  /// An SDL_AsyncIOQueue must be specified. The newly-created task will be added
  /// to it when it completes its work.
  ///
  /// \param asyncio a pointer to an SDL_AsyncIO structure to close.
  /// \param flush true if data should sync to disk before the task completes.
  /// \param queue a queue to add the new SDL_AsyncIO to.
  /// \param userdata an app-defined pointer that will be provided with the task
  /// results.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread, but two
  /// threads should not attempt to close the same object.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_CloseAsyncIO(SDL_AsyncIO *asyncio, bool flush, SDL_AsyncIOQueue *queue, void *userdata)
  /// ```
  /// {@category asyncio}
  bool close(
    Pointer<SdlAsyncIoQueue> queue,
    Pointer<Void> userdata, {
    bool flush = false,
  }) => sdlCloseAsyncIo(this, flush, queue, userdata);
}
