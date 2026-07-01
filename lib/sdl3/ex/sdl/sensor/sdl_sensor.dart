part of '../../../sdl.dart';

extension SdlSensorEx on SdlSensor {
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
  /// {@category sensor}
  static List<int> gets() => sdlxGetSensors();

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
  /// {@category sensor}
  static String? getNameForId(int instanceId) =>
      sdlGetSensorNameForId(instanceId);

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
  /// {@category sensor}
  static int getTypeForId(int instanceId) => sdlGetSensorTypeForId(instanceId);

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
  /// {@category sensor}
  static int getNonPortableTypeForId(int instanceId) =>
      sdlGetSensorNonPortableTypeForId(instanceId);

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
  /// {@category sensor}
  static Pointer<SdlSensor> open(int instanceId) => sdlOpenSensor(instanceId);

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
  /// {@category sensor}
  static Pointer<SdlSensor> getFromId(int instanceId) =>
      sdlGetSensorFromId(instanceId);

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
  /// {@category sensor}
  static void updates() => sdlUpdateSensors();
}

extension SdlSensorPointerEx on Pointer<SdlSensor> {
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
  /// {@category sensor}
  int getProperties() => sdlGetSensorProperties(this);

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
  /// {@category sensor}
  String? getName() => sdlGetSensorName(this);

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
  /// {@category sensor}
  int getType() => sdlGetSensorType(this);

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
  /// {@category sensor}
  int getNonPortableType() => sdlGetSensorNonPortableType(this);

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
  /// {@category sensor}
  int getId() => sdlGetSensorId(this);

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
  /// {@category sensor}
  bool sdlGetData(SdlxSensorData data, {int numValues = 6}) =>
      sdlxGetSensorData(this, data, numValues: numValues);

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
  /// {@category sensor}
  void close() => sdlCloseSensor(this);
}
