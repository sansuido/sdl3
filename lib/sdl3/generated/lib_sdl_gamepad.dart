// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Add support for gamepads that SDL is unaware of or change the binding of an
/// existing gamepad.
///
/// The mapping string has the format "GUID,name,mapping", where GUID is the
/// string value from SDL_GUIDToString(), name is the human readable string for
/// the device and mappings are gamepad mappings to joystick ones. Under
/// Windows there is a reserved GUID of "xinput" that covers all XInput
/// devices. The mapping format for joystick is:
///
/// - `bX`: a joystick button, index X
/// - `hX.Y`: hat X with value Y
/// - `aX`: axis X of the joystick
///
/// Buttons can be used as a gamepad axes and vice versa.
///
/// If a device with this GUID is already plugged in, SDL will generate an
/// SDL_EVENT_GAMEPAD_ADDED event.
///
/// This string shows an example of a valid mapping for a gamepad:
///
/// ```c
/// "341a3608000000000000504944564944,Afterglow PS3 Controller,a:b1,b:b2,y:b3,x:b0,start:b9,guide:b12,back:b8,dpup:h0.1,dpleft:h0.8,dpdown:h0.4,dpright:h0.2,leftshoulder:b4,rightshoulder:b5,leftstick:b10,rightstick:b11,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b6,righttrigger:b7"
/// ```
///
/// \param mapping the mapping string.
/// \returns 1 if a new mapping is added, 0 if an existing mapping is updated,
/// -1 on failure; call SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_AddGamepadMappingsFromFile
/// \sa SDL_AddGamepadMappingsFromIO
/// \sa SDL_GetGamepadMapping
/// \sa SDL_GetGamepadMappingForGUID
/// \sa SDL_HINT_GAMECONTROLLERCONFIG
/// \sa SDL_HINT_GAMECONTROLLERCONFIG_FILE
/// \sa SDL_EVENT_GAMEPAD_ADDED
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AddGamepadMapping(const char *mapping)
/// ```
int sdlAddGamepadMapping(String? mapping) {
  final sdlAddGamepadMappingLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> mapping),
      int Function(Pointer<Utf8> mapping)>('SDL_AddGamepadMapping');
  final mappingPointer = mapping != null ? mapping.toNativeUtf8() : nullptr;
  final result = sdlAddGamepadMappingLookupFunction(mappingPointer);
  calloc.free(mappingPointer);
  return result;
}

///
/// Load a set of gamepad mappings from an SDL_IOStream.
///
/// You can call this function several times, if needed, to load different
/// database files.
///
/// If a new mapping is loaded for an already known gamepad GUID, the later
/// version will overwrite the one currently loaded.
///
/// Any new mappings for already plugged in controllers will generate
/// SDL_EVENT_GAMEPAD_ADDED events.
///
/// Mappings not belonging to the current platform or with no platform field
/// specified will be ignored (i.e. mappings for Linux will be ignored in
/// Windows, etc).
///
/// This function will load the text database entirely in memory before
/// processing it, so take this into consideration if you are in a memory
/// constrained environment.
///
/// \param src the data stream for the mappings to be added.
/// \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
/// in the case of an error.
/// \returns the number of mappings added or -1 on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_AddGamepadMapping
/// \sa SDL_AddGamepadMappingsFromFile
/// \sa SDL_GetGamepadMapping
/// \sa SDL_GetGamepadMappingForGUID
/// \sa SDL_HINT_GAMECONTROLLERCONFIG
/// \sa SDL_HINT_GAMECONTROLLERCONFIG_FILE
/// \sa SDL_EVENT_GAMEPAD_ADDED
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AddGamepadMappingsFromIO(SDL_IOStream *src, bool closeio)
/// ```
int sdlAddGamepadMappingsFromIo(Pointer<SdlIoStream> src, bool closeio) {
  final sdlAddGamepadMappingsFromIoLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlIoStream> src, Uint8 closeio),
      int Function(Pointer<SdlIoStream> src,
          int closeio)>('SDL_AddGamepadMappingsFromIO');
  return sdlAddGamepadMappingsFromIoLookupFunction(src, closeio ? 1 : 0);
}

///
/// Load a set of gamepad mappings from a file.
///
/// You can call this function several times, if needed, to load different
/// database files.
///
/// If a new mapping is loaded for an already known gamepad GUID, the later
/// version will overwrite the one currently loaded.
///
/// Any new mappings for already plugged in controllers will generate
/// SDL_EVENT_GAMEPAD_ADDED events.
///
/// Mappings not belonging to the current platform or with no platform field
/// specified will be ignored (i.e. mappings for Linux will be ignored in
/// Windows, etc).
///
/// \param file the mappings file to load.
/// \returns the number of mappings added or -1 on failure; call SDL_GetError()
/// for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_AddGamepadMapping
/// \sa SDL_AddGamepadMappingsFromIO
/// \sa SDL_GetGamepadMapping
/// \sa SDL_GetGamepadMappingForGUID
/// \sa SDL_HINT_GAMECONTROLLERCONFIG
/// \sa SDL_HINT_GAMECONTROLLERCONFIG_FILE
/// \sa SDL_EVENT_GAMEPAD_ADDED
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_AddGamepadMappingsFromFile(const char *file)
/// ```
int sdlAddGamepadMappingsFromFile(String? file) {
  final sdlAddGamepadMappingsFromFileLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> file),
      int Function(Pointer<Utf8> file)>('SDL_AddGamepadMappingsFromFile');
  final filePointer = file != null ? file.toNativeUtf8() : nullptr;
  final result = sdlAddGamepadMappingsFromFileLookupFunction(filePointer);
  calloc.free(filePointer);
  return result;
}

///
/// Reinitialize the SDL mapping database to its initial state.
///
/// This will generate gamepad events as needed if device mappings change.
///
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ReloadGamepadMappings(void)
/// ```
bool sdlReloadGamepadMappings() {
  final sdlReloadGamepadMappingsLookupFunction =
      libSdl3.lookupFunction<Uint8 Function(), int Function()>(
          'SDL_ReloadGamepadMappings');
  return sdlReloadGamepadMappingsLookupFunction() == 1;
}

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
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC char ** SDLCALL SDL_GetGamepadMappings(int *count)
/// ```
Pointer<Pointer<Int8>> sdlGetGamepadMappings(Pointer<Int32> count) {
  final sdlGetGamepadMappingsLookupFunction = libSdl3.lookupFunction<
      Pointer<Pointer<Int8>> Function(Pointer<Int32> count),
      Pointer<Pointer<Int8>> Function(
          Pointer<Int32> count)>('SDL_GetGamepadMappings');
  return sdlGetGamepadMappingsLookupFunction(count);
}

///
/// Get the gamepad mapping string for a given GUID.
///
/// \param guid a structure containing the GUID for which a mapping is desired.
/// \returns a mapping string or NULL on failure; call SDL_GetError() for more
/// information. This should be freed with SDL_free() when it is no
/// longer needed.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetJoystickGUIDForID
/// \sa SDL_GetJoystickGUID
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetGamepadMappingForGUID(SDL_GUID guid)
/// ```
Pointer<Int8> sdlGetGamepadMappingForGuid(SdlGuid guid) {
  final sdlGetGamepadMappingForGuidLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(SdlGuid guid),
      Pointer<Int8> Function(SdlGuid guid)>('SDL_GetGamepadMappingForGUID');
  return sdlGetGamepadMappingForGuidLookupFunction(guid);
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_AddGamepadMapping
/// \sa SDL_GetGamepadMappingForID
/// \sa SDL_GetGamepadMappingForGUID
/// \sa SDL_SetGamepadMapping
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetGamepadMapping(SDL_Gamepad *gamepad)
/// ```
Pointer<Int8> sdlGetGamepadMapping(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadMappingLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Pointer<SdlGamepad> gamepad),
      Pointer<Int8> Function(
          Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadMapping');
  return sdlGetGamepadMappingLookupFunction(gamepad);
}

///
/// Set the current mapping of a joystick or gamepad.
///
/// Details about mappings are discussed with SDL_AddGamepadMapping().
///
/// \param instance_id the joystick instance ID.
/// \param mapping the mapping to use for this device, or NULL to clear the
/// mapping.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_AddGamepadMapping
/// \sa SDL_GetGamepadMapping
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGamepadMapping(SDL_JoystickID instance_id, const char *mapping)
/// ```
bool sdlSetGamepadMapping(int instanceId, String? mapping) {
  final sdlSetGamepadMappingLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Uint32 instanceId, Pointer<Utf8> mapping),
      int Function(
          int instanceId, Pointer<Utf8> mapping)>('SDL_SetGamepadMapping');
  final mappingPointer = mapping != null ? mapping.toNativeUtf8() : nullptr;
  final result =
      sdlSetGamepadMappingLookupFunction(instanceId, mappingPointer) == 1;
  calloc.free(mappingPointer);
  return result;
}

///
/// Return whether a gamepad is currently connected.
///
/// \returns true if a gamepad is connected, false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepads
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HasGamepad(void)
/// ```
bool sdlHasGamepad() {
  final sdlHasGamepadLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_HasGamepad');
  return sdlHasGamepadLookupFunction() == 1;
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_HasGamepad
/// \sa SDL_OpenGamepad
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickID * SDLCALL SDL_GetGamepads(int *count)
/// ```
Pointer<Uint32> sdlGetGamepads(Pointer<Int32> count) {
  final sdlGetGamepadsLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(Pointer<Int32> count)>('SDL_GetGamepads');
  return sdlGetGamepadsLookupFunction(count);
}

///
/// Check if the given joystick is supported by the gamepad interface.
///
/// \param instance_id the joystick instance ID.
/// \returns true if the given joystick is supported by the gamepad interface,
/// false if it isn't or it's an invalid index.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetJoysticks
/// \sa SDL_OpenGamepad
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_IsGamepad(SDL_JoystickID instance_id)
/// ```
bool sdlIsGamepad(int instanceId) {
  final sdlIsGamepadLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_IsGamepad');
  return sdlIsGamepadLookupFunction(instanceId) == 1;
}

///
/// Get the implementation dependent name of a gamepad.
///
/// This can be called before any gamepads are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the name of the selected gamepad. If no name can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadName
/// \sa SDL_GetGamepads
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadNameForID(SDL_JoystickID instance_id)
/// ```
String? sdlGetGamepadNameForId(int instanceId) {
  final sdlGetGamepadNameForIdLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetGamepadNameForID');
  final result = sdlGetGamepadNameForIdLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the implementation dependent path of a gamepad.
///
/// This can be called before any gamepads are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the path of the selected gamepad. If no path can be found, this
/// function returns NULL; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadPath
/// \sa SDL_GetGamepads
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadPathForID(SDL_JoystickID instance_id)
/// ```
String? sdlGetGamepadPathForId(int instanceId) {
  final sdlGetGamepadPathForIdLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Uint32 instanceId),
      Pointer<Utf8> Function(int instanceId)>('SDL_GetGamepadPathForID');
  final result = sdlGetGamepadPathForIdLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the player index of a gamepad.
///
/// This can be called before any gamepads are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the player index of a gamepad, or -1 if it's not available.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadPlayerIndex
/// \sa SDL_GetGamepads
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetGamepadPlayerIndexForID(SDL_JoystickID instance_id)
/// ```
int sdlGetGamepadPlayerIndexForId(int instanceId) {
  final sdlGetGamepadPlayerIndexForIdLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetGamepadPlayerIndexForID');
  return sdlGetGamepadPlayerIndexForIdLookupFunction(instanceId);
}

///
/// Get the implementation-dependent GUID of a gamepad.
///
/// This can be called before any gamepads are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the GUID of the selected gamepad. If called on an invalid index,
/// this function returns a zero GUID.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GUIDToString
/// \sa SDL_GetGamepads
///
/// ```c
/// extern SDL_DECLSPEC SDL_GUID SDLCALL SDL_GetGamepadGUIDForID(SDL_JoystickID instance_id)
/// ```
SdlGuid sdlGetGamepadGuidForId(int instanceId) {
  final sdlGetGamepadGuidForIdLookupFunction = libSdl3.lookupFunction<
      SdlGuid Function(Uint32 instanceId),
      SdlGuid Function(int instanceId)>('SDL_GetGamepadGUIDForID');
  return sdlGetGamepadGuidForIdLookupFunction(instanceId);
}

///
/// Get the USB vendor ID of a gamepad, if available.
///
/// This can be called before any gamepads are opened. If the vendor ID isn't
/// available this function returns 0.
///
/// \param instance_id the joystick instance ID.
/// \returns the USB vendor ID of the selected gamepad. If called on an invalid
/// index, this function returns zero.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadVendor
/// \sa SDL_GetGamepads
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetGamepadVendorForID(SDL_JoystickID instance_id)
/// ```
int sdlGetGamepadVendorForId(int instanceId) {
  final sdlGetGamepadVendorForIdLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetGamepadVendorForID');
  return sdlGetGamepadVendorForIdLookupFunction(instanceId);
}

///
/// Get the USB product ID of a gamepad, if available.
///
/// This can be called before any gamepads are opened. If the product ID isn't
/// available this function returns 0.
///
/// \param instance_id the joystick instance ID.
/// \returns the USB product ID of the selected gamepad. If called on an
/// invalid index, this function returns zero.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadProduct
/// \sa SDL_GetGamepads
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetGamepadProductForID(SDL_JoystickID instance_id)
/// ```
int sdlGetGamepadProductForId(int instanceId) {
  final sdlGetGamepadProductForIdLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetGamepadProductForID');
  return sdlGetGamepadProductForIdLookupFunction(instanceId);
}

///
/// Get the product version of a gamepad, if available.
///
/// This can be called before any gamepads are opened. If the product version
/// isn't available this function returns 0.
///
/// \param instance_id the joystick instance ID.
/// \returns the product version of the selected gamepad. If called on an
/// invalid index, this function returns zero.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadProductVersion
/// \sa SDL_GetGamepads
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetGamepadProductVersionForID(SDL_JoystickID instance_id)
/// ```
int sdlGetGamepadProductVersionForId(int instanceId) {
  final sdlGetGamepadProductVersionForIdLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetGamepadProductVersionForID');
  return sdlGetGamepadProductVersionForIdLookupFunction(instanceId);
}

///
/// Get the type of a gamepad.
///
/// This can be called before any gamepads are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the gamepad type.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadType
/// \sa SDL_GetGamepads
/// \sa SDL_GetRealGamepadTypeForID
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadType SDLCALL SDL_GetGamepadTypeForID(SDL_JoystickID instance_id)
/// ```
int sdlGetGamepadTypeForId(int instanceId) {
  final sdlGetGamepadTypeForIdLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetGamepadTypeForID');
  return sdlGetGamepadTypeForIdLookupFunction(instanceId);
}

///
/// Get the type of a gamepad, ignoring any mapping override.
///
/// This can be called before any gamepads are opened.
///
/// \param instance_id the joystick instance ID.
/// \returns the gamepad type.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadTypeForID
/// \sa SDL_GetGamepads
/// \sa SDL_GetRealGamepadType
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadType SDLCALL SDL_GetRealGamepadTypeForID(SDL_JoystickID instance_id)
/// ```
int sdlGetRealGamepadTypeForId(int instanceId) {
  final sdlGetRealGamepadTypeForIdLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 instanceId),
      int Function(int instanceId)>('SDL_GetRealGamepadTypeForID');
  return sdlGetRealGamepadTypeForIdLookupFunction(instanceId);
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepads
/// \sa SDL_GetGamepadMapping
///
/// ```c
/// extern SDL_DECLSPEC char * SDLCALL SDL_GetGamepadMappingForID(SDL_JoystickID instance_id)
/// ```
Pointer<Int8> sdlGetGamepadMappingForId(int instanceId) {
  final sdlGetGamepadMappingForIdLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Uint32 instanceId),
      Pointer<Int8> Function(int instanceId)>('SDL_GetGamepadMappingForID');
  return sdlGetGamepadMappingForIdLookupFunction(instanceId);
}

///
/// Open a gamepad for use.
///
/// \param instance_id the joystick instance ID.
/// \returns a gamepad identifier or NULL if an error occurred; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_CloseGamepad
/// \sa SDL_IsGamepad
///
/// ```c
/// extern SDL_DECLSPEC SDL_Gamepad * SDLCALL SDL_OpenGamepad(SDL_JoystickID instance_id)
/// ```
Pointer<SdlGamepad> sdlOpenGamepad(int instanceId) {
  final sdlOpenGamepadLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGamepad> Function(Uint32 instanceId),
      Pointer<SdlGamepad> Function(int instanceId)>('SDL_OpenGamepad');
  return sdlOpenGamepadLookupFunction(instanceId);
}

///
/// Get the SDL_Gamepad associated with a joystick instance ID, if it has been
/// opened.
///
/// \param instance_id the joystick instance ID of the gamepad.
/// \returns an SDL_Gamepad on success or NULL on failure or if it hasn't been
/// opened yet; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Gamepad * SDLCALL SDL_GetGamepadFromID(SDL_JoystickID instance_id)
/// ```
Pointer<SdlGamepad> sdlGetGamepadFromId(int instanceId) {
  final sdlGetGamepadFromIdLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGamepad> Function(Uint32 instanceId),
      Pointer<SdlGamepad> Function(int instanceId)>('SDL_GetGamepadFromID');
  return sdlGetGamepadFromIdLookupFunction(instanceId);
}

///
/// Get the SDL_Gamepad associated with a player index.
///
/// \param player_index the player index, which different from the instance ID.
/// \returns the SDL_Gamepad associated with a player index.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadPlayerIndex
/// \sa SDL_SetGamepadPlayerIndex
///
/// ```c
/// extern SDL_DECLSPEC SDL_Gamepad * SDLCALL SDL_GetGamepadFromPlayerIndex(int player_index)
/// ```
Pointer<SdlGamepad> sdlGetGamepadFromPlayerIndex(int playerIndex) {
  final sdlGetGamepadFromPlayerIndexLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlGamepad> Function(Int32 playerIndex),
      Pointer<SdlGamepad> Function(
          int playerIndex)>('SDL_GetGamepadFromPlayerIndex');
  return sdlGetGamepadFromPlayerIndexLookupFunction(playerIndex);
}

///
/// Get the properties associated with an opened gamepad.
///
/// These properties are shared with the underlying joystick object.
///
/// The following read-only properties are provided by SDL:
///
/// - `SDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN`: true if this gamepad has an LED
/// that has adjustable brightness
/// - `SDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN`: true if this gamepad has an LED
/// that has adjustable color
/// - `SDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN`: true if this gamepad has a
/// player LED
/// - `SDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN`: true if this gamepad has
/// left/right rumble
/// - `SDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN`: true if this gamepad has
/// simple trigger rumble
///
/// \param gamepad a gamepad identifier previously returned by
/// SDL_OpenGamepad().
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetGamepadProperties(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadProperties(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadPropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadProperties');
  return sdlGetGamepadPropertiesLookupFunction(gamepad);
}

///
/// Get the instance ID of an opened gamepad.
///
/// \param gamepad a gamepad identifier previously returned by
/// SDL_OpenGamepad().
/// \returns the instance ID of the specified gamepad on success or 0 on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickID SDLCALL SDL_GetGamepadID(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadId(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadIdLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadID');
  return sdlGetGamepadIdLookupFunction(gamepad);
}

///
/// Get the implementation-dependent name for an opened gamepad.
///
/// \param gamepad a gamepad identifier previously returned by
/// SDL_OpenGamepad().
/// \returns the implementation dependent name for the gamepad, or NULL if
/// there is no name or the identifier passed is invalid.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadNameForID
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadName(SDL_Gamepad *gamepad)
/// ```
String? sdlGetGamepadName(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlGamepad> gamepad),
      Pointer<Utf8> Function(
          Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadName');
  final result = sdlGetGamepadNameLookupFunction(gamepad);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the implementation-dependent path for an opened gamepad.
///
/// \param gamepad a gamepad identifier previously returned by
/// SDL_OpenGamepad().
/// \returns the implementation dependent path for the gamepad, or NULL if
/// there is no path or the identifier passed is invalid.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadPathForID
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadPath(SDL_Gamepad *gamepad)
/// ```
String? sdlGetGamepadPath(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadPathLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlGamepad> gamepad),
      Pointer<Utf8> Function(
          Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadPath');
  final result = sdlGetGamepadPathLookupFunction(gamepad);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the type of an opened gamepad.
///
/// \param gamepad the gamepad object to query.
/// \returns the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it's not
/// available.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadTypeForID
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadType SDLCALL SDL_GetGamepadType(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadType(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadType');
  return sdlGetGamepadTypeLookupFunction(gamepad);
}

///
/// Get the type of an opened gamepad, ignoring any mapping override.
///
/// \param gamepad the gamepad object to query.
/// \returns the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it's not
/// available.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetRealGamepadTypeForID
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadType SDLCALL SDL_GetRealGamepadType(SDL_Gamepad *gamepad)
/// ```
int sdlGetRealGamepadType(Pointer<SdlGamepad> gamepad) {
  final sdlGetRealGamepadTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetRealGamepadType');
  return sdlGetRealGamepadTypeLookupFunction(gamepad);
}

///
/// Get the player index of an opened gamepad.
///
/// For XInput gamepads this returns the XInput user index.
///
/// \param gamepad the gamepad object to query.
/// \returns the player index for gamepad, or -1 if it's not available.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_SetGamepadPlayerIndex
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetGamepadPlayerIndex(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadPlayerIndex(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadPlayerIndexLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadPlayerIndex');
  return sdlGetGamepadPlayerIndexLookupFunction(gamepad);
}

///
/// Set the player index of an opened gamepad.
///
/// \param gamepad the gamepad object to adjust.
/// \param player_index player index to assign to this gamepad, or -1 to clear
/// the player index and turn off player LEDs.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadPlayerIndex
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGamepadPlayerIndex(SDL_Gamepad *gamepad, int player_index)
/// ```
bool sdlSetGamepadPlayerIndex(Pointer<SdlGamepad> gamepad, int playerIndex) {
  final sdlSetGamepadPlayerIndexLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Int32 playerIndex),
      int Function(Pointer<SdlGamepad> gamepad,
          int playerIndex)>('SDL_SetGamepadPlayerIndex');
  return sdlSetGamepadPlayerIndexLookupFunction(gamepad, playerIndex) == 1;
}

///
/// Get the USB vendor ID of an opened gamepad, if available.
///
/// If the vendor ID isn't available this function returns 0.
///
/// \param gamepad the gamepad object to query.
/// \returns the USB vendor ID, or zero if unavailable.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadVendorForID
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetGamepadVendor(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadVendor(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadVendorLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadVendor');
  return sdlGetGamepadVendorLookupFunction(gamepad);
}

///
/// Get the USB product ID of an opened gamepad, if available.
///
/// If the product ID isn't available this function returns 0.
///
/// \param gamepad the gamepad object to query.
/// \returns the USB product ID, or zero if unavailable.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadProductForID
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetGamepadProduct(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadProduct(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadProductLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadProduct');
  return sdlGetGamepadProductLookupFunction(gamepad);
}

///
/// Get the product version of an opened gamepad, if available.
///
/// If the product version isn't available this function returns 0.
///
/// \param gamepad the gamepad object to query.
/// \returns the USB product version, or zero if unavailable.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadProductVersionForID
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetGamepadProductVersion(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadProductVersion(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadProductVersionLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Pointer<SdlGamepad> gamepad),
      int Function(
          Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadProductVersion');
  return sdlGetGamepadProductVersionLookupFunction(gamepad);
}

///
/// Get the firmware version of an opened gamepad, if available.
///
/// If the firmware version isn't available this function returns 0.
///
/// \param gamepad the gamepad object to query.
/// \returns the gamepad firmware version, or zero if unavailable.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC Uint16 SDLCALL SDL_GetGamepadFirmwareVersion(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadFirmwareVersion(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadFirmwareVersionLookupFunction = libSdl3.lookupFunction<
      Uint16 Function(Pointer<SdlGamepad> gamepad),
      int Function(
          Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadFirmwareVersion');
  return sdlGetGamepadFirmwareVersionLookupFunction(gamepad);
}

///
/// Get the serial number of an opened gamepad, if available.
///
/// Returns the serial number of the gamepad, or NULL if it is not available.
///
/// \param gamepad the gamepad object to query.
/// \returns the serial number, or NULL if unavailable.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadSerial(SDL_Gamepad *gamepad)
/// ```
String? sdlGetGamepadSerial(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadSerialLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Pointer<SdlGamepad> gamepad),
      Pointer<Utf8> Function(
          Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadSerial');
  final result = sdlGetGamepadSerialLookupFunction(gamepad);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the Steam Input handle of an opened gamepad, if available.
///
/// Returns an InputHandle_t for the gamepad that can be used with Steam Input
/// API: https://partner.steamgames.com/doc/api/ISteamInput
///
/// \param gamepad the gamepad object to query.
/// \returns the gamepad handle, or 0 if unavailable.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC Uint64 SDLCALL SDL_GetGamepadSteamHandle(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadSteamHandle(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadSteamHandleLookupFunction = libSdl3.lookupFunction<
      Uint64 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadSteamHandle');
  return sdlGetGamepadSteamHandleLookupFunction(gamepad);
}

///
/// Get the connection state of a gamepad.
///
/// \param gamepad the gamepad object to query.
/// \returns the connection state on success or
/// `SDL_JOYSTICK_CONNECTION_INVALID` on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_JoystickConnectionState SDLCALL SDL_GetGamepadConnectionState(SDL_Gamepad *gamepad)
/// ```
int sdlGetGamepadConnectionState(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadConnectionStateLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGamepad> gamepad),
      int Function(
          Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadConnectionState');
  return sdlGetGamepadConnectionStateLookupFunction(gamepad);
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
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_PowerState SDLCALL SDL_GetGamepadPowerInfo(SDL_Gamepad *gamepad, int *percent)
/// ```
int sdlGetGamepadPowerInfo(
    Pointer<SdlGamepad> gamepad, Pointer<Int32> percent) {
  final sdlGetGamepadPowerInfoLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGamepad> gamepad, Pointer<Int32> percent),
      int Function(Pointer<SdlGamepad> gamepad,
          Pointer<Int32> percent)>('SDL_GetGamepadPowerInfo');
  return sdlGetGamepadPowerInfoLookupFunction(gamepad, percent);
}

///
/// Check if a gamepad has been opened and is currently connected.
///
/// \param gamepad a gamepad identifier previously returned by
/// SDL_OpenGamepad().
/// \returns true if the gamepad has been opened and is currently connected, or
/// false if not.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GamepadConnected(SDL_Gamepad *gamepad)
/// ```
bool sdlGamepadConnected(Pointer<SdlGamepad> gamepad) {
  final sdlGamepadConnectedLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GamepadConnected');
  return sdlGamepadConnectedLookupFunction(gamepad) == 1;
}

///
/// Get the underlying joystick from a gamepad.
///
/// This function will give you a SDL_Joystick object, which allows you to use
/// the SDL_Joystick functions with a SDL_Gamepad object. This would be useful
/// for getting a joystick's position at any given time, even if it hasn't
/// moved (moving it would produce an event, which would have the axis' value).
///
/// The pointer returned is owned by the SDL_Gamepad. You should not call
/// SDL_CloseJoystick() on it, for example, since doing so will likely cause
/// SDL to crash.
///
/// \param gamepad the gamepad object that you want to get a joystick from.
/// \returns an SDL_Joystick object, or NULL on failure; call SDL_GetError()
/// for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Joystick * SDLCALL SDL_GetGamepadJoystick(SDL_Gamepad *gamepad)
/// ```
Pointer<SdlJoystick> sdlGetGamepadJoystick(Pointer<SdlGamepad> gamepad) {
  final sdlGetGamepadJoystickLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlJoystick> Function(Pointer<SdlGamepad> gamepad),
      Pointer<SdlJoystick> Function(
          Pointer<SdlGamepad> gamepad)>('SDL_GetGamepadJoystick');
  return sdlGetGamepadJoystickLookupFunction(gamepad);
}

///
/// Set the state of gamepad event processing.
///
/// If gamepad events are disabled, you must call SDL_UpdateGamepads() yourself
/// and check the state of the gamepad when you want gamepad information.
///
/// \param enabled whether to process gamepad events or not.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GamepadEventsEnabled
/// \sa SDL_UpdateGamepads
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_SetGamepadEventsEnabled(bool enabled)
/// ```
void sdlSetGamepadEventsEnabled(bool enabled) {
  final sdlSetGamepadEventsEnabledLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint8 enabled),
      void Function(int enabled)>('SDL_SetGamepadEventsEnabled');
  return sdlSetGamepadEventsEnabledLookupFunction(enabled ? 1 : 0);
}

///
/// Query the state of gamepad event processing.
///
/// If gamepad events are disabled, you must call SDL_UpdateGamepads() yourself
/// and check the state of the gamepad when you want gamepad information.
///
/// \returns true if gamepad events are being processed, false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_SetGamepadEventsEnabled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GamepadEventsEnabled(void)
/// ```
bool sdlGamepadEventsEnabled() {
  final sdlGamepadEventsEnabledLookupFunction =
      libSdl3.lookupFunction<Uint8 Function(), int Function()>(
          'SDL_GamepadEventsEnabled');
  return sdlGamepadEventsEnabledLookupFunction() == 1;
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
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadBinding ** SDLCALL SDL_GetGamepadBindings(SDL_Gamepad *gamepad, int *count)
/// ```
Pointer<Pointer<SdlGamepadBinding>> sdlGetGamepadBindings(
    Pointer<SdlGamepad> gamepad, Pointer<Int32> count) {
  final sdlGetGamepadBindingsLookupFunction = libSdl3.lookupFunction<
      Pointer<Pointer<SdlGamepadBinding>> Function(
          Pointer<SdlGamepad> gamepad, Pointer<Int32> count),
      Pointer<Pointer<SdlGamepadBinding>> Function(Pointer<SdlGamepad> gamepad,
          Pointer<Int32> count)>('SDL_GetGamepadBindings');
  return sdlGetGamepadBindingsLookupFunction(gamepad, count);
}

///
/// Manually pump gamepad updates if not using the loop.
///
/// This function is called automatically by the event loop if events are
/// enabled. Under such circumstances, it will not be necessary to call this
/// function.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UpdateGamepads(void)
/// ```
void sdlUpdateGamepads() {
  final sdlUpdateGamepadsLookupFunction = libSdl3
      .lookupFunction<Void Function(), void Function()>('SDL_UpdateGamepads');
  return sdlUpdateGamepadsLookupFunction();
}

///
/// Convert a string into SDL_GamepadType enum.
///
/// This function is called internally to translate SDL_Gamepad mapping strings
/// for the underlying joystick device into the consistent SDL_Gamepad mapping.
/// You do not normally need to call this function unless you are parsing
/// SDL_Gamepad mappings in your own code.
///
/// \param str string representing a SDL_GamepadType type.
/// \returns the SDL_GamepadType enum corresponding to the input string, or
/// `SDL_GAMEPAD_TYPE_UNKNOWN` if no match was found.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadStringForType
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadType SDLCALL SDL_GetGamepadTypeFromString(const char *str)
/// ```
int sdlGetGamepadTypeFromString(String? str) {
  final sdlGetGamepadTypeFromStringLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str),
      int Function(Pointer<Utf8> str)>('SDL_GetGamepadTypeFromString');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlGetGamepadTypeFromStringLookupFunction(strPointer);
  calloc.free(strPointer);
  return result;
}

///
/// Convert from an SDL_GamepadType enum to a string.
///
/// \param type an enum value for a given SDL_GamepadType.
/// \returns a string for the given type, or NULL if an invalid type is
/// specified. The string returned is of the format used by
/// SDL_Gamepad mapping strings.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadTypeFromString
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadStringForType(SDL_GamepadType type)
/// ```
String? sdlGetGamepadStringForType(int type) {
  final sdlGetGamepadStringForTypeLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 type),
      Pointer<Utf8> Function(int type)>('SDL_GetGamepadStringForType');
  final result = sdlGetGamepadStringForTypeLookupFunction(type);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Convert a string into SDL_GamepadAxis enum.
///
/// This function is called internally to translate SDL_Gamepad mapping strings
/// for the underlying joystick device into the consistent SDL_Gamepad mapping.
/// You do not normally need to call this function unless you are parsing
/// SDL_Gamepad mappings in your own code.
///
/// Note specially that "righttrigger" and "lefttrigger" map to
/// `SDL_GAMEPAD_AXIS_RIGHT_TRIGGER` and `SDL_GAMEPAD_AXIS_LEFT_TRIGGER`,
/// respectively.
///
/// \param str string representing a SDL_Gamepad axis.
/// \returns the SDL_GamepadAxis enum corresponding to the input string, or
/// `SDL_GAMEPAD_AXIS_INVALID` if no match was found.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadStringForAxis
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadAxis SDLCALL SDL_GetGamepadAxisFromString(const char *str)
/// ```
int sdlGetGamepadAxisFromString(String? str) {
  final sdlGetGamepadAxisFromStringLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str),
      int Function(Pointer<Utf8> str)>('SDL_GetGamepadAxisFromString');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlGetGamepadAxisFromStringLookupFunction(strPointer);
  calloc.free(strPointer);
  return result;
}

///
/// Convert from an SDL_GamepadAxis enum to a string.
///
/// \param axis an enum value for a given SDL_GamepadAxis.
/// \returns a string for the given axis, or NULL if an invalid axis is
/// specified. The string returned is of the format used by
/// SDL_Gamepad mapping strings.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadAxisFromString
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadStringForAxis(SDL_GamepadAxis axis)
/// ```
String? sdlGetGamepadStringForAxis(int axis) {
  final sdlGetGamepadStringForAxisLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 axis),
      Pointer<Utf8> Function(int axis)>('SDL_GetGamepadStringForAxis');
  final result = sdlGetGamepadStringForAxisLookupFunction(axis);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Query whether a gamepad has a given axis.
///
/// This merely reports whether the gamepad's mapping defined this axis, as
/// that is all the information SDL has about the physical device.
///
/// \param gamepad a gamepad.
/// \param axis an axis enum value (an SDL_GamepadAxis value).
/// \returns true if the gamepad has this axis, false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GamepadHasButton
/// \sa SDL_GetGamepadAxis
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GamepadHasAxis(SDL_Gamepad *gamepad, SDL_GamepadAxis axis)
/// ```
bool sdlGamepadHasAxis(Pointer<SdlGamepad> gamepad, int axis) {
  final sdlGamepadHasAxisLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Int32 axis),
      int Function(
          Pointer<SdlGamepad> gamepad, int axis)>('SDL_GamepadHasAxis');
  return sdlGamepadHasAxisLookupFunction(gamepad, axis) == 1;
}

///
/// Get the current state of an axis control on a gamepad.
///
/// The axis indices start at index 0.
///
/// For thumbsticks, the state is a value ranging from -32768 (up/left) to
/// 32767 (down/right).
///
/// Triggers range from 0 when released to 32767 when fully pressed, and never
/// return a negative value. Note that this differs from the value reported by
/// the lower-level SDL_GetJoystickAxis(), which normally uses the full range.
///
/// \param gamepad a gamepad.
/// \param axis an axis index (one of the SDL_GamepadAxis values).
/// \returns axis state (including 0) on success or 0 (also) on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GamepadHasAxis
/// \sa SDL_GetGamepadButton
///
/// ```c
/// extern SDL_DECLSPEC Sint16 SDLCALL SDL_GetGamepadAxis(SDL_Gamepad *gamepad, SDL_GamepadAxis axis)
/// ```
int sdlGetGamepadAxis(Pointer<SdlGamepad> gamepad, int axis) {
  final sdlGetGamepadAxisLookupFunction = libSdl3.lookupFunction<
      Int16 Function(Pointer<SdlGamepad> gamepad, Int32 axis),
      int Function(
          Pointer<SdlGamepad> gamepad, int axis)>('SDL_GetGamepadAxis');
  return sdlGetGamepadAxisLookupFunction(gamepad, axis);
}

///
/// Convert a string into an SDL_GamepadButton enum.
///
/// This function is called internally to translate SDL_Gamepad mapping strings
/// for the underlying joystick device into the consistent SDL_Gamepad mapping.
/// You do not normally need to call this function unless you are parsing
/// SDL_Gamepad mappings in your own code.
///
/// \param str string representing a SDL_Gamepad axis.
/// \returns the SDL_GamepadButton enum corresponding to the input string, or
/// `SDL_GAMEPAD_BUTTON_INVALID` if no match was found.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadStringForButton
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadButton SDLCALL SDL_GetGamepadButtonFromString(const char *str)
/// ```
int sdlGetGamepadButtonFromString(String? str) {
  final sdlGetGamepadButtonFromStringLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> str),
      int Function(Pointer<Utf8> str)>('SDL_GetGamepadButtonFromString');
  final strPointer = str != null ? str.toNativeUtf8() : nullptr;
  final result = sdlGetGamepadButtonFromStringLookupFunction(strPointer);
  calloc.free(strPointer);
  return result;
}

///
/// Convert from an SDL_GamepadButton enum to a string.
///
/// \param button an enum value for a given SDL_GamepadButton.
/// \returns a string for the given button, or NULL if an invalid button is
/// specified. The string returned is of the format used by
/// SDL_Gamepad mapping strings.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadButtonFromString
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadStringForButton(SDL_GamepadButton button)
/// ```
String? sdlGetGamepadStringForButton(int button) {
  final sdlGetGamepadStringForButtonLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 button),
      Pointer<Utf8> Function(int button)>('SDL_GetGamepadStringForButton');
  final result = sdlGetGamepadStringForButtonLookupFunction(button);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Query whether a gamepad has a given button.
///
/// This merely reports whether the gamepad's mapping defined this button, as
/// that is all the information SDL has about the physical device.
///
/// \param gamepad a gamepad.
/// \param button a button enum value (an SDL_GamepadButton value).
/// \returns true if the gamepad has this button, false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GamepadHasAxis
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GamepadHasButton(SDL_Gamepad *gamepad, SDL_GamepadButton button)
/// ```
bool sdlGamepadHasButton(Pointer<SdlGamepad> gamepad, int button) {
  final sdlGamepadHasButtonLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Int32 button),
      int Function(
          Pointer<SdlGamepad> gamepad, int button)>('SDL_GamepadHasButton');
  return sdlGamepadHasButtonLookupFunction(gamepad, button) == 1;
}

///
/// Get the current state of a button on a gamepad.
///
/// \param gamepad a gamepad.
/// \param button a button index (one of the SDL_GamepadButton values).
/// \returns true if the button is pressed, false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GamepadHasButton
/// \sa SDL_GetGamepadAxis
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetGamepadButton(SDL_Gamepad *gamepad, SDL_GamepadButton button)
/// ```
bool sdlGetGamepadButton(Pointer<SdlGamepad> gamepad, int button) {
  final sdlGetGamepadButtonLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Int32 button),
      int Function(
          Pointer<SdlGamepad> gamepad, int button)>('SDL_GetGamepadButton');
  return sdlGetGamepadButtonLookupFunction(gamepad, button) == 1;
}

///
/// Get the label of a button on a gamepad.
///
/// \param type the type of gamepad to check.
/// \param button a button index (one of the SDL_GamepadButton values).
/// \returns the SDL_GamepadButtonLabel enum corresponding to the button label.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadButtonLabel
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadButtonLabel SDLCALL SDL_GetGamepadButtonLabelForType(SDL_GamepadType type, SDL_GamepadButton button)
/// ```
int sdlGetGamepadButtonLabelForType(int type, int button) {
  final sdlGetGamepadButtonLabelForTypeLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Int32 type, Int32 button),
      int Function(int type, int button)>('SDL_GetGamepadButtonLabelForType');
  return sdlGetGamepadButtonLabelForTypeLookupFunction(type, button);
}

///
/// Get the label of a button on a gamepad.
///
/// \param gamepad a gamepad.
/// \param button a button index (one of the SDL_GamepadButton values).
/// \returns the SDL_GamepadButtonLabel enum corresponding to the button label.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadButtonLabelForType
///
/// ```c
/// extern SDL_DECLSPEC SDL_GamepadButtonLabel SDLCALL SDL_GetGamepadButtonLabel(SDL_Gamepad *gamepad, SDL_GamepadButton button)
/// ```
int sdlGetGamepadButtonLabel(Pointer<SdlGamepad> gamepad, int button) {
  final sdlGetGamepadButtonLabelLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGamepad> gamepad, Int32 button),
      int Function(Pointer<SdlGamepad> gamepad,
          int button)>('SDL_GetGamepadButtonLabel');
  return sdlGetGamepadButtonLabelLookupFunction(gamepad, button);
}

///
/// Get the number of touchpads on a gamepad.
///
/// \param gamepad a gamepad.
/// \returns number of touchpads.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetNumGamepadTouchpadFingers
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumGamepadTouchpads(SDL_Gamepad *gamepad)
/// ```
int sdlGetNumGamepadTouchpads(Pointer<SdlGamepad> gamepad) {
  final sdlGetNumGamepadTouchpadsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGamepad> gamepad),
      int Function(Pointer<SdlGamepad> gamepad)>('SDL_GetNumGamepadTouchpads');
  return sdlGetNumGamepadTouchpadsLookupFunction(gamepad);
}

///
/// Get the number of supported simultaneous fingers on a touchpad on a game
/// gamepad.
///
/// \param gamepad a gamepad.
/// \param touchpad a touchpad.
/// \returns number of supported simultaneous fingers.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadTouchpadFinger
/// \sa SDL_GetNumGamepadTouchpads
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumGamepadTouchpadFingers(SDL_Gamepad *gamepad, int touchpad)
/// ```
int sdlGetNumGamepadTouchpadFingers(Pointer<SdlGamepad> gamepad, int touchpad) {
  final sdlGetNumGamepadTouchpadFingersLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlGamepad> gamepad, Int32 touchpad),
      int Function(Pointer<SdlGamepad> gamepad,
          int touchpad)>('SDL_GetNumGamepadTouchpadFingers');
  return sdlGetNumGamepadTouchpadFingersLookupFunction(gamepad, touchpad);
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
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetNumGamepadTouchpadFingers
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetGamepadTouchpadFinger(SDL_Gamepad *gamepad, int touchpad, int finger, bool *down, float *x, float *y, float *pressure)
/// ```
bool sdlGetGamepadTouchpadFinger(
    Pointer<SdlGamepad> gamepad,
    int touchpad,
    int finger,
    Pointer<Uint8> down,
    Pointer<Float> x,
    Pointer<Float> y,
    Pointer<Float> pressure) {
  final sdlGetGamepadTouchpadFingerLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlGamepad> gamepad,
          Int32 touchpad,
          Int32 finger,
          Pointer<Uint8> down,
          Pointer<Float> x,
          Pointer<Float> y,
          Pointer<Float> pressure),
      int Function(
          Pointer<SdlGamepad> gamepad,
          int touchpad,
          int finger,
          Pointer<Uint8> down,
          Pointer<Float> x,
          Pointer<Float> y,
          Pointer<Float> pressure)>('SDL_GetGamepadTouchpadFinger');
  return sdlGetGamepadTouchpadFingerLookupFunction(
          gamepad, touchpad, finger, down, x, y, pressure) ==
      1;
}

///
/// Return whether a gamepad has a particular sensor.
///
/// \param gamepad the gamepad to query.
/// \param type the type of sensor to query.
/// \returns true if the sensor exists, false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadSensorData
/// \sa SDL_GetGamepadSensorDataRate
/// \sa SDL_SetGamepadSensorEnabled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GamepadHasSensor(SDL_Gamepad *gamepad, SDL_SensorType type)
/// ```
bool sdlGamepadHasSensor(Pointer<SdlGamepad> gamepad, int type) {
  final sdlGamepadHasSensorLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Int32 type),
      int Function(
          Pointer<SdlGamepad> gamepad, int type)>('SDL_GamepadHasSensor');
  return sdlGamepadHasSensorLookupFunction(gamepad, type) == 1;
}

///
/// Set whether data reporting for a gamepad sensor is enabled.
///
/// \param gamepad the gamepad to update.
/// \param type the type of sensor to enable/disable.
/// \param enabled whether data reporting should be enabled.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GamepadHasSensor
/// \sa SDL_GamepadSensorEnabled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGamepadSensorEnabled(SDL_Gamepad *gamepad, SDL_SensorType type, bool enabled)
/// ```
bool sdlSetGamepadSensorEnabled(
    Pointer<SdlGamepad> gamepad, int type, bool enabled) {
  final sdlSetGamepadSensorEnabledLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Int32 type, Uint8 enabled),
      int Function(Pointer<SdlGamepad> gamepad, int type,
          int enabled)>('SDL_SetGamepadSensorEnabled');
  return sdlSetGamepadSensorEnabledLookupFunction(
          gamepad, type, enabled ? 1 : 0) ==
      1;
}

///
/// Query whether sensor data reporting is enabled for a gamepad.
///
/// \param gamepad the gamepad to query.
/// \param type the type of sensor to query.
/// \returns true if the sensor is enabled, false otherwise.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_SetGamepadSensorEnabled
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GamepadSensorEnabled(SDL_Gamepad *gamepad, SDL_SensorType type)
/// ```
bool sdlGamepadSensorEnabled(Pointer<SdlGamepad> gamepad, int type) {
  final sdlGamepadSensorEnabledLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Int32 type),
      int Function(
          Pointer<SdlGamepad> gamepad, int type)>('SDL_GamepadSensorEnabled');
  return sdlGamepadSensorEnabledLookupFunction(gamepad, type) == 1;
}

///
/// Get the data rate (number of events per second) of a gamepad sensor.
///
/// \param gamepad the gamepad to query.
/// \param type the type of sensor to query.
/// \returns the data rate, or 0.0f if the data rate is not available.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC float SDLCALL SDL_GetGamepadSensorDataRate(SDL_Gamepad *gamepad, SDL_SensorType type)
/// ```
double sdlGetGamepadSensorDataRate(Pointer<SdlGamepad> gamepad, int type) {
  final sdlGetGamepadSensorDataRateLookupFunction = libSdl3.lookupFunction<
      Float Function(Pointer<SdlGamepad> gamepad, Int32 type),
      double Function(Pointer<SdlGamepad> gamepad,
          int type)>('SDL_GetGamepadSensorDataRate');
  return sdlGetGamepadSensorDataRateLookupFunction(gamepad, type);
}

///
/// Get the current state of a gamepad sensor.
///
/// The number of values and interpretation of the data is sensor dependent.
/// See SDL_sensor.h for the details for each type of sensor.
///
/// \param gamepad the gamepad to query.
/// \param type the type of sensor to query.
/// \param data a pointer filled with the current sensor state.
/// \param num_values the number of values to write to data.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetGamepadSensorData(SDL_Gamepad *gamepad, SDL_SensorType type, float *data, int num_values)
/// ```
bool sdlGetGamepadSensorData(
    Pointer<SdlGamepad> gamepad, int type, Pointer<Float> data, int numValues) {
  final sdlGetGamepadSensorDataLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Int32 type,
          Pointer<Float> data, Int32 numValues),
      int Function(Pointer<SdlGamepad> gamepad, int type, Pointer<Float> data,
          int numValues)>('SDL_GetGamepadSensorData');
  return sdlGetGamepadSensorDataLookupFunction(
          gamepad, type, data, numValues) ==
      1;
}

///
/// Start a rumble effect on a gamepad.
///
/// Each call to this function cancels any previous rumble effect, and calling
/// it with 0 intensity stops any rumbling.
///
/// This function requires you to process SDL events or call
/// SDL_UpdateJoysticks() to update rumble state.
///
/// \param gamepad the gamepad to vibrate.
/// \param low_frequency_rumble the intensity of the low frequency (left)
/// rumble motor, from 0 to 0xFFFF.
/// \param high_frequency_rumble the intensity of the high frequency (right)
/// rumble motor, from 0 to 0xFFFF.
/// \param duration_ms the duration of the rumble effect, in milliseconds.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RumbleGamepad(SDL_Gamepad *gamepad, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms)
/// ```
bool sdlRumbleGamepad(Pointer<SdlGamepad> gamepad, int lowFrequencyRumble,
    int highFrequencyRumble, int durationMs) {
  final sdlRumbleGamepadLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Uint16 lowFrequencyRumble,
          Uint16 highFrequencyRumble, Uint32 durationMs),
      int Function(Pointer<SdlGamepad> gamepad, int lowFrequencyRumble,
          int highFrequencyRumble, int durationMs)>('SDL_RumbleGamepad');
  return sdlRumbleGamepadLookupFunction(
          gamepad, lowFrequencyRumble, highFrequencyRumble, durationMs) ==
      1;
}

///
/// Start a rumble effect in the gamepad's triggers.
///
/// Each call to this function cancels any previous trigger rumble effect, and
/// calling it with 0 intensity stops any rumbling.
///
/// Note that this is rumbling of the _triggers_ and not the gamepad as a
/// whole. This is currently only supported on Xbox One gamepads. If you want
/// the (more common) whole-gamepad rumble, use SDL_RumbleGamepad() instead.
///
/// This function requires you to process SDL events or call
/// SDL_UpdateJoysticks() to update rumble state.
///
/// \param gamepad the gamepad to vibrate.
/// \param left_rumble the intensity of the left trigger rumble motor, from 0
/// to 0xFFFF.
/// \param right_rumble the intensity of the right trigger rumble motor, from 0
/// to 0xFFFF.
/// \param duration_ms the duration of the rumble effect, in milliseconds.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_RumbleGamepad
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RumbleGamepadTriggers(SDL_Gamepad *gamepad, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms)
/// ```
bool sdlRumbleGamepadTriggers(Pointer<SdlGamepad> gamepad, int leftRumble,
    int rightRumble, int durationMs) {
  final sdlRumbleGamepadTriggersLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(Pointer<SdlGamepad> gamepad, Uint16 leftRumble,
          Uint16 rightRumble, Uint32 durationMs),
      int Function(Pointer<SdlGamepad> gamepad, int leftRumble, int rightRumble,
          int durationMs)>('SDL_RumbleGamepadTriggers');
  return sdlRumbleGamepadTriggersLookupFunction(
          gamepad, leftRumble, rightRumble, durationMs) ==
      1;
}

///
/// Update a gamepad's LED color.
///
/// An example of a joystick LED is the light on the back of a PlayStation 4's
/// DualShock 4 controller.
///
/// For gamepads with a single color LED, the maximum of the RGB values will be
/// used as the LED brightness.
///
/// \param gamepad the gamepad to update.
/// \param red the intensity of the red LED.
/// \param green the intensity of the green LED.
/// \param blue the intensity of the blue LED.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetGamepadLED(SDL_Gamepad *gamepad, Uint8 red, Uint8 green, Uint8 blue)
/// ```
bool sdlSetGamepadLed(
    Pointer<SdlGamepad> gamepad, int red, int green, int blue) {
  final sdlSetGamepadLedLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlGamepad> gamepad, Uint8 red, Uint8 green, Uint8 blue),
      int Function(Pointer<SdlGamepad> gamepad, int red, int green,
          int blue)>('SDL_SetGamepadLED');
  return sdlSetGamepadLedLookupFunction(gamepad, red, green, blue) == 1;
}

///
/// Send a gamepad specific effect packet.
///
/// \param gamepad the gamepad to affect.
/// \param data the data to send to the gamepad.
/// \param size the size of the data to send to the gamepad.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.1.3.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SendGamepadEffect(SDL_Gamepad *gamepad, const void *data, int size)
/// ```
bool sdlSendGamepadEffect(
    Pointer<SdlGamepad> gamepad, Pointer<NativeType> data, int size) {
  final sdlSendGamepadEffectLookupFunction = libSdl3.lookupFunction<
      Uint8 Function(
          Pointer<SdlGamepad> gamepad, Pointer<NativeType> data, Int32 size),
      int Function(Pointer<SdlGamepad> gamepad, Pointer<NativeType> data,
          int size)>('SDL_SendGamepadEffect');
  return sdlSendGamepadEffectLookupFunction(gamepad, data, size) == 1;
}

///
/// Close a gamepad previously opened with SDL_OpenGamepad().
///
/// \param gamepad a gamepad identifier previously returned by
/// SDL_OpenGamepad().
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_OpenGamepad
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CloseGamepad(SDL_Gamepad *gamepad)
/// ```
void sdlCloseGamepad(Pointer<SdlGamepad> gamepad) {
  final sdlCloseGamepadLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlGamepad> gamepad),
      void Function(Pointer<SdlGamepad> gamepad)>('SDL_CloseGamepad');
  return sdlCloseGamepadLookupFunction(gamepad);
}

///
/// Return the sfSymbolsName for a given button on a gamepad on Apple
/// platforms.
///
/// \param gamepad the gamepad to query.
/// \param button a button on the gamepad.
/// \returns the sfSymbolsName or NULL if the name can't be found.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadAppleSFSymbolsNameForAxis
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadAppleSFSymbolsNameForButton(SDL_Gamepad *gamepad, SDL_GamepadButton button)
/// ```
String? sdlGetGamepadAppleSfSymbolsNameForButton(
    Pointer<SdlGamepad> gamepad, int button) {
  final sdlGetGamepadAppleSfSymbolsNameForButtonLookupFunction =
      libSdl3.lookupFunction<
          Pointer<Utf8> Function(Pointer<SdlGamepad> gamepad, Int32 button),
          Pointer<Utf8> Function(Pointer<SdlGamepad> gamepad,
              int button)>('SDL_GetGamepadAppleSFSymbolsNameForButton');
  final result =
      sdlGetGamepadAppleSfSymbolsNameForButtonLookupFunction(gamepad, button);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Return the sfSymbolsName for a given axis on a gamepad on Apple platforms.
///
/// \param gamepad the gamepad to query.
/// \param axis an axis on the gamepad.
/// \returns the sfSymbolsName or NULL if the name can't be found.
///
/// \since This function is available since SDL 3.1.3.
///
/// \sa SDL_GetGamepadAppleSFSymbolsNameForButton
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetGamepadAppleSFSymbolsNameForAxis(SDL_Gamepad *gamepad, SDL_GamepadAxis axis)
/// ```
String? sdlGetGamepadAppleSfSymbolsNameForAxis(
    Pointer<SdlGamepad> gamepad, int axis) {
  final sdlGetGamepadAppleSfSymbolsNameForAxisLookupFunction =
      libSdl3.lookupFunction<
          Pointer<Utf8> Function(Pointer<SdlGamepad> gamepad, Int32 axis),
          Pointer<Utf8> Function(Pointer<SdlGamepad> gamepad,
              int axis)>('SDL_GetGamepadAppleSFSymbolsNameForAxis');
  final result =
      sdlGetGamepadAppleSfSymbolsNameForAxisLookupFunction(gamepad, axis);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}
