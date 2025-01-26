// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Set the SDL error message for the current thread.
///
/// Calling this function will replace any previous error message that was set.
///
/// This function always returns false, since SDL frequently uses false to
/// signify a failing result, leading to this idiom:
///
/// ```c
/// if (error_code) {
/// return SDL_SetError("This operation has failed: %d", error_code);
/// }
/// ```
///
/// \param fmt a printf()-style message format string.
/// \param ... additional parameters matching % tokens in the `fmt` string, if
/// any.
/// \returns false.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClearError
/// \sa SDL_GetError
/// \sa SDL_SetErrorV
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetError(SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(1)
/// ```
bool sdlSetError(String? fmt) {
  final sdlSetErrorLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Utf8> fmt),
      int Function(Pointer<Utf8> fmt)>('SDL_SetError');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlSetErrorLookupFunction(fmtPointer) == 1;
  calloc.free(fmtPointer);
  return result;
}

///
/// Set the SDL error message for the current thread.
///
/// Calling this function will replace any previous error message that was set.
///
/// \param fmt a printf()-style message format string.
/// \param ap a variable argument list.
/// \returns false.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClearError
/// \sa SDL_GetError
/// \sa SDL_SetError
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetErrorV(SDL_PRINTF_FORMAT_STRING const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(1)
/// ```
bool sdlSetErrorV(String? fmt) {
  final sdlSetErrorVLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Utf8> fmt),
      int Function(Pointer<Utf8> fmt)>('SDL_SetErrorV');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlSetErrorVLookupFunction(fmtPointer) == 1;
  calloc.free(fmtPointer);
  return result;
}

///
/// Set an error indicating that memory allocation failed.
///
/// This function does not do any memory allocation.
///
/// \returns false.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_OutOfMemory(void)
/// ```
bool sdlOutOfMemory() {
  final sdlOutOfMemoryLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_OutOfMemory');
  return sdlOutOfMemoryLookupFunction() == 1;
}

///
/// Retrieve a message about the last error that occurred on the current
/// thread.
///
/// It is possible for multiple errors to occur before calling SDL_GetError().
/// Only the last error is returned.
///
/// The message is only applicable when an SDL function has signaled an error.
/// You must check the return values of SDL function calls to determine when to
/// appropriately call SDL_GetError(). You should *not* use the results of
/// SDL_GetError() to decide if an error has occurred! Sometimes SDL will set
/// an error string even when reporting success.
///
/// SDL will *not* clear the error string for successful API calls. You *must*
/// check return values for failure cases before you can assume the error
/// string applies.
///
/// Error strings are set per-thread, so an error set in a different thread
/// will not interfere with the current thread's operation.
///
/// The returned value is a thread-local string which will remain valid until
/// the current thread's error string is changed. The caller should make a copy
/// if the value is needed after the next SDL API call.
///
/// \returns a message with information about the specific error that occurred,
/// or an empty string if there hasn't been an error message set since
/// the last call to SDL_ClearError().
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClearError
/// \sa SDL_SetError
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetError(void)
/// ```
String? sdlGetError() {
  final sdlGetErrorLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(), Pointer<Utf8> Function()>('SDL_GetError');
  final result = sdlGetErrorLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Clear any previous error message for this thread.
///
/// \returns true.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetError
/// \sa SDL_SetError
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ClearError(void)
/// ```
bool sdlClearError() {
  final sdlClearErrorLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_ClearError');
  return sdlClearErrorLookupFunction() == 1;
}
