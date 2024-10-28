// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Set the priority of all log categories.
///
/// \param priority the SDL_LogPriority to assign.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ResetLogPriorities
/// \sa SDL_SetLogPriority
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetLogPriorities(SDL_LogPriority priority)
/// ```
void sdlSetLogPriorities(int priority) {
  final sdlSetLogPrioritiesLookupFunction = libSdl3.lookupFunction<
      Void Function(Int32 priority),
      void Function(int priority)>('SDL_SetLogPriorities');
  return sdlSetLogPrioritiesLookupFunction(priority);
}

///
/// Set the priority of a particular log category.
///
/// \param category the category to assign a priority to.
/// \param priority the SDL_LogPriority to assign.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetLogPriority
/// \sa SDL_ResetLogPriorities
/// \sa SDL_SetLogPriorities
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetLogPriority(int category, SDL_LogPriority priority)
/// ```
void sdlSetLogPriority(int category, int priority) {
  final sdlSetLogPriorityLookupFunction = libSdl3.lookupFunction<
      Void Function(Int32 category, Int32 priority),
      void Function(int category, int priority)>('SDL_SetLogPriority');
  return sdlSetLogPriorityLookupFunction(category, priority);
}

///
/// Get the priority of a particular log category.
///
/// \param category the category to query.
/// \returns the SDL_LogPriority for the requested category.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetLogPriority
///
/// ```c
/// extern SDL_DECLSPEC SDL_LogPriority SDLCALL SDL_GetLogPriority(int category)
/// ```
int sdlGetLogPriority(int category) {
  final sdlGetLogPriorityLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 category),
      int Function(int category)>('SDL_GetLogPriority');
  return sdlGetLogPriorityLookupFunction(category);
}

///
/// Reset all priorities to default.
///
/// This is called by SDL_Quit().
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetLogPriorities
/// \sa SDL_SetLogPriority
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ResetLogPriorities(void)
/// ```
void sdlResetLogPriorities() {
  final sdlResetLogPrioritiesLookupFunction =
      libSdl3.lookupFunction<Void Function(), void Function()>(
          'SDL_ResetLogPriorities');
  return sdlResetLogPrioritiesLookupFunction();
}

///
/// Set the text prepended to log messages of a given priority.
///
/// By default SDL_LOG_PRIORITY_INFO and below have no prefix, and
/// SDL_LOG_PRIORITY_WARN and higher have a prefix showing their priority, e.g.
/// "WARNING: ".
///
/// \param priority the SDL_LogPriority to modify.
/// \param prefix the prefix to use for that log priority, or NULL to use no
/// prefix.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetLogPriorities
/// \sa SDL_SetLogPriority
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetLogPriorityPrefix(SDL_LogPriority priority, const char *prefix)
/// ```
bool sdlSetLogPriorityPrefix(int priority, String? prefix) {
  final sdlSetLogPriorityPrefixLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Int32 priority, Pointer<Utf8> prefix),
      int Function(
          int priority, Pointer<Utf8> prefix)>('SDL_SetLogPriorityPrefix');
  final prefixPointer = prefix != null ? prefix.toNativeUtf8() : nullptr;
  final result =
      sdlSetLogPriorityPrefixLookupFunction(priority, prefixPointer) == 1;
  calloc.free(prefixPointer);
  return result;
}

///
/// Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO.
///
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the `fmt` string, if
/// any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LogCritical
/// \sa SDL_LogDebug
/// \sa SDL_LogError
/// \sa SDL_LogInfo
/// \sa SDL_LogMessage
/// \sa SDL_LogMessageV
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_Log(SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(1)
/// ```
void sdlLog(String? fmt, Pointer<NativeType> arg1) {
  final sdlLogLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<Utf8> fmt, Pointer<NativeType> arg1),
      void Function(Pointer<Utf8> fmt, Pointer<NativeType> arg1)>('SDL_Log');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlLogLookupFunction(fmtPointer, arg1);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with SDL_LOG_PRIORITY_TRACE.
///
/// \param category the category of the message.
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the **fmt** string,
/// if any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogCritical
/// \sa SDL_LogDebug
/// \sa SDL_LogError
/// \sa SDL_LogInfo
/// \sa SDL_LogMessage
/// \sa SDL_LogMessageV
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogTrace(int category, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
void sdlLogTrace(int category, String? fmt, Pointer<NativeType> arg2) {
  final sdlLogTraceLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Int32 category, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      void Function(int category, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_LogTrace');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlLogTraceLookupFunction(category, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with SDL_LOG_PRIORITY_VERBOSE.
///
/// \param category the category of the message.
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the **fmt** string,
/// if any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogCritical
/// \sa SDL_LogDebug
/// \sa SDL_LogError
/// \sa SDL_LogInfo
/// \sa SDL_LogMessage
/// \sa SDL_LogMessageV
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogVerbose(int category, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
void sdlLogVerbose(int category, String? fmt, Pointer<NativeType> arg2) {
  final sdlLogVerboseLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Int32 category, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      void Function(int category, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_LogVerbose');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlLogVerboseLookupFunction(category, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with SDL_LOG_PRIORITY_DEBUG.
///
/// \param category the category of the message.
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the **fmt** string,
/// if any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogCritical
/// \sa SDL_LogError
/// \sa SDL_LogInfo
/// \sa SDL_LogMessage
/// \sa SDL_LogMessageV
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogDebug(int category, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
void sdlLogDebug(int category, String? fmt, Pointer<NativeType> arg2) {
  final sdlLogDebugLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Int32 category, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      void Function(int category, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_LogDebug');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlLogDebugLookupFunction(category, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with SDL_LOG_PRIORITY_INFO.
///
/// \param category the category of the message.
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the **fmt** string,
/// if any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogCritical
/// \sa SDL_LogDebug
/// \sa SDL_LogError
/// \sa SDL_LogMessage
/// \sa SDL_LogMessageV
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogInfo(int category, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
void sdlLogInfo(int category, String? fmt, Pointer<NativeType> arg2) {
  final sdlLogInfoLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Int32 category, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      void Function(int category, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_LogInfo');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlLogInfoLookupFunction(category, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with SDL_LOG_PRIORITY_WARN.
///
/// \param category the category of the message.
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the **fmt** string,
/// if any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogCritical
/// \sa SDL_LogDebug
/// \sa SDL_LogError
/// \sa SDL_LogInfo
/// \sa SDL_LogMessage
/// \sa SDL_LogMessageV
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogWarn(int category, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
void sdlLogWarn(int category, String? fmt, Pointer<NativeType> arg2) {
  final sdlLogWarnLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Int32 category, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      void Function(int category, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_LogWarn');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlLogWarnLookupFunction(category, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with SDL_LOG_PRIORITY_ERROR.
///
/// \param category the category of the message.
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the **fmt** string,
/// if any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogCritical
/// \sa SDL_LogDebug
/// \sa SDL_LogInfo
/// \sa SDL_LogMessage
/// \sa SDL_LogMessageV
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogError(int category, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
void sdlLogError(int category, String? fmt, Pointer<NativeType> arg2) {
  final sdlLogErrorLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Int32 category, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      void Function(int category, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_LogError');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlLogErrorLookupFunction(category, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with SDL_LOG_PRIORITY_CRITICAL.
///
/// \param category the category of the message.
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the **fmt** string,
/// if any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogDebug
/// \sa SDL_LogError
/// \sa SDL_LogInfo
/// \sa SDL_LogMessage
/// \sa SDL_LogMessageV
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogCritical(int category, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2)
/// ```
void sdlLogCritical(int category, String? fmt, Pointer<NativeType> arg2) {
  final sdlLogCriticalLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Int32 category, Pointer<Utf8> fmt, Pointer<NativeType> arg2),
      void Function(int category, Pointer<Utf8> fmt,
          Pointer<NativeType> arg2)>('SDL_LogCritical');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result = sdlLogCriticalLookupFunction(category, fmtPointer, arg2);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with the specified category and priority.
///
/// \param category the category of the message.
/// \param priority the priority of the message.
/// \param fmt a printf() style message format string.
/// \param ... additional parameters matching % tokens in the **fmt** string,
/// if any.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogCritical
/// \sa SDL_LogDebug
/// \sa SDL_LogError
/// \sa SDL_LogInfo
/// \sa SDL_LogMessageV
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogMessage(int category, SDL_LogPriority priority, SDL_PRINTF_FORMAT_STRING const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(3)
/// ```
void sdlLogMessage(
    int category, int priority, String? fmt, Pointer<NativeType> arg3) {
  final sdlLogMessageLookupFunction = libSdl3.lookupFunction<
      Void Function(Int32 category, Int32 priority, Pointer<Utf8> fmt,
          Pointer<NativeType> arg3),
      void Function(int category, int priority, Pointer<Utf8> fmt,
          Pointer<NativeType> arg3)>('SDL_LogMessage');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result =
      sdlLogMessageLookupFunction(category, priority, fmtPointer, arg3);
  calloc.free(fmtPointer);
  return result;
}

///
/// Log a message with the specified category and priority.
///
/// \param category the category of the message.
/// \param priority the priority of the message.
/// \param fmt a printf() style message format string.
/// \param ap a variable argument list.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_Log
/// \sa SDL_LogCritical
/// \sa SDL_LogDebug
/// \sa SDL_LogError
/// \sa SDL_LogInfo
/// \sa SDL_LogMessage
/// \sa SDL_LogTrace
/// \sa SDL_LogVerbose
/// \sa SDL_LogWarn
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LogMessageV(int category, SDL_LogPriority priority, SDL_PRINTF_FORMAT_STRING const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(3)
/// ```
void sdlLogMessageV(
    int category, int priority, String? fmt, Pointer<NativeType> arg3) {
  final sdlLogMessageVLookupFunction = libSdl3.lookupFunction<
      Void Function(Int32 category, Int32 priority, Pointer<Utf8> fmt,
          Pointer<NativeType> arg3),
      void Function(int category, int priority, Pointer<Utf8> fmt,
          Pointer<NativeType> arg3)>('SDL_LogMessageV');
  final fmtPointer = fmt != null ? fmt.toNativeUtf8() : nullptr;
  final result =
      sdlLogMessageVLookupFunction(category, priority, fmtPointer, arg3);
  calloc.free(fmtPointer);
  return result;
}

///
/// Get the default log output function.
///
/// \returns the default log output callback.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.4.
///
/// \sa SDL_SetLogOutputFunction
/// \sa SDL_GetLogOutputFunction
///
/// ```c
/// extern SDL_DECLSPEC SDL_LogOutputFunction SDLCALL SDL_GetDefaultLogOutputFunction(void)
/// ```
Pointer<NativeFunction<SdlLogOutputFunction>> sdlGetDefaultLogOutputFunction() {
  final sdlGetDefaultLogOutputFunctionLookupFunction = libSdl3.lookupFunction<
      Pointer<NativeFunction<SdlLogOutputFunction>> Function(),
      Pointer<NativeFunction<SdlLogOutputFunction>>
          Function()>('SDL_GetDefaultLogOutputFunction');
  return sdlGetDefaultLogOutputFunctionLookupFunction();
}

///
/// Get the current log output function.
///
/// \param callback an SDL_LogOutputFunction filled in with the current log
/// callback.
/// \param userdata a pointer filled in with the pointer that is passed to
/// `callback`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDefaultLogOutputFunction
/// \sa SDL_SetLogOutputFunction
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GetLogOutputFunction(SDL_LogOutputFunction *callback, void **userdata)
/// ```
void sdlGetLogOutputFunction(
    Pointer<Pointer<NativeFunction<SdlLogOutputFunction>>> callback,
    Pointer<Pointer<NativeType>> userdata) {
  final sdlGetLogOutputFunctionLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<Pointer<NativeFunction<SdlLogOutputFunction>>> callback,
          Pointer<Pointer<NativeType>> userdata),
      void Function(
          Pointer<Pointer<NativeFunction<SdlLogOutputFunction>>> callback,
          Pointer<Pointer<NativeType>> userdata)>('SDL_GetLogOutputFunction');
  return sdlGetLogOutputFunctionLookupFunction(callback, userdata);
}

///
/// Replace the default log output function with one of your own.
///
/// \param callback an SDL_LogOutputFunction to call instead of the default.
/// \param userdata a pointer that is passed to `callback`.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetDefaultLogOutputFunction
/// \sa SDL_GetLogOutputFunction
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetLogOutputFunction(SDL_LogOutputFunction callback, void *userdata)
/// ```
void sdlSetLogOutputFunction(
    Pointer<NativeFunction<SdlLogOutputFunction>> callback,
    Pointer<NativeType> userdata) {
  final sdlSetLogOutputFunctionLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeFunction<SdlLogOutputFunction>> callback,
          Pointer<NativeType> userdata),
      void Function(Pointer<NativeFunction<SdlLogOutputFunction>> callback,
          Pointer<NativeType> userdata)>('SDL_SetLogOutputFunction');
  return sdlSetLogOutputFunctionLookupFunction(callback, userdata);
}
