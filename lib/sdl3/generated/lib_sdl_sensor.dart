// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Get a list of currently connected sensors.
///
/// \param count a pointer filled in with the number of sensors returned
/// \returns a 0 terminated array of sensor instance IDs which should be freed
/// with SDL_free(), or NULL on error; call SDL_GetError() for more
/// details.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SensorID *SDLCALL SDL_GetSensors(int *count)
/// ```
Pointer<Uint32> sdlGetSensors(Pointer<Int32> count) {
  final sdlGetSensorsLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(Pointer<Int32> count)>('SDL_GetSensors');
  return sdlGetSensorsLookupFunction(count);
}

///
/// Get the implementation dependent name of a sensor.
///
/// \param instance_id the sensor instance ID
/// \returns the sensor name, or NULL if `instance_id` is not valid
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetSensorInstanceName(SDL_SensorID instance_id)
/// ```
String? sdlGetSensorInstanceName(int instanceId) {
  final sdlGetSensorInstanceNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetSensorInstanceName');
  final result = sdlGetSensorInstanceNameLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the type of a sensor.
///
/// \param instance_id the sensor instance ID
/// \returns the SDL_SensorType, or `SDL_SENSOR_INVALID` if `instance_id` is
/// not valid
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SensorType SDLCALL SDL_GetSensorInstanceType(SDL_SensorID instance_id)
/// ```
int sdlGetSensorInstanceType(int instanceId) {
  final sdlGetSensorInstanceTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetSensorInstanceType');
  return sdlGetSensorInstanceTypeLookupFunction(instanceId);
}

///
/// Get the platform dependent type of a sensor.
///
/// \param instance_id the sensor instance ID
/// \returns the sensor platform dependent type, or -1 if `instance_id` is not
/// valid
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetSensorInstanceNonPortableType(SDL_SensorID instance_id)
/// ```
int sdlGetSensorInstanceNonPortableType(int instanceId) {
  final sdlGetSensorInstanceNonPortableTypeLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Uint32 instanceId),
          int Function(int instanceId)>('SDL_GetSensorInstanceNonPortableType');
  return sdlGetSensorInstanceNonPortableTypeLookupFunction(instanceId);
}

///
/// Open a sensor for use.
///
/// \param instance_id the sensor instance ID
/// \returns an SDL_Sensor sensor object, or NULL if an error occurred.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Sensor *SDLCALL SDL_OpenSensor(SDL_SensorID instance_id)
/// ```
Pointer<SdlSensor> sdlOpenSensor(int instanceId) {
  final sdlOpenSensorLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSensor> Function(Uint32 instanceId),
      Pointer<SdlSensor> Function(int instanceId)>('SDL_OpenSensor');
  return sdlOpenSensorLookupFunction(instanceId);
}

///
/// Return the SDL_Sensor associated with an instance ID.
///
/// \param instance_id the sensor instance ID
/// \returns an SDL_Sensor object.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Sensor *SDLCALL SDL_GetSensorFromInstanceID(SDL_SensorID instance_id)
/// ```
Pointer<SdlSensor> sdlGetSensorFromInstanceId(int instanceId) {
  final sdlGetSensorFromInstanceIdLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlSensor> Function(Uint32 instanceId),
      Pointer<SdlSensor> Function(
          int instanceId)>('SDL_GetSensorFromInstanceID');
  return sdlGetSensorFromInstanceIdLookupFunction(instanceId);
}

///
/// Get the properties associated with a sensor.
///
/// \param sensor The SDL_Sensor object
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetSensorProperties(SDL_Sensor *sensor)
/// ```
int sdlGetSensorProperties(Pointer<SdlSensor> sensor) {
  final sdlGetSensorPropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlSensor> sensor),
      int Function(Pointer<SdlSensor> sensor)>('SDL_GetSensorProperties');
  return sdlGetSensorPropertiesLookupFunction(sensor);
}

///
/// Get the implementation dependent name of a sensor.
///
/// \param sensor The SDL_Sensor object
/// \returns the sensor name, or NULL if `sensor` is NULL.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC const char *SDLCALL SDL_GetSensorName(SDL_Sensor *sensor)
/// ```
String? sdlGetSensorName(Pointer<SdlSensor> sensor) {
  final sdlGetSensorNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlSensor> sensor),
      Pointer<Utf8> Function(Pointer<SdlSensor> sensor)>('SDL_GetSensorName');
  final result = sdlGetSensorNameLookupFunction(sensor);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the type of a sensor.
///
/// \param sensor The SDL_Sensor object to inspect
/// \returns the SDL_SensorType type, or `SDL_SENSOR_INVALID` if `sensor` is
/// NULL.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SensorType SDLCALL SDL_GetSensorType(SDL_Sensor *sensor)
/// ```
int sdlGetSensorType(Pointer<SdlSensor> sensor) {
  final sdlGetSensorTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSensor> sensor),
      int Function(Pointer<SdlSensor> sensor)>('SDL_GetSensorType');
  return sdlGetSensorTypeLookupFunction(sensor);
}

///
/// Get the platform dependent type of a sensor.
///
/// \param sensor The SDL_Sensor object to inspect
/// \returns the sensor platform dependent type, or -1 if `sensor` is NULL.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetSensorNonPortableType(SDL_Sensor *sensor)
/// ```
int sdlGetSensorNonPortableType(Pointer<SdlSensor> sensor) {
  final sdlGetSensorNonPortableTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlSensor> sensor),
      int Function(Pointer<SdlSensor> sensor)>('SDL_GetSensorNonPortableType');
  return sdlGetSensorNonPortableTypeLookupFunction(sensor);
}

///
/// Get the instance ID of a sensor.
///
/// \param sensor The SDL_Sensor object to inspect
/// \returns the sensor instance ID, or 0 if `sensor` is NULL.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SensorID SDLCALL SDL_GetSensorInstanceID(SDL_Sensor *sensor)
/// ```
int sdlGetSensorInstanceId(Pointer<SdlSensor> sensor) {
  final sdlGetSensorInstanceIdLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlSensor> sensor),
      int Function(Pointer<SdlSensor> sensor)>('SDL_GetSensorInstanceID');
  return sdlGetSensorInstanceIdLookupFunction(sensor);
}

///
/// Get the current state of an opened sensor.
///
/// The number of values and interpretation of the data is sensor dependent.
///
/// \param sensor The SDL_Sensor object to query
/// \param data A pointer filled with the current sensor state
/// \param num_values The number of values to write to data
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetSensorData(SDL_Sensor *sensor, float *data, int num_values)
/// ```
int sdlGetSensorData(
    Pointer<SdlSensor> sensor, Pointer<Float> data, int numValues) {
  final sdlGetSensorDataLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlSensor> sensor, Pointer<Float> data, Int32 numValues),
      int Function(Pointer<SdlSensor> sensor, Pointer<Float> data,
          int numValues)>('SDL_GetSensorData');
  return sdlGetSensorDataLookupFunction(sensor, data, numValues);
}

///
/// Close a sensor previously opened with SDL_OpenSensor().
///
/// \param sensor The SDL_Sensor object to close
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CloseSensor(SDL_Sensor *sensor)
/// ```
void sdlCloseSensor(Pointer<SdlSensor> sensor) {
  final sdlCloseSensorLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlSensor> sensor),
      void Function(Pointer<SdlSensor> sensor)>('SDL_CloseSensor');
  return sdlCloseSensorLookupFunction(sensor);
}

///
/// Update the current state of the open sensors.
///
/// This is called automatically by the event loop if sensor events are
/// enabled.
///
/// This needs to be called from the thread that initialized the sensor
/// subsystem.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UpdateSensors(void)
/// ```
void sdlUpdateSensors() {
  final sdlUpdateSensorsLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_UpdateSensors');
  return sdlUpdateSensorsLookupFunction();
}
