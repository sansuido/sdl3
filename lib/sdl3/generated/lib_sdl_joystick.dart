// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Locking for atomic access to the joystick API
///
/// The SDL joystick functions are thread-safe, however you can lock the
/// joysticks while processing to guarantee that the joystick list won't change
/// and joystick and gamepad events will not be delivered.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_LockJoysticks(void) SDL_ACQUIRE(SDL_joystick_lock)
/// ```
void sdlLockJoysticks(Pointer<NativeType> arg0) {
  final sdlLockJoysticksLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> arg0),
      void Function(Pointer<NativeType> arg0)>('SDL_LockJoysticks');
  return sdlLockJoysticksLookupFunction(arg0);
}

///
/// Unlocking for atomic access to the joystick API
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_UnlockJoysticks(void) SDL_RELEASE(SDL_joystick_lock)
/// ```
void sdlUnlockJoysticks(Pointer<NativeType> arg0) {
  final sdlUnlockJoysticksLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<NativeType> arg0),
      void Function(Pointer<NativeType> arg0)>('SDL_UnlockJoysticks');
  return sdlUnlockJoysticksLookupFunction(arg0);
}

///
/// Return whether a joystick is currently connected.
///
/// \returns SDL_TRUE if a joystick is connected, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_HasJoystick(void)
/// ```
bool sdlHasJoystick() {
  final sdlHasJoystickLookupFunction = libSdl3
      .lookupFunction<Int32 Function(), int Function()>('SDL_HasJoystick');
  return sdlHasJoystickLookupFunction() == 1;
}

///
/// Get a list of currently connected joysticks.
///
/// \param count a pointer filled in with the number of joysticks returned
/// \returns a 0 terminated array of joystick instance IDs which should be
/// freed with SDL_free(), or NULL on error; call SDL_GetError() for
/// more details.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_HasJoystick
/// \sa SDL_OpenJoystick
///
/// ```c
/// extern DECLSPEC SDL_JoystickID *SDLCALL SDL_GetJoysticks(int *count)
/// ```
Pointer<Uint32> sdlGetJoysticks(Pointer<Int32> count) {
  final sdlGetJoysticksLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(Pointer<Int32> count)>('SDL_GetJoysticks');
  return sdlGetJoysticksLookupFunction(count);
}

///
/// Get the implementation dependent name of a joystick.
///
/// This can be called before any joysticks are opened.
///
/// \param instance_id the joystick instance ID
/// \returns the name of the selected joystick. If no name can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickName
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern DECLSPEC const char *SDLCALL SDL_GetJoystickInstanceName(SDL_JoystickID instance_id)
/// ```
String? sdlGetJoystickInstanceName(int instanceId) {
  final sdlGetJoystickInstanceNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetJoystickInstanceName');
  final result = sdlGetJoystickInstanceNameLookupFunction(instanceId);
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
/// \param instance_id the joystick instance ID
/// \returns the path of the selected joystick. If no path can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickPath
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern DECLSPEC const char *SDLCALL SDL_GetJoystickInstancePath(SDL_JoystickID instance_id)
/// ```
String? sdlGetJoystickInstancePath(int instanceId) {
  final sdlGetJoystickInstancePathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetJoystickInstancePath');
  final result = sdlGetJoystickInstancePathLookupFunction(instanceId);
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
/// \param instance_id the joystick instance ID
/// \returns the player index of a joystick, or -1 if it's not available
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickPlayerIndex
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetJoystickInstancePlayerIndex(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickInstancePlayerIndex(int instanceId) {
  final sdlGetJoystickInstancePlayerIndexLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Uint32 instanceId),
          int Function(int instanceId)>('SDL_GetJoystickInstancePlayerIndex');
  return sdlGetJoystickInstancePlayerIndexLookupFunction(instanceId);
}

///
/// Get the implementation-dependent GUID of a joystick.
///
/// This can be called before any joysticks are opened.
///
/// \param instance_id the joystick instance ID
/// \returns the GUID of the selected joystick. If called with an invalid
/// instance_id, this function returns a zero GUID.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickGUID
/// \sa SDL_GetJoystickGUIDString
///
/// ```c
/// extern DECLSPEC SDL_JoystickGUID SDLCALL SDL_GetJoystickInstanceGUID(SDL_JoystickID instance_id)
/// ```
SdlGuid sdlGetJoystickInstanceGuid(int instanceId) {
  final sdlGetJoystickInstanceGuidLookupFunction = libSdl3.lookupFunction<
      SdlGuid Function(Uint32 instanceId),
      SdlGuid Function(int instanceId)>('SDL_GetJoystickInstanceGUID');
  return sdlGetJoystickInstanceGuidLookupFunction(instanceId);
}

///
/// Get the USB vendor ID of a joystick, if available.
///
/// This can be called before any joysticks are opened. If the vendor ID isn't
/// available this function returns 0.
///
/// \param instance_id the joystick instance ID
/// \returns the USB vendor ID of the selected joystick. If called with an
/// invalid instance_id, this function returns 0.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickVendor
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern DECLSPEC Uint16 SDLCALL SDL_GetJoystickInstanceVendor(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickInstanceVendor(int instanceId) {
  final sdlGetJoystickInstanceVendorLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetJoystickInstanceVendor');
  return sdlGetJoystickInstanceVendorLookupFunction(instanceId);
}

///
/// Get the USB product ID of a joystick, if available.
///
/// This can be called before any joysticks are opened. If the product ID isn't
/// available this function returns 0.
///
/// \param instance_id the joystick instance ID
/// \returns the USB product ID of the selected joystick. If called with an
/// invalid instance_id, this function returns 0.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickProduct
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern DECLSPEC Uint16 SDLCALL SDL_GetJoystickInstanceProduct(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickInstanceProduct(int instanceId) {
  final sdlGetJoystickInstanceProductLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetJoystickInstanceProduct');
  return sdlGetJoystickInstanceProductLookupFunction(instanceId);
}

///
/// Get the product version of a joystick, if available.
///
/// This can be called before any joysticks are opened. If the product version
/// isn't available this function returns 0.
///
/// \param instance_id the joystick instance ID
/// \returns the product version of the selected joystick. If called with an
/// invalid instance_id, this function returns 0.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickProductVersion
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern DECLSPEC Uint16 SDLCALL SDL_GetJoystickInstanceProductVersion(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickInstanceProductVersion(int instanceId) {
  final sdlGetJoystickInstanceProductVersionLookupFunction =
      libSdl3.lookupFunction<
          Uint16 Function(Uint32 instanceId),
          int Function(
              int instanceId)>('SDL_GetJoystickInstanceProductVersion');
  return sdlGetJoystickInstanceProductVersionLookupFunction(instanceId);
}

///
/// Get the type of a joystick, if available.
///
/// This can be called before any joysticks are opened.
///
/// \param instance_id the joystick instance ID
/// \returns the SDL_JoystickType of the selected joystick. If called with an
/// invalid instance_id, this function returns
/// `SDL_JOYSTICK_TYPE_UNKNOWN`.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickType
/// \sa SDL_GetJoysticks
///
/// ```c
/// extern DECLSPEC SDL_JoystickType SDLCALL SDL_GetJoystickInstanceType(SDL_JoystickID instance_id)
/// ```
int sdlGetJoystickInstanceType(int instanceId) {
  final sdlGetJoystickInstanceTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetJoystickInstanceType');
  return sdlGetJoystickInstanceTypeLookupFunction(instanceId);
}

///
/// Open a joystick for use.
///
/// The joystick subsystem must be initialized before a joystick can be opened
/// for use.
///
/// \param instance_id the joystick instance ID
/// \returns a joystick identifier or NULL if an error occurred; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CloseJoystick
///
/// ```c
/// extern DECLSPEC SDL_Joystick *SDLCALL SDL_OpenJoystick(SDL_JoystickID instance_id)
/// ```
Pointer<SdlJoystick> sdlOpenJoystick(int instanceId) {
  final sdlOpenJoystickLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlJoystick> Function(Uint32 instanceId),
      Pointer<SdlJoystick> Function(int instanceId)>('SDL_OpenJoystick');
  return sdlOpenJoystickLookupFunction(instanceId);
}

///
/// Get the SDL_Joystick associated with an instance ID, if it has been opened.
///
/// \param instance_id the instance ID to get the SDL_Joystick for
/// \returns an SDL_Joystick on success or NULL on failure or if it hasn't been
/// opened yet; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_Joystick *SDLCALL SDL_GetJoystickFromInstanceID(SDL_JoystickID instance_id)
/// ```
Pointer<SdlJoystick> sdlGetJoystickFromInstanceId(int instanceId) {
  final sdlGetJoystickFromInstanceIdLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlJoystick> Function(Uint32 instanceId),
      Pointer<SdlJoystick> Function(
          int instanceId)>('SDL_GetJoystickFromInstanceID');
  return sdlGetJoystickFromInstanceIdLookupFunction(instanceId);
}

///
/// Get the SDL_Joystick associated with a player index.
///
/// \param player_index the player index to get the SDL_Joystick for
/// \returns an SDL_Joystick on success or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickPlayerIndex
/// \sa SDL_SetJoystickPlayerIndex
///
/// ```c
/// extern DECLSPEC SDL_Joystick *SDLCALL SDL_GetJoystickFromPlayerIndex(int player_index)
/// ```
Pointer<SdlJoystick> sdlGetJoystickFromPlayerIndex(int playerIndex) {
  final sdlGetJoystickFromPlayerIndexLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlJoystick> Function(Int32 playerIndex),
      Pointer<SdlJoystick> Function(
          int playerIndex)>('SDL_GetJoystickFromPlayerIndex');
  return sdlGetJoystickFromPlayerIndexLookupFunction(playerIndex);
}

///
/// Attach a new virtual joystick.
///
/// \param type type of joystick
/// \param naxes number of axes
/// \param nbuttons number of buttons
/// \param nhats number of hats
/// \returns the joystick instance ID, or 0 if an error occurred; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AttachVirtualJoystickEx
/// \sa SDL_DetachVirtualJoystick
///
/// ```c
/// extern DECLSPEC SDL_JoystickID SDLCALL SDL_AttachVirtualJoystick(SDL_JoystickType type, int naxes, int nbuttons, int nhats)
/// ```
int sdlAttachVirtualJoystick(int type, int naxes, int nbuttons, int nhats) {
  final sdlAttachVirtualJoystickLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Int32 type, Int32 naxes, Int32 nbuttons, Int32 nhats),
      int Function(int type, int naxes, int nbuttons,
          int nhats)>('SDL_AttachVirtualJoystick');
  return sdlAttachVirtualJoystickLookupFunction(type, naxes, nbuttons, nhats);
}

///
/// Attach a new virtual joystick with extended properties.
///
/// \param desc Joystick description
/// \returns the joystick instance ID, or 0 if an error occurred; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AttachVirtualJoystick
/// \sa SDL_DetachVirtualJoystick
///
/// ```c
/// extern DECLSPEC SDL_JoystickID SDLCALL SDL_AttachVirtualJoystickEx(const SDL_VirtualJoystickDesc *desc)
/// ```
int sdlAttachVirtualJoystickEx(Pointer<SdlVirtualJoystickDesc> desc) {
  final sdlAttachVirtualJoystickExLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlVirtualJoystickDesc> desc),
      int Function(
          Pointer<SdlVirtualJoystickDesc> desc)>('SDL_AttachVirtualJoystickEx');
  return sdlAttachVirtualJoystickExLookupFunction(desc);
}

///
/// Detach a virtual joystick.
///
/// \param instance_id the joystick instance ID, previously returned from
/// SDL_AttachVirtualJoystick()
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AttachVirtualJoystick
/// \sa SDL_AttachVirtualJoystickEx
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_DetachVirtualJoystick(SDL_JoystickID instance_id)
/// ```
int sdlDetachVirtualJoystick(int instanceId) {
  final sdlDetachVirtualJoystickLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_DetachVirtualJoystick');
  return sdlDetachVirtualJoystickLookupFunction(instanceId);
}

///
/// Query whether or not a joystick is virtual.
///
/// \param instance_id the joystick instance ID
/// \returns SDL_TRUE if the joystick is virtual, SDL_FALSE otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_IsJoystickVirtual(SDL_JoystickID instance_id)
/// ```
bool sdlIsJoystickVirtual(int instanceId) {
  final sdlIsJoystickVirtualLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_IsJoystickVirtual');
  return sdlIsJoystickVirtualLookupFunction(instanceId) == 1;
}

///
/// Set values on an opened, virtual-joystick's axis.
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
/// \param axis the specific axis on the virtual joystick to set.
/// \param value the new value for the specified axis.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetJoystickVirtualAxis(SDL_Joystick *joystick, int axis, Sint16 value)
/// ```
int sdlSetJoystickVirtualAxis(
    Pointer<SdlJoystick> joystick, int axis, int value) {
  final sdlSetJoystickVirtualAxisLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick, Int32 axis, Int16 value),
      int Function(Pointer<SdlJoystick> joystick, int axis,
          int value)>('SDL_SetJoystickVirtualAxis');
  return sdlSetJoystickVirtualAxisLookupFunction(joystick, axis, value);
}

///
/// Set values on an opened, virtual-joystick's button.
///
/// Please note that values set here will not be applied until the next call to
/// SDL_UpdateJoysticks, which can either be called directly, or can be called
/// indirectly through various other SDL APIs, including, but not limited to
/// the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
/// SDL_WaitEvent.
///
/// \param joystick the virtual joystick on which to set state.
/// \param button the specific button on the virtual joystick to set.
/// \param value the new value for the specified button.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetJoystickVirtualButton(SDL_Joystick *joystick, int button, Uint8 value)
/// ```
int sdlSetJoystickVirtualButton(
    Pointer<SdlJoystick> joystick, int button, int value) {
  final sdlSetJoystickVirtualButtonLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick, Int32 button, Uint8 value),
      int Function(Pointer<SdlJoystick> joystick, int button,
          int value)>('SDL_SetJoystickVirtualButton');
  return sdlSetJoystickVirtualButtonLookupFunction(joystick, button, value);
}

///
/// Set values on an opened, virtual-joystick's hat.
///
/// Please note that values set here will not be applied until the next call to
/// SDL_UpdateJoysticks, which can either be called directly, or can be called
/// indirectly through various other SDL APIs, including, but not limited to
/// the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
/// SDL_WaitEvent.
///
/// \param joystick the virtual joystick on which to set state.
/// \param hat the specific hat on the virtual joystick to set.
/// \param value the new value for the specified hat.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetJoystickVirtualHat(SDL_Joystick *joystick, int hat, Uint8 value)
/// ```
int sdlSetJoystickVirtualHat(
    Pointer<SdlJoystick> joystick, int hat, int value) {
  final sdlSetJoystickVirtualHatLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick, Int32 hat, Uint8 value),
      int Function(Pointer<SdlJoystick> joystick, int hat,
          int value)>('SDL_SetJoystickVirtualHat');
  return sdlSetJoystickVirtualHatLookupFunction(joystick, hat, value);
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
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern DECLSPEC SDL_PropertiesID SDLCALL SDL_GetJoystickProperties(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickProperties(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickPropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetJoystickProperties');
  return sdlGetJoystickPropertiesLookupFunction(joystick);
}

///
/// Get the implementation dependent name of a joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the name of the selected joystick. If no name can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstanceName
///
/// ```c
/// extern DECLSPEC const char *SDLCALL SDL_GetJoystickName(SDL_Joystick *joystick)
/// ```
String? sdlGetJoystickName(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlJoystick> joystick),
      Pointer<Utf8> Function(
          Pointer<SdlJoystick> joystick)>('SDL_GetJoystickName');
  final result = sdlGetJoystickNameLookupFunction(joystick);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the implementation dependent path of a joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the path of the selected joystick. If no path can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstancePath
///
/// ```c
/// extern DECLSPEC const char *SDLCALL SDL_GetJoystickPath(SDL_Joystick *joystick)
/// ```
String? sdlGetJoystickPath(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickPathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlJoystick> joystick),
      Pointer<Utf8> Function(
          Pointer<SdlJoystick> joystick)>('SDL_GetJoystickPath');
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
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the player index, or -1 if it's not available.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetJoystickPlayerIndex
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetJoystickPlayerIndex(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickPlayerIndex(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickPlayerIndexLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick),
      int Function(
          Pointer<SdlJoystick> joystick)>('SDL_GetJoystickPlayerIndex');
  return sdlGetJoystickPlayerIndexLookupFunction(joystick);
}

///
/// Set the player index of an opened joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \param player_index Player index to assign to this joystick, or -1 to clear
/// the player index and turn off player LEDs.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickPlayerIndex
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetJoystickPlayerIndex(SDL_Joystick *joystick, int player_index)
/// ```
int sdlSetJoystickPlayerIndex(Pointer<SdlJoystick> joystick, int playerIndex) {
  final sdlSetJoystickPlayerIndexLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick, Int32 playerIndex),
      int Function(Pointer<SdlJoystick> joystick,
          int playerIndex)>('SDL_SetJoystickPlayerIndex');
  return sdlSetJoystickPlayerIndexLookupFunction(joystick, playerIndex);
}

///
/// Get the implementation-dependent GUID for the joystick.
///
/// This function requires an open joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the GUID of the given joystick. If called on an invalid index,
/// this function returns a zero GUID; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstanceGUID
/// \sa SDL_GetJoystickGUIDString
///
/// ```c
/// extern DECLSPEC SDL_JoystickGUID SDLCALL SDL_GetJoystickGUID(SDL_Joystick *joystick)
/// ```
SdlGuid sdlGetJoystickGuid(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickGuidLookupFunction = libSdl3.lookupFunction<
      SdlGuid Function(Pointer<SdlJoystick> joystick),
      SdlGuid Function(Pointer<SdlJoystick> joystick)>('SDL_GetJoystickGUID');
  return sdlGetJoystickGuidLookupFunction(joystick);
}

///
/// Get the USB vendor ID of an opened joystick, if available.
///
/// If the vendor ID isn't available this function returns 0.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the USB vendor ID of the selected joystick, or 0 if unavailable.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstanceVendor
///
/// ```c
/// extern DECLSPEC Uint16 SDLCALL SDL_GetJoystickVendor(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickVendor(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickVendorLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetJoystickVendor');
  return sdlGetJoystickVendorLookupFunction(joystick);
}

///
/// Get the USB product ID of an opened joystick, if available.
///
/// If the product ID isn't available this function returns 0.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the USB product ID of the selected joystick, or 0 if unavailable.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstanceProduct
///
/// ```c
/// extern DECLSPEC Uint16 SDLCALL SDL_GetJoystickProduct(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickProduct(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickProductLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetJoystickProduct');
  return sdlGetJoystickProductLookupFunction(joystick);
}

///
/// Get the product version of an opened joystick, if available.
///
/// If the product version isn't available this function returns 0.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the product version of the selected joystick, or 0 if unavailable.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstanceProductVersion
///
/// ```c
/// extern DECLSPEC Uint16 SDLCALL SDL_GetJoystickProductVersion(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickProductVersion(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickProductVersionLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Pointer<SdlJoystick> joystick),
      int Function(
          Pointer<SdlJoystick> joystick)>('SDL_GetJoystickProductVersion');
  return sdlGetJoystickProductVersionLookupFunction(joystick);
}

///
/// Get the firmware version of an opened joystick, if available.
///
/// If the firmware version isn't available this function returns 0.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the firmware version of the selected joystick, or 0 if
/// unavailable.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC Uint16 SDLCALL SDL_GetJoystickFirmwareVersion(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickFirmwareVersion(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickFirmwareVersionLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Pointer<SdlJoystick> joystick),
      int Function(
          Pointer<SdlJoystick> joystick)>('SDL_GetJoystickFirmwareVersion');
  return sdlGetJoystickFirmwareVersionLookupFunction(joystick);
}

///
/// Get the serial number of an opened joystick, if available.
///
/// Returns the serial number of the joystick, or NULL if it is not available.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the serial number of the selected joystick, or NULL if
/// unavailable.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC const char * SDLCALL SDL_GetJoystickSerial(SDL_Joystick *joystick)
/// ```
String? sdlGetJoystickSerial(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickSerialLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlJoystick> joystick),
      Pointer<Utf8> Function(
          Pointer<SdlJoystick> joystick)>('SDL_GetJoystickSerial');
  final result = sdlGetJoystickSerialLookupFunction(joystick);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the type of an opened joystick.
///
/// \param joystick the SDL_Joystick obtained from SDL_OpenJoystick()
/// \returns the SDL_JoystickType of the selected joystick.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstanceType
///
/// ```c
/// extern DECLSPEC SDL_JoystickType SDLCALL SDL_GetJoystickType(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickType(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetJoystickType');
  return sdlGetJoystickTypeLookupFunction(joystick);
}

///
/// Get an ASCII string representation for a given SDL_JoystickGUID.
///
/// You should supply at least 33 bytes for pszGUID.
///
/// \param guid the SDL_JoystickGUID you wish to convert to string
/// \param pszGUID buffer in which to write the ASCII string
/// \param cbGUID the size of pszGUID
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstanceGUID
/// \sa SDL_GetJoystickGUID
/// \sa SDL_GetJoystickGUIDFromString
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetJoystickGUIDString(SDL_JoystickGUID guid, char *pszGUID, int cbGUID)
/// ```
int sdlGetJoystickGuidString(SdlGuid guid, Pointer<Int8> pszGuid, int cbGuid) {
  final sdlGetJoystickGuidStringLookupFunction = libSdl3.lookupFunction<
      Int32 Function(SdlGuid guid, Pointer<Int8> pszGuid, Int32 cbGuid),
      int Function(SdlGuid guid, Pointer<Int8> pszGuid,
          int cbGuid)>('SDL_GetJoystickGUIDString');
  return sdlGetJoystickGuidStringLookupFunction(guid, pszGuid, cbGuid);
}

///
/// Convert a GUID string into a SDL_JoystickGUID structure.
///
/// Performs no error checking. If this function is given a string containing
/// an invalid GUID, the function will silently succeed, but the GUID generated
/// will not be useful.
///
/// \param pchGUID string containing an ASCII representation of a GUID
/// \returns a SDL_JoystickGUID structure.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickGUIDString
///
/// ```c
/// extern DECLSPEC SDL_JoystickGUID SDLCALL SDL_GetJoystickGUIDFromString(const char *pchGUID)
/// ```
SdlGuid sdlGetJoystickGuidFromString(String? pchGuid) {
  final sdlGetJoystickGuidFromStringLookupFunction = libSdl3.lookupFunction<
      SdlGuid Function(Pointer<Utf8> pchGuid),
      SdlGuid Function(Pointer<Utf8> pchGuid)>('SDL_GetJoystickGUIDFromString');
  final pchGuidPointer = pchGuid != null ? pchGuid.toNativeUtf8() : nullptr;
  final result = sdlGetJoystickGuidFromStringLookupFunction(pchGuidPointer);
  calloc.free(pchGuidPointer);
  return result;
}

///
/// Get the device information encoded in a SDL_JoystickGUID structure
///
/// \param guid the SDL_JoystickGUID you wish to get info about
/// \param vendor A pointer filled in with the device VID, or 0 if not
/// available
/// \param product A pointer filled in with the device PID, or 0 if not
/// available
/// \param version A pointer filled in with the device version, or 0 if not
/// available
/// \param crc16 A pointer filled in with a CRC used to distinguish different
/// products with the same VID/PID, or 0 if not available
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickInstanceGUID
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_GetJoystickGUIDInfo(SDL_JoystickGUID guid, Uint16 *vendor, Uint16 *product, Uint16 *version, Uint16 *crc16)
/// ```
void sdlGetJoystickGuidInfo(SdlGuid guid, Pointer<Uint16> vendor,
    Pointer<Uint16> product, Pointer<Uint16> version, Pointer<Uint16> crc16) {
  final sdlGetJoystickGuidInfoLookupFunction = libSdl3.lookupFunction<
      Void Function(
          SdlGuid guid,
          Pointer<Uint16> vendor,
          Pointer<Uint16> product,
          Pointer<Uint16> version,
          Pointer<Uint16> crc16),
      void Function(
          SdlGuid guid,
          Pointer<Uint16> vendor,
          Pointer<Uint16> product,
          Pointer<Uint16> version,
          Pointer<Uint16> crc16)>('SDL_GetJoystickGUIDInfo');
  return sdlGetJoystickGuidInfoLookupFunction(
      guid, vendor, product, version, crc16);
}

///
/// Get the status of a specified joystick.
///
/// \param joystick the joystick to query
/// \returns SDL_TRUE if the joystick has been opened, SDL_FALSE if it has not;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_JoystickConnected(SDL_Joystick *joystick)
/// ```
bool sdlJoystickConnected(Pointer<SdlJoystick> joystick) {
  final sdlJoystickConnectedLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_JoystickConnected');
  return sdlJoystickConnectedLookupFunction(joystick) == 1;
}

///
/// Get the instance ID of an opened joystick.
///
/// \param joystick an SDL_Joystick structure containing joystick information
/// \returns the instance ID of the specified joystick on success or 0 on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_JoystickID SDLCALL SDL_GetJoystickInstanceID(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickInstanceId(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickInstanceIdLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetJoystickInstanceID');
  return sdlGetJoystickInstanceIdLookupFunction(joystick);
}

///
/// Get the number of general axis controls on a joystick.
///
/// Often, the directional pad on a game controller will either look like 4
/// separate buttons or a POV hat, and not axes, but all of this is up to the
/// device and platform.
///
/// \param joystick an SDL_Joystick structure containing joystick information
/// \returns the number of axis controls/number of axes on success or a
/// negative error code on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickAxis
/// \sa SDL_GetNumJoystickBalls
/// \sa SDL_GetNumJoystickButtons
/// \sa SDL_GetNumJoystickHats
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumJoystickAxes(SDL_Joystick *joystick)
/// ```
int sdlGetNumJoystickAxes(Pointer<SdlJoystick> joystick) {
  final sdlGetNumJoystickAxesLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetNumJoystickAxes');
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
/// \param joystick an SDL_Joystick structure containing joystick information
/// \returns the number of trackballs on success or a negative error code on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickBall
/// \sa SDL_GetNumJoystickAxes
/// \sa SDL_GetNumJoystickButtons
/// \sa SDL_GetNumJoystickHats
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumJoystickBalls(SDL_Joystick *joystick)
/// ```
int sdlGetNumJoystickBalls(Pointer<SdlJoystick> joystick) {
  final sdlGetNumJoystickBallsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetNumJoystickBalls');
  return sdlGetNumJoystickBallsLookupFunction(joystick);
}

///
/// Get the number of POV hats on a joystick.
///
/// \param joystick an SDL_Joystick structure containing joystick information
/// \returns the number of POV hats on success or a negative error code on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickHat
/// \sa SDL_GetNumJoystickAxes
/// \sa SDL_GetNumJoystickBalls
/// \sa SDL_GetNumJoystickButtons
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumJoystickHats(SDL_Joystick *joystick)
/// ```
int sdlGetNumJoystickHats(Pointer<SdlJoystick> joystick) {
  final sdlGetNumJoystickHatsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetNumJoystickHats');
  return sdlGetNumJoystickHatsLookupFunction(joystick);
}

///
/// Get the number of buttons on a joystick.
///
/// \param joystick an SDL_Joystick structure containing joystick information
/// \returns the number of buttons on success or a negative error code on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetJoystickButton
/// \sa SDL_GetNumJoystickAxes
/// \sa SDL_GetNumJoystickBalls
/// \sa SDL_GetNumJoystickHats
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumJoystickButtons(SDL_Joystick *joystick)
/// ```
int sdlGetNumJoystickButtons(Pointer<SdlJoystick> joystick) {
  final sdlGetNumJoystickButtonsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetNumJoystickButtons');
  return sdlGetNumJoystickButtonsLookupFunction(joystick);
}

///
/// Set the state of joystick event processing.
///
/// If joystick events are disabled, you must call SDL_UpdateJoysticks()
/// yourself and check the state of the joystick when you want joystick
/// information.
///
/// \param enabled whether to process joystick events or not
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_JoystickEventsEnabled
/// \sa SDL_UpdateJoysticks
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_SetJoystickEventsEnabled(SDL_bool enabled)
/// ```
void sdlSetJoystickEventsEnabled(bool enabled) {
  final sdlSetJoystickEventsEnabledLookupFunction = libSdl3.lookupFunction<
      Void Function(Int32 enabled),
      void Function(int enabled)>('SDL_SetJoystickEventsEnabled');
  return sdlSetJoystickEventsEnabledLookupFunction(enabled ? 1 : 0);
}

///
/// Query the state of joystick event processing.
///
/// If joystick events are disabled, you must call SDL_UpdateJoysticks()
/// yourself and check the state of the joystick when you want joystick
/// information.
///
/// \returns SDL_TRUE if joystick events are being processed, SDL_FALSE
/// otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetJoystickEventsEnabled
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_JoystickEventsEnabled(void)
/// ```
bool sdlJoystickEventsEnabled() {
  final sdlJoystickEventsEnabledLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_JoystickEventsEnabled');
  return sdlJoystickEventsEnabledLookupFunction() == 1;
}

///
/// Update the current state of the open joysticks.
///
/// This is called automatically by the event loop if any joystick events are
/// enabled.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_UpdateJoysticks(void)
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
/// \param joystick an SDL_Joystick structure containing joystick information
/// \param axis the axis to query; the axis indices start at index 0
/// \returns a 16-bit signed integer representing the current position of the
/// axis or 0 on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumJoystickAxes
///
/// ```c
/// extern DECLSPEC Sint16 SDLCALL SDL_GetJoystickAxis(SDL_Joystick *joystick, int axis)
/// ```
int sdlGetJoystickAxis(Pointer<SdlJoystick> joystick, int axis) {
  final sdlGetJoystickAxisLookupFunction = libSdl3.lookupFunction<
      Int16 Function(Pointer<SdlJoystick> joystick, Int32 axis),
      int Function(
          Pointer<SdlJoystick> joystick, int axis)>('SDL_GetJoystickAxis');
  return sdlGetJoystickAxisLookupFunction(joystick, axis);
}

///
/// Get the initial state of an axis control on a joystick.
///
/// The state is a value ranging from -32768 to 32767.
///
/// The axis indices start at index 0.
///
/// \param joystick an SDL_Joystick structure containing joystick information
/// \param axis the axis to query; the axis indices start at index 0
/// \param state Upon return, the initial value is supplied here.
/// \returns SDL_TRUE if this axis has any initial value, or SDL_FALSE if not.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_GetJoystickAxisInitialState(SDL_Joystick *joystick, int axis, Sint16 *state)
/// ```
bool sdlGetJoystickAxisInitialState(
    Pointer<SdlJoystick> joystick, int axis, Pointer<Int16> state) {
  final sdlGetJoystickAxisInitialStateLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlJoystick> joystick, Int32 axis, Pointer<Int16> state),
      int Function(Pointer<SdlJoystick> joystick, int axis,
          Pointer<Int16> state)>('SDL_GetJoystickAxisInitialState');
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
/// \param joystick the SDL_Joystick to query
/// \param ball the ball index to query; ball indices start at index 0
/// \param dx stores the difference in the x axis position since the last poll
/// \param dy stores the difference in the y axis position since the last poll
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumJoystickBalls
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetJoystickBall(SDL_Joystick *joystick, int ball, int *dx, int *dy)
/// ```
int sdlGetJoystickBall(Pointer<SdlJoystick> joystick, int ball,
    Pointer<Int32> dx, Pointer<Int32> dy) {
  final sdlGetJoystickBallLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick, Int32 ball,
          Pointer<Int32> dx, Pointer<Int32> dy),
      int Function(Pointer<SdlJoystick> joystick, int ball, Pointer<Int32> dx,
          Pointer<Int32> dy)>('SDL_GetJoystickBall');
  return sdlGetJoystickBallLookupFunction(joystick, ball, dx, dy);
}

///
/// Get the current state of a POV hat on a joystick.
///
/// The returned value will be one of the following positions:
///
/// - `SDL_HAT_CENTERED`
/// - `SDL_HAT_UP`
/// - `SDL_HAT_RIGHT`
/// - `SDL_HAT_DOWN`
/// - `SDL_HAT_LEFT`
/// - `SDL_HAT_RIGHTUP`
/// - `SDL_HAT_RIGHTDOWN`
/// - `SDL_HAT_LEFTUP`
/// - `SDL_HAT_LEFTDOWN`
///
/// \param joystick an SDL_Joystick structure containing joystick information
/// \param hat the hat index to get the state from; indices start at index 0
/// \returns the current hat position.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumJoystickHats
///
/// ```c
/// extern DECLSPEC Uint8 SDLCALL SDL_GetJoystickHat(SDL_Joystick *joystick, int hat)
/// ```
int sdlGetJoystickHat(Pointer<SdlJoystick> joystick, int hat) {
  final sdlGetJoystickHatLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlJoystick> joystick, Int32 hat),
      int Function(
          Pointer<SdlJoystick> joystick, int hat)>('SDL_GetJoystickHat');
  return sdlGetJoystickHatLookupFunction(joystick, hat);
}

///
/// Get the current state of a button on a joystick.
///
/// \param joystick an SDL_Joystick structure containing joystick information
/// \param button the button index to get the state from; indices start at
/// index 0
/// \returns 1 if the specified button is pressed, 0 otherwise.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumJoystickButtons
///
/// ```c
/// extern DECLSPEC Uint8 SDLCALL SDL_GetJoystickButton(SDL_Joystick *joystick, int button)
/// ```
int sdlGetJoystickButton(Pointer<SdlJoystick> joystick, int button) {
  final sdlGetJoystickButtonLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlJoystick> joystick, Int32 button),
      int Function(
          Pointer<SdlJoystick> joystick, int button)>('SDL_GetJoystickButton');
  return sdlGetJoystickButtonLookupFunction(joystick, button);
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
/// \param joystick The joystick to vibrate
/// \param low_frequency_rumble The intensity of the low frequency (left)
/// rumble motor, from 0 to 0xFFFF
/// \param high_frequency_rumble The intensity of the high frequency (right)
/// rumble motor, from 0 to 0xFFFF
/// \param duration_ms The duration of the rumble effect, in milliseconds
/// \returns 0, or -1 if rumble isn't supported on this joystick
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_RumbleJoystick(SDL_Joystick *joystick, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms)
/// ```
int sdlRumbleJoystick(Pointer<SdlJoystick> joystick, int lowFrequencyRumble,
    int highFrequencyRumble, int durationMs) {
  final sdlRumbleJoystickLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick, Uint16 lowFrequencyRumble,
          Uint16 highFrequencyRumble, Uint32 durationMs),
      int Function(Pointer<SdlJoystick> joystick, int lowFrequencyRumble,
          int highFrequencyRumble, int durationMs)>('SDL_RumbleJoystick');
  return sdlRumbleJoystickLookupFunction(
      joystick, lowFrequencyRumble, highFrequencyRumble, durationMs);
}

///
/// Start a rumble effect in the joystick's triggers
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
/// \param joystick The joystick to vibrate
/// \param left_rumble The intensity of the left trigger rumble motor, from 0
/// to 0xFFFF
/// \param right_rumble The intensity of the right trigger rumble motor, from 0
/// to 0xFFFF
/// \param duration_ms The duration of the rumble effect, in milliseconds
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_RumbleJoystick
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_RumbleJoystickTriggers(SDL_Joystick *joystick, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms)
/// ```
int sdlRumbleJoystickTriggers(Pointer<SdlJoystick> joystick, int leftRumble,
    int rightRumble, int durationMs) {
  final sdlRumbleJoystickTriggersLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick, Uint16 leftRumble,
          Uint16 rightRumble, Uint32 durationMs),
      int Function(Pointer<SdlJoystick> joystick, int leftRumble,
          int rightRumble, int durationMs)>('SDL_RumbleJoystickTriggers');
  return sdlRumbleJoystickTriggersLookupFunction(
      joystick, leftRumble, rightRumble, durationMs);
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
/// \param joystick The joystick to update
/// \param red The intensity of the red LED
/// \param green The intensity of the green LED
/// \param blue The intensity of the blue LED
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetJoystickLED(SDL_Joystick *joystick, Uint8 red, Uint8 green, Uint8 blue)
/// ```
int sdlSetJoystickLed(
    Pointer<SdlJoystick> joystick, int red, int green, int blue) {
  final sdlSetJoystickLedLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlJoystick> joystick, Uint8 red, Uint8 green, Uint8 blue),
      int Function(Pointer<SdlJoystick> joystick, int red, int green,
          int blue)>('SDL_SetJoystickLED');
  return sdlSetJoystickLedLookupFunction(joystick, red, green, blue);
}

///
/// Send a joystick specific effect packet
///
/// \param joystick The joystick to affect
/// \param data The data to send to the joystick
/// \param size The size of the data to send to the joystick
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SendJoystickEffect(SDL_Joystick *joystick, const void *data, int size)
/// ```
int sdlSendJoystickEffect(
    Pointer<SdlJoystick> joystick, Pointer<NativeType> data, int size) {
  final sdlSendJoystickEffectLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlJoystick> joystick, Pointer<NativeType> data, Int32 size),
      int Function(Pointer<SdlJoystick> joystick, Pointer<NativeType> data,
          int size)>('SDL_SendJoystickEffect');
  return sdlSendJoystickEffectLookupFunction(joystick, data, size);
}

///
/// Close a joystick previously opened with SDL_OpenJoystick().
///
/// \param joystick The joystick device to close
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_OpenJoystick
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_CloseJoystick(SDL_Joystick *joystick)
/// ```
void sdlCloseJoystick(Pointer<SdlJoystick> joystick) {
  final sdlCloseJoystickLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlJoystick> joystick),
      void Function(Pointer<SdlJoystick> joystick)>('SDL_CloseJoystick');
  return sdlCloseJoystickLookupFunction(joystick);
}

///
/// Get the battery level of a joystick as SDL_JoystickPowerLevel.
///
/// \param joystick the SDL_Joystick to query
/// \returns the current battery level as SDL_JoystickPowerLevel on success or
/// `SDL_JOYSTICK_POWER_UNKNOWN` if it is unknown
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC SDL_JoystickPowerLevel SDLCALL SDL_GetJoystickPowerLevel(SDL_Joystick *joystick)
/// ```
int sdlGetJoystickPowerLevel(Pointer<SdlJoystick> joystick) {
  final sdlGetJoystickPowerLevelLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlJoystick> joystick),
      int Function(Pointer<SdlJoystick> joystick)>('SDL_GetJoystickPowerLevel');
  return sdlGetJoystickPowerLevelLookupFunction(joystick);
}
