// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
part of '../sdl.dart';

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
Pointer<Uint32> sdlGetSensors(Pointer<Int32> count) {
  final sdlGetSensorsLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Uint32> Function(Pointer<Int32> count),
        Pointer<Uint32> Function(Pointer<Int32> count)
      >('SDL_GetSensors');
  return sdlGetSensorsLookupFunction(count);
}

///
/// Get the implementation dependent name of a sensor.
///
/// This can be called before any sensors are opened.
///
/// \param instance_id the sensor instance ID.
/// \returns the sensor name, or NULL if `instance_id` is not valid.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetSensorNameForID(SDL_SensorID instance_id)
/// ```
String? sdlGetSensorNameForId(int instanceId) {
  final sdlGetSensorNameForIdLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Utf8> Function(Uint32 instanceId),
        Pointer<Utf8> Function(int instanceId)
      >('SDL_GetSensorNameForID');
  final result = sdlGetSensorNameForIdLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the type of a sensor.
///
/// This can be called before any sensors are opened.
///
/// \param instance_id the sensor instance ID.
/// \returns the SDL_SensorType, or `SDL_SENSOR_INVALID` if `instance_id` is
/// not valid.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SensorType SDLCALL SDL_GetSensorTypeForID(SDL_SensorID instance_id)
/// ```
int sdlGetSensorTypeForId(int instanceId) {
  final sdlGetSensorTypeForIdLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetSensorTypeForID');
  return sdlGetSensorTypeForIdLookupFunction(instanceId);
}

///
/// Get the platform dependent type of a sensor.
///
/// This can be called before any sensors are opened.
///
/// \param instance_id the sensor instance ID.
/// \returns the sensor platform dependent type, or -1 if `instance_id` is not
/// valid.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetSensorNonPortableTypeForID(SDL_SensorID instance_id)
/// ```
int sdlGetSensorNonPortableTypeForId(int instanceId) {
  final sdlGetSensorNonPortableTypeForIdLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetSensorNonPortableTypeForID');
  return sdlGetSensorNonPortableTypeForIdLookupFunction(instanceId);
}

///
/// Open a sensor for use.
///
/// \param instance_id the sensor instance ID.
/// \returns an SDL_Sensor object or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Sensor * SDLCALL SDL_OpenSensor(SDL_SensorID instance_id)
/// ```
Pointer<SdlSensor> sdlOpenSensor(int instanceId) {
  final sdlOpenSensorLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSensor> Function(Uint32 instanceId),
        Pointer<SdlSensor> Function(int instanceId)
      >('SDL_OpenSensor');
  return sdlOpenSensorLookupFunction(instanceId);
}

///
/// Return the SDL_Sensor associated with an instance ID.
///
/// \param instance_id the sensor instance ID.
/// \returns an SDL_Sensor object or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Sensor * SDLCALL SDL_GetSensorFromID(SDL_SensorID instance_id)
/// ```
Pointer<SdlSensor> sdlGetSensorFromId(int instanceId) {
  final sdlGetSensorFromIdLookupFunction = _libSdl
      .lookupFunction<
        Pointer<SdlSensor> Function(Uint32 instanceId),
        Pointer<SdlSensor> Function(int instanceId)
      >('SDL_GetSensorFromID');
  return sdlGetSensorFromIdLookupFunction(instanceId);
}

///
/// Get the properties associated with a sensor.
///
/// \param sensor the SDL_Sensor object.
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetSensorProperties(SDL_Sensor *sensor)
/// ```
int sdlGetSensorProperties(Pointer<SdlSensor> sensor) {
  final sdlGetSensorPropertiesLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlSensor> sensor),
        int Function(Pointer<SdlSensor> sensor)
      >('SDL_GetSensorProperties');
  return sdlGetSensorPropertiesLookupFunction(sensor);
}

///
/// Get the implementation dependent name of a sensor.
///
/// \param sensor the SDL_Sensor object.
/// \returns the sensor name or NULL on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetSensorName(SDL_Sensor *sensor)
/// ```
String? sdlGetSensorName(Pointer<SdlSensor> sensor) {
  final sdlGetSensorNameLookupFunction = _libSdl
      .lookupFunction<
        Pointer<Utf8> Function(Pointer<SdlSensor> sensor),
        Pointer<Utf8> Function(Pointer<SdlSensor> sensor)
      >('SDL_GetSensorName');
  final result = sdlGetSensorNameLookupFunction(sensor);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the type of a sensor.
///
/// \param sensor the SDL_Sensor object to inspect.
/// \returns the SDL_SensorType type, or `SDL_SENSOR_INVALID` if `sensor` is
/// NULL.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SensorType SDLCALL SDL_GetSensorType(SDL_Sensor *sensor)
/// ```
int sdlGetSensorType(Pointer<SdlSensor> sensor) {
  final sdlGetSensorTypeLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Pointer<SdlSensor> sensor),
        int Function(Pointer<SdlSensor> sensor)
      >('SDL_GetSensorType');
  return sdlGetSensorTypeLookupFunction(sensor);
}

///
/// Get the platform dependent type of a sensor.
///
/// \param sensor the SDL_Sensor object to inspect.
/// \returns the sensor platform dependent type, or -1 if `sensor` is NULL.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetSensorNonPortableType(SDL_Sensor *sensor)
/// ```
int sdlGetSensorNonPortableType(Pointer<SdlSensor> sensor) {
  final sdlGetSensorNonPortableTypeLookupFunction = _libSdl
      .lookupFunction<
        Int32 Function(Pointer<SdlSensor> sensor),
        int Function(Pointer<SdlSensor> sensor)
      >('SDL_GetSensorNonPortableType');
  return sdlGetSensorNonPortableTypeLookupFunction(sensor);
}

///
/// Get the instance ID of a sensor.
///
/// \param sensor the SDL_Sensor object to inspect.
/// \returns the sensor instance ID, or 0 on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_SensorID SDLCALL SDL_GetSensorID(SDL_Sensor *sensor)
/// ```
int sdlGetSensorId(Pointer<SdlSensor> sensor) {
  final sdlGetSensorIdLookupFunction = _libSdl
      .lookupFunction<
        Uint32 Function(Pointer<SdlSensor> sensor),
        int Function(Pointer<SdlSensor> sensor)
      >('SDL_GetSensorID');
  return sdlGetSensorIdLookupFunction(sensor);
}

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
bool sdlGetSensorData(
  Pointer<SdlSensor> sensor,
  Pointer<Float> data,
  int numValues,
) {
  final sdlGetSensorDataLookupFunction = _libSdl
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlSensor> sensor,
          Pointer<Float> data,
          Int32 numValues,
        ),
        int Function(
          Pointer<SdlSensor> sensor,
          Pointer<Float> data,
          int numValues,
        )
      >('SDL_GetSensorData');
  return sdlGetSensorDataLookupFunction(sensor, data, numValues) == 1;
}

///
/// Close a sensor previously opened with SDL_OpenSensor().
///
/// \param sensor the SDL_Sensor object to close.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CloseSensor(SDL_Sensor *sensor)
/// ```
void sdlCloseSensor(Pointer<SdlSensor> sensor) {
  final sdlCloseSensorLookupFunction = _libSdl
      .lookupFunction<
        Void Function(Pointer<SdlSensor> sensor),
        void Function(Pointer<SdlSensor> sensor)
      >('SDL_CloseSensor');
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UpdateSensors(void)
/// ```
void sdlUpdateSensors() {
  final sdlUpdateSensorsLookupFunction = _libSdl
      .lookupFunction<Void Function(), void Function()>('SDL_UpdateSensors');
  return sdlUpdateSensorsLookupFunction();
}
