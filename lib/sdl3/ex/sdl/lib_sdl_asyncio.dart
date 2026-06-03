part of '../../sdl.dart';

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
bool sdlxGetAsyncIoResult(
  Pointer<SdlAsyncIoQueue> queue,
  SdlxAsyncIoOutcome outcome,
) {
  final outcomePointer = outcome.calloc();
  final result = sdlGetAsyncIoResult(queue, outcomePointer);
  if (result) {
    outcome.loadFromPointer(outcomePointer);
  }
  outcomePointer.callocFree();
  return result;
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
bool sdlxWaitAsyncIoResult(
  Pointer<SdlAsyncIoQueue> queue,
  SdlxAsyncIoOutcome outcome,
  int timeoutMS,
) {
  final outcomePointer = outcome.calloc();
  final result = sdlWaitAsyncIoResult(queue, outcomePointer, timeoutMS);
  if (result) {
    outcome.loadFromPointer(outcomePointer);
  }
  outcomePointer.callocFree();
  return result;
}
