import 'dart:ffi';

import '../../generated/lib_sdl_gamepad.dart';
import '../../generated/struct_sdl.dart';

extension SdlGamepadEx on SdlGamepad {
  // lib_sdl_gamepad.dart

  ///
  /// Add support for gamepads that SDL is unaware of or change the binding of an
  /// existing gamepad.
  ///
  /// The mapping string has the format "GUID,name,mapping", where GUID is the
  /// string value from SDL_GetJoystickGUIDString(), name is the human readable
  /// string for the device and mappings are gamepad mappings to joystick ones.
  /// Under Windows there is a reserved GUID of "xinput" that covers all XInput
  /// devices. The mapping format for joystick is:
  ///
  /// - `bX`: a joystick button, index X
  /// - `hX.Y`: hat X with value Y
  /// - `aX`: axis X of the joystick
  ///
  /// Buttons can be used as a gamepad axes and vice versa.
  ///
  /// This string shows an example of a valid mapping for a gamepad:
  ///
  /// ```c
  /// "341a3608000000000000504944564944,Afterglow PS3 Controller,a:b1,b:b2,y:b3,x:b0,start:b9,guide:b12,back:b8,dpup:h0.1,dpleft:h0.8,dpdown:h0.4,dpright:h0.2,leftshoulder:b4,rightshoulder:b5,leftstick:b10,rightstick:b11,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b6,righttrigger:b7"
  /// ```
  ///
  /// \param mapping the mapping string
  /// \returns 1 if a new mapping is added, 0 if an existing mapping is updated,
  /// -1 on error; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadMapping
  /// \sa SDL_GetGamepadMappingForGUID
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_AddGamepadMapping(const char *mapping)
  /// ```
  static int addMapping(String? mappingString) {
    return sdlAddGamepadMapping(mappingString);
  }

  ///
  /// Load a set of gamepad mappings from a seekable SDL data stream.
  ///
  /// You can call this function several times, if needed, to load different
  /// database files.
  ///
  /// If a new mapping is loaded for an already known gamepad GUID, the later
  /// version will overwrite the one currently loaded.
  ///
  /// Mappings not belonging to the current platform or with no platform field
  /// specified will be ignored (i.e. mappings for Linux will be ignored in
  /// Windows, etc).
  ///
  /// This function will load the text database entirely in memory before
  /// processing it, so take this into consideration if you are in a memory
  /// constrained environment.
  ///
  /// \param src the data stream for the mappings to be added
  /// \param freesrc if SDL_TRUE, calls SDL_RWclose() on `src` before returning,
  /// even in the case of an error
  /// \returns the number of mappings added or -1 on error; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_AddGamepadMapping
  /// \sa SDL_AddGamepadMappingsFromFile
  /// \sa SDL_GetGamepadMappingForGUID
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_AddGamepadMappingsFromIO(SDL_RWops *src, SDL_bool freesrc)
  /// ```
  static int addMappingsFromIo(Pointer<SdlIoStream> src, bool freerw) {
    return sdlAddGamepadMappingsFromIo(src, freerw);
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
  /// Mappings not belonging to the current platform or with no platform field
  /// specified will be ignored (i.e. mappings for Linux will be ignored in
  /// Windows, etc).
  ///
  /// \param file the mappings file to load
  /// \returns the number of mappings added or -1 on error; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_AddGamepadMapping
  /// \sa SDL_AddGamepadMappingsFromRW
  /// \sa SDL_GetGamepadMappingForGUID
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_AddGamepadMappingsFromFile(const char *file)
  /// ```
  static int addMappingFromFile(String? file) {
    return sdlAddGamepadMappingsFromFile(file);
  }

  ///
  /// Reinitialize the SDL mapping database to its initial state.
  ///
  /// This will generate gamepad events as needed if device mappings change.
  ///
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_ReloadGamepadMappings(void)
  /// ```
  static int reloadMappings() {
    return sdlReloadGamepadMappings();
  }

  ///
  /// Get the mapping at a particular index.
  ///
  /// You must free the returned pointer with SDL_free() when you are done with
  /// it, but you do _not_ free each string in the array.
  ///
  /// \param count a pointer filled in with the number of mappings returned, can
  /// be NULL.
  /// \returns an array of the mapping strings, NULL-terminated. Must be freed
  /// with SDL_free(). Returns NULL on error.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC char ** SDLCALL SDL_GetGamepadMappings(int *count)
  /// ```
  static Pointer<Pointer<Int8>> getMappings(Pointer<Int32> count) {
    return sdlGetGamepadMappings(count);
  }

  ///
  /// Get the gamepad mapping string for a given GUID.
  ///
  /// The returned string must be freed with SDL_free().
  ///
  /// \param guid a structure containing the GUID for which a mapping is desired
  /// \returns a mapping string or NULL on error; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetJoystickInstanceGUID
  /// \sa SDL_GetJoystickGUID
  ///
  /// ```c
  /// extern DECLSPEC char * SDLCALL SDL_GetGamepadMappingForGUID(SDL_JoystickGUID guid)
  /// ```
  static Pointer<Int8> getMappingForGuid(SdlGuid guid) {
    // 143
    return sdlGetGamepadMappingForGuid(guid);
  }

  ///
  /// Set the current mapping of a joystick or gamepad.
  ///
  /// Details about mappings are discussed with SDL_AddGamepadMapping().
  ///
  /// \param instance_id the joystick instance ID
  /// \param mapping the mapping to use for this device, or NULL to clear the
  /// mapping
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_AddGamepadMapping
  /// \sa SDL_GetGamepadMapping
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetGamepadMapping(SDL_JoystickID instance_id, const char *mapping)
  /// ```
  static int setMapping(int instanceId, String? mapping) {
    return sdlSetGamepadMapping(instanceId, mapping);
  }

  ///
  /// Get a list of currently connected gamepads.
  ///
  /// \param count a pointer filled in with the number of gamepads returned
  /// \returns a 0 terminated array of joystick instance IDs which should be
  /// freed with SDL_free(), or NULL on error; call SDL_GetError() for
  /// more details.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC SDL_JoystickID *SDLCALL SDL_GetGamepads(int *count)
  /// ```
  static Pointer<Uint32> gets(Pointer<Int32> count) {
    return sdlGetGamepads(count);
  }

  ///
  /// Check if the given joystick is supported by the gamepad interface.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns SDL_TRUE if the given joystick is supported by the gamepad
  /// interface, SDL_FALSE if it isn't or it's an invalid index.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC SDL_bool SDLCALL SDL_IsGamepad(SDL_JoystickID instance_id)
  /// ```
  static bool isGamepad(int instanceId) {
    return sdlIsGamepad(instanceId);
  }

  ///
  /// Get the implementation dependent name of a gamepad.
  ///
  /// This can be called before any gamepads are opened.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the name of the selected gamepad. If no name can be found, this
  /// function returns NULL; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadName
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC const char *SDLCALL SDL_GetGamepadInstanceName(SDL_JoystickID instance_id)
  /// ```
  static String? getInstanceName(int instanceId) {
    return sdlGetGamepadInstanceName(instanceId);
  }

  ///
  /// Get the implementation dependent path of a gamepad.
  ///
  /// This can be called before any gamepads are opened.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the path of the selected gamepad. If no path can be found, this
  /// function returns NULL; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadPath
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC const char *SDLCALL SDL_GetGamepadInstancePath(SDL_JoystickID instance_id)
  /// ```
  static String? getInstancePath(int instanceId) {
    return sdlGetGamepadInstancePath(instanceId);
  }

  ///
  /// Get the player index of a gamepad.
  ///
  /// This can be called before any gamepads are opened.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the player index of a gamepad, or -1 if it's not available
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadPlayerIndex
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetGamepadInstancePlayerIndex(SDL_JoystickID instance_id)
  /// ```
  static int getInstancePlayerIndex(int instanceId) {
    return sdlGetGamepadInstancePlayerIndex(instanceId);
  }

  ///
  /// Get the implementation-dependent GUID of a gamepad.
  ///
  /// This can be called before any gamepads are opened.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the GUID of the selected gamepad. If called on an invalid index,
  /// this function returns a zero GUID
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadGUID
  /// \sa SDL_GetGamepadGUIDString
  ///
  /// ```c
  /// extern DECLSPEC SDL_JoystickGUID SDLCALL SDL_GetGamepadInstanceGUID(SDL_JoystickID instance_id)
  /// ```
  static SdlGuid getInstanceGuid(int instanceId) {
    return sdlGetGamepadInstanceGuid(instanceId);
  }

  ///
  /// Get the USB vendor ID of a gamepad, if available.
  ///
  /// This can be called before any gamepads are opened. If the vendor ID isn't
  /// available this function returns 0.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the USB vendor ID of the selected gamepad. If called on an invalid
  /// index, this function returns zero
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC Uint16 SDLCALL SDL_GetGamepadInstanceVendor(SDL_JoystickID instance_id)
  /// ```
  static int getInstanceVendor(int instanceId) {
    return sdlGetGamepadInstanceVendor(instanceId);
  }

  ///
  /// Get the USB product ID of a gamepad, if available.
  ///
  /// This can be called before any gamepads are opened. If the product ID isn't
  /// available this function returns 0.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the USB product ID of the selected gamepad. If called on an
  /// invalid index, this function returns zero
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC Uint16 SDLCALL SDL_GetGamepadInstanceProduct(SDL_JoystickID instance_id)
  /// ```
  static int getInstanceProduct(int instanceId) {
    return sdlGetGamepadInstanceProduct(instanceId);
  }

  ///
  /// Get the product version of a gamepad, if available.
  ///
  /// This can be called before any gamepads are opened. If the product version
  /// isn't available this function returns 0.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the product version of the selected gamepad. If called on an
  /// invalid index, this function returns zero
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC Uint16 SDLCALL SDL_GetGamepadInstanceProductVersion(SDL_JoystickID instance_id)
  /// ```
  static int getInstanceProductVersion(int instanceId) {
    return sdlGetGamepadInstanceProductVersion(instanceId);
  }

  ///
  /// Get the type of a gamepad.
  ///
  /// This can be called before any gamepads are opened.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the gamepad type.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadType SDLCALL SDL_GetGamepadInstanceType(SDL_JoystickID instance_id)
  /// ```
  static int getInstanceType(int instanceId) {
    return sdlGetGamepadInstanceType(instanceId);
  }

  ///
  /// Get the type of a gamepad, ignoring any mapping override.
  ///
  /// This can be called before any gamepads are opened.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the gamepad type.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadType SDLCALL SDL_GetRealGamepadInstanceType(SDL_JoystickID instance_id)
  /// ```
  static int getRealInstanceType(int instanceId) {
    return sdlGetRealGamepadInstanceType(instanceId);
  }

  ///
  /// Get the mapping of a gamepad.
  ///
  /// This can be called before any gamepads are opened.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns the mapping string. Must be freed with SDL_free(). Returns NULL if
  /// no mapping is available.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC char *SDLCALL SDL_GetGamepadInstanceMapping(SDL_JoystickID instance_id)
  /// ```
  static Pointer<Int8> getInstanceMapping(int instanceId) {
    return sdlGetGamepadInstanceMapping(instanceId);
  }

  ///
  /// Open a gamepad for use.
  ///
  /// \param instance_id the joystick instance ID
  /// \returns a gamepad identifier or NULL if an error occurred; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CloseGamepad
  /// \sa SDL_IsGamepad
  ///
  /// ```c
  /// extern DECLSPEC SDL_Gamepad *SDLCALL SDL_OpenGamepad(SDL_JoystickID instance_id)
  /// ```
  static Pointer<SdlGamepad> open(int instanceId) {
    return sdlOpenGamepad(instanceId);
  }

  ///
  /// Get the SDL_Gamepad associated with a joystick instance ID, if it has been
  /// opened.
  ///
  /// \param instance_id the joystick instance ID of the gamepad
  /// \returns an SDL_Gamepad on success or NULL on failure or if it hasn't been
  /// opened yet; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_Gamepad *SDLCALL SDL_GetGamepadFromInstanceID(SDL_JoystickID instance_id)
  /// ```
  static Pointer<SdlGamepad> getFromInstanceId(int instanceId) {
    return sdlGetGamepadFromInstanceId(instanceId);
  }

  ///
  /// Get the SDL_Gamepad associated with a player index.
  ///
  /// \param player_index the player index, which different from the instance ID
  /// \returns the SDL_Gamepad associated with a player index.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadPlayerIndex
  /// \sa SDL_SetGamepadPlayerIndex
  ///
  /// ```c
  /// extern DECLSPEC SDL_Gamepad *SDLCALL SDL_GetGamepadFromPlayerIndex(int player_index)
  /// ```
  static Pointer<SdlGamepad> getFromPlayerIndex(int playerIndex) {
    return sdlGetGamepadFromPlayerIndex(playerIndex);
  }

  ///
  /// Set the state of gamepad event processing.
  ///
  /// If gamepad events are disabled, you must call SDL_UpdateGamepads() yourself
  /// and check the state of the gamepad when you want gamepad information.
  ///
  /// \param enabled whether to process gamepad events or not
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GamepadEventsEnabled
  ///
  /// ```c
  /// extern DECLSPEC void SDLCALL SDL_SetGamepadEventsEnabled(SDL_bool enabled)
  /// ```
  static void setEventsEnabled(bool enabled) {
    return sdlSetGamepadEventsEnabled(enabled);
  }

  ///
  /// Query the state of gamepad event processing.
  ///
  /// If gamepad events are disabled, you must call SDL_UpdateGamepads() yourself
  /// and check the state of the gamepad when you want gamepad information.
  ///
  /// \returns SDL_TRUE if gamepad events are being processed, SDL_FALSE
  /// otherwise.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetGamepadEventsEnabled
  ///
  /// ```c
  /// extern DECLSPEC SDL_bool SDLCALL SDL_GamepadEventsEnabled(void)
  /// ```
  static bool eventsEnabled() {
    return sdlGamepadEventsEnabled();
  }

  ///
  /// Manually pump gamepad updates if not using the loop.
  ///
  /// This function is called automatically by the event loop if events are
  /// enabled. Under such circumstances, it will not be necessary to call this
  /// function.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC void SDLCALL SDL_UpdateGamepads(void)
  /// ```
  static void updates() {
    return sdlUpdateGamepads();
  }

  ///
  /// Convert a string into SDL_GamepadType enum.
  ///
  /// This function is called internally to translate SDL_Gamepad mapping strings
  /// for the underlying joystick device into the consistent SDL_Gamepad mapping.
  /// You do not normally need to call this function unless you are parsing
  /// SDL_Gamepad mappings in your own code.
  ///
  /// \param str string representing a SDL_GamepadType type
  /// \returns the SDL_GamepadType enum corresponding to the input string, or
  /// `SDL_GAMEPAD_TYPE_UNKNOWN` if no match was found.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadStringForType
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadType SDLCALL SDL_GetGamepadTypeFromString(const char *str)
  /// ```
  static int getTypeFromString(String? str) {
    return sdlGetGamepadTypeFromString(str);
  }

  ///
  /// Convert from an SDL_GamepadType enum to a string.
  ///
  /// The caller should not SDL_free() the returned string.
  ///
  /// \param type an enum value for a given SDL_GamepadType
  /// \returns a string for the given type, or NULL if an invalid type is
  /// specified. The string returned is of the format used by
  /// SDL_Gamepad mapping strings.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadTypeFromString
  ///
  /// ```c
  /// extern DECLSPEC const char *SDLCALL SDL_GetGamepadStringForType(SDL_GamepadType type)
  /// ```
  static String? getStringForType(int type) {
    return sdlGetGamepadStringForType(type);
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
  /// \param str string representing a SDL_Gamepad axis
  /// \returns the SDL_GamepadAxis enum corresponding to the input string, or
  /// `SDL_GAMEPAD_AXIS_INVALID` if no match was found.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadStringForAxis
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadAxis SDLCALL SDL_GetGamepadAxisFromString(const char *str)
  /// ```
  static int getAxisFromString(String? str) {
    return sdlGetGamepadAxisFromString(str);
  }

  ///
  /// Convert from an SDL_GamepadAxis enum to a string.
  ///
  /// The caller should not SDL_free() the returned string.
  ///
  /// \param axis an enum value for a given SDL_GamepadAxis
  /// \returns a string for the given axis, or NULL if an invalid axis is
  /// specified. The string returned is of the format used by
  /// SDL_Gamepad mapping strings.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadAxisFromString
  ///
  /// ```c
  /// extern DECLSPEC const char* SDLCALL SDL_GetGamepadStringForAxis(SDL_GamepadAxis axis)
  /// ```
  static String? getStringForAxis(int axis) {
    return sdlGetGamepadStringForAxis(axis);
  }

  ///
  /// Convert a string into an SDL_GamepadButton enum.
  ///
  /// This function is called internally to translate SDL_Gamepad mapping strings
  /// for the underlying joystick device into the consistent SDL_Gamepad mapping.
  /// You do not normally need to call this function unless you are parsing
  /// SDL_Gamepad mappings in your own code.
  ///
  /// \param str string representing a SDL_Gamepad axis
  /// \returns the SDL_GamepadButton enum corresponding to the input string, or
  /// `SDL_GAMEPAD_BUTTON_INVALID` if no match was found.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadButton SDLCALL SDL_GetGamepadButtonFromString(const char *str)
  /// ```
  static int getButtonFromString(String? str) {
    return sdlGetGamepadButtonFromString(str);
  }

  ///
  /// Convert from an SDL_GamepadButton enum to a string.
  ///
  /// The caller should not SDL_free() the returned string.
  ///
  /// \param button an enum value for a given SDL_GamepadButton
  /// \returns a string for the given button, or NULL if an invalid button is
  /// specified. The string returned is of the format used by
  /// SDL_Gamepad mapping strings.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadButtonFromString
  ///
  /// ```c
  /// extern DECLSPEC const char* SDLCALL SDL_GetGamepadStringForButton(SDL_GamepadButton button)
  /// ```
  static String? getStringForButton(int button) {
    return sdlGetGamepadStringForButton(button);
  }

  ///
  /// Get the label of a button on a gamepad.
  ///
  /// \param type the type of gamepad to check
  /// \param button a button index (one of the SDL_GamepadButton values)
  /// \returns the SDL_GamepadButtonLabel enum corresponding to the button label
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadButtonLabel
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadButtonLabel SDLCALL SDL_GetGamepadButtonLabelForType(SDL_GamepadType type, SDL_GamepadButton button)
  /// ```
  static int getButtonLabelForType(int type, int button) {
    return sdlGetGamepadButtonLabelForType(type, button);
  }
}

extension SdlGamepadPointerEx on Pointer<SdlGamepad> {
  // lib_sdl_gamepad.dart

  ///
  /// Get the current mapping of a gamepad.
  ///
  /// The returned string must be freed with SDL_free().
  ///
  /// Details about mappings are discussed with SDL_AddGamepadMapping().
  ///
  /// \param gamepad the gamepad you want to get the current mapping for
  /// \returns a string that has the gamepad's mapping or NULL if no mapping is
  /// available; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_AddGamepadMapping
  /// \sa SDL_GetGamepadMappingForGUID
  /// \sa SDL_SetGamepadMapping
  ///
  /// ```c
  /// extern DECLSPEC char * SDLCALL SDL_GetGamepadMapping(SDL_Gamepad *gamepad)
  /// ```
  Pointer<Int8> getMapping() {
    // 170
    return sdlGetGamepadMapping(this);
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
  /// SDL_OpenGamepad()
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetProperty
  /// \sa SDL_SetProperty
  ///
  /// ```c
  /// extern DECLSPEC SDL_PropertiesID SDLCALL SDL_GetGamepadProperties(SDL_Gamepad *gamepad)
  /// ```
  int getProperties() {
    return sdlGetGamepadProperties(this);
  }

  ///
  /// Get the instance ID of an opened gamepad.
  ///
  /// \param gamepad a gamepad identifier previously returned by
  /// SDL_OpenGamepad()
  /// \returns the instance ID of the specified gamepad on success or 0 on
  /// failure; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC SDL_JoystickID SDLCALL SDL_GetGamepadInstanceID(SDL_Gamepad *gamepad)
  /// ```
  int getInstanceId() {
    return sdlGetGamepadInstanceId(this);
  }

  ///
  /// Get the implementation-dependent name for an opened gamepad.
  ///
  /// \param gamepad a gamepad identifier previously returned by
  /// SDL_OpenGamepad()
  /// \returns the implementation dependent name for the gamepad, or NULL if
  /// there is no name or the identifier passed is invalid.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadInstanceName
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC const char *SDLCALL SDL_GetGamepadName(SDL_Gamepad *gamepad)
  /// ```
  String? getName() {
    return sdlGetGamepadName(this);
  }

  ///
  /// Get the implementation-dependent path for an opened gamepad.
  ///
  /// \param gamepad a gamepad identifier previously returned by
  /// SDL_OpenGamepad()
  /// \returns the implementation dependent path for the gamepad, or NULL if
  /// there is no path or the identifier passed is invalid.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadInstancePath
  ///
  /// ```c
  /// extern DECLSPEC const char *SDLCALL SDL_GetGamepadPath(SDL_Gamepad *gamepad)
  /// ```
  String? getPath() {
    return sdlGetGamepadPath(this);
  }

  ///
  /// Get the type of an opened gamepad.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it's not
  /// available.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadInstanceType
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadType SDLCALL SDL_GetGamepadType(SDL_Gamepad *gamepad)
  /// ```
  int getType() {
    return sdlGetGamepadType(this);
  }

  ///
  /// Get the type of an opened gamepad, ignoring any mapping override.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it's not
  /// available.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRealGamepadInstanceType
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadType SDLCALL SDL_GetRealGamepadType(SDL_Gamepad *gamepad)
  /// ```
  int getRealType() {
    return sdlGetRealGamepadType(this);
  }

  ///
  /// Get the player index of an opened gamepad.
  ///
  /// For XInput gamepads this returns the XInput user index.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the player index for gamepad, or -1 if it's not available.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetGamepadPlayerIndex(SDL_Gamepad *gamepad)
  /// ```
  int getPlayerIndex() {
    return sdlGetGamepadPlayerIndex(this);
  }

  ///
  /// Set the player index of an opened gamepad.
  ///
  /// \param gamepad the gamepad object to adjust.
  /// \param player_index Player index to assign to this gamepad, or -1 to clear
  /// the player index and turn off player LEDs.
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetGamepadPlayerIndex(SDL_Gamepad *gamepad, int player_index)
  /// ```
  int setPlayerIndex(int playerIndex) {
    return sdlSetGamepadPlayerIndex(this, playerIndex);
  }

  ///
  /// Get the USB vendor ID of an opened gamepad, if available.
  ///
  /// If the vendor ID isn't available this function returns 0.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the USB vendor ID, or zero if unavailable.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC Uint16 SDLCALL SDL_GetGamepadVendor(SDL_Gamepad *gamepad)
  /// ```
  int getVendor() {
    return sdlGetGamepadVendor(this);
  }

  ///
  /// Get the USB product ID of an opened gamepad, if available.
  ///
  /// If the product ID isn't available this function returns 0.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the USB product ID, or zero if unavailable.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC Uint16 SDLCALL SDL_GetGamepadProduct(SDL_Gamepad *gamepad)
  /// ```
  int getProduct() {
    return sdlGetGamepadProduct(this);
  }

  ///
  /// Get the product version of an opened gamepad, if available.
  ///
  /// If the product version isn't available this function returns 0.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the USB product version, or zero if unavailable.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC Uint16 SDLCALL SDL_GetGamepadProductVersion(SDL_Gamepad *gamepad)
  /// ```
  int getProductVersion() {
    return sdlGetGamepadProductVersion(this);
  }

  ///
  /// Get the firmware version of an opened gamepad, if available.
  ///
  /// If the firmware version isn't available this function returns 0.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the gamepad firmware version, or zero if unavailable.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC Uint16 SDLCALL SDL_GetGamepadFirmwareVersion(SDL_Gamepad *gamepad)
  /// ```
  int getFirmwareVersion() {
    return sdlGetGamepadFirmwareVersion(this);
  }

  ///
  /// Get the serial number of an opened gamepad, if available.
  ///
  /// Returns the serial number of the gamepad, or NULL if it is not available.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the serial number, or NULL if unavailable.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC const char * SDLCALL SDL_GetGamepadSerial(SDL_Gamepad *gamepad)
  /// ```
  String? getSerial() {
    return sdlGetGamepadSerial(this);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC Uint64 SDLCALL SDL_GetGamepadSteamHandle(SDL_Gamepad *gamepad)
  /// ```
  int getSteamHandle() {
    return sdlGetGamepadSteamHandle(this);
  }

  ///
  /// Get the connection state of a gamepad.
  ///
  /// \param gamepad the gamepad object to query.
  /// \returns the connection state on success or
  /// `SDL_JOYSTICK_CONNECTION_INVALID` on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_JoystickConnectionState SDLCALL SDL_GetGamepadConnectionState(SDL_Gamepad *gamepad)
  /// ```
  int sdlGetConnectionState() {
    return sdlGetGamepadConnectionState(this);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_PowerState SDLCALL SDL_GetGamepadPowerInfo(SDL_Gamepad *gamepad, int *percent)
  /// ```
  int getPowerInfo(Pointer<Int32> percent) {
    return sdlGetGamepadPowerInfo(this, percent);
  }

  ///
  /// Check if a gamepad has been opened and is currently connected.
  ///
  /// \param gamepad a gamepad identifier previously returned by
  /// SDL_OpenGamepad()
  /// \returns SDL_TRUE if the gamepad has been opened and is currently
  /// connected, or SDL_FALSE if not.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CloseGamepad
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC SDL_bool SDLCALL SDL_GamepadConnected(SDL_Gamepad *gamepad)
  /// ```
  bool connected() {
    return sdlGamepadConnected(this);
  }

  ///
  /// Get the underlying joystick from a gamepad
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
  /// \param gamepad the gamepad object that you want to get a joystick from
  /// \returns an SDL_Joystick object; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_Joystick *SDLCALL SDL_GetGamepadJoystick(SDL_Gamepad *gamepad)
  /// ```
  Pointer<SdlJoystick> getJoystick() {
    return sdlGetGamepadJoystick(this);
  }

  ///
  /// Get the SDL joystick layer bindings for a gamepad
  ///
  /// \param gamepad a gamepad
  /// \param count a pointer filled in with the number of bindings returned
  /// \returns a NULL terminated array of pointers to bindings which should be
  /// freed with SDL_free(), or NULL on error; call SDL_GetError() for
  /// more details.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadBinding **SDLCALL SDL_GetGamepadBindings(SDL_Gamepad *gamepad, int *count)
  /// ```
  Pointer<Pointer<SdlGamepadBinding>> getBindings(Pointer<Int32> count) {
    return sdlGetGamepadBindings(this, count);
  }

  ///
  /// Query whether a gamepad has a given axis.
  ///
  /// This merely reports whether the gamepad's mapping defined this axis, as
  /// that is all the information SDL has about the physical device.
  ///
  /// \param gamepad a gamepad
  /// \param axis an axis enum value (an SDL_GamepadAxis value)
  /// \returns SDL_TRUE if the gamepad has this axis, SDL_FALSE otherwise.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_bool SDLCALL SDL_GamepadHasAxis(SDL_Gamepad *gamepad, SDL_GamepadAxis axis)
  /// ```
  bool hasAxis(int axis) {
    return sdlGamepadHasAxis(this, axis);
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
  /// \param gamepad a gamepad
  /// \param axis an axis index (one of the SDL_GamepadAxis values)
  /// \returns axis state (including 0) on success or 0 (also) on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadButton
  ///
  /// ```c
  /// extern DECLSPEC Sint16 SDLCALL SDL_GetGamepadAxis(SDL_Gamepad *gamepad, SDL_GamepadAxis axis)
  /// ```
  int getAxis(int axis) {
    return sdlGetGamepadAxis(this, axis);
  }

  ///
  /// Query whether a gamepad has a given button.
  ///
  /// This merely reports whether the gamepad's mapping defined this button, as
  /// that is all the information SDL has about the physical device.
  ///
  /// \param gamepad a gamepad
  /// \param button a button enum value (an SDL_GamepadButton value)
  /// \returns SDL_TRUE if the gamepad has this button, SDL_FALSE otherwise.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_bool SDLCALL SDL_GamepadHasButton(SDL_Gamepad *gamepad, SDL_GamepadButton button)
  /// ```
  bool hasButton(int button) {
    return sdlGamepadHasButton(this, button);
  }

  ///
  /// Get the current state of a button on a gamepad.
  ///
  /// \param gamepad a gamepad
  /// \param button a button index (one of the SDL_GamepadButton values)
  /// \returns 1 for pressed state or 0 for not pressed state or error; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadAxis
  ///
  /// ```c
  /// extern DECLSPEC Uint8 SDLCALL SDL_GetGamepadButton(SDL_Gamepad *gamepad, SDL_GamepadButton button)
  /// ```
  int getButton(int button) {
    return sdlGetGamepadButton(this, button);
  }

  ///
  /// Get the label of a button on a gamepad.
  ///
  /// \param gamepad a gamepad
  /// \param button a button index (one of the SDL_GamepadButton values)
  /// \returns the SDL_GamepadButtonLabel enum corresponding to the button label
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadButtonLabelForType
  ///
  /// ```c
  /// extern DECLSPEC SDL_GamepadButtonLabel SDLCALL SDL_GetGamepadButtonLabel(SDL_Gamepad *gamepad, SDL_GamepadButton button)
  /// ```
  int getButtonLabel(int button) {
    return sdlGetGamepadButtonLabel(this, button);
  }

  ///
  /// Get the number of touchpads on a gamepad.
  ///
  /// \param gamepad a gamepad
  /// \returns number of touchpads
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetNumGamepadTouchpads(SDL_Gamepad *gamepad)
  /// ```
  int getNumTouchpads() {
    return sdlGetNumGamepadTouchpads(this);
  }

  ///
  /// Get the number of supported simultaneous fingers on a touchpad on a game
  /// gamepad.
  ///
  /// \param gamepad a gamepad
  /// \param touchpad a touchpad
  /// \returns number of supported simultaneous fingers
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetNumGamepadTouchpadFingers(SDL_Gamepad *gamepad, int touchpad)
  /// ```
  int getNumTouchpadFingers(int touchpad) {
    return sdlGetNumGamepadTouchpadFingers(this, touchpad);
  }

  ///
  /// Get the current state of a finger on a touchpad on a gamepad.
  ///
  /// \param gamepad a gamepad
  /// \param touchpad a touchpad
  /// \param finger a finger
  /// \param state filled with state
  /// \param x filled with x position
  /// \param y filled with y position
  /// \param pressure filled with pressure value
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetGamepadTouchpadFinger(SDL_Gamepad *gamepad, int touchpad, int finger, Uint8 *state, float *x, float *y, float *pressure)
  /// ```
  int getTouchpadFinger(int touchpad, int finger, Pointer<Uint8> state,
      Pointer<Float> x, Pointer<Float> y, Pointer<Float> pressure) {
    return sdlGetGamepadTouchpadFinger(
        this, touchpad, finger, state, x, y, pressure);
  }

  ///
  /// Return whether a gamepad has a particular sensor.
  ///
  /// \param gamepad The gamepad to query
  /// \param type The type of sensor to query
  /// \returns SDL_TRUE if the sensor exists, SDL_FALSE otherwise.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_bool SDLCALL SDL_GamepadHasSensor(SDL_Gamepad *gamepad, SDL_SensorType type)
  /// ```
  bool hasSensor(int type) {
    return sdlGamepadHasSensor(this, type);
  }

  ///
  /// Set whether data reporting for a gamepad sensor is enabled.
  ///
  /// \param gamepad The gamepad to update
  /// \param type The type of sensor to enable/disable
  /// \param enabled Whether data reporting should be enabled
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetGamepadSensorEnabled(SDL_Gamepad *gamepad, SDL_SensorType type, SDL_bool enabled)
  /// ```
  int setSensorEnabled(int type, bool enabled) {
    return sdlSetGamepadSensorEnabled(this, type, enabled);
  }

  ///
  /// Query whether sensor data reporting is enabled for a gamepad.
  ///
  /// \param gamepad The gamepad to query
  /// \param type The type of sensor to query
  /// \returns SDL_TRUE if the sensor is enabled, SDL_FALSE otherwise.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_bool SDLCALL SDL_GamepadSensorEnabled(SDL_Gamepad *gamepad, SDL_SensorType type)
  /// ```
  bool sensorEnabled(int type) {
    return sdlGamepadSensorEnabled(this, type);
  }

  ///
  /// Get the data rate (number of events per second) of a gamepad sensor.
  ///
  /// \param gamepad The gamepad to query
  /// \param type The type of sensor to query
  /// \returns the data rate, or 0.0f if the data rate is not available.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC float SDLCALL SDL_GetGamepadSensorDataRate(SDL_Gamepad *gamepad, SDL_SensorType type)
  /// ```
  double getSensorDataRate(int type) {
    return sdlGetGamepadSensorDataRate(this, type);
  }

  ///
  /// Get the current state of a gamepad sensor.
  ///
  /// The number of values and interpretation of the data is sensor dependent.
  /// See SDL_sensor.h for the details for each type of sensor.
  ///
  /// \param gamepad The gamepad to query
  /// \param type The type of sensor to query
  /// \param data A pointer filled with the current sensor state
  /// \param num_values The number of values to write to data
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetGamepadSensorData(SDL_Gamepad *gamepad, SDL_SensorType type, float *data, int num_values)
  /// ```
  int getSensorData(int type, Pointer<Float> data, int numValues) {
    return sdlGetGamepadSensorData(this, type, data, numValues);
  }

  ///
  /// Start a rumble effect on a gamepad.
  ///
  /// Each call to this function cancels any previous rumble effect, and calling
  /// it with 0 intensity stops any rumbling.
  ///
  /// \param gamepad The gamepad to vibrate
  /// \param low_frequency_rumble The intensity of the low frequency (left)
  /// rumble motor, from 0 to 0xFFFF
  /// \param high_frequency_rumble The intensity of the high frequency (right)
  /// rumble motor, from 0 to 0xFFFF
  /// \param duration_ms The duration of the rumble effect, in milliseconds
  /// \returns 0, or -1 if rumble isn't supported on this gamepad
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RumbleGamepad(SDL_Gamepad *gamepad, Uint16 low_frequency_rumble, Uint16 high_frequency_rumble, Uint32 duration_ms)
  /// ```
  int rumble(int lowFrequencyRumble, int highFrequencyRumble, int durationMs) {
    return sdlRumbleGamepad(
        this, lowFrequencyRumble, highFrequencyRumble, durationMs);
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
  /// \param gamepad The gamepad to vibrate
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
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RumbleGamepadTriggers(SDL_Gamepad *gamepad, Uint16 left_rumble, Uint16 right_rumble, Uint32 duration_ms)
  /// ```
  int rumbleTriggers(int leftRumble, int rightRumble, int durationMs) {
    return sdlRumbleGamepadTriggers(this, leftRumble, rightRumble, durationMs);
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
  /// \param gamepad The gamepad to update
  /// \param red The intensity of the red LED
  /// \param green The intensity of the green LED
  /// \param blue The intensity of the blue LED
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetGamepadLED(SDL_Gamepad *gamepad, Uint8 red, Uint8 green, Uint8 blue)
  /// ```
  int setLed(int red, int green, int blue) {
    return sdlSetGamepadLed(this, red, green, blue);
  }

  ///
  /// Send a gamepad specific effect packet
  ///
  /// \param gamepad The gamepad to affect
  /// \param data The data to send to the gamepad
  /// \param size The size of the data to send to the gamepad
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SendGamepadEffect(SDL_Gamepad *gamepad, const void *data, int size)
  /// ```
  int sendEffect(Pointer<NativeType> data, int size) {
    return sdlSendGamepadEffect(this, data, size);
  }

  ///
  /// Close a gamepad previously opened with SDL_OpenGamepad().
  ///
  /// \param gamepad a gamepad identifier previously returned by
  /// SDL_OpenGamepad()
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_OpenGamepad
  ///
  /// ```c
  /// extern DECLSPEC void SDLCALL SDL_CloseGamepad(SDL_Gamepad *gamepad)
  /// ```
  void close() {
    sdlCloseGamepad(this);
  }

  ///
  /// Return the sfSymbolsName for a given button on a gamepad on Apple
  /// platforms.
  ///
  /// \param gamepad the gamepad to query
  /// \param button a button on the gamepad
  /// \returns the sfSymbolsName or NULL if the name can't be found
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadAppleSFSymbolsNameForAxis
  ///
  /// ```c
  /// extern DECLSPEC const char* SDLCALL SDL_GetGamepadAppleSFSymbolsNameForButton(SDL_Gamepad *gamepad, SDL_GamepadButton button)
  /// ```
  String? getAppleSfSymbolsNameForButton(int button) {
    return sdlGetGamepadAppleSfSymbolsNameForButton(this, button);
  }

  ///
  /// Return the sfSymbolsName for a given axis on a gamepad on Apple platforms.
  ///
  /// \param gamepad the gamepad to query
  /// \param axis an axis on the gamepad
  /// \returns the sfSymbolsName or NULL if the name can't be found
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetGamepadAppleSFSymbolsNameForButton
  ///
  /// ```c
  /// extern DECLSPEC const char* SDLCALL SDL_GetGamepadAppleSFSymbolsNameForAxis(SDL_Gamepad *gamepad, SDL_GamepadAxis axis)
  /// ```
  String? getAppleSfSymbolsNameForAxis(int axis) {
    return sdlGetGamepadAppleSfSymbolsNameForAxis(this, axis);
  }
}
