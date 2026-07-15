part of '../../../sdl.dart';

extension SdlHapticEx on SdlHaptic {
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
  static List<int> getIds() => sdlxGetHaptics();

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
  /// {@category haptic}
  static String? getNameForId(int instanceId) =>
      sdlGetHapticNameForId(instanceId);

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
  /// {@category haptic}
  static Pointer<SdlHaptic> open(int instanceId) => sdlOpenHaptic(instanceId);

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
  /// {@category haptic}
  static Pointer<SdlHaptic> getFromId(int instanceId) =>
      sdlGetHapticFromId(instanceId);

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
  /// {@category haptic}
  static bool isMouse() => sdlIsMouseHaptic();

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
  /// {@category haptic}
  static Pointer<SdlHaptic> openFromMouse() => sdlOpenHapticFromMouse();
}

extension SdlHapticPointerEx on Pointer<SdlHaptic> {
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
  /// {@category haptic}
  int getId() => sdlGetHapticId(this);

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
  /// {@category haptic}
  String? getName() => sdlGetHapticName(this);

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
  /// {@category haptic}
  void close() => sdlCloseHaptic(this);

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
  /// {@category haptic}
  int getMaxEffects() => sdlGetMaxHapticEffects(this);

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
  /// {@category haptic}
  int getMaxEffectsPlaying() => sdlGetMaxHapticEffectsPlaying(this);

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
  /// {@category haptic}
  int getFeatures() => sdlGetHapticFeatures(this);

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
  /// {@category haptic}
  int getNumAxes() => sdlGetNumHapticAxes(this);

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
  bool effectSupported(SdlxHapticEffect effect) =>
      sdlxHapticEffectSupported(this, effect);

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
  int createEffect(SdlxHapticEffect effect) =>
      sdlxCreateHapticEffect(this, effect);

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
  bool updateEffect(int effect, SdlxHapticEffect data) =>
      sdlxUpdateHapticEffect(this, effect, data);

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
  /// extern SDL_DECLSPEC bool SDLCALL SDL_RunHapticEffect(SDL_Haptic *haptic, SDL_HapticEffectID effect, Uint32 iterations)
  /// ```
  /// {@category haptic}
  bool runEffect(int effect, int iterations) =>
      sdlRunHapticEffect(this, effect, iterations);

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
  /// extern SDL_DECLSPEC bool SDLCALL SDL_StopHapticEffect(SDL_Haptic *haptic, SDL_HapticEffectID effect)
  /// ```
  /// {@category haptic}
  bool stopEffect(int effect) => sdlStopHapticEffect(this, effect);

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
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyHapticEffect(SDL_Haptic *haptic, SDL_HapticEffectID effect)
  /// ```
  /// {@category haptic}
  void destroyEffect(int effect) => sdlDestroyHapticEffect(this, effect);

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
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetHapticEffectStatus(SDL_Haptic *haptic, SDL_HapticEffectID effect)
  /// ```
  /// {@category haptic}
  bool getEffectStatus(int effect) => sdlGetHapticEffectStatus(this, effect);

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
  /// {@category haptic}
  bool setGain(int gain) => sdlSetHapticGain(this, gain);

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
  /// {@category haptic}
  bool setAutocenter(int autocenter) =>
      sdlSetHapticAutocenter(this, autocenter);

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
  /// {@category haptic}
  bool pause() => sdlPauseHaptic(this);

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
  /// {@category haptic}
  bool resume() => sdlResumeHaptic(this);

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
  /// \sa SDL_StopHapticEffect
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_StopHapticEffects(SDL_Haptic *haptic)
  /// ```
  /// {@category haptic}
  bool stopEffects() => sdlStopHapticEffects(this);

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
  /// {@category haptic}
  bool rumbleSupported() => sdlHapticRumbleSupported(this);

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
  /// {@category haptic}
  bool initRumble() => sdlInitHapticRumble(this);

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
  /// {@category haptic}
  bool playRumble(double strength, int length) =>
      sdlPlayHapticRumble(this, strength, length);

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
  /// {@category haptic}
  bool stopRumble() => sdlStopHapticRumble(this);
}
