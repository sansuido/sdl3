// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl_atomic.dart';

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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockSpinlock
/// \sa SDL_UnlockSpinlock
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_TryLockSpinlock(SDL_SpinLock *lock)
/// ```
///
/// See also:
/// - [SDL_TryLockSpinlock - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_TryLockSpinlock)
///
/// {@category atomic}
bool sdlTryLockSpinlock(Pointer<Int32> lock) {
  final sdlTryLockSpinlockLookupFunction = _libSdl
      .lookupFunction<
        Bool Function(Pointer<Int32> lock),
        bool Function(Pointer<Int32> lock)
      >('SDL_TryLockSpinlock');
  return sdlTryLockSpinlockLookupFunction(lock);
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_TryLockSpinlock
/// \sa SDL_UnlockSpinlock
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LockSpinlock(SDL_SpinLock *lock)
/// ```
///
/// See also:
/// - [SDL_LockSpinlock - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_LockSpinlock)
///
/// {@category atomic}
void sdlLockSpinlock(Pointer<Int32> lock) {
  final sdlLockSpinlockLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<Int32> lock),
        void Function(Pointer<Int32> lock)
      >('SDL_LockSpinlock');
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_LockSpinlock
/// \sa SDL_TryLockSpinlock
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnlockSpinlock(SDL_SpinLock *lock)
/// ```
///
/// See also:
/// - [SDL_UnlockSpinlock - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_UnlockSpinlock)
///
/// {@category atomic}
void sdlUnlockSpinlock(Pointer<Int32> lock) {
  final sdlUnlockSpinlockLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<Int32> lock),
        void Function(Pointer<Int32> lock)
      >('SDL_UnlockSpinlock');
  return sdlUnlockSpinlockLookupFunction(lock);
}

///
/// Insert a memory release barrier (function version).
///
/// Please refer to SDL_MemoryBarrierRelease for details. This is a function
/// version, which might be useful if you need to use this functionality from a
/// scripting language, etc. Also, some of the macro versions call this
/// function behind the scenes, where more heavy lifting can happen inside of
/// SDL. Generally, though, an app written in C/C++/etc should use the macro
/// version, as it will be more efficient.
///
/// \threadsafety Obviously this function is safe to use from any thread at any
/// time, but if you find yourself needing this, you are probably
/// dealing with some very sensitive code; be careful!
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_MemoryBarrierRelease
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_MemoryBarrierReleaseFunction(void)
/// ```
///
/// See also:
/// - [SDL_MemoryBarrierReleaseFunction - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_MemoryBarrierReleaseFunction)
///
/// {@category atomic}
void sdlMemoryBarrierReleaseFunction() {
  final sdlMemoryBarrierReleaseFunctionLookupFunction = _libSdl
      .lookupFunction<Void Function(), void Function()>(
        'SDL_MemoryBarrierReleaseFunction',
      );
  return sdlMemoryBarrierReleaseFunctionLookupFunction();
}

///
/// Insert a memory acquire barrier (function version).
///
/// Please refer to SDL_MemoryBarrierRelease for details. This is a function
/// version, which might be useful if you need to use this functionality from a
/// scripting language, etc. Also, some of the macro versions call this
/// function behind the scenes, where more heavy lifting can happen inside of
/// SDL. Generally, though, an app written in C/C++/etc should use the macro
/// version, as it will be more efficient.
///
/// \threadsafety Obviously this function is safe to use from any thread at any
/// time, but if you find yourself needing this, you are probably
/// dealing with some very sensitive code; be careful!
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_MemoryBarrierAcquire
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_MemoryBarrierAcquireFunction(void)
/// ```
///
/// See also:
/// - [SDL_MemoryBarrierAcquireFunction - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_MemoryBarrierAcquireFunction)
///
/// {@category atomic}
void sdlMemoryBarrierAcquireFunction() {
  final sdlMemoryBarrierAcquireFunctionLookupFunction = _libSdl
      .lookupFunction<Void Function(), void Function()>(
        'SDL_MemoryBarrierAcquireFunction',
      );
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAtomicInt
/// \sa SDL_SetAtomicInt
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CompareAndSwapAtomicInt(SDL_AtomicInt *a, int oldval, int newval)
/// ```
///
/// See also:
/// - [SDL_CompareAndSwapAtomicInt - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CompareAndSwapAtomicInt)
///
/// {@category atomic}
bool sdlCompareAndSwapAtomicInt(
  Pointer<SdlAtomicInt> a,
  int oldval,
  int newval,
) {
  final sdlCompareAndSwapAtomicIntLookupFunction = _libSdl
      .lookupFunction<
        Bool Function(Pointer<SdlAtomicInt> a, Int32 oldval, Int32 newval),
        bool Function(Pointer<SdlAtomicInt> a, int oldval, int newval)
      >('SDL_CompareAndSwapAtomicInt');
  return sdlCompareAndSwapAtomicIntLookupFunction(a, oldval, newval);
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAtomicInt
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_SetAtomicInt(SDL_AtomicInt *a, int v)
/// ```
///
/// See also:
/// - [SDL_SetAtomicInt - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetAtomicInt)
///
/// {@category atomic}
int sdlSetAtomicInt(Pointer<SdlAtomicInt> a, int v) {
  final sdlSetAtomicIntLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Pointer<SdlAtomicInt> a, Int32 v),
        int Function(Pointer<SdlAtomicInt> a, int v)
      >('SDL_SetAtomicInt');
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAtomicInt
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetAtomicInt(SDL_AtomicInt *a)
/// ```
///
/// See also:
/// - [SDL_GetAtomicInt - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetAtomicInt)
///
/// {@category atomic}
int sdlGetAtomicInt(Pointer<SdlAtomicInt> a) {
  final sdlGetAtomicIntLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Pointer<SdlAtomicInt> a),
        int Function(Pointer<SdlAtomicInt> a)
      >('SDL_GetAtomicInt');
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AtomicDecRef
/// \sa SDL_AtomicIncRef
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AddAtomicInt(SDL_AtomicInt *a, int v)
/// ```
///
/// See also:
/// - [SDL_AddAtomicInt - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_AddAtomicInt)
///
/// {@category atomic}
int sdlAddAtomicInt(Pointer<SdlAtomicInt> a, int v) {
  final sdlAddAtomicIntLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Pointer<SdlAtomicInt> a, Int32 v),
        int Function(Pointer<SdlAtomicInt> a, int v)
      >('SDL_AddAtomicInt');
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAtomicU32
/// \sa SDL_SetAtomicU32
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CompareAndSwapAtomicU32(SDL_AtomicU32 *a, Uint32 oldval, Uint32 newval)
/// ```
///
/// See also:
/// - [SDL_CompareAndSwapAtomicU32 - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CompareAndSwapAtomicU32)
///
/// {@category atomic}
bool sdlCompareAndSwapAtomicU32(
  Pointer<SdlAtomicU32> a,
  int oldval,
  int newval,
) {
  final sdlCompareAndSwapAtomicU32LookupFunction = _libSdl
      .lookupFunction<
        Bool Function(Pointer<SdlAtomicU32> a, Uint32 oldval, Uint32 newval),
        bool Function(Pointer<SdlAtomicU32> a, int oldval, int newval)
      >('SDL_CompareAndSwapAtomicU32');
  return sdlCompareAndSwapAtomicU32LookupFunction(a, oldval, newval);
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAtomicU32
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_SetAtomicU32(SDL_AtomicU32 *a, Uint32 v)
/// ```
///
/// See also:
/// - [SDL_SetAtomicU32 - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetAtomicU32)
///
/// {@category atomic}
int sdlSetAtomicU32(Pointer<SdlAtomicU32> a, int v) {
  final sdlSetAtomicU32LookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlAtomicU32> a, Uint32 v),
        int Function(Pointer<SdlAtomicU32> a, int v)
      >('SDL_SetAtomicU32');
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAtomicU32
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GetAtomicU32(SDL_AtomicU32 *a)
/// ```
///
/// See also:
/// - [SDL_GetAtomicU32 - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetAtomicU32)
///
/// {@category atomic}
int sdlGetAtomicU32(Pointer<SdlAtomicU32> a) {
  final sdlGetAtomicU32LookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlAtomicU32> a),
        int Function(Pointer<SdlAtomicU32> a)
      >('SDL_GetAtomicU32');
  return sdlGetAtomicU32LookupFunction(a);
}

///
/// Add to an atomic variable.
///
/// This function also acts as a full memory barrier.
///
/// ***Note: If you don't know what this function is for, you shouldn't use
/// it!***
///
/// \param a a pointer to an SDL_AtomicU32 variable to be modified.
/// \param v the desired value to add or subtract.
/// \returns the previous value of the atomic variable.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.4.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_AddAtomicU32(SDL_AtomicU32 *a, int v)
/// ```
///
/// See also:
/// - [SDL_AddAtomicU32 - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_AddAtomicU32)
///
/// {@category atomic}
int sdlAddAtomicU32(Pointer<SdlAtomicU32> a, int v) {
  final sdlAddAtomicU32LookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlAtomicU32> a, Int32 v),
        int Function(Pointer<SdlAtomicU32> a, int v)
      >('SDL_AddAtomicU32');
  return sdlAddAtomicU32LookupFunction(a, v);
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CompareAndSwapAtomicInt
/// \sa SDL_GetAtomicPointer
/// \sa SDL_SetAtomicPointer
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_CompareAndSwapAtomicPointer(void **a, void *oldval, void *newval)
/// ```
///
/// See also:
/// - [SDL_CompareAndSwapAtomicPointer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_CompareAndSwapAtomicPointer)
///
/// {@category atomic}
bool sdlCompareAndSwapAtomicPointer(
  Pointer<Pointer<Void>> a,
  Pointer<Void> oldval,
  Pointer<Void> newval,
) {
  final sdlCompareAndSwapAtomicPointerLookupFunction = _libSdl
      .lookupFunction<
        Bool Function(
          Pointer<Pointer<Void>> a,
          Pointer<Void> oldval,
          Pointer<Void> newval,
        ),
        bool Function(
          Pointer<Pointer<Void>> a,
          Pointer<Void> oldval,
          Pointer<Void> newval,
        )
      >('SDL_CompareAndSwapAtomicPointer');
  return sdlCompareAndSwapAtomicPointerLookupFunction(a, oldval, newval);
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CompareAndSwapAtomicPointer
/// \sa SDL_GetAtomicPointer
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_SetAtomicPointer(void **a, void *v)
/// ```
///
/// See also:
/// - [SDL_SetAtomicPointer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_SetAtomicPointer)
///
/// {@category atomic}
Pointer<Void> sdlSetAtomicPointer(Pointer<Pointer<Void>> a, Pointer<Void> v) {
  final sdlSetAtomicPointerLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Void> Function(Pointer<Pointer<Void>> a, Pointer<Void> v),
        Pointer<Void> Function(Pointer<Pointer<Void>> a, Pointer<Void> v)
      >('SDL_SetAtomicPointer');
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CompareAndSwapAtomicPointer
/// \sa SDL_SetAtomicPointer
///
/// ```c
/// extern SDL_DECLSPEC void * SDLCALL SDL_GetAtomicPointer(void **a)
/// ```
///
/// See also:
/// - [SDL_GetAtomicPointer - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetAtomicPointer)
///
/// {@category atomic}
Pointer<Void> sdlGetAtomicPointer(Pointer<Pointer<Void>> a) {
  final sdlGetAtomicPointerLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Void> Function(Pointer<Pointer<Void>> a),
        Pointer<Void> Function(Pointer<Pointer<Void>> a)
      >('SDL_GetAtomicPointer');
  return sdlGetAtomicPointerLookupFunction(a);
}
