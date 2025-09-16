// ignore_for_file: avoid_positional_boolean_parameters

part of '../../sdl_mixer.dart';

extension MixTrackPointerEx on Pointer<MixTrack> {
  ///
  /// Destroy the specified track.
  ///
  /// If the track is currently playing, it will be stopped immediately, without
  /// any fadeout. If there is a callback set through
  /// MIX_SetTrackStoppedCallback(), it will _not_ be called.
  ///
  /// If the mixer is currently mixing in another thread, this will block until
  /// it finishes.
  ///
  /// Destroying a NULL MIX_Track is a legal no-op.
  ///
  /// \param track the track to destroy.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL MIX_DestroyTrack(MIX_Track *track)
  /// ```
  /// {@category mixer}
  void destroy() => mixDestroyTrack(this);

  ///
  /// Get the properties associated with a track.
  ///
  /// Currently SDL_mixer assigns no properties of its own to a track, but this
  /// can be a convenient place to store app-specific data.
  ///
  /// A SDL_PropertiesID is created the first time this function is called for a
  /// given track.
  ///
  /// \param track the track to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL MIX_GetTrackProperties(MIX_Track *track)
  /// ```
  /// {@category mixer}
  int getProperties() => mixGetTrackProperties(this);

  ///
  /// Get the MIX_Mixer that owns a MIX_Track.
  ///
  /// This is the mixer pointer that was passed to MIX_CreateTrack().
  ///
  /// \param track the track to query.
  /// \returns the mixer associated with the track, or NULL on error; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Mixer * SDLCALL MIX_GetTrackMixer(MIX_Track *track)
  /// ```
  /// {@category mixer}
  Pointer<MixMixer> getMixer() => mixGetTrackMixer(this);

  ///
  /// Set a MIX_Track's input to a MIX_Audio.
  ///
  /// A MIX_Audio is audio data stored in RAM (possibly still in a compressed
  /// form). One MIX_Audio can be assigned to multiple tracks at once.
  ///
  /// Once a track has a valid input, it can start mixing sound by calling
  /// MIX_PlayTrack(), or possibly MIX_PlayTag().
  ///
  /// Calling this function with a NULL audio input is legal, and removes any
  /// input from the track. If the track was currently playing, the next time the
  /// mixer runs, it'll notice this and mark the track as stopped, calling any
  /// assigned MIX_TrackStoppedCallback.
  ///
  /// It is legal to change the input of a track while it's playing, however some
  /// states, like loop points, may cease to make sense with the new audio. In
  /// such a case, one can call MIX_PlayTrack again to adjust parameters.
  ///
  /// The track will hold a reference to the provided MIX_Audio, so it is safe to
  /// call MIX_DestroyAudio() on it while the track is still using it. The track
  /// will drop its reference (and possibly free the resources) once it is no
  /// longer using the MIX_Audio.
  ///
  /// \param track the track on which to set a new audio input.
  /// \param audio the new audio input to set. May be NULL.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackAudio(MIX_Track *track, MIX_Audio *audio)
  /// ```
  /// {@category mixer}
  bool setAudio(Pointer<MixAudio> audio) => mixSetTrackAudio(this, audio);

  ///
  /// Set a MIX_Track's input to an SDL_AudioStream.
  ///
  /// Using an audio stream allows the application to generate any type of audio,
  /// in any format, possibly procedurally or on-demand, and mix in with all
  /// other tracks.
  ///
  /// When a track uses an audio stream, it will call SDL_GetAudioStreamData as
  /// it needs more audio to mix. The app can either buffer data to the stream
  /// ahead of time, or set a callback on the stream to provide data as needed.
  /// Please refer to SDL's documentation for details.
  ///
  /// A given audio stream may only be assigned to a single track at a time;
  /// duplicate assignments won't return an error, but assigning a stream to
  /// multiple tracks will cause each track to read from the stream arbitrarily,
  /// causing confusion and incorrect mixing.
  ///
  /// Once a track has a valid input, it can start mixing sound by calling
  /// MIX_PlayTrack(), or possibly MIX_PlayTag().
  ///
  /// Calling this function with a NULL audio stream is legal, and removes any
  /// input from the track. If the track was currently playing, the next time the
  /// mixer runs, it'll notice this and mark the track as stopped, calling any
  /// assigned MIX_TrackStoppedCallback.
  ///
  /// It is legal to change the input of a track while it's playing, however some
  /// states, like loop points, may cease to make sense with the new audio. In
  /// such a case, one can call MIX_PlayTrack again to adjust parameters.
  ///
  /// The provided audio stream must remain valid until the track no longer needs
  /// it (either by changing the track's input or destroying the track).
  ///
  /// \param track the track on which to set a new audio input.
  /// \param stream the audio stream to use as the track's input.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackAudioStream(MIX_Track *track, SDL_AudioStream *stream)
  /// ```
  /// {@category mixer}
  bool setAudioStream(Pointer<SdlAudioStream> stream) =>
      mixSetTrackAudioStream(this, stream);

  ///
  /// Set a MIX_Track's input to an SDL_IOStream.
  ///
  /// This is not the recommended way to set a track's input, but this can be
  /// useful for a very specific scenario: a large file, to be played once, that
  /// must be read from disk in small chunks as needed. In most cases, however,
  /// it is preferable to create a MIX_Audio ahead of time and use
  /// MIX_SetTrackAudio() instead.
  ///
  /// The stream supplied here should provide an audio file in a supported
  /// format. SDL_mixer will parse it during this call to make sure it's valid,
  /// and then will read file data from the stream as it needs to decode more
  /// during mixing.
  ///
  /// The stream must be able to seek through the complete set of data, or this
  /// function will fail.
  ///
  /// A given IOStream may only be assigned to a single track at a time;
  /// duplicate assignments won't return an error, but assigning a stream to
  /// multiple tracks will cause each track to read from the stream arbitrarily,
  /// causing confusion, incorrect mixing, or failure to decode.
  ///
  /// Once a track has a valid input, it can start mixing sound by calling
  /// MIX_PlayTrack(), or possibly MIX_PlayTag().
  ///
  /// Calling this function with a NULL stream is legal, and removes any input
  /// from the track. If the track was currently playing, the next time the mixer
  /// runs, it'll notice this and mark the track as stopped, calling any assigned
  /// MIX_TrackStoppedCallback.
  ///
  /// It is legal to change the input of a track while it's playing, however some
  /// states, like loop points, may cease to make sense with the new audio. In
  /// such a case, one can call MIX_PlayTrack again to adjust parameters.
  ///
  /// The provided stream must remain valid until the track no longer needs it
  /// (either by changing the track's input or destroying the track).
  ///
  /// \param track the track on which to set a new audio input.
  /// \param io the new i/o stream to use as the track's input.
  /// \param closeio if true, close the stream when done with it.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_SetTrackRawIOStream
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackIOStream(MIX_Track *track, SDL_IOStream *io, bool closeio)
  /// ```
  /// {@category mixer}
  bool setIoStream(Pointer<SdlIoStream> io, bool closeio) =>
      mixSetTrackIoStream(this, io, closeio);

  ///
  /// Assign an arbitrary tag to a track.
  ///
  /// A tag can be any valid C string in UTF-8 encoding. It can be useful to
  /// group tracks in various ways. For example, everything in-game might be
  /// marked as "game", so when the user brings up the settings menu, the app can
  /// pause all tracks involved in gameplay at once, but keep background music
  /// and menu sound effects running.
  ///
  /// A track can have as many tags as desired, until the machine runs out of
  /// memory.
  ///
  /// It's legal to add the same tag to a track more than once; the extra
  /// attempts will report success but not change anything.
  ///
  /// Tags can later be removed with MIX_UntagTrack().
  ///
  /// \param track the track to add a tag to.
  /// \param tag the tag to add.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_UntagTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_TagTrack(MIX_Track *track, const char *tag)
  /// ```
  /// {@category mixer}
  bool tag(String? tag) => mixTagTrack(this, tag);

  ///
  /// Remove an arbitrary tag from a track.
  ///
  /// A tag can be any valid C string in UTF-8 encoding. It can be useful to
  /// group tracks in various ways. For example, everything in-game might be
  /// marked as "game", so when the user brings up the settings menu, the app can
  /// pause all tracks involved in gameplay at once, but keep background music
  /// and menu sound effects running.
  ///
  /// It's legal to remove a tag that the track doesn't have; this function
  /// doesn't report errors, so this simply does nothing.
  ///
  /// \param track the track from which to remove a tag.
  /// \param tag the tag to remove.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_TagTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL MIX_UntagTrack(MIX_Track *track, const char *tag)
  /// ```
  /// {@category mixer}
  void untag(String? tag) => mixUntagTrack(this, tag);

  ///
  /// Seek a playing track to a new position in its input.
  ///
  /// (Not to be confused with MIX_SetTrack3DPosition(), which is positioning of
  /// the track in 3D space, not the playback position of its audio data.)
  ///
  /// On a playing track, the next time the mixer runs, it will start mixing from
  /// the new position.
  ///
  /// Position is defined in _sample frames_ of decoded audio, not units of time,
  /// so that sample-perfect mixing can be achieved. To instead operate in units
  /// of time, use MIX_TrackMSToFrames() to get the approximate sample frames for
  /// a given tick.
  ///
  /// This function requires an input that can seek (so it can not be used if the
  /// input was set with MIX_SetTrackAudioStream()), and a audio file format that
  /// allows seeking. SDL_mixer's decoders for some file formats do not offer
  /// seeking, or can only seek to times, not exact sample frames, in which case
  /// the final position may be off by some amount of sample frames. Please check
  /// your audio data and file bug reports if appropriate.
  ///
  /// It's legal to call this function on a track that is stopped, but a future
  /// call to MIX_PlayTrack() will reset the start position anyhow. Paused tracks
  /// will resume at the new input position.
  ///
  /// \param track the track to change.
  /// \param frames the sample frame position to seek to.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetTrackPlaybackPosition
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackPlaybackPosition(MIX_Track *track, Sint64 frames)
  /// ```
  /// {@category mixer}
  bool setPlaybackPosition(int frames) =>
      mixSetTrackPlaybackPosition(this, frames);

  ///
  /// Get the current input position of a playing track.
  ///
  /// (Not to be confused with MIX_GetTrack3DPosition(), which is positioning of
  /// the track in 3D space, not the playback position of its audio data.)
  ///
  /// Position is defined in _sample frames_ of decoded audio, not units of time,
  /// so that sample-perfect mixing can be achieved. To instead operate in units
  /// of time, use MIX_TrackFramesToMS() to convert the return value to
  /// milliseconds.
  ///
  /// Stopped and paused tracks will report the position when they halted.
  /// Playing tracks will report the current position, which will change over
  /// time.
  ///
  /// \param track the track to change.
  /// \returns the track's current sample frame position, or -1 on error; call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_SetTrackPlaybackPosition
  ///
  /// ```c
  /// extern SDL_DECLSPEC Sint64 SDLCALL MIX_GetTrackPlaybackPosition(MIX_Track *track)
  /// ```
  /// {@category mixer}
  int getPlaybackPosition() => mixGetTrackPlaybackPosition(this);

  ///
  /// Query whether a given track is looping.
  ///
  /// This specifically checks if the track is _not stopped_ (paused or playing),
  /// and there is at least one loop remaining. If a track _was_ looping but is
  /// on its final iteration of the loop, this will return false.
  ///
  /// On various errors (MIX_Init() was not called, the track is NULL), this
  /// returns false, but there is no mechanism to distinguish errors from
  /// non-looping tracks.
  ///
  /// \param track the track to query.
  /// \returns true if looping, false otherwise.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_TrackLooping(MIX_Track *track)
  /// ```
  /// {@category mixer}
  bool looping() => mixTrackLooping(this);

  ///
  /// Query the MIX_Audio assigned to a track.
  ///
  /// This returns the MIX_Audio object currently assigned to `track` through a
  /// call to MIX_SetTrackAudio(). If there is none assigned, or the track has an
  /// input that isn't a MIX_Audio (such as an SDL_AudioStream or SDL_IOStream),
  /// this will return NULL.
  ///
  /// On various errors (MIX_Init() was not called, the track is NULL), this
  /// returns NULL, but there is no mechanism to distinguish errors from tracks
  /// without a valid input.
  ///
  /// \param track the track to query.
  /// \returns a MIX_Audio if available, NULL if not.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetTrackAudioStream
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Audio * SDLCALL MIX_GetTrackAudio(MIX_Track *track)
  /// ```
  /// {@category mixer}
  Pointer<MixAudio> getAudio() => mixGetTrackAudio(this);

  ///
  /// Query the SDL_AudioStream assigned to a track.
  ///
  /// This returns the SDL_AudioStream object currently assigned to `track`
  /// through a call to MIX_SetTrackAudioStream(). If there is none assigned, or
  /// the track has an input that isn't an SDL_AudioStream (such as a MIX_Audio
  /// or SDL_IOStream), this will return NULL.
  ///
  /// On various errors (MIX_Init() was not called, the track is NULL), this
  /// returns NULL, but there is no mechanism to distinguish errors from tracks
  /// without a valid input.
  ///
  /// \param track the track to query.
  /// \returns an SDL_AudioStream if available, NULL if not.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetTrackAudio
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_AudioStream * SDLCALL MIX_GetTrackAudioStream(MIX_Track *track)
  /// ```
  /// {@category mixer}
  Pointer<SdlAudioStream> getAudioStream() => mixGetTrackAudioStream(this);

  ///
  /// Return the number of sample frames remaining to be mixed in a track.
  ///
  /// If the track is playing or paused, and its total duration is known, this
  /// will report how much audio is left to mix. If the track is playing, future
  /// calls to this function will report different values.
  ///
  /// Remaining audio is defined in _sample frames_ of decoded audio, not units
  /// of time, so that sample-perfect mixing can be achieved. To instead operate
  /// in units of time, use MIX_TrackFramesToMS() to convert the return value to
  /// milliseconds.
  ///
  /// This function does not take into account fade-outs or looping, just the
  /// current mixing position vs the duration of the track.
  ///
  /// If the duration of the track isn't known, or `track` is NULL, this function
  /// returns -1. A stopped track reports 0.
  ///
  /// \param track the track to query.
  /// \returns the total sample frames still to be mixed, or -1 if unknown.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC Sint64 SDLCALL MIX_GetTrackRemaining(MIX_Track *track)
  /// ```
  /// {@category mixer}
  int getRemaining() => mixGetTrackRemaining(this);

  ///
  /// Convert milliseconds to sample frames for a track's current format.
  ///
  /// This calculates time based on the track's current input format, which can
  /// change when its input does, and also if that input changes formats
  /// mid-stream (for example, if decoding a file that is two MP3s concatenated
  /// together).
  ///
  /// On various errors (MIX_Init() was not called, the track is NULL), this
  /// returns -1. If the track has no input, this returns -1. If `ms` is < 0,
  /// this returns -1.
  ///
  /// \param track the track to query.
  /// \param ms the milliseconds to convert to track-specific sample frames.
  /// \returns Converted number of sample frames, or -1 for errors/no input; call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_TrackFramesToMS
  ///
  /// ```c
  /// extern SDL_DECLSPEC Sint64 SDLCALL MIX_TrackMSToFrames(MIX_Track *track, Sint64 ms)
  /// ```
  /// {@category mixer}
  int msToFrames(int ms) => mixTrackMsToFrames(this, ms);

  ///
  /// Convert sample frames for a track's current format to milliseconds.
  ///
  /// This calculates time based on the track's current input format, which can
  /// change when its input does, and also if that input changes formats
  /// mid-stream (for example, if decoding a file that is two MP3s concatenated
  /// together).
  ///
  /// Sample frames are more precise than milliseconds, so out of necessity, this
  /// function will approximate by rounding down to the closest full millisecond.
  ///
  /// On various errors (MIX_Init() was not called, the track is NULL), this
  /// returns -1. If the track has no input, this returns -1. If `frames` is < 0,
  /// this returns -1.
  ///
  /// \param track the track to query.
  /// \param frames the track-specific sample frames to convert to milliseconds.
  /// \returns Converted number of milliseconds, or -1 for errors/no input; call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_TrackMSToFrames
  ///
  /// ```c
  /// extern SDL_DECLSPEC Sint64 SDLCALL MIX_TrackFramesToMS(MIX_Track *track, Sint64 frames)
  /// ```
  /// {@category mixer}
  int framesToMs(int frames) => mixTrackFramesToMs(this, frames);

  ///
  /// Start (or restart) mixing a track for playback.
  ///
  /// The track will use whatever input was last assigned to it when playing; an
  /// input must be assigned to this track or this function will fail. Inputs are
  /// assigned with calls to MIX_SetTrackAudio(), MIX_SetTrackAudioStream(), or
  /// MIX_SetTrackIOStream().
  ///
  /// If the track is already playing, or paused, this will restart the track
  /// with the newly-specified parameters.
  ///
  /// As there are several parameters, and more may be added in the future, they
  /// are specified with an SDL_PropertiesID. The parameters have reasonable
  /// defaults, and specifying a 0 for `options` will choose defaults for
  /// everything.
  ///
  /// These are the supported properties:
  ///
  /// - `MIX_PROP_PLAY_LOOPS_NUMBER`: The number of times to loop the track when
  /// it reaches the end. A value of 1 will loop to the start one time. Zero
  /// will not loop at all. A value of -1 requests infinite loops. If the input
  /// is not seekable and this value isn't zero, this function will report
  /// success but the track will stop at the point it should loop. Default 0.
  /// - `MIX_PROP_PLAY_MAX_FRAME_NUMBER`: Mix at most to this sample frame
  /// position in the track. This will be treated as if the input reach EOF at
  /// this point in the audio file. If -1, mix all available audio without a
  /// limit. Default -1.
  /// - `MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER`: The same as using the
  /// MIX_PROP_PLAY_MAX_FRAME_NUMBER property, but the value is specified in
  /// milliseconds instead of sample frames. If both properties are specified,
  /// the sample frames value is favored. Default -1.
  /// - `MIX_PROP_PLAY_START_FRAME_NUMBER`: Start mixing from this sample frame
  /// position in the track's input. A value <= 0 will begin from the start of
  /// the track's input. If the input is not seekable and this value is > 0,
  /// this function will report failure. Default 0.
  /// - `MIX_PROP_PLAY_START_MILLISECOND_NUMBER`: The same as using the
  /// MIX_PROP_PLAY_START_FRAME_NUMBER property, but the value is specified in
  /// milliseconds instead of sample frames. If both properties are specified,
  /// the sample frames value is favored. Default 0.
  /// - `MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER`: If the track is looping, this is
  /// the sample frame position that the track will loop back to; this lets one
  /// play an intro at the start of a track on the first iteration, but have a
  /// loop point somewhere in the middle thereafter. A value <= 0 will begin
  /// the loop from the start of the track's input. Default 0.
  /// - `MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER`: The same as using the
  /// MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER property, but the value is
  /// specified in milliseconds instead of sample frames. If both properties
  /// are specified, the sample frames value is favored. Default 0.
  /// - `MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER`: The number of sample frames over
  /// which to fade in the newly-started track. The track will begin mixing
  /// silence and reach full volume smoothly over this many sample frames. If
  /// the track loops before the fade-in is complete, it will continue to fade
  /// correctly from the loop point. A value <= 0 will disable fade-in, so the
  /// track starts mixing at full volume. Default 0.
  /// - `MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER`: The same as using the
  /// MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER property, but the value is specified
  /// in milliseconds instead of sample frames. If both properties are
  /// specified, the sample frames value is favored. Default 0.
  /// - `MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER`: At the end of mixing this
  /// track, after all loops are complete, append this many sample frames of
  /// silence as if it were part of the audio file. This allows for apps to
  /// implement effects in callbacks, like reverb, that need to generate
  /// samples past the end of the stream's audio, or perhaps introduce a delay
  /// before starting a new sound on the track without having to manage it
  /// directly. A value <= 0 generates no silence before stopping the track.
  /// Default 0.
  /// - `MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER`: The same as using the
  /// MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER property, but the value is
  /// specified in milliseconds instead of sample frames. If both properties
  /// are specified, the sample frames value is favored. Default 0.
  ///
  /// If this function fails, mixing of this track will not start (or restart, if
  /// it was already started).
  ///
  /// \param track the track to start (or restart) mixing.
  /// \param options a set of properties that control playback. May be zero.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PlayTag
  /// \sa MIX_PlayAudio
  /// \sa MIX_StopTrack
  /// \sa MIX_PauseTrack
  /// \sa MIX_TrackPlaying
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_PlayTrack(MIX_Track *track, SDL_PropertiesID options)
  /// ```
  /// {@category mixer}
  bool play(int options) => mixPlayTrack(this, options);

  ///
  /// Halt a currently-playing track, possibly fading out over time.
  ///
  /// If `fade_out_frames` is > 0, the track does not stop mixing immediately,
  /// but rather fades to silence over that many sample frames before stopping.
  /// Sample frames are specific to the input assigned to the track, to allow for
  /// sample-perfect mixing. MIX_TrackMSToFrames() can be used to convert
  /// milliseconds to an appropriate value here.
  ///
  /// If the track ends normally while the fade-out is still in progress, the
  /// audio stops there; the fade is not adjusted to be shorter if it will last
  /// longer than the audio remaining.
  ///
  /// Once a track has completed any fadeout and come to a stop, it will call its
  /// MIX_TrackStoppedCallback, if any. It is legal to assign the track a new
  /// input and/or restart it during this callback.
  ///
  /// It is legal to halt a track that's already stopped. It does nothing, and
  /// returns true.
  ///
  /// \param track the track to halt.
  /// \param fade_out_frames the number of sample frames to spend fading out to
  /// silence before halting. 0 to stop immediately.
  /// \returns true if the track has stopped, false on error; call SDL_GetError()
  /// for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PlayTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_StopTrack(MIX_Track *track, Sint64 fade_out_frames)
  /// ```
  /// {@category mixer}
  bool stop(int fadeOutFrames) => mixStopTrack(this, fadeOutFrames);

  ///
  /// Pause a currently-playing track.
  ///
  /// A paused track is not considered "stopped," so its MIX_TrackStoppedCallback
  /// will not fire if paused, but it won't change state by default, generate
  /// audio, or generally make progress, until it is resumed.
  ///
  /// It is legal to pause a track that's in any state (playing, already paused,
  /// or stopped). Unless the track is currently playing, pausing does nothing,
  /// and returns true. A false return is only used to signal errors here (such
  /// as MIX_Init not being called or `track` being NULL).
  ///
  /// \param track the track to pause.
  /// \returns true if the track has paused, false on error; call SDL_GetError()
  /// for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_ResumeTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_PauseTrack(MIX_Track *track)
  /// ```
  /// {@category mixer}
  bool pause() => mixPauseTrack(this);

  ///
  /// Resume a currently-paused track.
  ///
  /// A paused track is not considered "stopped," so its MIX_TrackStoppedCallback
  /// will not fire if paused, but it won't change state by default, generate
  /// audio, or generally make progress, until it is resumed.
  ///
  /// It is legal to resume a track that's in any state (playing, paused, or
  /// stopped). Unless the track is currently paused, resuming does nothing, and
  /// returns true. A false return is only used to signal errors here (such as
  /// MIX_Init not being called or `track` being NULL).
  ///
  /// \param track the track to resume.
  /// \returns true if the track has resumed, false on error; call SDL_GetError()
  /// for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PauseTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_ResumeTrack(MIX_Track *track)
  /// ```
  /// {@category mixer}
  bool resume() => mixResumeTrack(this);

  ///
  /// Query if a track is currently playing.
  ///
  /// If this returns true, the track is currently contributing to the mixer's
  /// output (it's "playing"). It is not stopped nor paused.
  ///
  /// On various errors (MIX_Init() was not called, the track is NULL), this
  /// returns false, but there is no mechanism to distinguish errors from
  /// non-playing tracks.
  ///
  /// \param track the track to query.
  /// \returns true if playing, false otherwise.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PlayTrack
  /// \sa MIX_PauseTrack
  /// \sa MIX_ResumeTrack
  /// \sa MIX_StopTrack
  /// \sa MIX_TrackPaused
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_TrackPlaying(MIX_Track *track)
  /// ```
  /// {@category mixer}
  bool playing() => mixTrackPlaying(this);

  ///
  /// Query if a track is currently paused.
  ///
  /// If this returns true, the track is not currently contributing to the
  /// mixer's output but will when resumed (it's "paused"). It is not playing nor
  /// stopped.
  ///
  /// On various errors (MIX_Init() was not called, the track is NULL), this
  /// returns false, but there is no mechanism to distinguish errors from
  /// non-playing tracks.
  ///
  /// \param track the track to query.
  /// \returns true if paused, false otherwise.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PlayTrack
  /// \sa MIX_PauseTrack
  /// \sa MIX_ResumeTrack
  /// \sa MIX_StopTrack
  /// \sa MIX_TrackPlaying
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_TrackPaused(MIX_Track *track)
  /// ```
  /// {@category mixer}
  bool paused() => mixTrackPaused(this);

  ///
  /// Set a track's gain control.
  ///
  /// Each track has its own gain, to adjust its overall volume. Each sample from
  /// this track is modulated by this gain value. A gain of zero will generate
  /// silence, 1.0f will not change the mixed volume, and larger than 1.0f will
  /// increase the volume. Negative values are illegal. There is no maximum gain
  /// specified, but this can quickly get extremely loud, so please be careful
  /// with this setting.
  ///
  /// A track's gain defaults to 1.0f.
  ///
  /// This value can be changed at any time to adjust the future mix.
  ///
  /// \param track the track to adjust.
  /// \param gain the new gain value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetTrackGain
  /// \sa MIX_SetMasterGain
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackGain(MIX_Track *track, float gain)
  /// ```
  /// {@category mixer}
  bool setGain(double gain) => mixSetTrackGain(this, gain);

  ///
  /// Get a track's gain control.
  ///
  /// This returns the last value set through MIX_SetTrackGain(), or 1.0f if no
  /// value has ever been explicitly set.
  ///
  /// \param track the track to query.
  /// \returns the track's current gain.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_SetTrackGain
  /// \sa MIX_GetMasterGain
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL MIX_GetTrackGain(MIX_Track *track)
  /// ```
  /// {@category mixer}
  double getGain() => mixGetTrackGain(this);

  ///
  /// Change the frequency ratio of a track.
  ///
  /// The frequency ratio is used to adjust the rate at which audio data is
  /// consumed. Changing this effectively modifies the speed and pitch of the
  /// track's audio. A value greater than 1.0f will play the audio faster, and at
  /// a higher pitch. A value less than 1.0f will play the audio slower, and at a
  /// lower pitch. 1.0f is normal speed.
  ///
  /// The default value is 1.0f.
  ///
  /// This value can be changed at any time to adjust the future mix.
  ///
  /// \param track the track on which to change the frequency ratio.
  /// \param ratio the frequency ratio. Must be between 0.01f and 100.0f.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetTrackFrequencyRatio
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackFrequencyRatio(MIX_Track *track, float ratio)
  /// ```
  /// {@category mixer}
  bool setFrequencyRatio(double ratio) =>
      mixSetTrackFrequencyRatio(this, ratio);

  ///
  /// Query the frequency ratio of a track.
  ///
  /// The frequency ratio is used to adjust the rate at which audio data is
  /// consumed. Changing this effectively modifies the speed and pitch of the
  /// track's audio. A value greater than 1.0f will play the audio faster, and at
  /// a higher pitch. A value less than 1.0f will play the audio slower, and at a
  /// lower pitch. 1.0f is normal speed.
  ///
  /// The default value is 1.0f.
  ///
  /// On various errors (MIX_Init() was not called, the track is NULL), this
  /// returns 0.0f. Since this is not a valid value to set, this can be seen as
  /// an error state.
  ///
  /// \param track the track on which to query the frequency ratio.
  /// \returns the current frequency ratio, or 0.0f on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetTrackFrequencyRatio
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL MIX_GetTrackFrequencyRatio(MIX_Track *track)
  /// ```
  /// {@category mixer}
  double getFrequencyRatio() => mixGetTrackFrequencyRatio(this);

  ///
  /// Set the current output channel map of a track.
  ///
  /// Channel maps are optional; most things do not need them, instead passing
  /// data in the order that SDL expects.
  ///
  /// The output channel map reorders track data after transformations and before
  /// it is mixed into a mixer group. This can be useful for reversing stereo
  /// channels, for example.
  ///
  /// Each item in the array represents an input channel, and its value is the
  /// channel that it should be remapped to. To reverse a stereo signal's left
  /// and right values, you'd have an array of `{ 1, 0 }`. It is legal to remap
  /// multiple channels to the same thing, so `{ 1, 1 }` would duplicate the
  /// right channel to both channels of a stereo signal. An element in the
  /// channel map set to -1 instead of a valid channel will mute that channel,
  /// setting it to a silence value.
  ///
  /// You cannot change the number of channels through a channel map, just
  /// reorder/mute them.
  ///
  /// Tracks default to no remapping applied. Passing a NULL channel map is
  /// legal, and turns off remapping.
  ///
  /// SDL_mixer will copy the channel map; the caller does not have to save this
  /// array after this call.
  ///
  /// \param track the track to change.
  /// \param chmap the new channel map, NULL to reset to default.
  /// \param count The number of channels in the map.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackOutputChannelMap(MIX_Track *track, const int *chmap, int count)
  /// ```
  /// {@category mixer}
  bool setOutputChannelMap(Pointer<Int32> chmap, int count) =>
      mixSetTrackOutputChannelMap(this, chmap, count);

  ///
  /// Force a track to stereo output, with optionally left/right panning.
  ///
  /// This will cause the output of the track to convert to stereo, and then mix
  /// it only onto the Front Left and Front Right speakers, regardless of the
  /// speaker configuration. The left and right channels are modulated by
  /// `gains`, which can be used to produce panning effects. This function may be
  /// called to adjust the gains at any time.
  ///
  /// If `gains` is not NULL, this track will be switched into forced-stereo
  /// mode. If `gains` is NULL, this will disable spatialization (both the
  /// forced-stereo mode of this function and full 3D spatialization of
  /// MIX_SetTrack3DPosition()).
  ///
  /// Negative gains are clamped to zero; there is no clamp for maximum, so one
  /// could set the value > 1.0f to make a channel louder.
  ///
  /// The track's 3D position, reported by MIX_GetTrack3DPosition(), will be
  /// reset to (0, 0, 0).
  ///
  /// \param track the track to adjust.
  /// \param gains the per-channel gains, or NULL to disable spatialization.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_SetTrack3DPosition
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackStereo(MIX_Track *track, const MIX_StereoGains *gains)
  /// ```
  /// {@category mixer}
  bool setStereo(Pointer<MixStereoGains> gains) =>
      mixSetTrackStereo(this, gains);

  ///
  /// Set a track's position in 3D space.
  ///
  /// (Please note that SDL_mixer is not intended to be a extremely powerful 3D
  /// API. It lacks 3D features that other APIs like OpenAL offer: there's no
  /// doppler effect, distance models, rolloff, etc. This is meant to be Good
  /// Enough for games that can use some positional sounds and can even take
  /// advantage of surround-sound configurations.)
  ///
  /// If `position` is not NULL, this track will be switched into 3D positional
  /// mode. If `position` is NULL, this will disable positional mixing (both the
  /// full 3D spatialization of this function and forced-stereo mode of
  /// MIX_SetTrackStereo()).
  ///
  /// In 3D positional mode, SDL_mixer will mix this track as if it were
  /// positioned in 3D space, including distance attenuation (quieter as it gets
  /// further from the listener) and spatialization (positioned on the correct
  /// speakers to suggest direction, either with stereo outputs or full surround
  /// sound).
  ///
  /// For a mono speaker output, spatialization is effectively disabled but
  /// distance attenuation will still work, which is all you can really do with a
  /// single speaker.
  ///
  /// The coordinate system operates like OpenGL or OpenAL: a "right-handed"
  /// coordinate system. See MIX_Point3D for the details.
  ///
  /// The listener is always at coordinate (0,0,0) and can't be changed.
  ///
  /// The track's input will be converted to mono (1 channel) so it can be
  /// rendered across the correct speakers.
  ///
  /// \param track the track for which to set 3D position.
  /// \param position the new 3D position for the track. May be NULL.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetTrack3DPosition
  /// \sa MIX_SetTrackStereo
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrack3DPosition(MIX_Track *track, const MIX_Point3D *position)
  /// ```
  /// {@category mixer}
  bool set3DPosition(Pointer<MixPoint3D> position) =>
      mixSetTrack3DPosition(this, position);

  ///
  /// Get a track's current position in 3D space.
  ///
  /// If 3D positioning isn't enabled for this track, through a call to
  /// MIX_SetTrack3DPosition(), this will return (0,0,0).
  ///
  /// \param track the track to query.
  /// \param position on successful return, will contain the track's position.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_SetTrack3DPosition
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_GetTrack3DPosition(MIX_Track *track, MIX_Point3D *position)
  /// ```
  /// {@category mixer}
  bool get3DPosition(Pointer<MixPoint3D> position) =>
      mixGetTrack3DPosition(this, position);

  ///
  /// Assign a track to a mixing group.
  ///
  /// All tracks in a group are mixed together, and that output is made available
  /// to the app before it is mixed into the final output.
  ///
  /// Tracks can only be in one group at a time, and the track and group must
  /// have been created on the same MIX_Mixer.
  ///
  /// Setting a track to a NULL group will remove it from any app-created groups,
  /// and reassign it to the mixer's internal default group.
  ///
  /// \param track the track to set mixing group assignment.
  /// \param group the new mixing group to assign to. May be NULL.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_CreateGroup
  /// \sa MIX_SetGroupPostMixCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackGroup(MIX_Track *track, MIX_Group *group)
  /// ```
  /// {@category mixer}
  bool setGroup(Pointer<MixGroup> group) => mixSetTrackGroup(this, group);

  ///
  /// Set a callback that fires when a MIX_Track is stopped.
  ///
  /// When a track completes playback, either because it ran out of data to mix
  /// (and all loops were completed as well), or it was explicitly stopped by the
  /// app, it will fire the callback specified here.
  ///
  /// Each track has its own unique callback.
  ///
  /// Passing a NULL callback here is legal; it disables this track's callback.
  ///
  /// Pausing a track will not fire the callback, nor will the callback fire on a
  /// playing track that is being destroyed.
  ///
  /// It is legal to adjust the track, including changing its input and
  /// restarting it. If this is done because it ran out of data in the middle of
  /// mixing, the mixer will start mixing the new track state in its current run
  /// without any gap in the audio.
  ///
  /// \param track the track to assign this callback to.
  /// \param cb the function to call when the track stops. May be NULL.
  /// \param userdata an opaque pointer provided to the callback for its own
  /// personal use.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_TrackStoppedCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackStoppedCallback(MIX_Track *track, MIX_TrackStoppedCallback cb, void *userdata)
  /// ```
  /// {@category mixer}
  bool setStoppedCallback(
    Pointer<NativeFunction<MixTrackStoppedCallback>> cb,
    Pointer<NativeType> userdata,
  ) => mixSetTrackStoppedCallback(this, cb, userdata);

  ///
  /// Set a callback that fires when a MIX_Track has initial decoded audio.
  ///
  /// As a track needs to mix more data, it pulls from its input (a MIX_Audio, an
  /// SDL_AudioStream, etc). This input might be a compressed file format, like
  /// MP3, so a little more data is uncompressed from it.
  ///
  /// Once the track has PCM data to start operating on, it can fire a callback
  /// before _any_ changes to the raw PCM input have happened. This lets an app
  /// view the data before it has gone through transformations such as gain, 3D
  /// positioning, fading, etc. It can also change the data in any way it pleases
  /// during this callback, and the mixer will continue as if this data came
  /// directly from the input.
  ///
  /// Each track has its own unique raw callback.
  ///
  /// Passing a NULL callback here is legal; it disables this track's callback.
  ///
  /// \param track the track to assign this callback to.
  /// \param cb the function to call when the track mixes. May be NULL.
  /// \param userdata an opaque pointer provided to the callback for its own
  /// personal use.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_TrackMixCallback
  /// \sa MIX_SetTrackCookedCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackRawCallback(MIX_Track *track, MIX_TrackMixCallback cb, void *userdata)
  /// ```
  /// {@category mixer}
  bool setRawCallback(
    Pointer<NativeFunction<MixTrackMixCallback>> cb,
    Pointer<NativeType> userdata,
  ) => mixSetTrackRawCallback(this, cb, userdata);

  ///
  /// Set a callback that fires when the mixer has transformed a track's audio.
  ///
  /// As a track needs to mix more data, it pulls from its input (a MIX_Audio, an
  /// SDL_AudioStream, etc). This input might be a compressed file format, like
  /// MP3, so a little more data is uncompressed from it.
  ///
  /// Once the track has PCM data to start operating on, and its raw callback has
  /// completed, it will begin to transform the audio: gain, fading, frequency
  /// ratio, 3D positioning, etc.
  ///
  /// A callback can be fired after all these transformations, but before the
  /// transformed data is mixed into other tracks. This lets an app view the data
  /// at the last moment that it is still a part of this track. It can also
  /// change the data in any way it pleases during this callback, and the mixer
  /// will continue as if this data came directly from the input.
  ///
  /// Each track has its own unique cooked callback.
  ///
  /// Passing a NULL callback here is legal; it disables this track's callback.
  ///
  /// \param track the track to assign this callback to.
  /// \param cb the function to call when the track mixes. May be NULL.
  /// \param userdata an opaque pointer provided to the callback for its own
  /// personal use.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_TrackMixCallback
  /// \sa MIX_SetTrackRawCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackCookedCallback(MIX_Track *track, MIX_TrackMixCallback cb, void *userdata)
  /// ```
  /// {@category mixer}
  bool setCookedCallback(
    Pointer<NativeFunction<MixTrackMixCallback>> cb,
    Pointer<NativeType> userdata,
  ) => mixSetTrackCookedCallback(this, cb, userdata);
}
