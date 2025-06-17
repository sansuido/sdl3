// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: avoid_positional_boolean_parameters
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Locking for atomic access to the joystick API.
///
/// The SDL joystick functions are thread-safe, however you can lock the
/// joysticks while processing to guarantee that the joystick list won't change
/// and joystick and gamepad events will not be delivered.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_LockJoysticks(void) SDL_ACQUIRE(SDL_joystick_lock)
/// ```
void sdlLockJoysticks(Pointer<NativeType> arg0) {
  final sdlLockJoysticksLookupFunction = libSdl3
      .lookupFunction<
        Void Function(Pointer<NativeType> arg0),
        void Function(Pointer<NativeType> arg0)
      >('SDL_LockJoysticks');
  return sdlLockJoysticksLookupFunction(arg0);
}

///
/// Unlocking for atomic access to the joystick API.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnlockJoysticks(void) SDL_RELEASE(SDL_joystick_lock)
/// ```
void sdlUnlockJoysticks(Pointer<NativeType> arg0) {
  final sdlUnlockJoysticksLookupFunction = libSdl3
      .lookupFunction<
        Void Function(Pointer<NativeType> arg0),
        void Function(Pointer<NativeType> arg0)
      >('SDL_UnlockJoysticks');
  return sdlUnlockJoysticksLookupFunction(arg0);
}

///
/// Return whether a joystick is currently connected.
///
/// \returns true if a joystick is connected, false otherwise.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasJoystick(void)
/// ```
bool sdlHasJoystick() {
  final sdlHasJoystickLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_HasJoystick');
  return sdlHasJoystickLookupFunction() == 1;
}

///
/// Get a list of currently connected joysticks.
///
/// \param count a pointer filled in with the number of joysticks returned, may
/// be NULL.
/// \returns a 0 terminated array of joystick instance IDs or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HasJoystick
/// \sa SDL_OpenJoystick
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickID * SDLCALL SDL_GetJoysticks(int *count)
/// ```
Pointer<Uint32> sdlGetJoysticks(Pointer<Int32> count) {
  final sdlGetJoysticksLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Uint32> Function(Pointer<Int32> count),
        Pointer<Uint32> Function(Pointer<Int32> count)
      >('SDL_GetJoysticks');
  return sdlGetJoysticksLookupFunction(count);
}

///
/// Get the implementation dependent name of a joystick.
///
/// This can be called before any joysticks are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the name of the selected joystick. If no name can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickName
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetJoystickNameForID(SDL_JoystickID instance_id)
/// ```
String? sdlGetJoystickNameForId(int instanceId) {
  final sdlGetJoystickNameForIdLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Utf8> Function(Uint32 instanceId),
        Pointer<Utf8> Function(int instanceId)
      >('SDL_GetJoystickNameForID');
  final result = sdlGetJoystickNameForIdLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the implementation dependent path of a joystick.
///
/// This can be called before any joysticks are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the path of the selected joystick. If no path can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickPath
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetJoystickPathForID(SDL_JoystickID instance_id)
/// ```
String? sdlGetJoystickPathForId(int instanceId) {
  final sdlGetJoystickPathForIdLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Utf8> Function(Uint32 instanceId),
        Pointer<Utf8> Function(int instanceId)
      >('SDL_GetJoystickPathForID');
  final result = sdlGetJoystickPathForIdLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the player index of a joystick.
///
/// This can be called before any joysticks are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the player index of a joystick, or -1 if it's not available.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickPlayerIndex
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetJoystickPlayerIndexForID(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickPlayerIndexForId(int instanceId) {
  final sdlGetJoystickPlayerIndexForIdLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetJoystickPlayerIndexForID');
  return sdlGetJoystickPlayerIndexForIdLookupFunction(instanceId);
}

///
/// Get the implementation-dependent GUID of a joystick.
///
/// This can be called before any joysticks are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the GUID of the selected joystick. If called with an invalid
/// instance_id, this function returns a zero GUID.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickGUID
/// \sa SDL_GUIDToString
///
/// ```c
/// extern SDL_DECLSPEC SDL_GUID SDLCALL SDL_GetJoystickGUIDForID(SDL_JoystickID instance_id)
/// ```
SdlGuid sdlGetJoystickGuidForId(int instanceId) {
  final sdlGetJoystickGuidForIdLookupFunction = libSdl3
      .lookupFunction<
        SdlGuid Function(Uint32 instanceId),
        SdlGuid Function(int instanceId)
      >('SDL_GetJoystickGUIDForID');
  return sdlGetJoystickGuidForIdLookupFunction(instanceId);
}

///
/// Get the USB vendor ID of a joystick, if available.
///
/// This can be called before any joysticks are opened. If the vendor ID isn't
/// available this function returns 0.
///
/// \param instance_id the joystick instance ID.
/// \returns the USB vendor ID of the selected joystick. If called with an
/// invalid instance_id, this function returns 0.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickVendor
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetJoystickVendorForID(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickVendorForId(int instanceId) {
  final sdlGetJoystickVendorForIdLookupFunction = libSdl3
      .lookupFunction<
        Uint16 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetJoystickVendorForID');
  return sdlGetJoystickVendorForIdLookupFunction(instanceId);
}

///
/// Get the USB product ID of a joystick, if available.
///
/// This can be called before any joysticks are opened. If the product ID isn't
/// available this function returns 0.
///
/// \param instance_id the joystick instance ID.
/// \returns the USB product ID of the selected joystick. If called with an
/// invalid instance_id, this function returns 0.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickProduct
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetJoystickProductForID(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickProductForId(int instanceId) {
  final sdlGetJoystickProductForIdLookupFunction = libSdl3
      .lookupFunction<
        Uint16 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetJoystickProductForID');
  return sdlGetJoystickProductForIdLookupFunction(instanceId);
}

///
/// Get the product version of a joystick, if available.
///
/// This can be called before any joysticks are opened. If the product version
/// isn't available this function returns 0.
///
/// \param instance_id the joystick instance ID.
/// \returns the product version of the selected joystick. If called with an
/// invalid instance_id, this function returns 0.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickProductVersion
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetJoystickProductVersionForID(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickProductVersionForId(int instanceId) {
  final sdlGetJoystickProductVersionForIdLookupFunction = libSdl3
      .lookupFunction<
        Uint16 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetJoystickProductVersionForID');
  return sdlGetJoystickProductVersionForIdLookupFunction(instanceId);
}

///
/// Get the type of a joystick, if available.
///
/// This can be called before any joysticks are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the SDL_JoystickType of the selected joystick. If called with an
/// invalid instance_id, this function returns
/// `SDL_JOYSTICK_TYPE_UNKNOWN`.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickType
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickType SDLCALL SDL_GetJoystickTypeForID(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickTypeForId(int instanceId) {
  final sdlGetJoystickTypeForIdLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_GetJoystickTypeForID');
  return sdlGetJoystickTypeForIdLookupFunction(instanceId);
}

///
/// Open a joystick for use.
///
/// The joystick subsystem must be initialized before a joystick can be opened
/// for use.
///
/// \param instance_id the joystick instance ID.
/// \returns a joystick identifier or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseJoystick
///
/// ```c
/// extern SDL_DECLSPEC SDL_Joystick * SDLCALL SDL_OpenJoystick(SDL_JoystickID instance_id)
/// ```
Pointer<SdlJoystick> sdlOpenJoystick(int instanceId) {
  final sdlOpenJoystickLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlJoystick> Function(Uint32 instanceId),
        Pointer<SdlJoystick> Function(int instanceId)
      >('SDL_OpenJoystick');
  return sdlOpenJoystickLookupFunction(instanceId);
}

///
/// Get the SDL_Joystick associated with an instance ID, if it has been opened.
///
/// \param instance_id the instance ID to get the SDL_Joystick for.
/// \returns an SDL_Joystick on success or NULL on failure or if it hasn't been
/// opened yet; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Joystick * SDLCALL SDL_GetJoystickFromID(SDL_JoystickID instance_id)
/// ```
Pointer<SdlJoystick> sdlGetJoystickFromId(int instanceId) {
  final sdlGetJoystickFromIdLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlJoystick> Function(Uint32 instanceId),
        Pointer<SdlJoystick> Function(int instanceId)
      >('SDL_GetJoystickFromID');
  return sdlGetJoystickFromIdLookupFunction(instanceId);
}

///
/// Get the SDL_Joystick associated with a player index.
///
/// \param player_index the player index to get the SDL_Joystick for.
/// \returns an SDL_Joystick on success or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickPlayerIndex
/// \sa SDL_SetJoystickPlayerIndex
///
/// ```c
/// extern SDL_DECLSPEC SDL_Joystick * SDLCALL SDL_GetJoystickFromPlayerIndex(int player_index)
/// ```
Pointer<SdlJoystick> sdlGetJoystickFromPlayerIndex(int playerIndex) {
  final sdlGetJoystickFromPlayerIndexLookupFunction = libSdl3
      .lookupFunction<
        Pointer<SdlJoystick> Function(Int32 playerIndex),
        Pointer<SdlJoystick> Function(int playerIndex)
      >('SDL_GetJoystickFromPlayerIndex');
  return sdlGetJoystickFromPlayerIndexLookupFunction(playerIndex);
}

///
/// Attach a new virtual joystick.
///
/// \param desc joystick description, initialized using SDL_INIT_INTERFACE().
/// \returns the joystick instance ID, or 0 on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DetachVirtualJoystick
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickID SDLCALL SDL_AttachVirtualJoystick(const SDL_VirtualJoystickDesc *desc)
/// ```
int sdlAttachVirtualJoystick(Pointer<SdlVirtualJoystickDesc> desc) {
  final sdlAttachVirtualJoystickLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(Pointer<SdlVirtualJoystickDesc> desc),
        int Function(Pointer<SdlVirtualJoystickDesc> desc)
      >('SDL_AttachVirtualJoystick');
  return sdlAttachVirtualJoystickLookupFunction(desc);
}

///
/// Detach a virtual joystick.
///
/// \param instance_id the joystick instance ID, previously returned from
/// SDL_AttachVirtualJoystick().
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_AttachVirtualJoystick
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_DetachVirtualJoystick(SDL_JoystickID instance_id)
/// ```
bool sdlDetachVirtualJoystick(int instanceId) {
  final sdlDetachVirtualJoystickLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_DetachVirtualJoystick');
  return sdlDetachVirtualJoystickLookupFunction(instanceId) == 1;
}

///
/// Query whether or not a joystick is virtual.
///
/// \param instance_id the joystick instance ID.
/// \returns true if the joystick is virtual, false otherwise.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_IsJoystickVirtual(SDL_JoystickID instance_id)
/// ```
bool sdlIsJoystickVirtual(int instanceId) {
  final sdlIsJoystickVirtualLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Uint32 instanceId),
        int Function(int instanceId)
      >('SDL_IsJoystickVirtual');
  return sdlIsJoystickVirtualLookupFunction(instanceId) == 1;
}

///
/// Set the state of an axis on an opened virtual joystick.
///
/// Please note that values set here will not be applied until the next call to
/// SDL_UpdateJoysticks, which can either be called directly, or can be called
/// indirectly through various other SDL APIs, including, but not limited to
/// the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
/// SDL_WaitEvent.
///
/// Note that when sending trigger axes, you should scale the value to the full
/// range of Sint16. For example, a trigger at rest would have the value of
/// `SDL_JOYSTICK_AXIS_MIN`.
///
/// \param joystick the virtual joystick on which to set state.
/// \param axis the index of the axis on the virtual joystick to update.
/// \param value the new value for the specified axis.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetJoystickVirtualAxis(SDL_Joystick *joystick, int axis, Sint16 value)
/// ```
bool sdlSetJoystickVirtualAxis(
  Pointer<SdlJoystick> joystick,
  int axis,
  int value,
) {
  final sdlSetJoystickVirtualAxisLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlJoystick> joystick, Int32 axis, Int16 value),
        int Function(Pointer<SdlJoystick> joystick, int axis, int value)
      >('SDL_SetJoystickVirtualAxis');
  return sdlSetJoystickVirtualAxisLookupFunction(joystick, axis, value) == 1;
}

///
/// Generate ball motion on an opened virtual joystick.
///
/// Please note that values set here will not be applied until the next call to
/// SDL_UpdateJoysticks, which can either be called directly, or can be called
/// indirectly through various other SDL APIs, including, but not limited to
/// the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
/// SDL_WaitEvent.
///
/// \param joystick the virtual joystick on which to set state.
/// \param ball the index of the ball on the virtual joystick to update.
/// \param xrel the relative motion on the X axis.
/// \param yrel the relative motion on the Y axis.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetJoystickVirtualBall(SDL_Joystick *joystick, int ball, Sint16 xrel, Sint16 yrel)
/// ```
bool sdlSetJoystickVirtualBall(
  Pointer<SdlJoystick> joystick,
  int ball,
  int xrel,
  int yrel,
) {
  final sdlSetJoystickVirtualBallLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Int32 ball,
          Int16 xrel,
          Int16 yrel,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          int ball,
          int xrel,
          int yrel,
        )
      >('SDL_SetJoystickVirtualBall');
  return sdlSetJoystickVirtualBallLookupFunction(joystick, ball, xrel, yrel) ==
      1;
}

///
/// Set the state of a button on an opened virtual joystick.
///
/// Please note that values set here will not be applied until the next call to
/// SDL_UpdateJoysticks, which can either be called directly, or can be called
/// indirectly through various other SDL APIs, including, but not limited to
/// the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
/// SDL_WaitEvent.
///
/// \param joystick the virtual joystick on which to set state.
/// \param button the index of the button on the virtual joystick to update.
/// \param down true if the button is pressed, false otherwise.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetJoystickVirtualButton(SDL_Joystick *joystick, int button, bool down)
/// ```
bool sdlSetJoystickVirtualButton(
  Pointer<SdlJoystick> joystick,
  int button,
  bool down,
) {
  final sdlSetJoystickVirtualButtonLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlJoystick> joystick, Int32 button, Uint8 down),
        int Function(Pointer<SdlJoystick> joystick, int button, int down)
      >('SDL_SetJoystickVirtualButton');
  return sdlSetJoystickVirtualButtonLookupFunction(
        joystick,
        button,
        down ? 1 : 0,
      ) ==
      1;
}

///
/// Set the state of a hat on an opened virtual joystick.
///
/// Please note that values set here will not be applied until the next call to
/// SDL_UpdateJoysticks, which can either be called directly, or can be called
/// indirectly through various other SDL APIs, including, but not limited to
/// the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
/// SDL_WaitEvent.
///
/// \param joystick the virtual joystick on which to set state.
/// \param hat the index of the hat on the virtual joystick to update.
/// \param value the new value for the specified hat.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetJoystickVirtualHat(SDL_Joystick *joystick, int hat, Uint8 value)
/// ```
bool sdlSetJoystickVirtualHat(
  Pointer<SdlJoystick> joystick,
  int hat,
  int value,
) {
  final sdlSetJoystickVirtualHatLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlJoystick> joystick, Int32 hat, Uint8 value),
        int Function(Pointer<SdlJoystick> joystick, int hat, int value)
      >('SDL_SetJoystickVirtualHat');
  return sdlSetJoystickVirtualHatLookupFunction(joystick, hat, value) == 1;
}

///
/// Set touchpad finger state on an opened virtual joystick.
///
/// Please note that values set here will not be applied until the next call to
/// SDL_UpdateJoysticks, which can either be called directly, or can be called
/// indirectly through various other SDL APIs, including, but not limited to
/// the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
/// SDL_WaitEvent.
///
/// \param joystick the virtual joystick on which to set state.
/// \param touchpad the index of the touchpad on the virtual joystick to
/// update.
/// \param finger the index of the finger on the touchpad to set.
/// \param down true if the finger is pressed, false if the finger is released.
/// \param x the x coordinate of the finger on the touchpad, normalized 0 to 1,
/// with the origin in the upper left.
/// \param y the y coordinate of the finger on the touchpad, normalized 0 to 1,
/// with the origin in the upper left.
/// \param pressure the pressure of the finger.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetJoystickVirtualTouchpad(SDL_Joystick *joystick, int touchpad, int finger, bool down, float x, float y, float pressure)
/// ```
bool sdlSetJoystickVirtualTouchpad(
  Pointer<SdlJoystick> joystick,
  int touchpad,
  int finger,
  bool down,
  double x,
  double y,
  double pressure,
) {
  final sdlSetJoystickVirtualTouchpadLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Int32 touchpad,
          Int32 finger,
          Uint8 down,
          Float x,
          Float y,
          Float pressure,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          int touchpad,
          int finger,
          int down,
          double x,
          double y,
          double pressure,
        )
      >('SDL_SetJoystickVirtualTouchpad');
  return sdlSetJoystickVirtualTouchpadLookupFunction(
        joystick,
        touchpad,
        finger,
        down ? 1 : 0,
        x,
        y,
        pressure,
      ) ==
      1;
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SendJoystickVirtualSensorData(SDL_Joystick *joystick, SDL_SensorType type, Uint64 sensor_timestamp, const float *data, int num_values)
/// ```
bool sdlSendJoystickVirtualSensorData(
  Pointer<SdlJoystick> joystick,
  int type,
  int sensorTimestamp,
  Pointer<Float> data,
  int numValues,
) {
  final sdlSendJoystickVirtualSensorDataLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Int32 type,
          Uint64 sensorTimestamp,
          Pointer<Float> data,
          Int32 numValues,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          int type,
          int sensorTimestamp,
          Pointer<Float> data,
          int numValues,
        )
      >('SDL_SendJoystickVirtualSensorData');
  return sdlSendJoystickVirtualSensorDataLookupFunction(
        joystick,
        type,
        sensorTimestamp,
        data,
        numValues,
      ) ==
      1;
}

///
/// Get the properties associated with a joystick.
///
/// The following read-only properties are provided by SDL:
///
/// - `SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN`: true if this joystick has an
/// LED that has adjustable brightness
/// - `SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN`: true if this joystick has an LED
/// that has adjustable color
/// - `SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN`: true if this joystick has a
/// player LED
/// - `SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN`: true if this joystick has
/// left/right rumble
/// - `SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN`: true if this joystick has
/// simple trigger rumble
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetJoystickProperties(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickProperties(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickPropertiesLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickProperties');
  return sdlGetJoystickPropertiesLookupFunction(joystick);
}

///
/// Get the implementation dependent name of a joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the name of the selected joystick. If no name can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickNameForID
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetJoystickName(SDL_Joystick *joystick)
/// ```
String? sdlGetJoystickName(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickNameLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Utf8> Function(Pointer<SdlJoystick> joystick),
        Pointer<Utf8> Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickName');
  final result = sdlGetJoystickNameLookupFunction(joystick);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the implementation dependent path of a joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the path of the selected joystick. If no path can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickPathForID
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetJoystickPath(SDL_Joystick *joystick)
/// ```
String? sdlGetJoystickPath(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickPathLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Utf8> Function(Pointer<SdlJoystick> joystick),
        Pointer<Utf8> Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickPath');
  final result = sdlGetJoystickPathLookupFunction(joystick);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the player index of an opened joystick.
///
/// For XInput controllers this returns the XInput user index. Many joysticks
/// will not be able to supply this information.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the player index, or -1 if it's not available.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetJoystickPlayerIndex
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetJoystickPlayerIndex(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickPlayerIndex(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickPlayerIndexLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickPlayerIndex');
  return sdlGetJoystickPlayerIndexLookupFunction(joystick);
}

///
/// Set the player index of an opened joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \param player_index player index to assign to this joystick, or -1 to clear
/// the player index and turn off player LEDs.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickPlayerIndex
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetJoystickPlayerIndex(SDL_Joystick *joystick, int player_index)
/// ```
bool sdlSetJoystickPlayerIndex(Pointer<SdlJoystick> joystick, int playerIndex) {
  final sdlSetJoystickPlayerIndexLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlJoystick> joystick, Int32 playerIndex),
        int Function(Pointer<SdlJoystick> joystick, int playerIndex)
      >('SDL_SetJoystickPlayerIndex');
  return sdlSetJoystickPlayerIndexLookupFunction(joystick, playerIndex) == 1;
}

///
/// Get the implementation-dependent GUID for the joystick.
///
/// This function requires an open joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the GUID of the given joystick. If called on an invalid index,
/// this function returns a zero GUID; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickGUIDForID
/// \sa SDL_GUIDToString
///
/// ```c
/// extern SDL_DECLSPEC SDL_GUID SDLCALL SDL_GetJoystickGUID(SDL_Joystick *joystick)
/// ```
SdlGuid sdlGetJoystickGuid(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickGuidLookupFunction = libSdl3
      .lookupFunction<
        SdlGuid Function(Pointer<SdlJoystick> joystick),
        SdlGuid Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickGUID');
  return sdlGetJoystickGuidLookupFunction(joystick);
}

///
/// Get the USB vendor ID of an opened joystick, if available.
///
/// If the vendor ID isn't available this function returns 0.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the USB vendor ID of the selected joystick, or 0 if unavailable.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickVendorForID
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetJoystickVendor(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickVendor(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickVendorLookupFunction = libSdl3
      .lookupFunction<
        Uint16 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickVendor');
  return sdlGetJoystickVendorLookupFunction(joystick);
}

///
/// Get the USB product ID of an opened joystick, if available.
///
/// If the product ID isn't available this function returns 0.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the USB product ID of the selected joystick, or 0 if unavailable.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickProductForID
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetJoystickProduct(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickProduct(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickProductLookupFunction = libSdl3
      .lookupFunction<
        Uint16 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickProduct');
  return sdlGetJoystickProductLookupFunction(joystick);
}

///
/// Get the product version of an opened joystick, if available.
///
/// If the product version isn't available this function returns 0.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the product version of the selected joystick, or 0 if unavailable.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickProductVersionForID
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetJoystickProductVersion(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickProductVersion(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickProductVersionLookupFunction = libSdl3
      .lookupFunction<
        Uint16 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickProductVersion');
  return sdlGetJoystickProductVersionLookupFunction(joystick);
}

///
/// Get the firmware version of an opened joystick, if available.
///
/// If the firmware version isn't available this function returns 0.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the firmware version of the selected joystick, or 0 if
/// unavailable.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetJoystickFirmwareVersion(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickFirmwareVersion(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickFirmwareVersionLookupFunction = libSdl3
      .lookupFunction<
        Uint16 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickFirmwareVersion');
  return sdlGetJoystickFirmwareVersionLookupFunction(joystick);
}

///
/// Get the serial number of an opened joystick, if available.
///
/// Returns the serial number of the joystick, or NULL if it is not available.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the serial number of the selected joystick, or NULL if
/// unavailable.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetJoystickSerial(SDL_Joystick *joystick)
/// ```
String? sdlGetJoystickSerial(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickSerialLookupFunction = libSdl3
      .lookupFunction<
        Pointer<Utf8> Function(Pointer<SdlJoystick> joystick),
        Pointer<Utf8> Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickSerial');
  final result = sdlGetJoystickSerialLookupFunction(joystick);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the type of an opened joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
/// \returns the SDL_JoystickType of the selected joystick.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickTypeForID
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickType SDLCALL SDL_GetJoystickType(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickType(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickTypeLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickType');
  return sdlGetJoystickTypeLookupFunction(joystick);
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickGUIDForID
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_GetJoystickGUIDInfo(SDL_GUID guid, Uint16 *vendor, Uint16 *product, Uint16 *version, Uint16 *crc16)
/// ```
void sdlGetJoystickGuidInfo(
  SdlGuid guid,
  Pointer<Uint16> vendor,
  Pointer<Uint16> product,
  Pointer<Uint16> version,
  Pointer<Uint16> crc16,
) {
  final sdlGetJoystickGuidInfoLookupFunction = libSdl3
      .lookupFunction<
        Void Function(
          SdlGuid guid,
          Pointer<Uint16> vendor,
          Pointer<Uint16> product,
          Pointer<Uint16> version,
          Pointer<Uint16> crc16,
        ),
        void Function(
          SdlGuid guid,
          Pointer<Uint16> vendor,
          Pointer<Uint16> product,
          Pointer<Uint16> version,
          Pointer<Uint16> crc16,
        )
      >('SDL_GetJoystickGUIDInfo');
  return sdlGetJoystickGuidInfoLookupFunction(
    guid,
    vendor,
    product,
    version,
    crc16,
  );
}

///
/// Get the status of a specified joystick.
///
/// \param joystick the joystick to query.
/// \returns true if the joystick has been opened, false if it has not; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_JoystickConnected(SDL_Joystick *joystick)
/// ```
bool sdlJoystickConnected(Pointer<SdlJoystick> joystick) {
  final sdlJoystickConnectedLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_JoystickConnected');
  return sdlJoystickConnectedLookupFunction(joystick) == 1;
}

///
/// Get the instance ID of an opened joystick.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \returns the instance ID of the specified joystick on success or 0 on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickID SDLCALL SDL_GetJoystickID(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickId(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickIdLookupFunction = libSdl3
      .lookupFunction<
        Uint32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickID');
  return sdlGetJoystickIdLookupFunction(joystick);
}

///
/// Get the number of general axis controls on a joystick.
///
/// Often, the directional pad on a game controller will either look like 4
/// separate buttons or a POV hat, and not axes, but all of this is up to the
/// device and platform.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \returns the number of axis controls/number of axes on success or -1 on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickAxis
/// \sa SDL_GetNumJoystickBalls
/// \sa SDL_GetNumJoystickButtons
/// \sa SDL_GetNumJoystickHats
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumJoystickAxes(SDL_Joystick *joystick)
/// ```
int sdlGetNumJoystickAxes(Pointer<SdlJoystick> joystick) {
  final sdlGetNumJoystickAxesLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetNumJoystickAxes');
  return sdlGetNumJoystickAxesLookupFunction(joystick);
}

///
/// Get the number of trackballs on a joystick.
///
/// Joystick trackballs have only relative motion events associated with them
/// and their state cannot be polled.
///
/// Most joysticks do not have trackballs.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \returns the number of trackballs on success or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickBall
/// \sa SDL_GetNumJoystickAxes
/// \sa SDL_GetNumJoystickButtons
/// \sa SDL_GetNumJoystickHats
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumJoystickBalls(SDL_Joystick *joystick)
/// ```
int sdlGetNumJoystickBalls(Pointer<SdlJoystick> joystick) {
  final sdlGetNumJoystickBallsLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetNumJoystickBalls');
  return sdlGetNumJoystickBallsLookupFunction(joystick);
}

///
/// Get the number of POV hats on a joystick.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \returns the number of POV hats on success or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickHat
/// \sa SDL_GetNumJoystickAxes
/// \sa SDL_GetNumJoystickBalls
/// \sa SDL_GetNumJoystickButtons
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumJoystickHats(SDL_Joystick *joystick)
/// ```
int sdlGetNumJoystickHats(Pointer<SdlJoystick> joystick) {
  final sdlGetNumJoystickHatsLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetNumJoystickHats');
  return sdlGetNumJoystickHatsLookupFunction(joystick);
}

///
/// Get the number of buttons on a joystick.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \returns the number of buttons on success or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetJoystickButton
/// \sa SDL_GetNumJoystickAxes
/// \sa SDL_GetNumJoystickBalls
/// \sa SDL_GetNumJoystickHats
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumJoystickButtons(SDL_Joystick *joystick)
/// ```
int sdlGetNumJoystickButtons(Pointer<SdlJoystick> joystick) {
  final sdlGetNumJoystickButtonsLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetNumJoystickButtons');
  return sdlGetNumJoystickButtonsLookupFunction(joystick);
}

///
/// Set the state of joystick event processing.
///
/// If joystick events are disabled, you must call SDL_UpdateJoysticks()
/// yourself and check the state of the joystick when you want joystick
/// information.
///
/// \param enabled whether to process joystick events or not.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_JoystickEventsEnabled
/// \sa SDL_UpdateJoysticks
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetJoystickEventsEnabled(bool enabled)
/// ```
void sdlSetJoystickEventsEnabled(bool enabled) {
  final sdlSetJoystickEventsEnabledLookupFunction = libSdl3
      .lookupFunction<Void Function(Uint8 enabled), void Function(int enabled)>(
        'SDL_SetJoystickEventsEnabled',
      );
  return sdlSetJoystickEventsEnabledLookupFunction(enabled ? 1 : 0);
}

///
/// Query the state of joystick event processing.
///
/// If joystick events are disabled, you must call SDL_UpdateJoysticks()
/// yourself and check the state of the joystick when you want joystick
/// information.
///
/// \returns true if joystick events are being processed, false otherwise.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetJoystickEventsEnabled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_JoystickEventsEnabled(void)
/// ```
bool sdlJoystickEventsEnabled() {
  final sdlJoystickEventsEnabledLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>(
        'SDL_JoystickEventsEnabled',
      );
  return sdlJoystickEventsEnabledLookupFunction() == 1;
}

///
/// Update the current state of the open joysticks.
///
/// This is called automatically by the event loop if any joystick events are
/// enabled.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UpdateJoysticks(void)
/// ```
void sdlUpdateJoysticks() {
  final sdlUpdateJoysticksLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_UpdateJoysticks');
  return sdlUpdateJoysticksLookupFunction();
}

///
/// Get the current state of an axis control on a joystick.
///
/// SDL makes no promises about what part of the joystick any given axis refers
/// to. Your game should have some sort of configuration UI to let users
/// specify what each axis should be bound to. Alternately, SDL's higher-level
/// Game Controller API makes a great effort to apply order to this lower-level
/// interface, so you know that a specific axis is the "left thumb stick," etc.
///
/// The value returned by SDL_GetJoystickAxis() is a signed integer (-32768 to
/// 32767) representing the current position of the axis. It may be necessary
/// to impose certain tolerances on these values to account for jitter.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \param axis the axis to query; the axis indices start at index 0.
/// \returns a 16-bit signed integer representing the current position of the
/// axis or 0 on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumJoystickAxes
///
/// ```c
/// extern SDL_DECLSPEC Sint16 SDLCALL SDL_GetJoystickAxis(SDL_Joystick *joystick, int axis)
/// ```
int sdlGetJoystickAxis(Pointer<SdlJoystick> joystick, int axis) {
  final sdlGetJoystickAxisLookupFunction = libSdl3
      .lookupFunction<
        Int16 Function(Pointer<SdlJoystick> joystick, Int32 axis),
        int Function(Pointer<SdlJoystick> joystick, int axis)
      >('SDL_GetJoystickAxis');
  return sdlGetJoystickAxisLookupFunction(joystick, axis);
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetJoystickAxisInitialState(SDL_Joystick *joystick, int axis, Sint16 *state)
/// ```
bool sdlGetJoystickAxisInitialState(
  Pointer<SdlJoystick> joystick,
  int axis,
  Pointer<Int16> state,
) {
  final sdlGetJoystickAxisInitialStateLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Int32 axis,
          Pointer<Int16> state,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          int axis,
          Pointer<Int16> state,
        )
      >('SDL_GetJoystickAxisInitialState');
  return sdlGetJoystickAxisInitialStateLookupFunction(joystick, axis, state) ==
      1;
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
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumJoystickBalls
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetJoystickBall(SDL_Joystick *joystick, int ball, int *dx, int *dy)
/// ```
bool sdlGetJoystickBall(
  Pointer<SdlJoystick> joystick,
  int ball,
  Pointer<Int32> dx,
  Pointer<Int32> dy,
) {
  final sdlGetJoystickBallLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Int32 ball,
          Pointer<Int32> dx,
          Pointer<Int32> dy,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          int ball,
          Pointer<Int32> dx,
          Pointer<Int32> dy,
        )
      >('SDL_GetJoystickBall');
  return sdlGetJoystickBallLookupFunction(joystick, ball, dx, dy) == 1;
}

///
/// Get the current state of a POV hat on a joystick.
///
/// The returned value will be one of the `SDL_HAT_*` values.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \param hat the hat index to get the state from; indices start at index 0.
/// \returns the current hat position.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumJoystickHats
///
/// ```c
/// extern SDL_DECLSPEC Uint8 SDLCALL SDL_GetJoystickHat(SDL_Joystick *joystick, int hat)
/// ```
int sdlGetJoystickHat(Pointer<SdlJoystick> joystick, int hat) {
  final sdlGetJoystickHatLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlJoystick> joystick, Int32 hat),
        int Function(Pointer<SdlJoystick> joystick, int hat)
      >('SDL_GetJoystickHat');
  return sdlGetJoystickHatLookupFunction(joystick, hat);
}

///
/// Get the current state of a button on a joystick.
///
/// \param joystick an SDL_Joystick structure containing joystick information.
/// \param button the button index to get the state from; indices start at
/// index 0.
/// \returns true if the button is pressed, false otherwise.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetNumJoystickButtons
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetJoystickButton(SDL_Joystick *joystick, int button)
/// ```
bool sdlGetJoystickButton(Pointer<SdlJoystick> joystick, int button) {
  final sdlGetJoystickButtonLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(Pointer<SdlJoystick> joystick, Int32 button),
        int Function(Pointer<SdlJoystick> joystick, int button)
      >('SDL_GetJoystickButton');
  return sdlGetJoystickButtonLookupFunction(joystick, button) == 1;
}

///
/// Start a rumble effect.
///
/// Each call to this function cancels any previous rumble effect, and calling
/// it with 0 intensity stops any rumbling.
///
/// This function requires you to process SDL events or call
/// SDL_UpdateJoysticks() to update rumble state.
///
/// \param joystick the joystick to vibrate.
/// \param low_frequency_rumble the intensity of the low frequency (left)
/// rumble motor, from 0 to 0xFFFF.
/// \param high_frequency_rumble the intensity of the high frequency (right)
/// rumble motor, from 0 to 0xFFFF.
/// \param duration_ms the duration of the rumble effect, in milliseconds.
/// \returns true, or false if rumble isn't supported on this joystick.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RumbleJoystick(SDL_Joystick *joystick, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms)
/// ```
bool sdlRumbleJoystick(
  Pointer<SdlJoystick> joystick,
  int lowFrequencyRumble,
  int highFrequencyRumble,
  int durationMs,
) {
  final sdlRumbleJoystickLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Uint16 lowFrequencyRumble,
          Uint16 highFrequencyRumble,
          Uint32 durationMs,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          int lowFrequencyRumble,
          int highFrequencyRumble,
          int durationMs,
        )
      >('SDL_RumbleJoystick');
  return sdlRumbleJoystickLookupFunction(
        joystick,
        lowFrequencyRumble,
        highFrequencyRumble,
        durationMs,
      ) ==
      1;
}

///
/// Start a rumble effect in the joystick's triggers.
///
/// Each call to this function cancels any previous trigger rumble effect, and
/// calling it with 0 intensity stops any rumbling.
///
/// Note that this is rumbling of the _triggers_ and not the game controller as
/// a whole. This is currently only supported on Xbox One controllers. If you
/// want the (more common) whole-controller rumble, use SDL_RumbleJoystick()
/// instead.
///
/// This function requires you to process SDL events or call
/// SDL_UpdateJoysticks() to update rumble state.
///
/// \param joystick the joystick to vibrate.
/// \param left_rumble the intensity of the left trigger rumble motor, from 0
/// to 0xFFFF.
/// \param right_rumble the intensity of the right trigger rumble motor, from 0
/// to 0xFFFF.
/// \param duration_ms the duration of the rumble effect, in milliseconds.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RumbleJoystick
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RumbleJoystickTriggers(SDL_Joystick *joystick, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms)
/// ```
bool sdlRumbleJoystickTriggers(
  Pointer<SdlJoystick> joystick,
  int leftRumble,
  int rightRumble,
  int durationMs,
) {
  final sdlRumbleJoystickTriggersLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Uint16 leftRumble,
          Uint16 rightRumble,
          Uint32 durationMs,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          int leftRumble,
          int rightRumble,
          int durationMs,
        )
      >('SDL_RumbleJoystickTriggers');
  return sdlRumbleJoystickTriggersLookupFunction(
        joystick,
        leftRumble,
        rightRumble,
        durationMs,
      ) ==
      1;
}

///
/// Update a joystick's LED color.
///
/// An example of a joystick LED is the light on the back of a PlayStation 4's
/// DualShock 4 controller.
///
/// For joysticks with a single color LED, the maximum of the RGB values will
/// be used as the LED brightness.
///
/// \param joystick the joystick to update.
/// \param red the intensity of the red LED.
/// \param green the intensity of the green LED.
/// \param blue the intensity of the blue LED.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetJoystickLED(SDL_Joystick *joystick, Uint8 red, Uint8 green, Uint8 blue)
/// ```
bool sdlSetJoystickLed(
  Pointer<SdlJoystick> joystick,
  int red,
  int green,
  int blue,
) {
  final sdlSetJoystickLedLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Uint8 red,
          Uint8 green,
          Uint8 blue,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          int red,
          int green,
          int blue,
        )
      >('SDL_SetJoystickLED');
  return sdlSetJoystickLedLookupFunction(joystick, red, green, blue) == 1;
}

///
/// Send a joystick specific effect packet.
///
/// \param joystick the joystick to affect.
/// \param data the data to send to the joystick.
/// \param size the size of the data to send to the joystick.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SendJoystickEffect(SDL_Joystick *joystick, const void *data, int size)
/// ```
bool sdlSendJoystickEffect(
  Pointer<SdlJoystick> joystick,
  Pointer<NativeType> data,
  int size,
) {
  final sdlSendJoystickEffectLookupFunction = libSdl3
      .lookupFunction<
        Uint8 Function(
          Pointer<SdlJoystick> joystick,
          Pointer<NativeType> data,
          Int32 size,
        ),
        int Function(
          Pointer<SdlJoystick> joystick,
          Pointer<NativeType> data,
          int size,
        )
      >('SDL_SendJoystickEffect');
  return sdlSendJoystickEffectLookupFunction(joystick, data, size) == 1;
}

///
/// Close a joystick previously opened with SDL_OpenJoystick().
///
/// \param joystick the joystick device to close.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenJoystick
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CloseJoystick(SDL_Joystick *joystick)
/// ```
void sdlCloseJoystick(Pointer<SdlJoystick> joystick) {
  final sdlCloseJoystickLookupFunction = libSdl3
      .lookupFunction<
        Void Function(Pointer<SdlJoystick> joystick),
        void Function(Pointer<SdlJoystick> joystick)
      >('SDL_CloseJoystick');
  return sdlCloseJoystickLookupFunction(joystick);
}

///
/// Get the connection state of a joystick.
///
/// \param joystick the joystick to query.
/// \returns the connection state on success or
/// `SDL_JOYSTICK_CONNECTION_INVALID` on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickConnectionState SDLCALL SDL_GetJoystickConnectionState(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickConnectionState(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickConnectionStateLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlJoystick> joystick),
        int Function(Pointer<SdlJoystick> joystick)
      >('SDL_GetJoystickConnectionState');
  return sdlGetJoystickConnectionStateLookupFunction(joystick);
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
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PowerState SDLCALL SDL_GetJoystickPowerInfo(SDL_Joystick *joystick, int *percent)
/// ```
int sdlGetJoystickPowerInfo(
  Pointer<SdlJoystick> joystick,
  Pointer<Int32> percent,
) {
  final sdlGetJoystickPowerInfoLookupFunction = libSdl3
      .lookupFunction<
        Int32 Function(Pointer<SdlJoystick> joystick, Pointer<Int32> percent),
        int Function(Pointer<SdlJoystick> joystick, Pointer<Int32> percent)
      >('SDL_GetJoystickPowerInfo');
  return sdlGetJoystickPowerInfoLookupFunction(joystick, percent);
}
