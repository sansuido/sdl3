part of '../../../sdl.dart';

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
/// {@category haptic}
List<int> sdlxGetHaptics() {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final hapticsPointer = sdlGetHaptics(countPointer);
  if (hapticsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(hapticsPointer[i]);
    }
    sdlFree(hapticsPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
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
/// {@category haptic}
bool sdlxHapticEffectSupported(
  Pointer<SdlHaptic> haptic,
  SdlxHapticEffect effect,
) {
  final effectPointer = effect.calloc();
  final result = sdlHapticEffectSupported(haptic, effectPointer);
  effectPointer.callocFree();
  return result;
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
/// extern SDL_DECLSPEC SDL_HapticEffectID SDLCALL SDL_CreateHapticEffect(SDL_Haptic *haptic, const SDL_HapticEffect *effect)
/// ```
/// {@category haptic}
int sdlxCreateHapticEffect(Pointer<SdlHaptic> haptic, SdlxHapticEffect effect) {
  final effectPointer = effect.calloc();
  final result = sdlCreateHapticEffect(haptic, effectPointer);
  effectPointer.callocFree();
  return result;
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
/// extern SDL_DECLSPEC bool SDLCALL SDL_UpdateHapticEffect(SDL_Haptic *haptic, SDL_HapticEffectID effect, const SDL_HapticEffect *data)
/// ```
/// {@category haptic}
bool sdlxUpdateHapticEffect(
  Pointer<SdlHaptic> haptic,
  int effect,
  SdlxHapticEffect data,
) {
  final dataPointer = data.calloc();
  final result = sdlUpdateHapticEffect(haptic, effect, dataPointer);
  dataPointer.callocFree();
  return result;
}
