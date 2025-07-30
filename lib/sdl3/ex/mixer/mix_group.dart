part of '../../sdl_mixer.dart';

extension MixGroupPointerEx on Pointer<MixGroup> {
  ///
  /// Destroy a mixing group.
  ///
  /// Any tracks currently assigned to this group will be reassigned to the
  /// mixer's internal default group.
  ///
  /// \param group the mixing group to destroy.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_CreateGroup
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL MIX_DestroyGroup(MIX_Group *group)
  /// ```
  /// {@category mixer}
  void destroy() => mixDestroyGroup(this);

  ///
  /// Get the properties associated with a group.
  ///
  /// Currently SDL_mixer assigns no properties of its own to a group, but this
  /// can be a convenient place to store app-specific data.
  ///
  /// A SDL_PropertiesID is created the first time this function is called for a
  /// given group.
  ///
  /// \param group the group to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL MIX_GetGroupProperties(MIX_Group *group)
  /// ```
  /// {@category mixer}
  int getProperties() => mixGetGroupProperties(this);

  ///
  /// Get the MIX_Mixer that owns a MIX_Group.
  ///
  /// This is the mixer pointer that was passed to MIX_CreateGroup().
  ///
  /// \param group the group to query.
  /// \returns the mixer associated with the group, or NULL on error; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Mixer * SDLCALL MIX_GetGroupMixer(MIX_Group *group)
  /// ```
  /// {@category mixer}
  Pointer<MixMixer> getMixer() => mixGetGroupMixer(this);

  ///
  /// Set a callback that fires when a mixer group has completed mixing.
  ///
  /// After all playing tracks in a mixer group have pulled in more data from
  /// their inputs, transformed it, and mixed together into a single buffer, a
  /// callback can be fired. This lets an app view the data at the last moment
  /// that it is still a part of this group. It can also change the data in any
  /// way it pleases during this callback, and the mixer will continue as if this
  /// data came directly from the group's mix buffer.
  ///
  /// Each group has its own unique callback. Tracks that aren't in an explicit
  /// MIX_Group are mixed in an internal grouping that is not available to the
  /// app.
  ///
  /// Passing a NULL callback here is legal; it disables this group's callback.
  ///
  /// \param group the mixing group to assign this callback to.
  /// \param cb the function to call when the group mixes. May be NULL.
  /// \param userdata an opaque pointer provided to the callback for its own
  /// personal use.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GroupMixCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetGroupPostMixCallback(MIX_Group *group, MIX_GroupMixCallback cb, void *userdata)
  /// ```
  /// {@category mixer}
  bool setPostMixCallback(
    Pointer<NativeFunction<MixGroupMixCallback>> cb,
    Pointer<NativeType> userdata,
  ) => mixSetGroupPostMixCallback(this, cb, userdata);
}
