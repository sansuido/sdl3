// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
part of '../sdl.dart';

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
Pointer<SdlAsyncIo> sdlAsyncIoFromFile(String? file, String? mode) {
  final sdlAsyncIoFromFileLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlAsyncIo> Function(Pointer<Utf8> file, Pointer<Utf8> mode),
        Pointer<SdlAsyncIo> Function(Pointer<Utf8> file, Pointer<Utf8> mode)
      >('SDL_AsyncIOFromFile');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final modePointer = mode != null ? mode.toNativeUtf8() : nullptr;
  final result = sdlAsyncIoFromFileLookupFunction(filePointer, modePointer);
  calloc
    ..free(filePointer)
    ..free(modePointer);
  return result;
}

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
int sdlGetAsyncIoSize(Pointer<SdlAsyncIo> asyncio) {
  final sdlGetAsyncIoSizeLookupFunction = _libSdl
      .lookupFunction<
        Int64 Function(Pointer<SdlAsyncIo> asyncio),
        int Function(Pointer<SdlAsyncIo> asyncio)
      >('SDL_GetAsyncIOSize');
  return sdlGetAsyncIoSizeLookupFunction(asyncio);
}

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
bool sdlReadAsyncIo(
  Pointer<SdlAsyncIo> asyncio,
  Pointer<NativeType> ptr,
  int offset,
  int size,
  Pointer<SdlAsyncIoQueue> queue,
  Pointer<NativeType> userdata,
) {
  final sdlReadAsyncIoLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlAsyncIo> asyncio,
          Pointer<NativeType> ptr,
          Uint64 offset,
          Uint64 size,
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<NativeType> userdata,
        ),
        int Function(
          Pointer<SdlAsyncIo> asyncio,
          Pointer<NativeType> ptr,
          int offset,
          int size,
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<NativeType> userdata,
        )
      >('SDL_ReadAsyncIO');
  return sdlReadAsyncIoLookupFunction(
        asyncio,
        ptr,
        offset,
        size,
        queue,
        userdata,
      ) ==
      1;
}

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
bool sdlWriteAsyncIo(
  Pointer<SdlAsyncIo> asyncio,
  Pointer<NativeType> ptr,
  int offset,
  int size,
  Pointer<SdlAsyncIoQueue> queue,
  Pointer<NativeType> userdata,
) {
  final sdlWriteAsyncIoLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlAsyncIo> asyncio,
          Pointer<NativeType> ptr,
          Uint64 offset,
          Uint64 size,
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<NativeType> userdata,
        ),
        int Function(
          Pointer<SdlAsyncIo> asyncio,
          Pointer<NativeType> ptr,
          int offset,
          int size,
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<NativeType> userdata,
        )
      >('SDL_WriteAsyncIO');
  return sdlWriteAsyncIoLookupFunction(
        asyncio,
        ptr,
        offset,
        size,
        queue,
        userdata,
      ) ==
      1;
}

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
bool sdlCloseAsyncIo(
  Pointer<SdlAsyncIo> asyncio,
  bool flush,
  Pointer<SdlAsyncIoQueue> queue,
  Pointer<NativeType> userdata,
) {
  final sdlCloseAsyncIoLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlAsyncIo> asyncio,
          Uint8 flush,
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<NativeType> userdata,
        ),
        int Function(
          Pointer<SdlAsyncIo> asyncio,
          int flush,
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<NativeType> userdata,
        )
      >('SDL_CloseAsyncIO');
  return sdlCloseAsyncIoLookupFunction(
        asyncio,
        flush ? 1 : 0,
        queue,
        userdata,
      ) ==
      1;
}

///
/// Create a task queue for tracking multiple I/O operations.
///
/// Async I/O operations are assigned to a queue when started. The queue can be
/// checked for completed tasks thereafter.
///
/// \returns a new task queue object or NULL if there was an error; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DestroyAsyncIOQueue
/// \sa SDL_GetAsyncIOResult
/// \sa SDL_WaitAsyncIOResult
///
/// ```c
/// extern SDL_DECLSPEC SDL_AsyncIOQueue * SDLCALL SDL_CreateAsyncIOQueue(void)
/// ```
/// {@category asyncio}
Pointer<SdlAsyncIoQueue> sdlCreateAsyncIoQueue() {
  final sdlCreateAsyncIoQueueLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlAsyncIoQueue> Function(),
        Pointer<SdlAsyncIoQueue> Function()
      >('SDL_CreateAsyncIOQueue');
  return sdlCreateAsyncIoQueueLookupFunction();
}

///
/// Destroy a previously-created async I/O task queue.
///
/// If there are still tasks pending for this queue, this call will block until
/// those tasks are finished. All those tasks will be deallocated. Their
/// results will be lost to the app.
///
/// Any pending reads from SDL_LoadFileAsync() that are still in this queue
/// will have their buffers deallocated by this function, to prevent a memory
/// leak.
///
/// Once this function is called, the queue is no longer valid and should not
/// be used, including by other threads that might access it while destruction
/// is blocking on pending tasks.
///
/// Do not destroy a queue that still has threads waiting on it through
/// SDL_WaitAsyncIOResult(). You can call SDL_SignalAsyncIOQueue() first to
/// unblock those threads, and take measures (such as SDL_WaitThread()) to make
/// sure they have finished their wait and won't wait on the queue again.
///
/// \param queue the task queue to destroy.
///
/// \threadsafety It is safe to call this function from any thread, so long as
/// no other thread is waiting on the queue with
/// SDL_WaitAsyncIOResult.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyAsyncIOQueue(SDL_AsyncIOQueue *queue)
/// ```
/// {@category asyncio}
void sdlDestroyAsyncIoQueue(Pointer<SdlAsyncIoQueue> queue) {
  final sdlDestroyAsyncIoQueueLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlAsyncIoQueue> queue),
        void Function(Pointer<SdlAsyncIoQueue> queue)
      >('SDL_DestroyAsyncIOQueue');
  return sdlDestroyAsyncIoQueueLookupFunction(queue);
}

///
/// Query an async I/O task queue for completed tasks.
///
/// If a task assigned to this queue has finished, this will return true and
/// fill in `outcome` with the details of the task. If no task in the queue has
/// finished, this function will return false. This function does not block.
///
/// If a task has completed, this function will free its resources and the task
/// pointer will no longer be valid. The task will be removed from the queue.
///
/// It is safe for multiple threads to call this function on the same queue at
/// once; a completed task will only go to one of the threads.
///
/// \param queue the async I/O task queue to query.
/// \param outcome details of a finished task will be written here. May not be
/// NULL.
/// \returns true if a task has completed, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WaitAsyncIOResult
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetAsyncIOResult(SDL_AsyncIOQueue *queue, SDL_AsyncIOOutcome *outcome)
/// ```
/// {@category asyncio}
bool sdlGetAsyncIoResult(
  Pointer<SdlAsyncIoQueue> queue,
  Pointer<SdlAsyncIoOutcome> outcome,
) {
  final sdlGetAsyncIoResultLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<SdlAsyncIoOutcome> outcome,
        ),
        int Function(
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<SdlAsyncIoOutcome> outcome,
        )
      >('SDL_GetAsyncIOResult');
  return sdlGetAsyncIoResultLookupFunction(queue, outcome) == 1;
}

///
/// Block until an async I/O task queue has a completed task.
///
/// This function puts the calling thread to sleep until there a task assigned
/// to the queue that has finished.
///
/// If a task assigned to the queue has finished, this will return true and
/// fill in `outcome` with the details of the task. If no task in the queue has
/// finished, this function will return false.
///
/// If a task has completed, this function will free its resources and the task
/// pointer will no longer be valid. The task will be removed from the queue.
///
/// It is safe for multiple threads to call this function on the same queue at
/// once; a completed task will only go to one of the threads.
///
/// Note that by the nature of various platforms, more than one waiting thread
/// may wake to handle a single task, but only one will obtain it, so
/// `timeoutMS` is a _maximum_ wait time, and this function may return false
/// sooner.
///
/// This function may return false if there was a system error, the OS
/// inadvertently awoke multiple threads, or if SDL_SignalAsyncIOQueue() was
/// called to wake up all waiting threads without a finished task.
///
/// A timeout can be used to specify a maximum wait time, but rather than
/// polling, it is possible to have a timeout of -1 to wait forever, and use
/// SDL_SignalAsyncIOQueue() to wake up the waiting threads later.
///
/// \param queue the async I/O task queue to wait on.
/// \param outcome details of a finished task will be written here. May not be
/// NULL.
/// \param timeoutMS the maximum time to wait, in milliseconds, or -1 to wait
/// indefinitely.
/// \returns true if task has completed, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SignalAsyncIOQueue
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitAsyncIOResult(SDL_AsyncIOQueue *queue, SDL_AsyncIOOutcome *outcome, Sint32 timeoutMS)
/// ```
/// {@category asyncio}
bool sdlWaitAsyncIoResult(
  Pointer<SdlAsyncIoQueue> queue,
  Pointer<SdlAsyncIoOutcome> outcome,
  int timeoutMs,
) {
  final sdlWaitAsyncIoResultLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<SdlAsyncIoOutcome> outcome,
          Int32 timeoutMs,
        ),
        int Function(
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<SdlAsyncIoOutcome> outcome,
          int timeoutMs,
        )
      >('SDL_WaitAsyncIOResult');
  return sdlWaitAsyncIoResultLookupFunction(queue, outcome, timeoutMs) == 1;
}

///
/// Wake up any threads that are blocking in SDL_WaitAsyncIOResult().
///
/// This will unblock any threads that are sleeping in a call to
/// SDL_WaitAsyncIOResult for the specified queue, and cause them to return
/// from that function.
///
/// This can be useful when destroying a queue to make sure nothing is touching
/// it indefinitely. In this case, once this call completes, the caller should
/// take measures to make sure any previously-blocked threads have returned
/// from their wait and will not touch the queue again (perhaps by setting a
/// flag to tell the threads to terminate and then using SDL_WaitThread() to
/// make sure they've done so).
///
/// \param queue the async I/O task queue to signal.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_WaitAsyncIOResult
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SignalAsyncIOQueue(SDL_AsyncIOQueue *queue)
/// ```
/// {@category asyncio}
void sdlSignalAsyncIoQueue(Pointer<SdlAsyncIoQueue> queue) {
  final sdlSignalAsyncIoQueueLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlAsyncIoQueue> queue),
        void Function(Pointer<SdlAsyncIoQueue> queue)
      >('SDL_SignalAsyncIOQueue');
  return sdlSignalAsyncIoQueueLookupFunction(queue);
}

///
/// Load all the data from a file path, asynchronously.
///
/// This function returns as quickly as possible; it does not wait for the read
/// to complete. On a successful return, this work will continue in the
/// background. If the work begins, even failure is asynchronous: a failing
/// return value from this function only means the work couldn't start at all.
///
/// The data is allocated with a zero byte at the end (null terminated) for
/// convenience. This extra byte is not included in SDL_AsyncIOOutcome's
/// bytes_transferred value.
///
/// This function will allocate the buffer to contain the file. It must be
/// deallocated by calling SDL_free() on SDL_AsyncIOOutcome's buffer field
/// after completion.
///
/// An SDL_AsyncIOQueue must be specified. The newly-created task will be added
/// to it when it completes its work.
///
/// \param file the path to read all available data from.
/// \param queue a queue to add the new SDL_AsyncIO to.
/// \param userdata an app-defined pointer that will be provided with the task
/// results.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LoadFile_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_LoadFileAsync(const char *file, SDL_AsyncIOQueue *queue, void *userdata)
/// ```
/// {@category asyncio}
bool sdlLoadFileAsync(
  String? file,
  Pointer<SdlAsyncIoQueue> queue,
  Pointer<NativeType> userdata,
) {
  final sdlLoadFileAsyncLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<Utf8> file,
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<NativeType> userdata,
        ),
        int Function(
          Pointer<Utf8> file,
          Pointer<SdlAsyncIoQueue> queue,
          Pointer<NativeType> userdata,
        )
      >('SDL_LoadFileAsync');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result =
      sdlLoadFileAsyncLookupFunction(filePointer, queue, userdata) == 1;
  calloc.free(filePointer);
  return result;
}
