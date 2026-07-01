part of '../../../sdl.dart';

///
/// Get the current gamepad mappings.
///
/// \param count a pointer filled in with the number of mappings returned, can
/// be NULL.
/// \returns an array of the mapping strings, NULL-terminated, or NULL on
/// failure; call SDL_GetError() for more information. This is a
/// single allocation that should be freed with SDL_free() when it is
/// no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC char ** SDLCALL SDL_GetGamepadMappings(int *count)
/// ```
/// {@category gamepad}
List<String> sdlxGetGamepadMappings() {
  final result = <String>[];
  final countPointer = calloc<Int32>();
  final stringsPointer = sdlGetGamepadMappings(countPointer);
  if (stringsPointer != nullptr) {
    final count = countPointer.value;
    for (var i = 0; i < count; i++) {
      final stringPointer = stringsPointer[i].cast<Utf8>();
      if (stringPointer != nullptr) {
        result.add(stringPointer.toDartString());
      }
    }
    sdlFree(stringsPointer.cast<Void>());
  }
  calloc.free(countPointer);
  return result;
}

///
/// Get the gamepad mapping string for a given GUID.
///
/// \param guid a structure containing the GUID for which a mapping is desired.
/// \returns a mapping string or NULL on failure; call SDL_GetError() for more
/// information. This should be freed with SDL_free() when it is no
/// longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickGUIDForID
/// \sa SDL_GetJoystickGUID
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetGamepadMappingForGUID(SDL_GUID guid)
/// ```
/// {@category gamepad}
String? sdlxGetGamepadMappingForGuid(SdlGuid guid) {
  String? result;
  final stringPointer = sdlGetGamepadMappingForGuid(guid);
  if (stringPointer != nullptr) {
    result = stringPointer.cast<Utf8>().toDartString();
    sdlFree(stringPointer.cast<Void>());
  }
  return result;
}

///
/// Get the current mapping of a gamepad.
///
/// Details about mappings are discussed with SDL_AddGamepadMapping().
///
/// \param gamepad the gamepad you want to get the current mapping for.
/// \returns a string that has the gamepad's mapping or NULL if no mapping is
/// available; call SDL_GetError() for more information. This should
/// be freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AddGamepadMapping
/// \sa SDL_GetGamepadMappingForID
/// \sa SDL_GetGamepadMappingForGUID
/// \sa SDL_SetGamepadMapping
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetGamepadMapping(SDL_Gamepad *gamepad)
/// ```
/// {@category gamepad}
String? sdlxGetGamepadMapping(Pointer<SdlGamepad> gamepad) {
  String? result;
  final stringPointer = sdlGetGamepadMapping(gamepad);
  if (stringPointer != nullptr) {
    result = stringPointer.cast<Utf8>().toDartString();
    sdlFree(stringPointer.cast<Void>());
  }
  return result;
}

///
/// Get a list of currently connected gamepads.
///
/// \param count a pointer filled in with the number of gamepads returned, may
/// be NULL.
/// \returns a 0 terminated array of joystick instance IDs or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasGamepad
/// \sa SDL_OpenGamepad
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickID * SDLCALL SDL_GetGamepads(int *count)
/// ```
/// {@category gamepad}
List<int> sdlxGetGamepads() {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final idsPointer = sdlGetGamepads(countPointer);
  if (idsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(idsPointer[i]);
    }
    sdlFree(idsPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}

///
/// Get the mapping of a gamepad.
///
/// This can be called before any gamepads are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the mapping string. Returns NULL if no mapping is available. This
/// should be freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetGamepads
/// \sa SDL_GetGamepadMapping
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetGamepadMappingForID(SDL_JoystickID instance_id)
/// ```
/// {@category gamepad}
String? sdlxGetGamepadMappingForId(int instanceId) {
  String? result;
  final stringPointer = sdlGetGamepadMappingForId(instanceId);
  if (stringPointer != nullptr) {
    result = stringPointer.cast<Utf8>().toDartString();
    sdlFree(stringPointer.cast<Void>());
  }
  return result;
}

///
/// Get the battery state of a gamepad.
///
/// You should never take a battery status as absolute truth. Batteries
/// (especially failing batteries) are delicate hardware, and the values
/// reported here are best estimates based on what that hardware reports. It's
/// not uncommon for older batteries to lose stored power much faster than it
/// reports, or completely drain when reporting it has 20 percent left, etc.
///
/// \param gamepad the gamepad object to query.
/// \param percent a pointer filled in with the percentage of battery life
/// left, between 0 and 100, or NULL to ignore. This will be
/// filled in with -1 we can't determine a value or there is no
/// battery.
/// \returns the current battery state.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PowerState SDLCALL SDL_GetGamepadPowerInfo(SDL_Gamepad *gamepad, int *percent)
/// ```
/// {@category gamepad}
({int percent, int state}) sdlxGetGamepadPowerInfo(
  Pointer<SdlGamepad> gamepad,
) {
  var percent = 0;
  final percentPointer = ffi.calloc<Int32>();
  final state = sdlGetGamepadPowerInfo(gamepad, percentPointer);
  percent = percentPointer.value;
  return (percent: percent, state: state);
}

///
/// Get the SDL joystick layer bindings for a gamepad.
///
/// \param gamepad a gamepad.
/// \param count a pointer filled in with the number of bindings returned.
/// \returns a NULL terminated array of pointers to bindings or NULL on
/// failure; call SDL_GetError() for more information. This is a
/// single allocation that should be freed with SDL_free() when it is
/// no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadBinding ** SDLCALL SDL_GetGamepadBindings(SDL_Gamepad *gamepad, int *count)
/// ```
/// {@category gamepad}
List<SdlxGamepadBinding> sdlxGetGamepadBindings(Pointer<SdlGamepad> gamepad) {
  final result = <SdlxGamepadBinding>[];
  final countPointer = ffi.calloc<Int32>();
  final bindingsPointer = sdlGetGamepadBindings(gamepad, countPointer);
  if (bindingsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(SdlxGamepadBinding()..loadFromPointer(bindingsPointer[i]));
    }
    sdlFree(bindingsPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}

///
/// Get the current state of a finger on a touchpad on a gamepad.
///
/// \param gamepad a gamepad.
/// \param touchpad a touchpad.
/// \param finger a finger.
/// \param down a pointer filled with true if the finger is down, false
/// otherwise, may be NULL.
/// \param x a pointer filled with the x position, normalized 0 to 1, with the
/// origin in the upper left, may be NULL.
/// \param y a pointer filled with the y position, normalized 0 to 1, with the
/// origin in the upper left, may be NULL.
/// \param pressure a pointer filled with pressure value, may be NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumGamepadTouchpadFingers
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetGamepadTouchpadFinger(SDL_Gamepad *gamepad, int touchpad, int finger, bool *down, float *x, float *y, float *pressure)
/// ```
/// {@category gamepad}
bool sdlxGetGamepadTouchpadFinger(
  Pointer<SdlGamepad> gamepad,
  int touchpad,
  int finger,
  SdlxGamepadTouchpadFinger info,
) {
  final downPointer = ffi.calloc<Bool>();
  final xPointer = ffi.calloc<Float>();
  final yPointer = ffi.calloc<Float>();
  final pressurePointer = ffi.calloc<Float>();
  final result = sdlGetGamepadTouchpadFinger(
    gamepad,
    touchpad,
    finger,
    downPointer,
    xPointer,
    yPointer,
    pressurePointer,
  );
  if (result) {
    info
      ..down = downPointer.value
      ..x = xPointer.value
      ..y = yPointer.value
      ..pressure = pressurePointer.value;
  }
  downPointer.callocFree();
  xPointer.callocFree();
  yPointer.callocFree();
  pressurePointer.callocFree();
  return result;
}

///
/// Get the current state of a gamepad sensor.
///
/// The number of values and interpretation of the data is sensor dependent.
/// See the remarks in SDL_SensorType for details for each type of sensor.
///
/// \param gamepad the gamepad to query.
/// \param type the type of sensor to query.
/// \param data a pointer filled with the current sensor state.
/// \param num_values the number of values to write to data.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetGamepadSensorData(SDL_Gamepad *gamepad, SDL_SensorType type, float *data, int num_values)
/// ```
/// {@category gamepad}
bool sdlxGetGamepadSensorData(
  Pointer<SdlGamepad> gamepad,
  int type,
  SdlxSensorData data, {
  int numValues = 3,
}) {
  final dataPointer = ffi.calloc<Float>(numValues);
  final result = sdlGetGamepadSensorData(gamepad, type, dataPointer, numValues);
  if (result) {
    for (var i = 0; i < numValues; i++) {
      data.data.add(dataPointer[i]);
    }
  }
  dataPointer.callocFree();
  return result;
}
