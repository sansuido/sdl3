// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'lib_sdl.dart';

///
/// Get the number of milliseconds since SDL library initialization.
///
/// \returns an unsigned 64-bit value representing the number of milliseconds
/// since the SDL library initialized.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint64 SDLCALL SDL_GetTicks(void)
/// ```
int sdlGetTicks() {
  final sdlGetTicksLookupFunction =
      libSdl3.lookupFunction<Uint64 Function(), int Function()>('SDL_GetTicks');
  return sdlGetTicksLookupFunction();
}

///
/// Get the number of nanoseconds since SDL library initialization.
///
/// \returns an unsigned 64-bit value representing the number of nanoseconds
/// since the SDL library initialized.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint64 SDLCALL SDL_GetTicksNS(void)
/// ```
int sdlGetTicksNs() {
  final sdlGetTicksNsLookupFunction = libSdl3
      .lookupFunction<Uint64 Function(), int Function()>('SDL_GetTicksNS');
  return sdlGetTicksNsLookupFunction();
}

///
/// Get the current value of the high resolution counter.
///
/// This function is typically used for profiling.
///
/// The counter values are only meaningful relative to each other. Differences
/// between values can be converted to times by using
/// SDL_GetPerformanceFrequency().
///
/// \returns the current counter value.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPerformanceFrequency
///
/// ```c
/// extern SDL_DECLSPEC Uint64 SDLCALL SDL_GetPerformanceCounter(void)
/// ```
int sdlGetPerformanceCounter() {
  final sdlGetPerformanceCounterLookupFunction =
      libSdl3.lookupFunction<Uint64 Function(), int Function()>(
          'SDL_GetPerformanceCounter');
  return sdlGetPerformanceCounterLookupFunction();
}

///
/// Get the count per second of the high resolution counter.
///
/// \returns a platform-specific count per second.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetPerformanceCounter
///
/// ```c
/// extern SDL_DECLSPEC Uint64 SDLCALL SDL_GetPerformanceFrequency(void)
/// ```
int sdlGetPerformanceFrequency() {
  final sdlGetPerformanceFrequencyLookupFunction =
      libSdl3.lookupFunction<Uint64 Function(), int Function()>(
          'SDL_GetPerformanceFrequency');
  return sdlGetPerformanceFrequencyLookupFunction();
}

///
/// Wait a specified number of milliseconds before returning.
///
/// This function waits a specified number of milliseconds before returning. It
/// waits at least the specified time, but possibly longer due to OS
/// scheduling.
///
/// \param ms the number of milliseconds to delay.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_Delay(Uint32 ms)
/// ```
void sdlDelay(int ms) {
  final sdlDelayLookupFunction =
      libSdl3.lookupFunction<Void Function(Uint32 ms), void Function(int ms)>(
          'SDL_Delay');
  return sdlDelayLookupFunction(ms);
}

///
/// Wait a specified number of nanoseconds before returning.
///
/// This function waits a specified number of nanoseconds before returning. It
/// waits at least the specified time, but possibly longer due to OS
/// scheduling.
///
/// \param ns the number of nanoseconds to delay.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DelayNS(Uint64 ns)
/// ```
void sdlDelayNs(int ns) {
  final sdlDelayNsLookupFunction =
      libSdl3.lookupFunction<Void Function(Uint64 ns), void Function(int ns)>(
          'SDL_DelayNS');
  return sdlDelayNsLookupFunction(ns);
}

///
/// Call a callback function at a future time.
///
/// If you use this function, you must pass `SDL_INIT_TIMER` to SDL_Init().
///
/// The callback function is passed the current timer interval and the user
/// supplied parameter from the SDL_AddTimer() call and should return the next
/// timer interval. If the value returned from the callback is 0, the timer is
/// canceled.
///
/// The callback is run on a separate thread, and for short timeouts can
/// potentially be called before this function returns.
///
/// Timers take into account the amount of time it took to execute the
/// callback. For example, if the callback took 250 ms to execute and returned
/// 1000 (ms), the timer would only wait another 750 ms before its next
/// iteration.
///
/// Timing may be inexact due to OS scheduling. Be sure to note the current
/// time with SDL_GetTicksNS() or SDL_GetPerformanceCounter() in case your
/// callback needs to adjust for variances.
///
/// \param interval the timer delay, in milliseconds, passed to `callback`.
/// \param callback the SDL_TimerCallback function to call when the specified
/// `interval` elapses.
/// \param userdata a pointer that is passed to `callback`.
/// \returns a timer ID or 0 if an error occurs; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AddTimerNS
/// \sa SDL_RemoveTimer
///
/// ```c
/// extern SDL_DECLSPEC SDL_TimerID SDLCALL SDL_AddTimer(Uint32 interval, SDL_TimerCallback callback, void *userdata)
/// ```
int sdlAddTimer(
    int interval,
    Pointer<NativeFunction<SdlTimerCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlAddTimerLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Uint32 interval,
          Pointer<NativeFunction<SdlTimerCallback>> callback,
          Pointer<NativeType> userdata),
      int Function(
          int interval,
          Pointer<NativeFunction<SdlTimerCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_AddTimer');
  return sdlAddTimerLookupFunction(interval, callback, userdata);
}

///
/// Call a callback function at a future time.
///
/// If you use this function, you must pass `SDL_INIT_TIMER` to SDL_Init().
///
/// The callback function is passed the current timer interval and the user
/// supplied parameter from the SDL_AddTimerNS() call and should return the
/// next timer interval. If the value returned from the callback is 0, the
/// timer is canceled.
///
/// The callback is run on a separate thread, and for short timeouts can
/// potentially be called before this function returns.
///
/// Timers take into account the amount of time it took to execute the
/// callback. For example, if the callback took 250 ns to execute and returned
/// 1000 (ns), the timer would only wait another 750 ns before its next
/// iteration.
///
/// Timing may be inexact due to OS scheduling. Be sure to note the current
/// time with SDL_GetTicksNS() or SDL_GetPerformanceCounter() in case your
/// callback needs to adjust for variances.
///
/// \param interval the timer delay, in nanoseconds, passed to `callback`.
/// \param callback the SDL_TimerCallback function to call when the specified
/// `interval` elapses.
/// \param userdata a pointer that is passed to `callback`.
/// \returns a timer ID or 0 if an error occurs; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AddTimer
/// \sa SDL_RemoveTimer
///
/// ```c
/// extern SDL_DECLSPEC SDL_TimerID SDLCALL SDL_AddTimerNS(Uint64 interval, SDL_NSTimerCallback callback, void *userdata)
/// ```
int sdlAddTimerNs(
    int interval,
    Pointer<NativeFunction<SdlNsTimerCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlAddTimerNsLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(
          Uint64 interval,
          Pointer<NativeFunction<SdlNsTimerCallback>> callback,
          Pointer<NativeType> userdata),
      int Function(
          int interval,
          Pointer<NativeFunction<SdlNsTimerCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_AddTimerNS');
  return sdlAddTimerNsLookupFunction(interval, callback, userdata);
}

///
/// Remove a timer created with SDL_AddTimer().
///
/// \param id the ID of the timer to remove.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AddTimer
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_RemoveTimer(SDL_TimerID id)
/// ```
int sdlRemoveTimer(int id) {
  final sdlRemoveTimerLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Uint32 id), int Function(int id)>(
          'SDL_RemoveTimer');
  return sdlRemoveTimerLookupFunction(id);
}
