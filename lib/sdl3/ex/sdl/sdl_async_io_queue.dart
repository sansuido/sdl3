part of '../../sdl.dart';

extension SdlAsyncIoQueueEx on SdlAsyncIoQueue {
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
  static Pointer<SdlAsyncIoQueue> create() => sdlCreateAsyncIoQueue();
}

extension SdlAsyncIoQueuePointerEx on Pointer<SdlAsyncIoQueue> {
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
  void destroy() => sdlDestroyAsyncIoQueue(this);

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
  bool getResult(SdlxAsyncIoOutcome outcome) =>
      sdlxGetAsyncIoResult(this, outcome);

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
  bool waitResult(SdlxAsyncIoOutcome outcome, int timeoutMS) =>
      sdlWaitAsyncIoResult(this, outcome.calloc(), timeoutMS);

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
  void signal() => sdlSignalAsyncIoQueue(this);

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
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.2.0.
  ///
  /// \sa SDL_LoadFile_IO
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_LoadFileAsync(const char *file, SDL_AsyncIOQueue *queue, void *userdata)
  /// ```
  /// {@category asyncio}
  bool loadFile(String file, Pointer<Void> userdata) =>
      sdlLoadFileAsync(file, this, userdata);
}
