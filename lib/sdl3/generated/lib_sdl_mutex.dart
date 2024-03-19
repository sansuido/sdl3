// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

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
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroyMutex
/// \sa SDL_LockMutex
/// \sa SDL_TryLockMutex
/// \sa SDL_UnlockMutex
///
/// ```c
/// extern DECLSPEC SDL_Mutex *SDLCALL SDL_CreateMutex(void)
/// ```
Pointer<SdlMutex> sdlCreateMutex() {
  final sdlCreateMutexLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlMutex> Function(),
      Pointer<SdlMutex> Function()>('SDL_CreateMutex');
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
/// \param mutex the mutex to lock
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_TryLockMutex
/// \sa SDL_UnlockMutex
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_LockMutex(SDL_Mutex *mutex) SDL_ACQUIRE(mutex)
/// ```
void sdlLockMutex(Pointer<NativeType> arg0) {
  final sdlLockMutexLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> arg0),
      void Function(Pointer<NativeType> arg0)>('SDL_LockMutex');
  return sdlLockMutexLookupFunction(arg0);
}

///
/// Try to lock a mutex without blocking.
///
/// This works just like SDL_LockMutex(), but if the mutex is not available,
/// this function returns `SDL_MUTEX_TIMEDOUT` immediately.
///
/// This technique is useful if you need exclusive access to a resource but
/// don't want to wait for it, and will return to it to try again later.
///
/// This function does not fail; if mutex is NULL, it will return 0 immediately
/// having locked nothing. If the mutex is valid, this function will always
/// either lock the mutex and return 0, or return SDL_MUTEX_TIMEOUT and lock
/// nothing.
///
/// \param mutex the mutex to try to lock
/// \returns 0 or `SDL_MUTEX_TIMEDOUT`
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockMutex
/// \sa SDL_UnlockMutex
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_TryLockMutex(SDL_Mutex *mutex) SDL_TRY_ACQUIRE(0, mutex)
/// ```
int sdlTryLockMutex(Pointer<NativeType> arg0, Pointer<NativeType> arg1) {
  final sdlTryLockMutexLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<NativeType> arg0, Pointer<NativeType> arg1),
      int Function(Pointer<NativeType> arg0,
          Pointer<NativeType> arg1)>('SDL_TryLockMutex');
  return sdlTryLockMutexLookupFunction(arg0, arg1);
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
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockMutex
/// \sa SDL_TryLockMutex
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_UnlockMutex(SDL_Mutex *mutex) SDL_RELEASE(mutex)
/// ```
void sdlUnlockMutex(Pointer<NativeType> arg0) {
  final sdlUnlockMutexLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> arg0),
      void Function(Pointer<NativeType> arg0)>('SDL_UnlockMutex');
  return sdlUnlockMutexLookupFunction(arg0);
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
/// \param mutex the mutex to destroy
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateMutex
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroyMutex(SDL_Mutex *mutex)
/// ```
void sdlDestroyMutex(Pointer<SdlMutex> mutex) {
  final sdlDestroyMutexLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlMutex> mutex),
      void Function(Pointer<SdlMutex> mutex)>('SDL_DestroyMutex');
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
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroyRWLock
/// \sa SDL_LockRWLockForReading
/// \sa SDL_LockRWLockForWriting
/// \sa SDL_TryLockRWLockForReading
/// \sa SDL_TryLockRWLockForWriting
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern DECLSPEC SDL_RWLock *SDLCALL SDL_CreateRWLock(void)
/// ```
Pointer<SdlRwLock> sdlCreateRwLock() {
  final sdlCreateRwLockLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlRwLock> Function(),
      Pointer<SdlRwLock> Function()>('SDL_CreateRWLock');
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
/// \param rwlock the read/write lock to lock
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockRWLockForWriting
/// \sa SDL_TryLockRWLockForReading
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_LockRWLockForReading(SDL_RWLock *rwlock) SDL_ACQUIRE_SHARED(rwlock)
/// ```
void sdlLockRwLockForReading(Pointer<NativeType> arg0) {
  final sdlLockRwLockForReadingLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> arg0),
      void Function(Pointer<NativeType> arg0)>('SDL_LockRWLockForReading');
  return sdlLockRwLockForReadingLookupFunction(arg0);
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
/// \param rwlock the read/write lock to lock
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockRWLockForReading
/// \sa SDL_TryLockRWLockForWriting
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_LockRWLockForWriting(SDL_RWLock *rwlock) SDL_ACQUIRE(rwlock)
/// ```
void sdlLockRwLockForWriting(Pointer<NativeType> arg0) {
  final sdlLockRwLockForWritingLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> arg0),
      void Function(Pointer<NativeType> arg0)>('SDL_LockRWLockForWriting');
  return sdlLockRwLockForWritingLookupFunction(arg0);
}

///
/// Try to lock a read/write lock _for reading_ without blocking.
///
/// This works just like SDL_LockRWLockForReading(), but if the rwlock is not
/// available, then this function returns `SDL_RWLOCK_TIMEDOUT` immediately.
///
/// This technique is useful if you need access to a resource but don't want to
/// wait for it, and will return to it to try again later.
///
/// Trying to lock for read-only access can succeed if other threads are
/// holding read-only locks, as this won't prevent access.
///
/// This function does not fail; if rwlock is NULL, it will return 0
/// immediately having locked nothing. If rwlock is valid, this function will
/// always either lock the rwlock and return 0, or return SDL_RWLOCK_TIMEOUT
/// and lock nothing.
///
/// \param rwlock the rwlock to try to lock
/// \returns 0 or `SDL_RWLOCK_TIMEDOUT`
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockRWLockForReading
/// \sa SDL_TryLockRWLockForWriting
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_TryLockRWLockForReading(SDL_RWLock *rwlock) SDL_TRY_ACQUIRE_SHARED(0, rwlock)
/// ```
int sdlTryLockRwLockForReading(
    Pointer<NativeType> arg0, Pointer<NativeType> arg1) {
  final sdlTryLockRwLockForReadingLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<NativeType> arg0, Pointer<NativeType> arg1),
      int Function(Pointer<NativeType> arg0,
          Pointer<NativeType> arg1)>('SDL_TryLockRWLockForReading');
  return sdlTryLockRwLockForReadingLookupFunction(arg0, arg1);
}

///
/// Try to lock a read/write lock _for writing_ without blocking.
///
/// This works just like SDL_LockRWLockForWriting(), but if the rwlock is not
/// available, this function returns `SDL_RWLOCK_TIMEDOUT` immediately.
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
/// This function does not fail; if rwlock is NULL, it will return 0
/// immediately having locked nothing. If rwlock is valid, this function will
/// always either lock the rwlock and return 0, or return SDL_RWLOCK_TIMEOUT
/// and lock nothing.
///
/// \param rwlock the rwlock to try to lock
/// \returns 0 or `SDL_RWLOCK_TIMEDOUT`
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockRWLockForWriting
/// \sa SDL_TryLockRWLockForReading
/// \sa SDL_UnlockRWLock
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_TryLockRWLockForWriting(SDL_RWLock *rwlock) SDL_TRY_ACQUIRE(0, rwlock)
/// ```
int sdlTryLockRwLockForWriting(
    Pointer<NativeType> arg0, Pointer<NativeType> arg1) {
  final sdlTryLockRwLockForWritingLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<NativeType> arg0, Pointer<NativeType> arg1),
      int Function(Pointer<NativeType> arg0,
          Pointer<NativeType> arg1)>('SDL_TryLockRWLockForWriting');
  return sdlTryLockRwLockForWritingLookupFunction(arg0, arg1);
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
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockRWLockForReading
/// \sa SDL_LockRWLockForWriting
/// \sa SDL_TryLockRWLockForReading
/// \sa SDL_TryLockRWLockForWriting
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_UnlockRWLock(SDL_RWLock *rwlock) SDL_RELEASE_GENERIC(rwlock)
/// ```
void sdlUnlockRwLock(Pointer<NativeType> arg0) {
  final sdlUnlockRwLockLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> arg0),
      void Function(Pointer<NativeType> arg0)>('SDL_UnlockRWLock');
  return sdlUnlockRwLockLookupFunction(arg0);
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
/// \param rwlock the rwlock to destroy
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateRWLock
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroyRWLock(SDL_RWLock *rwlock)
/// ```
void sdlDestroyRwLock(Pointer<SdlRwLock> rwlock) {
  final sdlDestroyRwLockLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlRwLock> rwlock),
      void Function(Pointer<SdlRwLock> rwlock)>('SDL_DestroyRWLock');
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
/// \param initial_value the starting value of the semaphore
/// \returns a new semaphore or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_DestroySemaphore
/// \sa SDL_PostSemaphore
/// \sa SDL_TryWaitSemaphore
/// \sa SDL_GetSemaphoreValue
/// \sa SDL_WaitSemaphore
/// \sa SDL_WaitSemaphoreTimeout
///
/// ```c
/// extern DECLSPEC SDL_Semaphore *SDLCALL SDL_CreateSemaphore(Uint32 initial_value)
/// ```
Pointer<SdlSemaphore> sdlCreateSemaphore(int initialValue) {
  final sdlCreateSemaphoreLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSemaphore> Function(Uint32 initialValue),
      Pointer<SdlSemaphore> Function(int initialValue)>('SDL_CreateSemaphore');
  return sdlCreateSemaphoreLookupFunction(initialValue);
}

///
/// Destroy a semaphore.
///
/// It is not safe to destroy a semaphore if there are threads currently
/// waiting on it.
///
/// \param sem the semaphore to destroy
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateSemaphore
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroySemaphore(SDL_Semaphore *sem)
/// ```
void sdlDestroySemaphore(Pointer<SdlSemaphore> sem) {
  final sdlDestroySemaphoreLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlSemaphore> sem),
      void Function(Pointer<SdlSemaphore> sem)>('SDL_DestroySemaphore');
  return sdlDestroySemaphoreLookupFunction(sem);
}

///
/// Wait until a semaphore has a positive value and then decrements it.
///
/// This function suspends the calling thread until either the semaphore
/// pointed to by `sem` has a positive value or the call is interrupted by a
/// signal or error. If the call is successful it will atomically decrement the
/// semaphore value.
///
/// This function is the equivalent of calling SDL_WaitSemaphoreTimeout() with
/// a time length of -1.
///
/// \param sem the semaphore wait on
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PostSemaphore
/// \sa SDL_TryWaitSemaphore
/// \sa SDL_WaitSemaphoreTimeout
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_WaitSemaphore(SDL_Semaphore *sem)
/// ```
int sdlWaitSemaphore(Pointer<SdlSemaphore> sem) {
  final sdlWaitSemaphoreLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSemaphore> sem),
      int Function(Pointer<SdlSemaphore> sem)>('SDL_WaitSemaphore');
  return sdlWaitSemaphoreLookupFunction(sem);
}

///
/// See if a semaphore has a positive value and decrement it if it does.
///
/// This function checks to see if the semaphore pointed to by `sem` has a
/// positive value and atomically decrements the semaphore value if it does. If
/// the semaphore doesn't have a positive value, the function immediately
/// returns SDL_MUTEX_TIMEDOUT.
///
/// \param sem the semaphore to wait on
/// \returns 0 if the wait succeeds, `SDL_MUTEX_TIMEDOUT` if the wait would
/// block, or a negative error code on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PostSemaphore
/// \sa SDL_WaitSemaphore
/// \sa SDL_WaitSemaphoreTimeout
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_TryWaitSemaphore(SDL_Semaphore *sem)
/// ```
int sdlTryWaitSemaphore(Pointer<SdlSemaphore> sem) {
  final sdlTryWaitSemaphoreLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSemaphore> sem),
      int Function(Pointer<SdlSemaphore> sem)>('SDL_TryWaitSemaphore');
  return sdlTryWaitSemaphoreLookupFunction(sem);
}

///
/// Wait until a semaphore has a positive value and then decrements it.
///
/// This function suspends the calling thread until either the semaphore
/// pointed to by `sem` has a positive value, the call is interrupted by a
/// signal or error, or the specified time has elapsed. If the call is
/// successful it will atomically decrement the semaphore value.
///
/// \param sem the semaphore to wait on
/// \param timeoutMS the length of the timeout, in milliseconds
/// \returns 0 if the wait succeeds, `SDL_MUTEX_TIMEDOUT` if the wait does not
/// succeed in the allotted time, or a negative error code on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PostSemaphore
/// \sa SDL_TryWaitSemaphore
/// \sa SDL_WaitSemaphore
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_WaitSemaphoreTimeout(SDL_Semaphore *sem, Sint32 timeoutMS)
/// ```
int sdlWaitSemaphoreTimeout(Pointer<SdlSemaphore> sem, int timeoutMs) {
  final sdlWaitSemaphoreTimeoutLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSemaphore> sem, Int32 timeoutMs),
      int Function(Pointer<SdlSemaphore> sem,
          int timeoutMs)>('SDL_WaitSemaphoreTimeout');
  return sdlWaitSemaphoreTimeoutLookupFunction(sem, timeoutMs);
}

///
/// Atomically increment a semaphore's value and wake waiting threads.
///
/// \param sem the semaphore to increment
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_TryWaitSemaphore
/// \sa SDL_WaitSemaphore
/// \sa SDL_WaitSemaphoreTimeout
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_PostSemaphore(SDL_Semaphore *sem)
/// ```
int sdlPostSemaphore(Pointer<SdlSemaphore> sem) {
  final sdlPostSemaphoreLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSemaphore> sem),
      int Function(Pointer<SdlSemaphore> sem)>('SDL_PostSemaphore');
  return sdlPostSemaphoreLookupFunction(sem);
}

///
/// Get the current value of a semaphore.
///
/// \param sem the semaphore to query
/// \returns the current value of the semaphore.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC Uint32 SDLCALL SDL_GetSemaphoreValue(SDL_Semaphore *sem)
/// ```
int sdlGetSemaphoreValue(Pointer<SdlSemaphore> sem) {
  final sdlGetSemaphoreValueLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlSemaphore> sem),
      int Function(Pointer<SdlSemaphore> sem)>('SDL_GetSemaphoreValue');
  return sdlGetSemaphoreValueLookupFunction(sem);
}

///
/// Create a condition variable.
///
/// \returns a new condition variable or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BroadcastCondition
/// \sa SDL_SignalCondition
/// \sa SDL_WaitCondition
/// \sa SDL_WaitConditionTimeout
/// \sa SDL_DestroyCondition
///
/// ```c
/// extern DECLSPEC SDL_Condition *SDLCALL SDL_CreateCondition(void)
/// ```
Pointer<SdlCondition> sdlCreateCondition() {
  final sdlCreateConditionLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlCondition> Function(),
      Pointer<SdlCondition> Function()>('SDL_CreateCondition');
  return sdlCreateConditionLookupFunction();
}

///
/// Destroy a condition variable.
///
/// \param cond the condition variable to destroy
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateCondition
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroyCondition(SDL_Condition *cond)
/// ```
void sdlDestroyCondition(Pointer<SdlCondition> cond) {
  final sdlDestroyConditionLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlCondition> cond),
      void Function(Pointer<SdlCondition> cond)>('SDL_DestroyCondition');
  return sdlDestroyConditionLookupFunction(cond);
}

///
/// Restart one of the threads that are waiting on the condition variable.
///
/// \param cond the condition variable to signal
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BroadcastCondition
/// \sa SDL_WaitCondition
/// \sa SDL_WaitConditionTimeout
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SignalCondition(SDL_Condition *cond)
/// ```
int sdlSignalCondition(Pointer<SdlCondition> cond) {
  final sdlSignalConditionLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlCondition> cond),
      int Function(Pointer<SdlCondition> cond)>('SDL_SignalCondition');
  return sdlSignalConditionLookupFunction(cond);
}

///
/// Restart all threads that are waiting on the condition variable.
///
/// \param cond the condition variable to signal
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SignalCondition
/// \sa SDL_WaitCondition
/// \sa SDL_WaitConditionTimeout
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_BroadcastCondition(SDL_Condition *cond)
/// ```
int sdlBroadcastCondition(Pointer<SdlCondition> cond) {
  final sdlBroadcastConditionLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlCondition> cond),
      int Function(Pointer<SdlCondition> cond)>('SDL_BroadcastCondition');
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
/// \param cond the condition variable to wait on
/// \param mutex the mutex used to coordinate thread access
/// \returns 0 when it is signaled or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BroadcastCondition
/// \sa SDL_SignalCondition
/// \sa SDL_WaitConditionTimeout
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_WaitCondition(SDL_Condition *cond, SDL_Mutex *mutex)
/// ```
int sdlWaitCondition(Pointer<SdlCondition> cond, Pointer<SdlMutex> mutex) {
  final sdlWaitConditionLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlCondition> cond, Pointer<SdlMutex> mutex),
      int Function(Pointer<SdlCondition> cond,
          Pointer<SdlMutex> mutex)>('SDL_WaitCondition');
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
/// \param cond the condition variable to wait on
/// \param mutex the mutex used to coordinate thread access
/// \param timeoutMS the maximum time to wait, in milliseconds, or -1 to wait
/// indefinitely
/// \returns 0 if the condition variable is signaled, `SDL_MUTEX_TIMEDOUT` if
/// the condition is not signaled in the allotted time, or a negative
/// error code on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BroadcastCondition
/// \sa SDL_SignalCondition
/// \sa SDL_WaitCondition
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_WaitConditionTimeout(SDL_Condition *cond, SDL_Mutex *mutex, Sint32 timeoutMS)
/// ```
int sdlWaitConditionTimeout(
    Pointer<SdlCondition> cond, Pointer<SdlMutex> mutex, int timeoutMs) {
  final sdlWaitConditionTimeoutLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlCondition> cond, Pointer<SdlMutex> mutex, Int32 timeoutMs),
      int Function(Pointer<SdlCondition> cond, Pointer<SdlMutex> mutex,
          int timeoutMs)>('SDL_WaitConditionTimeout');
  return sdlWaitConditionTimeoutLookupFunction(cond, mutex, timeoutMs);
}
