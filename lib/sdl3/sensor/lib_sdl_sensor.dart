part of '../sdl_sensor.dart';

///
/// Get a list of currently connected sensors.
///
/// \param count a pointer filled in with the number of sensors returned, may
/// be NULL.
/// \returns a 0 terminated array of sensor instance IDs or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SensorID * SDLCALL SDL_GetSensors(int *count)
/// ```
///
/// See also:
/// - [SDL_GetSensors - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetSensors)
///
/// {@category sensor}
List<int> sdlxGetSensors() => ffi.using((arena) {
  final countPointer = arena<Int32>();
  final sensorsPointer = sdlGetSensors(countPointer);

  if (sensorsPointer == nullptr) {
    return [];
  }

  try {
    return [for (var i = 0; i < countPointer.value; i++) sensorsPointer[i]];
  } finally {
    sdlFree(sensorsPointer.cast<Void>());
  }
});

///
/// Get the current state of an opened sensor.
///
/// The number of values and interpretation of the data is sensor dependent.
///
/// \param sensor the SDL_Sensor object to query.
/// \param data a pointer filled with the current sensor state.
/// \param num_values the number of values to write to data.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetSensorData(SDL_Sensor *sensor, float *data, int num_values)
/// ```
///
/// See also:
/// - [SDL_GetSensorData - SDL3 Wiki](https://wiki.libsdl.org/SDL3/SDL_GetSensorData)
///
/// {@category sensor}
bool sdlxGetSensorData(
  Pointer<SdlSensor> sensor,
  SdlxSensorData data, {
  int numValues = 6,
}) => ffi.using((arena) {
  final dataPointer = arena<Float>(numValues);
  final result = sdlGetSensorData(sensor, dataPointer, numValues);
  if (result) {
    for (var i = 0; i < numValues; i++) {
      data.data.add(dataPointer[i]);
    }
  }
  return result;
});
