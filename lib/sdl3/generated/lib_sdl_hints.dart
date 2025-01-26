// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';

///
/// Set a hint with a specific priority.
///
/// The priority controls the behavior when setting a hint that already has a
/// value. Hints will replace existing hints of their priority and lower.
/// Environment variables are considered to have override priority.
///
/// \param name the hint to set.
/// \param value the value of the hint variable.
/// \param priority the SDL_HintPriority level for the hint.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHint
/// \sa SDL_ResetHint
/// \sa SDL_SetHint
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetHintWithPriority(const char *name, const char *value, SDL_HintPriority priority)
/// ```
bool sdlSetHintWithPriority(String? name, String? value, int priority) {
  final sdlSetHintWithPriorityLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Utf8> name, Pointer<Utf8> value, Int32 priority),
      int Function(Pointer<Utf8> name, Pointer<Utf8> value,
          int priority)>('SDL_SetHintWithPriority');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final valuePointer = value != null ? value.toNativeUtf8() : nullptr;
  final result = sdlSetHintWithPriorityLookupFunction(
          namePointer, valuePointer, priority) ==
      1;
  calloc.free(namePointer);
  calloc.free(valuePointer);
  return result;
}

///
/// Set a hint with normal priority.
///
/// Hints will not be set if there is an existing override hint or environment
/// variable that takes precedence. You can use SDL_SetHintWithPriority() to
/// set the hint with override priority instead.
///
/// \param name the hint to set.
/// \param value the value of the hint variable.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHint
/// \sa SDL_ResetHint
/// \sa SDL_SetHintWithPriority
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetHint(const char *name, const char *value)
/// ```
bool sdlSetHint(String? name, String? value) {
  final sdlSetHintLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Utf8> name, Pointer<Utf8> value),
      int Function(Pointer<Utf8> name, Pointer<Utf8> value)>('SDL_SetHint');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final valuePointer = value != null ? value.toNativeUtf8() : nullptr;
  final result = sdlSetHintLookupFunction(namePointer, valuePointer) == 1;
  calloc.free(namePointer);
  calloc.free(valuePointer);
  return result;
}

///
/// Reset a hint to the default value.
///
/// This will reset a hint to the value of the environment variable, or NULL if
/// the environment isn't set. Callbacks will be called normally with this
/// change.
///
/// \param name the hint to set.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetHint
/// \sa SDL_ResetHints
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ResetHint(const char *name)
/// ```
bool sdlResetHint(String? name) {
  final sdlResetHintLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Utf8> name),
      int Function(Pointer<Utf8> name)>('SDL_ResetHint');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlResetHintLookupFunction(namePointer) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Reset all hints to the default values.
///
/// This will reset all hints to the value of the associated environment
/// variable, or NULL if the environment isn't set. Callbacks will be called
/// normally with this change.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ResetHint
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_ResetHints(void)
/// ```
void sdlResetHints() {
  final sdlResetHintsLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_ResetHints');
  return sdlResetHintsLookupFunction();
}

///
/// Get the value of a hint.
///
/// \param name the hint to query.
/// \returns the string value of a hint or NULL if the hint isn't set.
///
/// \threadsafety It is safe to call this function from any thread, however the
/// return value only remains valid until the hint is changed; if
/// another thread might do so, the app should supply locks
/// and/or make a copy of the string. Note that using a hint
/// callback instead is always thread-safe, as SDL holds a lock
/// on the thread subsystem during the callback.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetHint
/// \sa SDL_SetHintWithPriority
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetHint(const char *name)
/// ```
String? sdlGetHint(String? name) {
  final sdlGetHintLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<Utf8> name),
      Pointer<Utf8> Function(Pointer<Utf8> name)>('SDL_GetHint');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result = sdlGetHintLookupFunction(namePointer);
  calloc.free(namePointer);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the boolean value of a hint variable.
///
/// \param name the name of the hint to get the boolean value from.
/// \param default_value the value to return if the hint does not exist.
/// \returns the boolean value of a hint or the provided default value if the
/// hint does not exist.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHint
/// \sa SDL_SetHint
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetHintBoolean(const char *name, bool default_value)
/// ```
bool sdlGetHintBoolean(String? name, bool defaultValue) {
  final sdlGetHintBooleanLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<Utf8> name, Uint8 defaultValue),
      int Function(Pointer<Utf8> name, int defaultValue)>('SDL_GetHintBoolean');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlGetHintBooleanLookupFunction(namePointer, defaultValue ? 1 : 0) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Add a function to watch a particular hint.
///
/// The callback function is called _during_ this function, to provide it an
/// initial value, and again each time the hint's value changes.
///
/// \param name the hint to watch.
/// \param callback An SDL_HintCallback function that will be called when the
/// hint value changes.
/// \param userdata a pointer to pass to the callback function.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RemoveHintCallback
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_AddHintCallback(const char *name, SDL_HintCallback callback, void *userdata)
/// ```
bool sdlAddHintCallback(
    String? name,
    Pointer<NativeFunction<SdlHintCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlAddHintCallbackLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<Utf8> name,
          Pointer<NativeFunction<SdlHintCallback>> callback,
          Pointer<NativeType> userdata),
      int Function(
          Pointer<Utf8> name,
          Pointer<NativeFunction<SdlHintCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_AddHintCallback');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlAddHintCallbackLookupFunction(namePointer, callback, userdata) == 1;
  calloc.free(namePointer);
  return result;
}

///
/// Remove a function watching a particular hint.
///
/// \param name the hint being watched.
/// \param callback an SDL_HintCallback function that will be called when the
/// hint value changes.
/// \param userdata a pointer being passed to the callback function.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddHintCallback
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_RemoveHintCallback(const char *name, SDL_HintCallback callback, void *userdata)
/// ```
void sdlRemoveHintCallback(
    String? name,
    Pointer<NativeFunction<SdlHintCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlRemoveHintCallbackLookupFunction = libSdl3.lookupFunction<
      Void Function(
          Pointer<Utf8> name,
          Pointer<NativeFunction<SdlHintCallback>> callback,
          Pointer<NativeType> userdata),
      void Function(
          Pointer<Utf8> name,
          Pointer<NativeFunction<SdlHintCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_RemoveHintCallback');
  final namePointer = name != null ? name.toNativeUtf8() : nullptr;
  final result =
      sdlRemoveHintCallbackLookupFunction(namePointer, callback, userdata);
  calloc.free(namePointer);
  return result;
}
