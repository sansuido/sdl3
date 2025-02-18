// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Get a list of currently connected haptic devices.
///
/// \param count a pointer filled in with the number of haptic devices
/// returned, may be NULL.
/// \returns a 0 terminated array of haptic device instance IDs or NULL on
/// failure; call SDL_GetError() for more information. This should be
/// freed with SDL_free() when it is no longer needed.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenHaptic
///
/// ```c
/// extern SDL_DECLSPEC SDL_HapticID * SDLCALL SDL_GetHaptics(int *count)
/// ```
Pointer<Uint32> sdlGetHaptics(Pointer<Int32> count) {
  final sdlGetHapticsLookupFunction = libSdl3.lookupFunction<
    Pointer<Uint32> Function(Pointer<Int32> count),
    Pointer<Uint32> Function(Pointer<Int32> count)
  >('SDL_GetHaptics');
  return sdlGetHapticsLookupFunction(count);
}

///
/// Get the implementation dependent name of a haptic device.
///
/// This can be called before any haptic devices are opened.
///
/// \param instance_id the haptic device instance ID.
/// \returns the name of the selected haptic device. If no name can be found,
/// this function returns NULL; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHapticName
/// \sa SDL_OpenHaptic
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetHapticNameForID(SDL_HapticID instance_id)
/// ```
String? sdlGetHapticNameForId(int instanceId) {
  final sdlGetHapticNameForIdLookupFunction = libSdl3.lookupFunction<
    Pointer<Utf8> Function(Uint32 instanceId),
    Pointer<Utf8> Function(int instanceId)
  >('SDL_GetHapticNameForID');
  final result = sdlGetHapticNameForIdLookupFunction(instanceId);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Open a haptic device for use.
///
/// The index passed as an argument refers to the N'th haptic device on this
/// system.
///
/// When opening a haptic device, its gain will be set to maximum and
/// autocenter will be disabled. To modify these values use SDL_SetHapticGain()
/// and SDL_SetHapticAutocenter().
///
/// \param instance_id the haptic device instance ID.
/// \returns the device identifier or NULL on failure; call SDL_GetError() for
/// more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseHaptic
/// \sa SDL_GetHaptics
/// \sa SDL_OpenHapticFromJoystick
/// \sa SDL_OpenHapticFromMouse
/// \sa SDL_SetHapticAutocenter
/// \sa SDL_SetHapticGain
///
/// ```c
/// extern SDL_DECLSPEC SDL_Haptic * SDLCALL SDL_OpenHaptic(SDL_HapticID instance_id)
/// ```
Pointer<SdlHaptic> sdlOpenHaptic(int instanceId) {
  final sdlOpenHapticLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlHaptic> Function(Uint32 instanceId),
    Pointer<SdlHaptic> Function(int instanceId)
  >('SDL_OpenHaptic');
  return sdlOpenHapticLookupFunction(instanceId);
}

///
/// Get the SDL_Haptic associated with an instance ID, if it has been opened.
///
/// \param instance_id the instance ID to get the SDL_Haptic for.
/// \returns an SDL_Haptic on success or NULL on failure or if it hasn't been
/// opened yet; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_Haptic * SDLCALL SDL_GetHapticFromID(SDL_HapticID instance_id)
/// ```
Pointer<SdlHaptic> sdlGetHapticFromId(int instanceId) {
  final sdlGetHapticFromIdLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlHaptic> Function(Uint32 instanceId),
    Pointer<SdlHaptic> Function(int instanceId)
  >('SDL_GetHapticFromID');
  return sdlGetHapticFromIdLookupFunction(instanceId);
}

///
/// Get the instance ID of an opened haptic device.
///
/// \param haptic the SDL_Haptic device to query.
/// \returns the instance ID of the specified haptic device on success or 0 on
/// failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC SDL_HapticID SDLCALL SDL_GetHapticID(SDL_Haptic *haptic)
/// ```
int sdlGetHapticId(Pointer<SdlHaptic> haptic) {
  final sdlGetHapticIdLookupFunction = libSdl3.lookupFunction<
    Uint32 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_GetHapticID');
  return sdlGetHapticIdLookupFunction(haptic);
}

///
/// Get the implementation dependent name of a haptic device.
///
/// \param haptic the SDL_Haptic obtained from SDL_OpenJoystick().
/// \returns the name of the selected haptic device. If no name can be found,
/// this function returns NULL; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHapticNameForID
///
/// ```c
/// extern SDL_DECLSPEC const char * SDLCALL SDL_GetHapticName(SDL_Haptic *haptic)
/// ```
String? sdlGetHapticName(Pointer<SdlHaptic> haptic) {
  final sdlGetHapticNameLookupFunction = libSdl3.lookupFunction<
    Pointer<Utf8> Function(Pointer<SdlHaptic> haptic),
    Pointer<Utf8> Function(Pointer<SdlHaptic> haptic)
  >('SDL_GetHapticName');
  final result = sdlGetHapticNameLookupFunction(haptic);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Query whether or not the current mouse has haptic capabilities.
///
/// \returns true if the mouse is haptic or false if it isn't.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenHapticFromMouse
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_IsMouseHaptic(void)
/// ```
bool sdlIsMouseHaptic() {
  final sdlIsMouseHapticLookupFunction = libSdl3
      .lookupFunction<Uint8 Function(), int Function()>('SDL_IsMouseHaptic');
  return sdlIsMouseHapticLookupFunction() == 1;
}

///
/// Try to open a haptic device from the current mouse.
///
/// \returns the haptic device identifier or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseHaptic
/// \sa SDL_IsMouseHaptic
///
/// ```c
/// extern SDL_DECLSPEC SDL_Haptic * SDLCALL SDL_OpenHapticFromMouse(void)
/// ```
Pointer<SdlHaptic> sdlOpenHapticFromMouse() {
  final sdlOpenHapticFromMouseLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlHaptic> Function(),
    Pointer<SdlHaptic> Function()
  >('SDL_OpenHapticFromMouse');
  return sdlOpenHapticFromMouseLookupFunction();
}

///
/// Query if a joystick has haptic features.
///
/// \param joystick the SDL_Joystick to test for haptic capabilities.
/// \returns true if the joystick is haptic or false if it isn't.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenHapticFromJoystick
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_IsJoystickHaptic(SDL_Joystick *joystick)
/// ```
bool sdlIsJoystickHaptic(Pointer<SdlJoystick> joystick) {
  final sdlIsJoystickHapticLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlJoystick> joystick),
    int Function(Pointer<SdlJoystick> joystick)
  >('SDL_IsJoystickHaptic');
  return sdlIsJoystickHapticLookupFunction(joystick) == 1;
}

///
/// Open a haptic device for use from a joystick device.
///
/// You must still close the haptic device separately. It will not be closed
/// with the joystick.
///
/// When opened from a joystick you should first close the haptic device before
/// closing the joystick device. If not, on some implementations the haptic
/// device will also get unallocated and you'll be unable to use force feedback
/// on that device.
///
/// \param joystick the SDL_Joystick to create a haptic device from.
/// \returns a valid haptic device identifier on success or NULL on failure;
/// call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseHaptic
/// \sa SDL_IsJoystickHaptic
///
/// ```c
/// extern SDL_DECLSPEC SDL_Haptic * SDLCALL SDL_OpenHapticFromJoystick(SDL_Joystick *joystick)
/// ```
Pointer<SdlHaptic> sdlOpenHapticFromJoystick(Pointer<SdlJoystick> joystick) {
  final sdlOpenHapticFromJoystickLookupFunction = libSdl3.lookupFunction<
    Pointer<SdlHaptic> Function(Pointer<SdlJoystick> joystick),
    Pointer<SdlHaptic> Function(Pointer<SdlJoystick> joystick)
  >('SDL_OpenHapticFromJoystick');
  return sdlOpenHapticFromJoystickLookupFunction(joystick);
}

///
/// Close a haptic device previously opened with SDL_OpenHaptic().
///
/// \param haptic the SDL_Haptic device to close.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenHaptic
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_CloseHaptic(SDL_Haptic *haptic)
/// ```
void sdlCloseHaptic(Pointer<SdlHaptic> haptic) {
  final sdlCloseHapticLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlHaptic> haptic),
    void Function(Pointer<SdlHaptic> haptic)
  >('SDL_CloseHaptic');
  return sdlCloseHapticLookupFunction(haptic);
}

///
/// Get the number of effects a haptic device can store.
///
/// On some platforms this isn't fully supported, and therefore is an
/// approximation. Always check to see if your created effect was actually
/// created and do not rely solely on SDL_GetMaxHapticEffects().
///
/// \param haptic the SDL_Haptic device to query.
/// \returns the number of effects the haptic device can store or a negative
/// error code on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetMaxHapticEffectsPlaying
/// \sa SDL_GetHapticFeatures
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetMaxHapticEffects(SDL_Haptic *haptic)
/// ```
int sdlGetMaxHapticEffects(Pointer<SdlHaptic> haptic) {
  final sdlGetMaxHapticEffectsLookupFunction = libSdl3.lookupFunction<
    Int32 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_GetMaxHapticEffects');
  return sdlGetMaxHapticEffectsLookupFunction(haptic);
}

///
/// Get the number of effects a haptic device can play at the same time.
///
/// This is not supported on all platforms, but will always return a value.
///
/// \param haptic the SDL_Haptic device to query maximum playing effects.
/// \returns the number of effects the haptic device can play at the same time
/// or -1 on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetMaxHapticEffects
/// \sa SDL_GetHapticFeatures
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetMaxHapticEffectsPlaying(SDL_Haptic *haptic)
/// ```
int sdlGetMaxHapticEffectsPlaying(Pointer<SdlHaptic> haptic) {
  final sdlGetMaxHapticEffectsPlayingLookupFunction = libSdl3.lookupFunction<
    Int32 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_GetMaxHapticEffectsPlaying');
  return sdlGetMaxHapticEffectsPlayingLookupFunction(haptic);
}

///
/// Get the haptic device's supported features in bitwise manner.
///
/// \param haptic the SDL_Haptic device to query.
/// \returns a list of supported haptic features in bitwise manner (OR'd), or 0
/// on failure; call SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_HapticEffectSupported
/// \sa SDL_GetMaxHapticEffects
///
/// ```c
/// extern SDL_DECLSPEC Uint32 SDLCALL SDL_GetHapticFeatures(SDL_Haptic *haptic)
/// ```
int sdlGetHapticFeatures(Pointer<SdlHaptic> haptic) {
  final sdlGetHapticFeaturesLookupFunction = libSdl3.lookupFunction<
    Uint32 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_GetHapticFeatures');
  return sdlGetHapticFeaturesLookupFunction(haptic);
}

///
/// Get the number of haptic axes the device has.
///
/// The number of haptic axes might be useful if working with the
/// SDL_HapticDirection effect.
///
/// \param haptic the SDL_Haptic device to query.
/// \returns the number of axes on success or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetNumHapticAxes(SDL_Haptic *haptic)
/// ```
int sdlGetNumHapticAxes(Pointer<SdlHaptic> haptic) {
  final sdlGetNumHapticAxesLookupFunction = libSdl3.lookupFunction<
    Int32 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_GetNumHapticAxes');
  return sdlGetNumHapticAxesLookupFunction(haptic);
}

///
/// Check to see if an effect is supported by a haptic device.
///
/// \param haptic the SDL_Haptic device to query.
/// \param effect the desired effect to query.
/// \returns true if the effect is supported or false if it isn't.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateHapticEffect
/// \sa SDL_GetHapticFeatures
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HapticEffectSupported(SDL_Haptic *haptic, const SDL_HapticEffect *effect)
/// ```
bool sdlHapticEffectSupported(
  Pointer<SdlHaptic> haptic,
  Pointer<SdlHapticEffect> effect,
) {
  final sdlHapticEffectSupportedLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic, Pointer<SdlHapticEffect> effect),
    int Function(Pointer<SdlHaptic> haptic, Pointer<SdlHapticEffect> effect)
  >('SDL_HapticEffectSupported');
  return sdlHapticEffectSupportedLookupFunction(haptic, effect) == 1;
}

///
/// Create a new haptic effect on a specified device.
///
/// \param haptic an SDL_Haptic device to create the effect on.
/// \param effect an SDL_HapticEffect structure containing the properties of
/// the effect to create.
/// \returns the ID of the effect on success or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_DestroyHapticEffect
/// \sa SDL_RunHapticEffect
/// \sa SDL_UpdateHapticEffect
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_CreateHapticEffect(SDL_Haptic *haptic, const SDL_HapticEffect *effect)
/// ```
int sdlCreateHapticEffect(
  Pointer<SdlHaptic> haptic,
  Pointer<SdlHapticEffect> effect,
) {
  final sdlCreateHapticEffectLookupFunction = libSdl3.lookupFunction<
    Int32 Function(Pointer<SdlHaptic> haptic, Pointer<SdlHapticEffect> effect),
    int Function(Pointer<SdlHaptic> haptic, Pointer<SdlHapticEffect> effect)
  >('SDL_CreateHapticEffect');
  return sdlCreateHapticEffectLookupFunction(haptic, effect);
}

///
/// Update the properties of an effect.
///
/// Can be used dynamically, although behavior when dynamically changing
/// direction may be strange. Specifically the effect may re-upload itself and
/// start playing from the start. You also cannot change the type either when
/// running SDL_UpdateHapticEffect().
///
/// \param haptic the SDL_Haptic device that has the effect.
/// \param effect the identifier of the effect to update.
/// \param data an SDL_HapticEffect structure containing the new effect
/// properties to use.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateHapticEffect
/// \sa SDL_RunHapticEffect
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateHapticEffect(SDL_Haptic *haptic, int effect, const SDL_HapticEffect *data)
/// ```
bool sdlUpdateHapticEffect(
  Pointer<SdlHaptic> haptic,
  int effect,
  Pointer<SdlHapticEffect> data,
) {
  final sdlUpdateHapticEffectLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(
      Pointer<SdlHaptic> haptic,
      Int32 effect,
      Pointer<SdlHapticEffect> data,
    ),
    int Function(
      Pointer<SdlHaptic> haptic,
      int effect,
      Pointer<SdlHapticEffect> data,
    )
  >('SDL_UpdateHapticEffect');
  return sdlUpdateHapticEffectLookupFunction(haptic, effect, data) == 1;
}

///
/// Run the haptic effect on its associated haptic device.
///
/// To repeat the effect over and over indefinitely, set `iterations` to
/// `SDL_HAPTIC_INFINITY`. (Repeats the envelope - attack and fade.) To make
/// one instance of the effect last indefinitely (so the effect does not fade),
/// set the effect's `length` in its structure/union to `SDL_HAPTIC_INFINITY`
/// instead.
///
/// \param haptic the SDL_Haptic device to run the effect on.
/// \param effect the ID of the haptic effect to run.
/// \param iterations the number of iterations to run the effect; use
/// `SDL_HAPTIC_INFINITY` to repeat forever.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHapticEffectStatus
/// \sa SDL_StopHapticEffect
/// \sa SDL_StopHapticEffects
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_RunHapticEffect(SDL_Haptic *haptic, int effect, Uint32 iterations)
/// ```
bool sdlRunHapticEffect(Pointer<SdlHaptic> haptic, int effect, int iterations) {
  final sdlRunHapticEffectLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic, Int32 effect, Uint32 iterations),
    int Function(Pointer<SdlHaptic> haptic, int effect, int iterations)
  >('SDL_RunHapticEffect');
  return sdlRunHapticEffectLookupFunction(haptic, effect, iterations) == 1;
}

///
/// Stop the haptic effect on its associated haptic device.
///
/// \param haptic the SDL_Haptic device to stop the effect on.
/// \param effect the ID of the haptic effect to stop.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RunHapticEffect
/// \sa SDL_StopHapticEffects
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_StopHapticEffect(SDL_Haptic *haptic, int effect)
/// ```
bool sdlStopHapticEffect(Pointer<SdlHaptic> haptic, int effect) {
  final sdlStopHapticEffectLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic, Int32 effect),
    int Function(Pointer<SdlHaptic> haptic, int effect)
  >('SDL_StopHapticEffect');
  return sdlStopHapticEffectLookupFunction(haptic, effect) == 1;
}

///
/// Destroy a haptic effect on the device.
///
/// This will stop the effect if it's running. Effects are automatically
/// destroyed when the device is closed.
///
/// \param haptic the SDL_Haptic device to destroy the effect on.
/// \param effect the ID of the haptic effect to destroy.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CreateHapticEffect
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_DestroyHapticEffect(SDL_Haptic *haptic, int effect)
/// ```
void sdlDestroyHapticEffect(Pointer<SdlHaptic> haptic, int effect) {
  final sdlDestroyHapticEffectLookupFunction = libSdl3.lookupFunction<
    Void Function(Pointer<SdlHaptic> haptic, Int32 effect),
    void Function(Pointer<SdlHaptic> haptic, int effect)
  >('SDL_DestroyHapticEffect');
  return sdlDestroyHapticEffectLookupFunction(haptic, effect);
}

///
/// Get the status of the current effect on the specified haptic device.
///
/// Device must support the SDL_HAPTIC_STATUS feature.
///
/// \param haptic the SDL_Haptic device to query for the effect status on.
/// \param effect the ID of the haptic effect to query its status.
/// \returns true if it is playing, false if it isn't playing or haptic status
/// isn't supported.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHapticFeatures
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetHapticEffectStatus(SDL_Haptic *haptic, int effect)
/// ```
bool sdlGetHapticEffectStatus(Pointer<SdlHaptic> haptic, int effect) {
  final sdlGetHapticEffectStatusLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic, Int32 effect),
    int Function(Pointer<SdlHaptic> haptic, int effect)
  >('SDL_GetHapticEffectStatus');
  return sdlGetHapticEffectStatusLookupFunction(haptic, effect) == 1;
}

///
/// Set the global gain of the specified haptic device.
///
/// Device must support the SDL_HAPTIC_GAIN feature.
///
/// The user may specify the maximum gain by setting the environment variable
/// `SDL_HAPTIC_GAIN_MAX` which should be between 0 and 100. All calls to
/// SDL_SetHapticGain() will scale linearly using `SDL_HAPTIC_GAIN_MAX` as the
/// maximum.
///
/// \param haptic the SDL_Haptic device to set the gain on.
/// \param gain value to set the gain to, should be between 0 and 100 (0 -
/// 100).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHapticFeatures
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetHapticGain(SDL_Haptic *haptic, int gain)
/// ```
bool sdlSetHapticGain(Pointer<SdlHaptic> haptic, int gain) {
  final sdlSetHapticGainLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic, Int32 gain),
    int Function(Pointer<SdlHaptic> haptic, int gain)
  >('SDL_SetHapticGain');
  return sdlSetHapticGainLookupFunction(haptic, gain) == 1;
}

///
/// Set the global autocenter of the device.
///
/// Autocenter should be between 0 and 100. Setting it to 0 will disable
/// autocentering.
///
/// Device must support the SDL_HAPTIC_AUTOCENTER feature.
///
/// \param haptic the SDL_Haptic device to set autocentering on.
/// \param autocenter value to set autocenter to (0-100).
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetHapticFeatures
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetHapticAutocenter(SDL_Haptic *haptic, int autocenter)
/// ```
bool sdlSetHapticAutocenter(Pointer<SdlHaptic> haptic, int autocenter) {
  final sdlSetHapticAutocenterLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic, Int32 autocenter),
    int Function(Pointer<SdlHaptic> haptic, int autocenter)
  >('SDL_SetHapticAutocenter');
  return sdlSetHapticAutocenterLookupFunction(haptic, autocenter) == 1;
}

///
/// Pause a haptic device.
///
/// Device must support the `SDL_HAPTIC_PAUSE` feature. Call SDL_ResumeHaptic()
/// to resume playback.
///
/// Do not modify the effects nor add new ones while the device is paused. That
/// can cause all sorts of weird errors.
///
/// \param haptic the SDL_Haptic device to pause.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ResumeHaptic
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_PauseHaptic(SDL_Haptic *haptic)
/// ```
bool sdlPauseHaptic(Pointer<SdlHaptic> haptic) {
  final sdlPauseHapticLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_PauseHaptic');
  return sdlPauseHapticLookupFunction(haptic) == 1;
}

///
/// Resume a haptic device.
///
/// Call to unpause after SDL_PauseHaptic().
///
/// \param haptic the SDL_Haptic device to unpause.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PauseHaptic
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_ResumeHaptic(SDL_Haptic *haptic)
/// ```
bool sdlResumeHaptic(Pointer<SdlHaptic> haptic) {
  final sdlResumeHapticLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_ResumeHaptic');
  return sdlResumeHapticLookupFunction(haptic) == 1;
}

///
/// Stop all the currently playing effects on a haptic device.
///
/// \param haptic the SDL_Haptic device to stop.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_RunHapticEffect
/// \sa SDL_StopHapticEffects
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_StopHapticEffects(SDL_Haptic *haptic)
/// ```
bool sdlStopHapticEffects(Pointer<SdlHaptic> haptic) {
  final sdlStopHapticEffectsLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_StopHapticEffects');
  return sdlStopHapticEffectsLookupFunction(haptic) == 1;
}

///
/// Check whether rumble is supported on a haptic device.
///
/// \param haptic haptic device to check for rumble support.
/// \returns true if the effect is supported or false if it isn't.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_InitHapticRumble
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_HapticRumbleSupported(SDL_Haptic *haptic)
/// ```
bool sdlHapticRumbleSupported(Pointer<SdlHaptic> haptic) {
  final sdlHapticRumbleSupportedLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_HapticRumbleSupported');
  return sdlHapticRumbleSupportedLookupFunction(haptic) == 1;
}

///
/// Initialize a haptic device for simple rumble playback.
///
/// \param haptic the haptic device to initialize for simple rumble playback.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PlayHapticRumble
/// \sa SDL_StopHapticRumble
/// \sa SDL_HapticRumbleSupported
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_InitHapticRumble(SDL_Haptic *haptic)
/// ```
bool sdlInitHapticRumble(Pointer<SdlHaptic> haptic) {
  final sdlInitHapticRumbleLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_InitHapticRumble');
  return sdlInitHapticRumbleLookupFunction(haptic) == 1;
}

///
/// Run a simple rumble effect on a haptic device.
///
/// \param haptic the haptic device to play the rumble effect on.
/// \param strength strength of the rumble to play as a 0-1 float value.
/// \param length length of the rumble to play in milliseconds.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_InitHapticRumble
/// \sa SDL_StopHapticRumble
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_PlayHapticRumble(SDL_Haptic *haptic, float strength, Uint32 length)
/// ```
bool sdlPlayHapticRumble(
  Pointer<SdlHaptic> haptic,
  double strength,
  int length,
) {
  final sdlPlayHapticRumbleLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic, Float strength, Uint32 length),
    int Function(Pointer<SdlHaptic> haptic, double strength, int length)
  >('SDL_PlayHapticRumble');
  return sdlPlayHapticRumbleLookupFunction(haptic, strength, length) == 1;
}

///
/// Stop the simple rumble on a haptic device.
///
/// \param haptic the haptic device to stop the rumble effect on.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PlayHapticRumble
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_StopHapticRumble(SDL_Haptic *haptic)
/// ```
bool sdlStopHapticRumble(Pointer<SdlHaptic> haptic) {
  final sdlStopHapticRumbleLookupFunction = libSdl3.lookupFunction<
    Uint8 Function(Pointer<SdlHaptic> haptic),
    int Function(Pointer<SdlHaptic> haptic)
  >('SDL_StopHapticRumble');
  return sdlStopHapticRumbleLookupFunction(haptic) == 1;
}
