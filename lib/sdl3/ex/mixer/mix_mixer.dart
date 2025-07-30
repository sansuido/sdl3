// ignore_for_file: avoid_positional_boolean_parameters

part of '../../sdl_mixer.dart';

extension MixMixerEx on MixMixer {
  ///
  /// Create a mixer that plays sound directly to an audio device.
  ///
  /// This is usually the function you want, vs MIX_CreateMixer().
  ///
  /// You can choose a specific device ID to open, following SDL's usual rules,
  /// but often the correct choice is to specify
  /// SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK and let SDL figure out what device to use
  /// (and seamlessly transition you to new hardware if the default changes).
  ///
  /// Only playback devices make sense here. Attempting to open a recording
  /// device will fail.
  ///
  /// This will call SDL_Init(SDL_INIT_AUDIO) internally; it's safe to call
  /// SDL_Init() before this call, too, if you intend to enumerate audio devices
  /// to choose one to open here.
  ///
  /// An audio format can be requested, and the system will try to set the
  /// hardware to those specifications, or as close as possible, but this is just
  /// a hint. SDL_mixer will handle all data conversion behind the scenes in any
  /// case, and specifying a NULL spec is a reasonable choice. The best reason to
  /// specify a format is because you know all your data is in that format and it
  /// might save some unnecessary CPU time on conversion.
  ///
  /// The actual device format chosen is available through MIX_GetMixerFormat().
  ///
  /// Once a mixer is created, next steps are usually to load audio (through
  /// MIX_LoadAudio() and friends), create a track (MIX_CreateTrack()), and play
  /// that audio through that track.
  ///
  /// When done with the mixer, it can be destroyed with MIX_DestroyMixer().
  ///
  /// \param devid the device to open for playback, or
  /// SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK for the default.
  /// \param spec the audio format request from the device. May be NULL.
  /// \returns a mixer that can be used to play audio, or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_CreateMixer
  /// \sa MIX_DestroyMixer
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Mixer * SDLCALL MIX_CreateMixerDevice(SDL_AudioDeviceID devid, const SDL_AudioSpec *spec)
  /// ```
  /// {@category mixer}
  static Pointer<MixMixer> createDevice(
    int devid,
    Pointer<SdlAudioSpec> spec,
  ) => mixCreateMixerDevice(devid, spec);

  ///
  /// Create a mixer that generates audio to a memory buffer.
  ///
  /// Usually you want MIX_CreateMixerDevice() instead of this function. The
  /// mixer created here can be used with MIX_Generate() to produce more data on
  /// demand, as fast as desired.
  ///
  /// An audio format must be specified. This is the format it will output in.
  /// This cannot be NULL.
  ///
  /// Once a mixer is created, next steps are usually to load audio (through
  /// MIX_LoadAudio() and friends), create a track (MIX_CreateTrack()), and play
  /// that audio through that track.
  ///
  /// When done with the mixer, it can be destroyed with MIX_DestroyMixer().
  ///
  /// \param spec the audio format that mixer will generate.
  /// \returns a mixer that can be used to generate audio, or NULL on failure;
  /// call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_CreateMixerDevice
  /// \sa MIX_DestroyMixer
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Mixer * SDLCALL MIX_CreateMixer(const SDL_AudioSpec *spec)
  /// ```
  /// {@category mixer}
  static Pointer<MixMixer> create(Pointer<SdlAudioSpec> spec) =>
      mixCreateMixer(spec);
}

extension MixMixerPointerEx on Pointer<MixMixer> {
  ///
  /// Free a mixer.
  ///
  /// If this mixer was created with MIX_CreateMixerDevice(), this function will
  /// also close the audio device and call SDL_QuitSubSystem(SDL_INIT_AUDIO).
  ///
  /// Any MIX_Group or MIX_Track created for this mixer will also be destroyed.
  /// Do not access them again or attempt to destroy them after the device is
  /// destroyed. MIX_Audio objects will not be destroyed, since they can be
  /// shared between mixers (but those will all be destroyed during MIX_Quit()).
  ///
  /// \param mixer the mixer to destroy.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_CreateMixerDevice
  /// \sa MIX_CreateMixer
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL MIX_DestroyMixer(MIX_Mixer *mixer)
  /// ```
  /// {@category mixer}
  void destroy() => mixDestroyMixer(this);

  ///
  /// Get the properties associated with a mixer.
  ///
  /// Currently SDL_mixer assigns no properties of its own to a mixer, but this
  /// can be a convenient place to store app-specific data.
  ///
  /// A SDL_PropertiesID is created the first time this function is called for a
  /// given mixer.
  ///
  /// \param mixer the mixer to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL MIX_GetMixerProperties(MIX_Mixer *mixer)
  /// ```
  /// {@category mixer}
  int getProperties() => mixGetMixerProperties(this);

  ///
  /// Get the audio format a mixer is generating.
  ///
  /// Generally you don't need this information, as SDL_mixer will convert data
  /// as necessary between inputs you provide and its output format, but it might
  /// be useful if trying to match your inputs to reduce conversion and
  /// resampling costs.
  ///
  /// For mixers created with MIX_CreateMixerDevice(), this is the format of the
  /// audio device (and may change later if the device itself changes; SDL_mixer
  /// will seamlessly handle this change internally, though).
  ///
  /// For mixers created with MIX_CreateMixer(), this is the format that
  /// MIX_Generate() will produce, as requested at create time, and does not
  /// change.
  ///
  /// Note that internally, SDL_mixer will work in SDL_AUDIO_F32 format before
  /// outputting the format specified here, so it would be more efficient to
  /// match input data to that, not the final output format.
  ///
  /// \param mixer the mixer to query.
  /// \param spec where to store the mixer audio format.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_GetMixerFormat(MIX_Mixer *mixer, SDL_AudioSpec *spec)
  /// ```
  /// {@category mixer}
  bool getFormat(Pointer<SdlAudioSpec> spec) => mixGetMixerFormat(this, spec);

  ///
  /// Load audio for playback from an SDL_IOStream.
  ///
  /// In normal usage, apps should load audio once, maybe at startup, then play
  /// it multiple times.
  ///
  /// When loading audio, it will be cached fully in RAM in its original data
  /// format. Each time it plays, the data will be decoded. For example, an MP3
  /// will be stored in memory in MP3 format and be decompressed on the fly
  /// during playback. This is a tradeoff between i/o overhead and memory usage.
  ///
  /// If `predecode` is true, the data will be decompressed during load and
  /// stored as raw PCM data. This might dramatically increase loading time and
  /// memory usage, but there will be no need to decompress data during playback.
  ///
  /// (One could also use MIX_SetTrackIOStream() to bypass loading the data into
  /// RAM upfront at all, but this offers still different tradeoffs. The correct
  /// approach depends on the app's needs and employing different approaches in
  /// different situations can make sense.)
  ///
  /// MIX_Audio objects can be shared between mixers. This function takes a
  /// MIX_Mixer, to imply this is the most likely place it will be used and
  /// loading should try to match its audio format, but the resulting audio can
  /// be used elsewhere. If `mixer` is NULL, SDL_mixer will set reasonable
  /// defaults.
  ///
  /// Once a MIX_Audio is created, it can be assigned to a MIX_Track with
  /// MIX_SetTrackAudio(), or played without any management with MIX_PlayAudio().
  ///
  /// When done with a MIX_Audio, it can be freed with MIX_DestroyAudio().
  ///
  /// This function loads data from an SDL_IOStream. There is also a version that
  /// loads from a path on the filesystem (MIX_LoadAudio()), and one that accepts
  /// properties for ultimate control (MIX_LoadAudioWithProperties()).
  ///
  /// The SDL_IOStream provided must be able to seek, or loading will fail. If
  /// the stream can't seek (data is coming from an HTTP connection, etc),
  /// consider caching the data to memory or disk first and creating a new stream
  /// to read from there.
  ///
  /// \param mixer a mixer this audio is intended to be used with. May be NULL.
  /// \param io the SDL_IOStream to load data from.
  /// \param predecode if true, data will be fully uncompressed before returning.
  /// \param closeio true if SDL_mixer should close `io` before returning
  /// (success or failure).
  /// \returns an audio object that can be used to make sound on a mixer, or NULL
  /// on failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_DestroyAudio
  /// \sa MIX_SetTrackAudio
  /// \sa MIX_LoadAudio_IO
  /// \sa MIX_LoadAudioWithProperties
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Audio * SDLCALL MIX_LoadAudio_IO(MIX_Mixer *mixer, SDL_IOStream *io, bool predecode, bool closeio)
  /// ```
  /// {@category mixer}
  Pointer<MixAudio> loadAudioIo(
    Pointer<SdlIoStream> io,
    bool predecode,
    bool closeio,
  ) => mixLoadAudioIo(this, io, predecode, closeio);

  ///
  /// Load audio for playback from a file.
  ///
  /// This is equivalent to calling:
  ///
  /// ```c
  /// SDL_LoadAudio_IO(mixer, SDL_IOFromFile(path, "rb"), predecode, true);
  /// ```
  ///
  /// This function loads data from a path on the filesystem. There is also a
  /// version that loads from an SDL_IOStream (MIX_LoadAudio_IO()), and one that
  /// accepts properties for ultimate control (MIX_LoadAudioWithProperties()).
  ///
  /// \param mixer a mixer this audio is intended to be used with. May be NULL.
  /// \param path the path on the filesystem to load data from.
  /// \param predecode if true, data will be fully uncompressed before returning.
  /// \returns an audio object that can be used to make sound on a mixer, or NULL
  /// on failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_DestroyAudio
  /// \sa MIX_SetTrackAudio
  /// \sa MIX_LoadAudio_IO
  /// \sa MIX_LoadAudioWithProperties
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Audio * SDLCALL MIX_LoadAudio(MIX_Mixer *mixer, const char *path, bool predecode)
  /// ```
  /// {@category mixer}
  Pointer<MixAudio> loadAudio(
    Pointer<SdlIoStream> io,
    String? path,
    bool predecode,
  ) => mixLoadAudio(this, path, predecode);

  ///
  /// Load raw PCM data from an SDL_IOStream.
  ///
  /// There are other options for _streaming_ raw PCM: an SDL_AudioStream can be
  /// connected to a track, as can an SDL_IOStream, and will read from those
  /// sources on-demand when it is time to mix the audio. This function is useful
  /// for loading static audio data that is meant to be played multiple times.
  ///
  /// This function will load the raw data in its entirety and cache it in RAM.
  ///
  /// MIX_Audio objects can be shared between multiple mixers. The `mixer`
  /// parameter just suggests the most likely mixer to use this audio, in case
  /// some optimization might be applied, but this is not required, and a NULL
  /// mixer may be specified.
  ///
  /// \param mixer a mixer this audio is intended to be used with. May be NULL.
  /// \param io the SDL_IOStream to load data from.
  /// \param spec what format the raw data is in.
  /// \param closeio true if SDL_mixer should close `io` before returning
  /// (success or failure).
  /// \returns an audio object that can be used to make sound on a mixer, or NULL
  /// on failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_DestroyAudio
  /// \sa MIX_SetTrackAudio
  /// \sa MIX_LoadRawAudio
  /// \sa MIX_LoadRawAudioNoCopy
  /// \sa MIX_LoadAudio_IO
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Audio * SDLCALL MIX_LoadRawAudio_IO(MIX_Mixer *mixer, SDL_IOStream *io, const SDL_AudioSpec *spec, bool closeio)
  /// ```
  /// {@category mixer}
  Pointer<MixAudio> loadRawAudioIo(
    Pointer<SdlIoStream> io,
    Pointer<SdlAudioSpec> spec,
    bool closeio,
  ) => mixLoadRawAudioIo(this, io, spec, closeio);

  ///
  /// Load raw PCM data from a memory buffer.
  ///
  /// There are other options for _streaming_ raw PCM: an SDL_AudioStream can be
  /// connected to a track, as can an SDL_IOStream, and will read from those
  /// sources on-demand when it is time to mix the audio. This function is useful
  /// for loading static audio data that is meant to be played multiple times.
  ///
  /// This function will load the raw data in its entirety and cache it in RAM,
  /// allocating a copy. If the original data will outlive the created MIX_Audio,
  /// you can use MIX_LoadRawAudioNoCopy() to avoid extra allocations and copies.
  ///
  /// MIX_Audio objects can be shared between multiple mixers. The `mixer`
  /// parameter just suggests the most likely mixer to use this audio, in case
  /// some optimization might be applied, but this is not required, and a NULL
  /// mixer may be specified.
  ///
  /// \param mixer a mixer this audio is intended to be used with. May be NULL.
  /// \param data the raw PCM data to load.
  /// \param datalen the size, in bytes, of the raw PCM data.
  /// \param spec what format the raw data is in.
  /// \returns an audio object that can be used to make sound on a mixer, or NULL
  /// on failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_DestroyAudio
  /// \sa MIX_SetTrackAudio
  /// \sa MIX_LoadRawAudio_IO
  /// \sa MIX_LoadRawAudioNoCopy
  /// \sa MIX_LoadAudio_IO
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Audio * SDLCALL MIX_LoadRawAudio(MIX_Mixer *mixer, const void *data, size_t datalen, const SDL_AudioSpec *spec)
  /// ```
  /// {@category mixer}
  Pointer<MixAudio> loadRawAudio(
    Pointer<NativeType> data,
    int datalen,
    Pointer<SdlAudioSpec> spec,
  ) => mixLoadRawAudio(this, data, datalen, spec);

  ///
  /// Load raw PCM data from a memory buffer without making a copy.
  ///
  /// This buffer must live for the entire time the returned MIX_Audio lives, as
  /// it will access it whenever it needs to mix more data.
  ///
  /// This function is meant to maximize efficiency: if the data is already in
  /// memory and can remain there, don't copy it. But it can also lead to some
  /// interesting tricks, like changing the buffer's contents to alter multiple
  /// playing tracks at once. (But, of course, be careful when being too clever.)
  ///
  /// MIX_Audio objects can be shared between multiple mixers. The `mixer`
  /// parameter just suggests the most likely mixer to use this audio, in case
  /// some optimization might be applied, but this is not required, and a NULL
  /// mixer may be specified.
  ///
  /// If `free_when_done` is true, SDL_mixer will call `SDL_free(data)` when the
  /// returned MIX_Audio is eventually destroyed. This can be useful when the
  /// data is not static, but rather composed dynamically for this specific
  /// MIX_Audio and simply wants to avoid the extra copy.
  ///
  /// \param mixer a mixer this audio is intended to be used with. May be NULL.
  /// \param data the buffer where the raw PCM data lives.
  /// \param datalen the size, in bytes, of the buffer.
  /// \param spec what format the raw data is in.
  /// \param free_when_done if true, `data` will be given to SDL_free() when the
  /// MIX_Audio is destroyed.
  /// \returns an audio object that can be used to make sound on a mixer, or NULL
  /// on failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_DestroyAudio
  /// \sa MIX_SetTrackAudio
  /// \sa MIX_LoadRawAudio
  /// \sa MIX_LoadRawAudio_IO
  /// \sa MIX_LoadAudio_IO
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Audio * SDLCALL MIX_LoadRawAudioNoCopy(MIX_Mixer *mixer, const void *data, size_t datalen, const SDL_AudioSpec *spec, bool free_when_done)
  /// ```
  /// {@category mixer}
  Pointer<MixAudio> loadRawAudioNoCopy(
    Pointer<NativeType> data,
    int datalen,
    Pointer<SdlAudioSpec> spec,
    bool freeWhenDone,
  ) => mixLoadRawAudioNoCopy(this, data, datalen, spec, freeWhenDone);

  ///
  /// Create a MIX_Audio that generates a sinewave.
  ///
  /// This is useful just to have _something_ to play, perhaps for testing or
  /// debugging purposes.
  ///
  /// The resulting MIX_Audio will generate infinite audio when assigned to a
  /// track.
  ///
  /// You specify its frequency in Hz (determines the pitch of the sinewave's
  /// audio) and amplitude (determines the volume of the sinewave: 1.0f is very
  /// loud, 0.0f is silent).
  ///
  /// MIX_Audio objects can be shared between multiple mixers. The `mixer`
  /// parameter just suggests the most likely mixer to use this audio, in case
  /// some optimization might be applied, but this is not required, and a NULL
  /// mixer may be specified.
  ///
  /// \param mixer a mixer this audio is intended to be used with. May be NULL.
  /// \param hz the sinewave's frequency in Hz.
  /// \param amplitude the sinewave's amplitude from 0.0f to 1.0f.
  /// \returns an audio object that can be used to make sound on a mixer, or NULL
  /// on failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_DestroyAudio
  /// \sa MIX_SetTrackAudio
  /// \sa MIX_LoadAudio_IO
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Audio * SDLCALL MIX_CreateSineWaveAudio(MIX_Mixer *mixer, int hz, float amplitude)
  /// ```
  /// {@category mixer}
  Pointer<MixAudio> createSineWaveAudio(int hz, double amplitude) =>
      mixCreateSineWaveAudio(this, hz, amplitude);

  ///
  /// Create a new track on a mixer.
  ///
  /// A track provides a single source of audio. All currently-playing tracks
  /// will be processed and mixed together to form the final output from the
  /// mixer.
  ///
  /// There are no limits to the number of tracks on may create, beyond running
  /// out of memory, but in normal practice there are a small number of tracks
  /// that are reused between all loaded audio as appropriate.
  ///
  /// Tracks are unique to a specific MIX_Mixer and can't be transferred between
  /// them.
  ///
  /// \param mixer the mixer on which to create this track.
  /// \returns a new MIX_Track on success, NULL on error; call SDL_GetError() for
  /// more informations.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_DestroyTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Track * SDLCALL MIX_CreateTrack(MIX_Mixer *mixer)
  /// ```
  /// {@category mixer}
  Pointer<MixTrack> createTrack() => mixCreateTrack(this);

  ///
  /// Start (or restart) mixing all tracks with a specific tag for playback.
  ///
  /// This function follows all the same rules as MIX_PlayTrack(); please refer
  /// to its documentation for the details. Unlike that function, MIX_PlayTag()
  /// operates on multiple tracks at once that have the specified tag applied,
  /// via MIX_TagTrack().
  ///
  /// If all of your tagged tracks have different sample rates, it would make
  /// sense to use the `*_MILLISECONDS_NUMBER` properties in your `options`,
  /// instead of `*_FRAMES_NUMBER`, and let SDL_mixer figure out how to apply it
  /// to each track.
  ///
  /// This function returns true if all tagged tracks are started (or restarted).
  /// If any track fails, this function returns false, but all tracks that could
  /// start will still be started even when this function reports failure.
  ///
  /// From the point of view of the mixing process, all tracks that successfully
  /// (re)start will do so at the exact same moment.
  ///
  /// \param mixer the mixer on which to look for tagged tracks.
  /// \param tag the tag to use when searching for tracks.
  /// \param options the set of options that will be applied to each track.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PlayTrack
  /// \sa MIX_TagTrack
  /// \sa MIX_StopTrack
  /// \sa MIX_PauseTrack
  /// \sa MIX_TrackPlaying
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_PlayTag(MIX_Mixer *mixer, const char *tag, SDL_PropertiesID options)
  /// ```
  /// {@category mixer}
  bool playTag(String? tag, int options) => mixPlayTag(this, tag, options);

  ///
  /// Play a MIX_Audio from start to finish without any management.
  ///
  /// This is what we term a "fire-and-forget" sound. Internally, SDL_mixer will
  /// manage a temporary track to mix the specified MIX_Audio, cleaning it up
  /// when complete. No options can be provided for how to do the mixing, like
  /// MIX_PlayTrack() offers, and since the track is not available to the caller,
  /// no adjustments can be made to mixing over time.
  ///
  /// This is not the function to build an entire game of any complexity around,
  /// but it can be convenient to play simple, one-off sounds that can't be
  /// stopped early. An example would be a voice saying "GAME OVER" during an
  /// unpausable endgame sequence.
  ///
  /// There are no limits to the number of fire-and-forget sounds that can mix at
  /// once (short of running out of memory), and SDL_mixer keeps an internal pool
  /// of temporary tracks it creates as needed and reuses when available.
  ///
  /// \param mixer the mixer on which to play this audio.
  /// \param audio the audio input to play.
  /// \returns true if the track has begun mixing, false on error; call
  /// SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PlayTrack
  /// \sa MIX_LoadAudio
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_PlayAudio(MIX_Mixer *mixer, MIX_Audio *audio)
  /// ```
  /// {@category mixer}
  bool playAudio(Pointer<MixAudio> audio) => mixPlayAudio(this, audio);

  ///
  /// Halt all currently-playing tracks, possibly fading out over time.
  ///
  /// If `fade_out_ms` is > 0, the tracks do not stop mixing immediately, but
  /// rather fades to silence over that many milliseconds before stopping. Note
  /// that this is different than MIX_StopTrack(), which wants sample frames;
  /// this function takes milliseconds because different tracks might have
  /// different sample rates.
  ///
  /// If a track ends normally while the fade-out is still in progress, the audio
  /// stops there; the fade is not adjusted to be shorter if it will last longer
  /// than the audio remaining.
  ///
  /// Once a track has completed any fadeout and come to a stop, it will call its
  /// MIX_TrackStoppedCallback, if any. It is legal to assign the track a new
  /// input and/or restart it during this callback. This function does not
  /// prevent new play requests from being made.
  ///
  /// \param mixer the mixer on which to stop all tracks.
  /// \param fade_out_ms the number of milliseconds to spend fading out to
  /// silence before halting. 0 to stop immediately.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_StopTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_StopAllTracks(MIX_Mixer *mixer, Sint64 fade_out_ms)
  /// ```
  /// {@category mixer}
  bool stopAllTracks(int fadeOutMs) => mixStopAllTracks(this, fadeOutMs);

  ///
  /// Halt all tracks with a specific tag, possibly fading out over time.
  ///
  /// If `fade_out_ms` is > 0, the tracks do not stop mixing immediately, but
  /// rather fades to silence over that many milliseconds before stopping. Note
  /// that this is different than MIX_StopTrack(), which wants sample frames;
  /// this function takes milliseconds because different tracks might have
  /// different sample rates.
  ///
  /// If a track ends normally while the fade-out is still in progress, the audio
  /// stops there; the fade is not adjusted to be shorter if it will last longer
  /// than the audio remaining.
  ///
  /// Once a track has completed any fadeout and come to a stop, it will call its
  /// MIX_TrackStoppedCallback, if any. It is legal to assign the track a new
  /// input and/or restart it during this callback. This function does not
  /// prevent new play requests from being made.
  ///
  /// \param mixer the mixer on which to stop tracks.
  /// \param tag the tag to use when searching for tracks.
  /// \param fade_out_ms the number of milliseconds to spend fading out to
  /// silence before halting. 0 to stop immediately.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_StopTrack
  /// \sa MIX_TagTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_StopTag(MIX_Mixer *mixer, const char *tag, Sint64 fade_out_ms)
  /// ```
  /// {@category mixer}
  bool stopTag(String? tag, int fadeOutMs) => mixStopTag(this, tag, fadeOutMs);

  ///
  /// Pause all currently-playing tracks.
  ///
  /// A paused track is not considered "stopped," so its MIX_TrackStoppedCallback
  /// will not fire if paused, but it won't change state by default, generate
  /// audio, or generally make progress, until it is resumed.
  ///
  /// This function makes all tracks on the specified mixer that are currently
  /// playing move to a paused state. They can later be resumed.
  ///
  /// \param mixer the mixer on which to pause all tracks.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_ResumeTrack
  /// \sa MIX_ResumeAllTracks
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_PauseAllTracks(MIX_Mixer *mixer)
  /// ```
  /// {@category mixer}
  bool pauseAllTracks() => mixPauseAllTracks(this);

  ///
  /// Pause all tracks with a specific tag.
  ///
  /// A paused track is not considered "stopped," so its MIX_TrackStoppedCallback
  /// will not fire if paused, but it won't change state by default, generate
  /// audio, or generally make progress, until it is resumed.
  ///
  /// This function makes all currently-playing tracks on the specified mixer,
  /// with a specific tag, move to a paused state. They can later be resumed.
  ///
  /// Tracks that match the specified tag that aren't currently playing are
  /// ignored.
  ///
  /// \param mixer the mixer on which to pause tracks.
  /// \param tag the tag to use when searching for tracks.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PauseTrack
  /// \sa MIX_ResumeTrack
  /// \sa MIX_ResumeTag
  /// \sa MIX_TagTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_PauseTag(MIX_Mixer *mixer, const char *tag)
  /// ```
  /// {@category mixer}
  bool pauseTag(String? tag) => mixPauseTag(this, tag);

  ///
  /// Resume all currently-paused tracks.
  ///
  /// A paused track is not considered "stopped," so its MIX_TrackStoppedCallback
  /// will not fire if paused, but it won't change state by default, generate
  /// audio, or generally make progress, until it is resumed.
  ///
  /// This function makes all tracks on the specified mixer that are currently
  /// paused move to a playing state.
  ///
  /// \param mixer the mixer on which to resume all tracks.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PauseTrack
  /// \sa MIX_PauseAllTracks
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_ResumeAllTracks(MIX_Mixer *mixer)
  /// ```
  /// {@category mixer}
  bool resumeAllTracks() => mixResumeAllTracks(this);

  ///
  /// Resume all tracks with a specific tag.
  ///
  /// A paused track is not considered "stopped," so its MIX_TrackStoppedCallback
  /// will not fire if paused, but it won't change state by default, generate
  /// audio, or generally make progress, until it is resumed.
  ///
  /// This function makes all currently-paused tracks on the specified mixer,
  /// with a specific tag, move to a playing state.
  ///
  /// Tracks that match the specified tag that aren't currently paused are
  /// ignored.
  ///
  /// \param mixer the mixer on which to resume tracks.
  /// \param tag the tag to use when searching for tracks.
  /// \returns true on success, false on error; call SDL_GetError() for details.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_ResumeTrack
  /// \sa MIX_PauseTrack
  /// \sa MIX_PauseTag
  /// \sa MIX_TagTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_ResumeTag(MIX_Mixer *mixer, const char *tag)
  /// ```
  /// {@category mixer}
  bool resumeTag(String? tag) => mixResumeTag(this, tag);

  ///
  /// Set a mixer's master gain control.
  ///
  /// Each mixer has a master gain, to adjust the volume of the entire mix. Each
  /// sample passing through the pipeline is modulated by this gain value. A gain
  /// of zero will generate silence, 1.0f will not change the mixed volume, and
  /// larger than 1.0f will increase the volume. Negative values are illegal.
  /// There is no maximum gain specified, but this can quickly get extremely
  /// loud, so please be careful with this setting.
  ///
  /// A mixer's master gain defaults to 1.0f.
  ///
  /// This value can be changed at any time to adjust the future mix.
  ///
  /// \param mixer the mixer to adjust.
  /// \param gain the new gain value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetMasterGain
  /// \sa MIX_SetTrackGain
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetMasterGain(MIX_Mixer *mixer, float gain)
  /// ```
  /// {@category mixer}
  bool setMasterGain(double gain) => mixSetMasterGain(this, gain);

  ///
  /// Get a mixer's master gain control.
  ///
  /// This returns the last value set through MIX_SetMasterGain(), or 1.0f if no
  /// value has ever been explicitly set.
  ///
  /// \param mixer the mixer to query.
  /// \returns the mixer's current master gain.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_SetMasterGain
  /// \sa MIX_GetTrackGain
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL MIX_GetMasterGain(MIX_Mixer *mixer)
  /// ```
  /// {@category mixer}
  double getMasterGain() => mixGetMasterGain(this);

  ///
  /// Set the gain control of all tracks with a specific tag.
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
  /// This will change the gain control on tracks on the specified mixer that
  /// have the specified tag.
  ///
  /// From the point of view of the mixing process, all tracks that successfully
  /// change gain values will do so at the exact same moment.
  ///
  /// This value can be changed at any time to adjust the future mix.
  ///
  /// \param mixer the mixer on which to look for tagged tracks.
  /// \param tag the tag to use when searching for tracks.
  /// \param gain the new gain value.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetTrackGain
  /// \sa MIX_SetTrackGain
  /// \sa MIX_SetMasterGain
  /// \sa MIX_TagTrack
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetTagGain(MIX_Mixer *mixer, const char *tag, float gain)
  /// ```
  /// {@category mixer}
  bool setTagGain(String? tag, double gain) => mixSetTagGain(this, tag, gain);

  ///
  /// Create a mixing group.
  ///
  /// Tracks are assigned to a mixing group (or if unassigned, they live in a
  /// mixer's internal default group). All tracks in a group are mixed together
  /// and the app can access this mixed data before it is mixed with all other
  /// groups to produce the final output.
  ///
  /// This can be a useful feature, but is completely optional; apps can ignore
  /// mixing groups entirely and still have a full experience with SDL_mixer.
  ///
  /// After creating a group, assign tracks to it with MIX_SetTrackGroup(). Use
  /// MIX_SetGroupPostMixCallback() to access the group's mixed data.
  ///
  /// A mixing group can be destroyed with MIX_DestroyGroup() when no longer
  /// needed. Destroying the mixer will also destroy all its still-existing
  /// mixing groups.
  ///
  /// \param mixer the mixer on which to create a mixing group.
  /// \returns a newly-created mixing group, or NULL on error; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_DestroyGroup
  /// \sa MIX_SetTrackGroup
  /// \sa MIX_SetGroupPostMixCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_Group * SDLCALL MIX_CreateGroup(MIX_Mixer *mixer)
  /// ```
  /// {@category mixer}
  Pointer<MixGroup> createGroup() => mixCreateGroup(this);

  ///
  /// Set a callback that fires when all mixing has completed.
  ///
  /// After all mixer groups have processed, their buffers are mixed together
  /// into a single buffer for the final output, at which point a callback can be
  /// fired. This lets an app view the data at the last moment before mixing
  /// completes. It can also change the data in any way it pleases during this
  /// callback, and the mixer will continue as if this data is the final output.
  ///
  /// Each mixer has its own unique callback.
  ///
  /// Passing a NULL callback here is legal; it disables this mixer's callback.
  ///
  /// \param mixer the mixer to assign this callback to.
  /// \param cb the function to call when the mixer mixes. May be NULL.
  /// \param userdata an opaque pointer provided to the callback for its own
  /// personal use.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_PostMixCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_SetPostMixCallback(MIX_Mixer *mixer, MIX_PostMixCallback cb, void *userdata)
  /// ```
  /// {@category mixer}
  bool setPostMixCallback(
    Pointer<NativeFunction<MixPostMixCallback>> cb,
    Pointer<NativeType> userdata,
  ) => mixSetPostMixCallback(this, cb, userdata);

  ///
  /// Generate mixer output when not driving an audio device.
  ///
  /// SDL_mixer allows the creation of MIX_Mixer objects that are not connected
  /// to an audio device, by calling MIX_CreateMixer() instead of
  /// MIX_CreateMixerDevice(). Such mixers will not generate output until
  /// explicitly requested through this function.
  ///
  /// The caller may request as much audio as desired, so long as `buflen` is a
  /// multiple of the sample frame size specified when creating the mixer (for
  /// example, if requesting stereo Sint16 audio, buflen must be a multiple of 4:
  /// 2 bytes-per-channel times 2 channels).
  ///
  /// The mixer will mix as quickly as possible; since it works in sample frames
  /// instead of time, it can potentially generate enormous amounts of audio in a
  /// small amount of time.
  ///
  /// On success, this always fills `buffer` with `buflen` bytes of audio; if all
  /// playing tracks finish mixing, it will fill the remaining buffer with
  /// silence.
  ///
  /// Each call to this function will pick up where it left off, playing tracks
  /// will continue to mix from the point the previous call completed, etc. The
  /// mixer state can be changed between each call in any way desired: tracks can
  /// be added, played, stopped, changed, removed, etc. Effectively this function
  /// does the same thing SDL_mixer does internally when the audio device needs
  /// more audio to play.
  ///
  /// This function can not be used with mixers from MIX_CreateMixerDevice();
  /// those generate audio as needed internally.
  ///
  /// \param mixer the mixer for which to generate more audio.
  /// \param buffer a pointer to a buffer to store audio in.
  /// \param buflen the number of bytes to store in buffer.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_CreateMixer
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_Generate(MIX_Mixer *mixer, void *buffer, int buflen)
  /// ```
  /// {@category mixer}
  bool generate(Pointer<NativeType> buffer, int buflen) =>
      mixGenerate(this, buffer, buflen);
}
