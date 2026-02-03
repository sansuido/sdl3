// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
part of '../sdl.dart';

///
/// Create a new mutex.
///
/// All newly-created mutexes begin in the _unlocked_ state.
///
/// Calls to SDL_LockMutex() will not return while the mutex is locked by
/// another thread. See SDL_TryLockMutex() to attempt to lock without blocking.
///
/// SDL mutexes are reentrant.
///
/// \returns the initialized and unlocked mutex or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DestroyMutex
/// \sa SDL_LockMutex
/// \sa SDL_TryLockMutex
/// \sa SDL_UnlockMutex
///
/// ```c
/// extern SDL_DECLSPEC SDL_Mutex * SDLCALL SDL_CreateMutex(void)
/// ```
/// {@category mutex}
Pointer<SdlMutex> sdlCreateMutex() {
  final sdlCreateMutexLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlMutex> Function(),
        Pointer<SdlMutex> Function()
      >('SDL_CreateMutex');
  return sdlCreateMutexLookupFunction();
}

///
/// Lock the mutex.
///
/// This will block until the mutex is available, which is to say it is in the
/// unlocked state and the OS has chosen the caller as the next thread to lock
/// it. Of all threads waiting to lock the mutex, only one may do so at a time.
///
/// It is legal for the owning thread to lock an already-locked mutex. It must
/// unlock it the same number of times before it is actually made available for
/// other threads in the system (this is known as a "recursive mutex").
///
/// This function does not fail; if mutex is NULL, it will return immediately
/// having locked nothing. If the mutex is valid, this function will always
/// block until it can lock the mutex, and return with it locked.
///
/// \param mutex the mutex to lock.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_TryLockMutex
/// \sa SDL_UnlockMutex
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LockMutex(SDL_Mutex *mutex) SDL_ACQUIRE(mutex)
/// ```
/// {@category mutex}
void sdlLockMutex(Pointer<SdlMutex> mutex) {
  final sdlLockMutexLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlMutex> mutex),
        void Function(Pointer<SdlMutex> mutex)
      >('SDL_LockMutex');
  return sdlLockMutexLookupFunction(mutex);
}

///
/// Try to lock a mutex without blocking.
///
/// This works just like SDL_LockMutex(), but if the mutex is not available,
/// this function returns false immediately.
///
/// This technique is useful if you need exclusive access to a resource but
/// don't want to wait for it, and will return to it to try again later.
///
/// This function returns true if passed a NULL mutex.
///
/// \param mutex the mutex to try to lock.
/// \returns true on success, false if the mutex would block.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockMutex
/// \sa SDL_UnlockMutex
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_TryLockMutex(SDL_Mutex *mutex) SDL_TRY_ACQUIRE(true, mutex)
/// ```
/// {@category mutex}
bool sdlTryLockMutex(Pointer<SdlMutex> mutex) {
  final sdlTryLockMutexLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlMutex> mutex),
        int Function(Pointer<SdlMutex> mutex)
      >('SDL_TryLockMutex');
  return sdlTryLockMutexLookupFunction(mutex) == 1;
}

///
/// Unlock the mutex.
///
/// It is legal for the owning thread to lock an already-locked mutex. It must
/// unlock it the same number of times before it is actually made available for
/// other threads in the system (this is known as a "recursive mutex").
///
/// It is illegal to unlock a mutex that has not been locked by the current
/// thread, and doing so results in undefined behavior.
///
/// \param mutex the mutex to unlock.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockMutex
/// \sa SDL_TryLockMutex
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnlockMutex(SDL_Mutex *mutex) SDL_RELEASE(mutex)
/// ```
/// {@category mutex}
void sdlUnlockMutex(Pointer<SdlMutex> mutex) {
  final sdlUnlockMutexLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlMutex> mutex),
        void Function(Pointer<SdlMutex> mutex)
      >('SDL_UnlockMutex');
  return sdlUnlockMutexLookupFunction(mutex);
}

///
/// Destroy a mutex created with SDL_CreateMutex().
///
/// This function must be called on any mutex that is no longer needed. Failure
/// to destroy a mutex will result in a system memory or resource leak. While
/// it is safe to destroy a mutex that is _unlocked_, it is not safe to attempt
/// to destroy a locked mutex, and may result in undefined behavior depending
/// on the platform.
///
/// \param mutex the mutex to destroy.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateMutex
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyMutex(SDL_Mutex *mutex)
/// ```
/// {@category mutex}
void sdlDestroyMutex(Pointer<SdlMutex> mutex) {
  final sdlDestroyMutexLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlMutex> mutex),
        void Function(Pointer<SdlMutex> mutex)
      >('SDL_DestroyMutex');
  return sdlDestroyMutexLookupFunction(mutex);
}

///
/// Create a new read/write lock.
///
/// A read/write lock is useful for situations where you have multiple threads
/// trying to access a resource that is rarely updated. All threads requesting
/// a read-only lock will be allowed to run in parallel; if a thread requests a
/// write lock, it will be provided exclusive access. This makes it safe for
/// multiple threads to use a resource at the same time if they promise not to
/// change it, and when it has to be changed, the rwlock will serve as a
/// gateway to make sure those changes can be made safely.
///
/// In the right situation, a rwlock can be more efficient than a mutex, which
/// only lets a single thread proceed at a time, even if it won't be modifying
/// the data.
///
/// All newly-created read/write locks begin in the _unlocked_ state.
///
/// Calls to SDL_LockRWLockForReading() and SDL_LockRWLockForWriting will not
/// return while the rwlock is locked _for writing_ by another thread. See
/// SDL_TryLockRWLockForReading() and SDL_TryLockRWLockForWriting() to attempt
/// to lock without blocking.
///
/// SDL read/write locks are only recursive for read-only locks! They are not
/// guaranteed to be fair, or provide access in a FIFO manner! They are not
/// guaranteed to favor writers. You may not lock a rwlock for both read-only
/// and write access at the same time from the same thread (so you can't
/// promote your read-only lock to a write lock without unlocking first).
///
/// \returns the initialized and unlocked read/write lock or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DestroyRWLock
/// \sa SDL_LockRWLockForReading
/// \sa SDL_LockRWLockForWriting
/// \sa SDL_TryLockRWLockForReading
/// \sa SDL_TryLockRWLockForWriting
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern SDL_DECLSPEC SDL_RWLock * SDLCALL SDL_CreateRWLock(void)
/// ```
/// {@category mutex}
Pointer<SdlRwLock> sdlCreateRwLock() {
  final sdlCreateRwLockLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlRwLock> Function(),
        Pointer<SdlRwLock> Function()
      >('SDL_CreateRWLock');
  return sdlCreateRwLockLookupFunction();
}

///
/// Lock the read/write lock for _read only_ operations.
///
/// This will block until the rwlock is available, which is to say it is not
/// locked for writing by any other thread. Of all threads waiting to lock the
/// rwlock, all may do so at the same time as long as they are requesting
/// read-only access; if a thread wants to lock for writing, only one may do so
/// at a time, and no other threads, read-only or not, may hold the lock at the
/// same time.
///
/// It is legal for the owning thread to lock an already-locked rwlock for
/// reading. It must unlock it the same number of times before it is actually
/// made available for other threads in the system (this is known as a
/// "recursive rwlock").
///
/// Note that locking for writing is not recursive (this is only available to
/// read-only locks).
///
/// It is illegal to request a read-only lock from a thread that already holds
/// the write lock. Doing so results in undefined behavior. Unlock the write
/// lock before requesting a read-only lock. (But, of course, if you have the
/// write lock, you don't need further locks to read in any case.)
///
/// This function does not fail; if rwlock is NULL, it will return immediately
/// having locked nothing. If the rwlock is valid, this function will always
/// block until it can lock the mutex, and return with it locked.
///
/// \param rwlock the read/write lock to lock.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockRWLockForWriting
/// \sa SDL_TryLockRWLockForReading
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LockRWLockForReading(SDL_RWLock *rwlock) SDL_ACQUIRE_SHARED(rwlock)
/// ```
/// {@category mutex}
void sdlLockRwLockForReading(Pointer<SdlRwLock> rwlock) {
  final sdlLockRwLockForReadingLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlRwLock> rwlock),
        void Function(Pointer<SdlRwLock> rwlock)
      >('SDL_LockRWLockForReading');
  return sdlLockRwLockForReadingLookupFunction(rwlock);
}

///
/// Lock the read/write lock for _write_ operations.
///
/// This will block until the rwlock is available, which is to say it is not
/// locked for reading or writing by any other thread. Only one thread may hold
/// the lock when it requests write access; all other threads, whether they
/// also want to write or only want read-only access, must wait until the
/// writer thread has released the lock.
///
/// It is illegal for the owning thread to lock an already-locked rwlock for
/// writing (read-only may be locked recursively, writing can not). Doing so
/// results in undefined behavior.
///
/// It is illegal to request a write lock from a thread that already holds a
/// read-only lock. Doing so results in undefined behavior. Unlock the
/// read-only lock before requesting a write lock.
///
/// This function does not fail; if rwlock is NULL, it will return immediately
/// having locked nothing. If the rwlock is valid, this function will always
/// block until it can lock the mutex, and return with it locked.
///
/// \param rwlock the read/write lock to lock.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockRWLockForReading
/// \sa SDL_TryLockRWLockForWriting
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LockRWLockForWriting(SDL_RWLock *rwlock) SDL_ACQUIRE(rwlock)
/// ```
/// {@category mutex}
void sdlLockRwLockForWriting(Pointer<SdlRwLock> rwlock) {
  final sdlLockRwLockForWritingLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlRwLock> rwlock),
        void Function(Pointer<SdlRwLock> rwlock)
      >('SDL_LockRWLockForWriting');
  return sdlLockRwLockForWritingLookupFunction(rwlock);
}

///
/// Try to lock a read/write lock _for reading_ without blocking.
///
/// This works just like SDL_LockRWLockForReading(), but if the rwlock is not
/// available, then this function returns false immediately.
///
/// This technique is useful if you need access to a resource but don't want to
/// wait for it, and will return to it to try again later.
///
/// Trying to lock for read-only access can succeed if other threads are
/// holding read-only locks, as this won't prevent access.
///
/// This function returns true if passed a NULL rwlock.
///
/// \param rwlock the rwlock to try to lock.
/// \returns true on success, false if the lock would block.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockRWLockForReading
/// \sa SDL_TryLockRWLockForWriting
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_TryLockRWLockForReading(SDL_RWLock *rwlock) SDL_TRY_ACQUIRE_SHARED(true, rwlock)
/// ```
/// {@category mutex}
bool sdlTryLockRwLockForReading(Pointer<SdlRwLock> rwlock) {
  final sdlTryLockRwLockForReadingLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlRwLock> rwlock),
        int Function(Pointer<SdlRwLock> rwlock)
      >('SDL_TryLockRWLockForReading');
  return sdlTryLockRwLockForReadingLookupFunction(rwlock) == 1;
}

///
/// Try to lock a read/write lock _for writing_ without blocking.
///
/// This works just like SDL_LockRWLockForWriting(), but if the rwlock is not
/// available, then this function returns false immediately.
///
/// This technique is useful if you need exclusive access to a resource but
/// don't want to wait for it, and will return to it to try again later.
///
/// It is illegal for the owning thread to lock an already-locked rwlock for
/// writing (read-only may be locked recursively, writing can not). Doing so
/// results in undefined behavior.
///
/// It is illegal to request a write lock from a thread that already holds a
/// read-only lock. Doing so results in undefined behavior. Unlock the
/// read-only lock before requesting a write lock.
///
/// This function returns true if passed a NULL rwlock.
///
/// \param rwlock the rwlock to try to lock.
/// \returns true on success, false if the lock would block.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockRWLockForWriting
/// \sa SDL_TryLockRWLockForReading
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_TryLockRWLockForWriting(SDL_RWLock *rwlock) SDL_TRY_ACQUIRE(true, rwlock)
/// ```
/// {@category mutex}
bool sdlTryLockRwLockForWriting(Pointer<SdlRwLock> rwlock) {
  final sdlTryLockRwLockForWritingLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlRwLock> rwlock),
        int Function(Pointer<SdlRwLock> rwlock)
      >('SDL_TryLockRWLockForWriting');
  return sdlTryLockRwLockForWritingLookupFunction(rwlock) == 1;
}

///
/// Unlock the read/write lock.
///
/// Use this function to unlock the rwlock, whether it was locked for read-only
/// or write operations.
///
/// It is legal for the owning thread to lock an already-locked read-only lock.
/// It must unlock it the same number of times before it is actually made
/// available for other threads in the system (this is known as a "recursive
/// rwlock").
///
/// It is illegal to unlock a rwlock that has not been locked by the current
/// thread, and doing so results in undefined behavior.
///
/// \param rwlock the rwlock to unlock.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockRWLockForReading
/// \sa SDL_LockRWLockForWriting
/// \sa SDL_TryLockRWLockForReading
/// \sa SDL_TryLockRWLockForWriting
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnlockRWLock(SDL_RWLock *rwlock) SDL_RELEASE_GENERIC(rwlock)
/// ```
/// {@category mutex}
void sdlUnlockRwLock(Pointer<SdlRwLock> rwlock) {
  final sdlUnlockRwLockLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlRwLock> rwlock),
        void Function(Pointer<SdlRwLock> rwlock)
      >('SDL_UnlockRWLock');
  return sdlUnlockRwLockLookupFunction(rwlock);
}

///
/// Destroy a read/write lock created with SDL_CreateRWLock().
///
/// This function must be called on any read/write lock that is no longer
/// needed. Failure to destroy a rwlock will result in a system memory or
/// resource leak. While it is safe to destroy a rwlock that is _unlocked_, it
/// is not safe to attempt to destroy a locked rwlock, and may result in
/// undefined behavior depending on the platform.
///
/// \param rwlock the rwlock to destroy.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateRWLock
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyRWLock(SDL_RWLock *rwlock)
/// ```
/// {@category mutex}
void sdlDestroyRwLock(Pointer<SdlRwLock> rwlock) {
  final sdlDestroyRwLockLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlRwLock> rwlock),
        void Function(Pointer<SdlRwLock> rwlock)
      >('SDL_DestroyRWLock');
  return sdlDestroyRwLockLookupFunction(rwlock);
}

///
/// Create a semaphore.
///
/// This function creates a new semaphore and initializes it with the value
/// `initial_value`. Each wait operation on the semaphore will atomically
/// decrement the semaphore value and potentially block if the semaphore value
/// is 0. Each post operation will atomically increment the semaphore value and
/// wake waiting threads and allow them to retry the wait operation.
///
/// \param initial_value the starting value of the semaphore.
/// \returns a new semaphore or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DestroySemaphore
/// \sa SDL_SignalSemaphore
/// \sa SDL_TryWaitSemaphore
/// \sa SDL_GetSemaphoreValue
/// \sa SDL_WaitSemaphore
/// \sa SDL_WaitSemaphoreTimeout
///
/// ```c
/// extern SDL_DECLSPEC SDL_Semaphore * SDLCALL SDL_CreateSemaphore(Uint32 initial_value)
/// ```
/// {@category mutex}
Pointer<SdlSemaphore> sdlCreateSemaphore(int initialValue) {
  final sdlCreateSemaphoreLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSemaphore> Function(Uint32 initialValue),
        Pointer<SdlSemaphore> Function(int initialValue)
      >('SDL_CreateSemaphore');
  return sdlCreateSemaphoreLookupFunction(initialValue);
}

///
/// Destroy a semaphore.
///
/// It is not safe to destroy a semaphore if there are threads currently
/// waiting on it.
///
/// \param sem the semaphore to destroy.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateSemaphore
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroySemaphore(SDL_Semaphore *sem)
/// ```
/// {@category mutex}
void sdlDestroySemaphore(Pointer<SdlSemaphore> sem) {
  final sdlDestroySemaphoreLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlSemaphore> sem),
        void Function(Pointer<SdlSemaphore> sem)
      >('SDL_DestroySemaphore');
  return sdlDestroySemaphoreLookupFunction(sem);
}

///
/// Wait until a semaphore has a positive value and then decrements it.
///
/// This function suspends the calling thread until the semaphore pointed to by
/// `sem` has a positive value, and then atomically decrement the semaphore
/// value.
///
/// This function is the equivalent of calling SDL_WaitSemaphoreTimeout() with
/// a time length of -1.
///
/// \param sem the semaphore wait on.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SignalSemaphore
/// \sa SDL_TryWaitSemaphore
/// \sa SDL_WaitSemaphoreTimeout
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_WaitSemaphore(SDL_Semaphore *sem)
/// ```
/// {@category mutex}
void sdlWaitSemaphore(Pointer<SdlSemaphore> sem) {
  final sdlWaitSemaphoreLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlSemaphore> sem),
        void Function(Pointer<SdlSemaphore> sem)
      >('SDL_WaitSemaphore');
  return sdlWaitSemaphoreLookupFunction(sem);
}

///
/// See if a semaphore has a positive value and decrement it if it does.
///
/// This function checks to see if the semaphore pointed to by `sem` has a
/// positive value and atomically decrements the semaphore value if it does. If
/// the semaphore doesn't have a positive value, the function immediately
/// returns false.
///
/// \param sem the semaphore to wait on.
/// \returns true if the wait succeeds, false if the wait would block.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SignalSemaphore
/// \sa SDL_WaitSemaphore
/// \sa SDL_WaitSemaphoreTimeout
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_TryWaitSemaphore(SDL_Semaphore *sem)
/// ```
/// {@category mutex}
bool sdlTryWaitSemaphore(Pointer<SdlSemaphore> sem) {
  final sdlTryWaitSemaphoreLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSemaphore> sem),
        int Function(Pointer<SdlSemaphore> sem)
      >('SDL_TryWaitSemaphore');
  return sdlTryWaitSemaphoreLookupFunction(sem) == 1;
}

///
/// Wait until a semaphore has a positive value and then decrements it.
///
/// This function suspends the calling thread until either the semaphore
/// pointed to by `sem` has a positive value or the specified time has elapsed.
/// If the call is successful it will atomically decrement the semaphore value.
///
/// \param sem the semaphore to wait on.
/// \param timeoutMS the length of the timeout, in milliseconds, or -1 to wait
/// indefinitely.
/// \returns true if the wait succeeds or false if the wait times out.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SignalSemaphore
/// \sa SDL_TryWaitSemaphore
/// \sa SDL_WaitSemaphore
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitSemaphoreTimeout(SDL_Semaphore *sem, Sint32 timeoutMS)
/// ```
/// {@category mutex}
bool sdlWaitSemaphoreTimeout(Pointer<SdlSemaphore> sem, int timeoutMs) {
  final sdlWaitSemaphoreTimeoutLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlSemaphore> sem, Int32 timeoutMs),
        int Function(Pointer<SdlSemaphore> sem, int timeoutMs)
      >('SDL_WaitSemaphoreTimeout');
  return sdlWaitSemaphoreTimeoutLookupFunction(sem, timeoutMs) == 1;
}

///
/// Atomically increment a semaphore's value and wake waiting threads.
///
/// \param sem the semaphore to increment.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_TryWaitSemaphore
/// \sa SDL_WaitSemaphore
/// \sa SDL_WaitSemaphoreTimeout
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SignalSemaphore(SDL_Semaphore *sem)
/// ```
/// {@category mutex}
void sdlSignalSemaphore(Pointer<SdlSemaphore> sem) {
  final sdlSignalSemaphoreLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlSemaphore> sem),
        void Function(Pointer<SdlSemaphore> sem)
      >('SDL_SignalSemaphore');
  return sdlSignalSemaphoreLookupFunction(sem);
}

///
/// Get the current value of a semaphore.
///
/// \param sem the semaphore to query.
/// \returns the current value of the semaphore.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GetSemaphoreValue(SDL_Semaphore *sem)
/// ```
/// {@category mutex}
int sdlGetSemaphoreValue(Pointer<SdlSemaphore> sem) {
  final sdlGetSemaphoreValueLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlSemaphore> sem),
        int Function(Pointer<SdlSemaphore> sem)
      >('SDL_GetSemaphoreValue');
  return sdlGetSemaphoreValueLookupFunction(sem);
}

///
/// Create a condition variable.
///
/// \returns a new condition variable or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_BroadcastCondition
/// \sa SDL_SignalCondition
/// \sa SDL_WaitCondition
/// \sa SDL_WaitConditionTimeout
/// \sa SDL_DestroyCondition
///
/// ```c
/// extern SDL_DECLSPEC SDL_Condition * SDLCALL SDL_CreateCondition(void)
/// ```
/// {@category mutex}
Pointer<SdlCondition> sdlCreateCondition() {
  final sdlCreateConditionLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlCondition> Function(),
        Pointer<SdlCondition> Function()
      >('SDL_CreateCondition');
  return sdlCreateConditionLookupFunction();
}

///
/// Destroy a condition variable.
///
/// \param cond the condition variable to destroy.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateCondition
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyCondition(SDL_Condition *cond)
/// ```
/// {@category mutex}
void sdlDestroyCondition(Pointer<SdlCondition> cond) {
  final sdlDestroyConditionLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlCondition> cond),
        void Function(Pointer<SdlCondition> cond)
      >('SDL_DestroyCondition');
  return sdlDestroyConditionLookupFunction(cond);
}

///
/// Restart one of the threads that are waiting on the condition variable.
///
/// \param cond the condition variable to signal.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_BroadcastCondition
/// \sa SDL_WaitCondition
/// \sa SDL_WaitConditionTimeout
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SignalCondition(SDL_Condition *cond)
/// ```
/// {@category mutex}
void sdlSignalCondition(Pointer<SdlCondition> cond) {
  final sdlSignalConditionLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlCondition> cond),
        void Function(Pointer<SdlCondition> cond)
      >('SDL_SignalCondition');
  return sdlSignalConditionLookupFunction(cond);
}

///
/// Restart all threads that are waiting on the condition variable.
///
/// \param cond the condition variable to signal.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SignalCondition
/// \sa SDL_WaitCondition
/// \sa SDL_WaitConditionTimeout
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_BroadcastCondition(SDL_Condition *cond)
/// ```
/// {@category mutex}
void sdlBroadcastCondition(Pointer<SdlCondition> cond) {
  final sdlBroadcastConditionLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlCondition> cond),
        void Function(Pointer<SdlCondition> cond)
      >('SDL_BroadcastCondition');
  return sdlBroadcastConditionLookupFunction(cond);
}

///
/// Wait until a condition variable is signaled.
///
/// This function unlocks the specified `mutex` and waits for another thread to
/// call SDL_SignalCondition() or SDL_BroadcastCondition() on the condition
/// variable `cond`. Once the condition variable is signaled, the mutex is
/// re-locked and the function returns.
///
/// The mutex must be locked before calling this function. Locking the mutex
/// recursively (more than once) is not supported and leads to undefined
/// behavior.
///
/// This function is the equivalent of calling SDL_WaitConditionTimeout() with
/// a time length of -1.
///
/// \param cond the condition variable to wait on.
/// \param mutex the mutex used to coordinate thread access.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_BroadcastCondition
/// \sa SDL_SignalCondition
/// \sa SDL_WaitConditionTimeout
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_WaitCondition(SDL_Condition *cond, SDL_Mutex *mutex)
/// ```
/// {@category mutex}
void sdlWaitCondition(Pointer<SdlCondition> cond, Pointer<SdlMutex> mutex) {
  final sdlWaitConditionLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlCondition> cond, Pointer<SdlMutex> mutex),
        void Function(Pointer<SdlCondition> cond, Pointer<SdlMutex> mutex)
      >('SDL_WaitCondition');
  return sdlWaitConditionLookupFunction(cond, mutex);
}

///
/// Wait until a condition variable is signaled or a certain time has passed.
///
/// This function unlocks the specified `mutex` and waits for another thread to
/// call SDL_SignalCondition() or SDL_BroadcastCondition() on the condition
/// variable `cond`, or for the specified time to elapse. Once the condition
/// variable is signaled or the time elapsed, the mutex is re-locked and the
/// function returns.
///
/// The mutex must be locked before calling this function. Locking the mutex
/// recursively (more than once) is not supported and leads to undefined
/// behavior.
///
/// \param cond the condition variable to wait on.
/// \param mutex the mutex used to coordinate thread access.
/// \param timeoutMS the maximum time to wait, in milliseconds, or -1 to wait
/// indefinitely.
/// \returns true if the condition variable is signaled, false if the condition
/// is not signaled in the allotted time.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_BroadcastCondition
/// \sa SDL_SignalCondition
/// \sa SDL_WaitCondition
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_WaitConditionTimeout(SDL_Condition *cond, SDL_Mutex *mutex, Sint32 timeoutMS)
/// ```
/// {@category mutex}
bool sdlWaitConditionTimeout(
  Pointer<SdlCondition> cond,
  Pointer<SdlMutex> mutex,
  int timeoutMs,
) {
  final sdlWaitConditionTimeoutLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlCondition> cond,
          Pointer<SdlMutex> mutex,
          Int32 timeoutMs,
        ),
        int Function(
          Pointer<SdlCondition> cond,
          Pointer<SdlMutex> mutex,
          int timeoutMs,
        )
      >('SDL_WaitConditionTimeout');
  return sdlWaitConditionTimeoutLookupFunction(cond, mutex, timeoutMs) == 1;
}

///
/// Return whether initialization should be done.
///
/// This function checks the passed in state and if initialization should be
/// done, sets the status to `SDL_INIT_STATUS_INITIALIZING` and returns true.
/// If another thread is already modifying this state, it will wait until
/// that's done before returning.
///
/// If this function returns true, the calling code must call
/// SDL_SetInitialized() to complete the initialization.
///
/// \param state the initialization state to check.
/// \returns true if initialization needs to be done, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetInitialized
/// \sa SDL_ShouldQuit
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ShouldInit(SDL_InitState *state)
/// ```
/// {@category mutex}
bool sdlShouldInit(Pointer<SdlInitState> state) {
  final sdlShouldInitLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlInitState> state),
        int Function(Pointer<SdlInitState> state)
      >('SDL_ShouldInit');
  return sdlShouldInitLookupFunction(state) == 1;
}

///
/// Return whether cleanup should be done.
///
/// This function checks the passed in state and if cleanup should be done,
/// sets the status to `SDL_INIT_STATUS_UNINITIALIZING` and returns true.
///
/// If this function returns true, the calling code must call
/// SDL_SetInitialized() to complete the cleanup.
///
/// \param state the initialization state to check.
/// \returns true if cleanup needs to be done, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetInitialized
/// \sa SDL_ShouldInit
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ShouldQuit(SDL_InitState *state)
/// ```
/// {@category mutex}
bool sdlShouldQuit(Pointer<SdlInitState> state) {
  final sdlShouldQuitLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(Pointer<SdlInitState> state),
        int Function(Pointer<SdlInitState> state)
      >('SDL_ShouldQuit');
  return sdlShouldQuitLookupFunction(state) == 1;
}

///
/// Finish an initialization state transition.
///
/// This function sets the status of the passed in state to
/// `SDL_INIT_STATUS_INITIALIZED` or `SDL_INIT_STATUS_UNINITIALIZED` and allows
/// any threads waiting for the status to proceed.
///
/// \param state the initialization state to check.
/// \param initialized the new initialization state.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ShouldInit
/// \sa SDL_ShouldQuit
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetInitialized(SDL_InitState *state, bool initialized)
/// ```
/// {@category mutex}
void sdlSetInitialized(Pointer<SdlInitState> state, bool initialized) {
  final sdlSetInitializedLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlInitState> state, Uint8 initialized),
        void Function(Pointer<SdlInitState> state, int initialized)
      >('SDL_SetInitialized');
  return sdlSetInitializedLookupFunction(state, initialized ? 1 : 0);
}
