part of '../../sdl.dart';

///
/// Get a list of currently connected joysticks.
///
/// \param count a pointer filled in with the number of joysticks returned, may
/// be NULL.
/// \returns a 0 terminated array of joystick instance IDs or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasJoystick
/// \sa SDL_OpenJoystick
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickID * SDLCALL SDL_GetJoysticks(int *count)
/// ```
/// {@category joystick}
List<int> sdlxGetJoysticks() {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final joysticksPointer = sdlGetJoysticks(countPointer);
  if (joysticksPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(joysticksPointer[i]);
    }
    sdlFree(joysticksPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}

///
/// Attach a new virtual joystick.
///
/// Apps can create virtual joysticks, that exist without hardware directly
/// backing them, and have program-supplied inputs. Once attached, a virtual
/// joystick looks like any other joystick that SDL can access. These can be
/// used to make other things look like joysticks, or provide pre-recorded
/// input, etc.
///
/// Once attached, the app can send joystick inputs to the new virtual joystick
/// using SDL_SetJoystickVirtualAxis(), etc.
///
/// When no longer needed, the virtual joystick can be removed by calling
/// SDL_DetachVirtualJoystick().
///
/// \param desc joystick description, initialized using SDL_INIT_INTERFACE().
/// \returns the joystick instance ID, or 0 on failure; call SDL_GetError() for
/// more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DetachVirtualJoystick
/// \sa SDL_SetJoystickVirtualAxis
/// \sa SDL_SetJoystickVirtualButton
/// \sa SDL_SetJoystickVirtualBall
/// \sa SDL_SetJoystickVirtualHat
/// \sa SDL_SetJoystickVirtualTouchpad
/// \sa SDL_SetJoystickVirtualSensorData
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickID SDLCALL SDL_AttachVirtualJoystick(const SDL_VirtualJoystickDesc *desc)
/// ```
/// {@category joystick}
int sdlxAttachVirtualJoystick(SdlxVirtualJoystickDesc desc) {
  final descPointer = desc.calloc();
  final result = sdlAttachVirtualJoystick(descPointer);
  descPointer.callocAllFree();
  return result;
}

///
/// Send a sensor update for an opened virtual joystick.
///
/// Please note that values set here will not be applied until the next call to
/// SDL_UpdateJoysticks, which can either be called directly, or can be called
/// indirectly through various other SDL APIs, including, but not limited to
/// the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
/// SDL_WaitEvent.
///
/// \param joystick the virtual joystick on which to set state.
/// \param type the type of the sensor on the virtual joystick to update.
/// \param sensor_timestamp a 64-bit timestamp in nanoseconds associated with
/// the sensor reading.
/// \param data the data associated with the sensor reading.
/// \param num_values the number of values pointed to by `data`.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetJoystickVirtualAxis
/// \sa SDL_SetJoystickVirtualButton
/// \sa SDL_SetJoystickVirtualBall
/// \sa SDL_SetJoystickVirtualHat
/// \sa SDL_SetJoystickVirtualTouchpad
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SendJoystickVirtualSensorData(SDL_Joystick *joystick, SDL_SensorType type, Uint64 sensor_timestamp, const float *data, int num_values)
/// ```
/// {@category joystick}
bool sdlxSendJoystickVirtualSensorData(
  Pointer<SdlJoystick> joystick,
  int type,
  int sensorTimestamp,
  List<double> data,
) {
  final dataPointer = ffi.calloc<Float>(data.length);
  for (var i = 0; i < data.length; i++) {
    dataPointer[i] = data[i];
  }
  final result = sdlSendJoystickVirtualSensorData(
    joystick,
    type,
    sensorTimestamp,
    dataPointer,
    data.length,
  );
  dataPointer.callocFree();
  return result;
}

///
/// Get the device information encoded in a SDL_GUID structure.
///
/// \param guid the SDL_GUID you wish to get info about.
/// \param vendor a pointer filled in with the device VID, or 0 if not
/// available.
/// \param product a pointer filled in with the device PID, or 0 if not
/// available.
/// \param version a pointer filled in with the device version, or 0 if not
/// available.
/// \param crc16 a pointer filled in with a CRC used to distinguish different
/// products with the same VID/PID, or 0 if not available.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickGUIDForID
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GetJoystickGUIDInfo(SDL_GUID guid, Uint16 *vendor, Uint16 *product, Uint16 *version, Uint16 *crc16)
/// ```
/// {@category joystick}
void sdlxGetJoystickGuidInfo(SdlGuid guid, SdlxJoystickGuidInfo info) {
  final vendorPointer = ffi.calloc<Uint16>();
  final productPointer = ffi.calloc<Uint16>();
  final versionPointer = ffi.calloc<Uint16>();
  final crc16Pointer = ffi.calloc<Uint16>();
  sdlGetJoystickGuidInfo(
    guid,
    vendorPointer,
    productPointer,
    versionPointer,
    crc16Pointer,
  );
  info
    ..vendor = vendorPointer.value
    ..product = productPointer.value
    ..version = versionPointer.value
    ..crc16 = crc16Pointer.value;
  vendorPointer.callocFree();
  productPointer.callocFree();
  versionPointer.callocFree();
  crc16Pointer.callocFree();
}

///
/// Get the initial state of an axis control on a joystick.
///
/// The state is a value ranging from -32768 to 32767.
///
/// The axis indices start at index 0.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \param axis the axis to query; the axis indices start at index 0.
/// \param state upon return, the initial value is supplied here.
/// \returns true if this axis has any initial value, or false if not.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetJoystickAxisInitialState(SDL_Joystick *joystick, int axis, Sint16 *state)
/// ```
/// {@category joystick}
int? sdlxGetJoystickAxisInitialState(Pointer<SdlJoystick> joystick, int axis) {
  int? result;
  final statePointer = ffi.calloc<Int16>();
  final bl = sdlGetJoystickAxisInitialState(joystick, axis, statePointer);
  if (bl) {
    result = statePointer.value;
  }
  statePointer.callocFree();
  return result;
}

///
/// Get the ball axis change since the last poll.
///
/// Trackballs can only return relative motion since the last call to
/// SDL_GetJoystickBall(), these motion deltas are placed into `dx` and `dy`.
///
/// Most joysticks do not have trackballs.
///
/// \param joystick the SDL_Joystick to query.
/// \param ball the ball index to query; ball indices start at index 0.
/// \param dx stores the difference in the x axis position since the last poll.
/// \param dy stores the difference in the y axis position since the last poll.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumJoystickBalls
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetJoystickBall(SDL_Joystick *joystick, int ball, int *dx, int *dy)
/// ```
/// {@category joystick}
SdlxPoint? sdlxGetJoystickBall(Pointer<SdlJoystick> joystick, int ball) {
  SdlxPoint? result;
  final dxPointer = ffi.calloc<Int32>();
  final dyPointer = ffi.calloc<Int32>();
  final bl = sdlGetJoystickBall(joystick, ball, dxPointer, dyPointer);
  if (bl) {
    result = SdlxPoint(dxPointer.value, dyPointer.value);
  }
  dxPointer.callocFree();
  dyPointer.callocFree();
  return result;
}

///
/// Get the battery state of a joystick.
///
/// You should never take a battery status as absolute truth. Batteries
/// (especially failing batteries) are delicate hardware, and the values
/// reported here are best estimates based on what that hardware reports. It's
/// not uncommon for older batteries to lose stored power much faster than it
/// reports, or completely drain when reporting it has 20 percent left, etc.
///
/// \param joystick the joystick to query.
/// \param percent a pointer filled in with the percentage of battery life
/// left, between 0 and 100, or NULL to ignore. This will be
/// filled in with -1 we can't determine a value or there is no
/// battery.
/// \returns the current battery state or `SDL_POWERSTATE_ERROR` on failure;
/// call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PowerState SDLCALL SDL_GetJoystickPowerInfo(SDL_Joystick *joystick, int *percent)
/// ```
/// {@category joystick}
int sdlxGetJoystickPowerInfo(
  Pointer<SdlJoystick> joystick,
  SdlxPowerInfo info,
) {
  final percentPointer = ffi.calloc<Int32>();
  final state = sdlGetJoystickPowerInfo(joystick, percentPointer);
  info
    ..state = state
    ..percent = percentPointer.value;
  percentPointer.callocFree();
  return state;
}
