// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Try to lock a spin lock by setting it to a non-zero value.
///
/// ***Please note that spinlocks are dangerous if you don't know what you're
/// doing. Please be careful using any sort of spinlock!***
///
/// \param lock a pointer to a lock variable.
/// \returns true if the lock succeeded, false if the lock is already held.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_LockSpinlock
/// \sa SDL_UnlockSpinlock
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_TryLockSpinlock(SDL_SpinLock *lock)
/// ```
bool sdlTryLockSpinlock(Pointer<Int32> lock) {
  final sdlTryLockSpinlockLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Int32> lock),
      int Function(Pointer<Int32> lock)>('SDL_TryLockSpinlock');
  return sdlTryLockSpinlockLookupFunction(lock) == 1;
}

///
/// Lock a spin lock by setting it to a non-zero value.
///
/// ***Please note that spinlocks are dangerous if you don't know what you're
/// doing. Please be careful using any sort of spinlock!***
///
/// \param lock a pointer to a lock variable.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_TryLockSpinlock
/// \sa SDL_UnlockSpinlock
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LockSpinlock(SDL_SpinLock *lock)
/// ```
void sdlLockSpinlock(Pointer<Int32> lock) {
  final sdlLockSpinlockLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<Int32> lock),
      void Function(Pointer<Int32> lock)>('SDL_LockSpinlock');
  return sdlLockSpinlockLookupFunction(lock);
}

///
/// Unlock a spin lock by setting it to 0.
///
/// Always returns immediately.
///
/// ***Please note that spinlocks are dangerous if you don't know what you're
/// doing. Please be careful using any sort of spinlock!***
///
/// \param lock a pointer to a lock variable.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_LockSpinlock
/// \sa SDL_TryLockSpinlock
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnlockSpinlock(SDL_SpinLock *lock)
/// ```
void sdlUnlockSpinlock(Pointer<Int32> lock) {
  final sdlUnlockSpinlockLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<Int32> lock),
      void Function(Pointer<Int32> lock)>('SDL_UnlockSpinlock');
  return sdlUnlockSpinlockLookupFunction(lock);
}

///
/// Insert a memory release barrier.
///
/// Memory barriers are designed to prevent reads and writes from being
/// reordered by the compiler and being seen out of order on multi-core CPUs.
///
/// A typical pattern would be for thread A to write some data and a flag, and
/// for thread B to read the flag and get the data. In this case you would
/// insert a release barrier between writing the data and the flag,
/// guaranteeing that the data write completes no later than the flag is
/// written, and you would insert an acquire barrier between reading the flag
/// and reading the data, to ensure that all the reads associated with the flag
/// have completed.
///
/// In this pattern you should always see a release barrier paired with an
/// acquire barrier and you should gate the data reads/writes with a single
/// flag variable.
///
/// For more information on these semantics, take a look at the blog post:
/// http://preshing.com/20120913/acquire-and-release-semantics
///
/// \threadsafety Obviously this macro is safe to use from any thread at any
/// time, but if you find yourself needing this, you are probably
/// dealing with some very sensitive code; be careful!
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_MemoryBarrierReleaseFunction(void)
/// ```
void sdlMemoryBarrierReleaseFunction() {
  final sdlMemoryBarrierReleaseFunctionLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_MemoryBarrierReleaseFunction');
  return sdlMemoryBarrierReleaseFunctionLookupFunction();
}

///
/// Insert a memory acquire barrier.
///
/// Please refer to SDL_MemoryBarrierReleaseFunction for the details!
///
/// \threadsafety Obviously this function is safe to use from any thread at any
/// time, but if you find yourself needing this, you are probably
/// dealing with some very sensitive code; be careful!
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_MemoryBarrierReleaseFunction
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_MemoryBarrierAcquireFunction(void)
/// ```
void sdlMemoryBarrierAcquireFunction() {
  final sdlMemoryBarrierAcquireFunctionLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_MemoryBarrierAcquireFunction');
  return sdlMemoryBarrierAcquireFunctionLookupFunction();
}

///
/// Set an atomic variable to a new value if it is currently an old value.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to an SDL_AtomicInt variable to be modified.
/// \param oldval the old value.
/// \param newval the new value.
/// \returns true if the atomic variable was set, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetAtomicInt
/// \sa SDL_SetAtomicInt
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CompareAndSwapAtomicInt(SDL_AtomicInt *a, int oldval, int newval)
/// ```
bool sdlCompareAndSwapAtomicInt(
    Pointer<SdlAtomicInt> a, int oldval, int newval) {
  final sdlCompareAndSwapAtomicIntLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlAtomicInt> a, Int32 oldval, Int32 newval),
      int Function(Pointer<SdlAtomicInt> a, int oldval,
          int newval)>('SDL_CompareAndSwapAtomicInt');
  return sdlCompareAndSwapAtomicIntLookupFunction(a, oldval, newval) == 1;
}

///
/// Set an atomic variable to a value.
///
/// This function also acts as a full memory barrier.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to an SDL_AtomicInt variable to be modified.
/// \param v the desired value.
/// \returns the previous value of the atomic variable.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetAtomicInt
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetAtomicInt(SDL_AtomicInt *a, int v)
/// ```
int sdlSetAtomicInt(Pointer<SdlAtomicInt> a, int v) {
  final sdlSetAtomicIntLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAtomicInt> a, Int32 v),
      int Function(Pointer<SdlAtomicInt> a, int v)>('SDL_SetAtomicInt');
  return sdlSetAtomicIntLookupFunction(a, v);
}

///
/// Get the value of an atomic variable.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to an SDL_AtomicInt variable.
/// \returns the current value of an atomic variable.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_SetAtomicInt
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetAtomicInt(SDL_AtomicInt *a)
/// ```
int sdlGetAtomicInt(Pointer<SdlAtomicInt> a) {
  final sdlGetAtomicIntLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAtomicInt> a),
      int Function(Pointer<SdlAtomicInt> a)>('SDL_GetAtomicInt');
  return sdlGetAtomicIntLookupFunction(a);
}

///
/// Add to an atomic variable.
///
/// This function also acts as a full memory barrier.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to an SDL_AtomicInt variable to be modified.
/// \param v the desired value to add.
/// \returns the previous value of the atomic variable.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_AtomicDecRef
/// \sa SDL_AtomicIncRef
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AddAtomicInt(SDL_AtomicInt *a, int v)
/// ```
int sdlAddAtomicInt(Pointer<SdlAtomicInt> a, int v) {
  final sdlAddAtomicIntLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAtomicInt> a, Int32 v),
      int Function(Pointer<SdlAtomicInt> a, int v)>('SDL_AddAtomicInt');
  return sdlAddAtomicIntLookupFunction(a, v);
}

///
/// Set an atomic variable to a new value if it is currently an old value.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to an SDL_AtomicU32 variable to be modified.
/// \param oldval the old value.
/// \param newval the new value.
/// \returns true if the atomic variable was set, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetAtomicU32
/// \sa SDL_SetAtomicU32
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CompareAndSwapAtomicU32(SDL_AtomicU32 *a, Uint32 oldval, Uint32 newval)
/// ```
bool sdlCompareAndSwapAtomicU32(
    Pointer<SdlAtomicU32> a, int oldval, int newval) {
  final sdlCompareAndSwapAtomicU32LookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlAtomicU32> a, Uint32 oldval, Uint32 newval),
      int Function(Pointer<SdlAtomicU32> a, int oldval,
          int newval)>('SDL_CompareAndSwapAtomicU32');
  return sdlCompareAndSwapAtomicU32LookupFunction(a, oldval, newval) == 1;
}

///
/// Set an atomic variable to a value.
///
/// This function also acts as a full memory barrier.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to an SDL_AtomicU32 variable to be modified.
/// \param v the desired value.
/// \returns the previous value of the atomic variable.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetAtomicU32
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_SetAtomicU32(SDL_AtomicU32 *a, Uint32 v)
/// ```
int sdlSetAtomicU32(Pointer<SdlAtomicU32> a, int v) {
  final sdlSetAtomicU32LookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlAtomicU32> a, Uint32 v),
      int Function(Pointer<SdlAtomicU32> a, int v)>('SDL_SetAtomicU32');
  return sdlSetAtomicU32LookupFunction(a, v);
}

///
/// Get the value of an atomic variable.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to an SDL_AtomicU32 variable.
/// \returns the current value of an atomic variable.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_SetAtomicU32
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GetAtomicU32(SDL_AtomicU32 *a)
/// ```
int sdlGetAtomicU32(Pointer<SdlAtomicU32> a) {
  final sdlGetAtomicU32LookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlAtomicU32> a),
      int Function(Pointer<SdlAtomicU32> a)>('SDL_GetAtomicU32');
  return sdlGetAtomicU32LookupFunction(a);
}

///
/// Set a pointer to a new value if it is currently an old value.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to a pointer.
/// \param oldval the old pointer value.
/// \param newval the new pointer value.
/// \returns true if the pointer was set, false otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CompareAndSwapAtomicInt
/// \sa SDL_GetAtomicPointer
/// \sa SDL_SetAtomicPointer
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CompareAndSwapAtomicPointer(void **a, void *oldval, void *newval)
/// ```
bool sdlCompareAndSwapAtomicPointer(Pointer<Pointer<NativeType>> a,
    Pointer<NativeType> oldval, Pointer<NativeType> newval) {
  final sdlCompareAndSwapAtomicPointerLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Pointer<NativeType>> a, Pointer<NativeType> oldval,
          Pointer<NativeType> newval),
      int Function(Pointer<Pointer<NativeType>> a, Pointer<NativeType> oldval,
          Pointer<NativeType> newval)>('SDL_CompareAndSwapAtomicPointer');
  return sdlCompareAndSwapAtomicPointerLookupFunction(a, oldval, newval) == 1;
}

///
/// Set a pointer to a value atomically.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to a pointer.
/// \param v the desired pointer value.
/// \returns the previous value of the pointer.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CompareAndSwapAtomicPointer
/// \sa SDL_GetAtomicPointer
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_SetAtomicPointer(void **a, void *v)
/// ```
Pointer<NativeType> sdlSetAtomicPointer(
    Pointer<Pointer<NativeType>> a, Pointer<NativeType> v) {
  final sdlSetAtomicPointerLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(
          Pointer<Pointer<NativeType>> a, Pointer<NativeType> v),
      Pointer<NativeType> Function(Pointer<Pointer<NativeType>> a,
          Pointer<NativeType> v)>('SDL_SetAtomicPointer');
  return sdlSetAtomicPointerLookupFunction(a, v);
}

///
/// Get the value of a pointer atomically.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to a pointer.
/// \returns the current value of a pointer.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CompareAndSwapAtomicPointer
/// \sa SDL_SetAtomicPointer
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_GetAtomicPointer(void **a)
/// ```
Pointer<NativeType> sdlGetAtomicPointer(Pointer<Pointer<NativeType>> a) {
  final sdlGetAtomicPointerLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeType> Function(Pointer<Pointer<NativeType>> a),
      Pointer<NativeType> Function(
          Pointer<Pointer<NativeType>> a)>('SDL_GetAtomicPointer');
  return sdlGetAtomicPointerLookupFunction(a);
}
