part of '../../sdl_mixer.dart';

extension MixAudioPointerEx on Pointer<MixAudio> {
  ///
  /// Get the properties associated with a MIX_Audio.
  ///
  /// SDL_mixer offers some properties of its own, but this can also be a
  /// convenient place to store app-specific data.
  ///
  /// A SDL_PropertiesID is created the first time this function is called for a
  /// given MIX_Audio, if necessary.
  ///
  /// The following read-only properties are provided by SDL_mixer:
  ///
  /// - `MIX_PROP_METADATA_TITLE_STRING`: the audio's title ("Smells Like Teen
  /// Spirit").
  /// - `MIX_PROP_METADATA_ARTIST_STRING`: the audio's artist name ("Nirvana").
  /// - `MIX_PROP_METADATA_ALBUM_STRING`: the audio's album name ("Nevermind").
  /// - `MIX_PROP_METADATA_COPYRIGHT_STRING`: the audio's copyright info
  /// ("Copyright (c) 1991")
  /// - `MIX_PROP_METADATA_TRACK_NUMBER`: the audio's track number on the album
  /// (1)
  /// - `MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER`: the total tracks on the album
  /// (13)
  /// - `MIX_PROP_METADATA_YEAR_NUMBER`: the year the audio was released (1991)
  /// - `MIX_PROP_METADATA_DURATION_FRAMES_NUMBER`: The sample frames worth of
  /// PCM data that comprise this audio. It might be off by a little if the
  /// decoder only knows the duration as a unit of time.
  /// - `MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN`: if true, audio never runs
  /// out of sound to generate. This isn't necessarily always known to
  /// SDL_mixer, though.
  ///
  /// Other properties, documented with MIX_LoadAudioWithProperties(), may also
  /// be present.
  ///
  /// Note that the metadata properties are whatever SDL_mixer finds in things
  /// like ID3 tags, and they often have very little standardized formatting, may
  /// be missing, and can be completely wrong if the original data is
  /// untrustworthy (like an MP3 from a P2P file sharing service).
  ///
  /// \param audio the audio to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL MIX_GetAudioProperties(MIX_Audio *audio)
  /// ```
  /// {@category mixer}
  int getProperties() => mixGetAudioProperties(this);

  ///
  /// Get the length of a MIX_Audio's playback in sample frames.
  ///
  /// This information is also available via the
  /// MIX_PROP_METADATA_DURATION_FRAMES_NUMBER property, but it's common enough
  /// to provide a simple accessor function.
  ///
  /// This reports the length of the data in _sample frames_, so sample-perfect
  /// mixing can be possible. Sample frames are only meaningful as a measure of
  /// time if the sample rate (frequency) is also known. To convert from sample
  /// frames to milliseconds, use MIX_AudioFramesToMS().
  ///
  /// Not all audio file formats can report the complete length of the data they
  /// will produce through decoding: some can't calculate it, some might produce
  /// infinite audio.
  ///
  /// Also, some file formats can only report duration as a unit of time, which
  /// means SDL_mixer might have to estimate sample frames from that information.
  /// With less precision, the reported duration might be off by a few sample
  /// frames in either direction.
  ///
  /// This will return a value >= 0 if a duration is known. It might also return
  /// MIX_DURATION_UNKNOWN or MIX_DURATION_INFINITE.
  ///
  /// \param audio the audio to query.
  /// \returns the length of the audio in sample frames, or MIX_DURATION_UNKNOWN
  /// or MIX_DURATION_INFINITE.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC Sint64 SDLCALL MIX_GetAudioDuration(MIX_Audio *audio)
  /// ```
  /// {@category mixer}
  int getDuration() => mixGetAudioDuration(this);

  ///
  /// Query the initial audio format of a MIX_Audio.
  ///
  /// Note that some audio files can change format in the middle; some explicitly
  /// support this, but a more common example is two MP3 files concatenated
  /// together. In many cases, SDL_mixer will correctly handle these sort of
  /// files, but this function will only report the initial format a file uses.
  ///
  /// \param audio the audio to query.
  /// \param spec on success, audio format details will be stored here.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL MIX_GetAudioFormat(MIX_Audio *audio, SDL_AudioSpec *spec)
  /// ```
  /// {@category mixer}
  bool getFormat(Pointer<SdlAudioSpec> spec) => mixGetAudioFormat(this, spec);

  ///
  /// Destroy the specified audio.
  ///
  /// MIX_Audio is reference-counted internally, so this function only unrefs it.
  /// If doing so causes the reference count to drop to zero, the MIX_Audio will
  /// be deallocated. This allows the system to safely operate if the audio is
  /// still assigned to a MIX_Track at the time of destruction. The actual
  /// destroying will happen when the track stops using it.
  ///
  /// But from the caller's perspective, once this function is called, it should
  /// assume the `audio` pointer has become invalid.
  ///
  /// Destroying a NULL MIX_Audio is a legal no-op.
  ///
  /// \param audio the audio to destroy.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL MIX_DestroyAudio(MIX_Audio *audio)
  /// ```
  /// {@category mixer}
  void destroy() => mixDestroyAudio(this);

  ///
  /// Convert milliseconds to sample frames for a MIX_Audio's format.
  ///
  /// This calculates time based on the audio's initial format, even if the
  /// format would change mid-stream.
  ///
  /// \param audio the audio to query.
  /// \param ms the milliseconds to convert to audio-specific sample frames.
  /// \returns Converted number of sample frames, or zero for errors/no input.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_AudioFramesToMS
  ///
  /// ```c
  /// extern SDL_DECLSPEC Uint64 SDLCALL MIX_AudioMSToFrames(MIX_Audio *audio, Uint64 ms)
  /// ```
  /// {@category mixer}
  int msToFrames(int ms) => mixAudioMsToFrames(this, ms);

  ///
  /// Convert sample frames for a MIX_Audio's format to milliseconds.
  ///
  /// This calculates time based on the audio's initial format, even if the
  /// format would change mid-stream.
  ///
  /// Sample frames are more precise than milliseconds, so out of necessity, this
  /// function will approximate by rounding down to the closest full millisecond.
  ///
  /// \param audio the audio to query.
  /// \param frames the audio-specific sample frames to convert to milliseconds.
  /// \returns Converted number of milliseconds, or zero for errors/no input.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_AudioMSToFrames
  ///
  /// ```c
  /// extern SDL_DECLSPEC Uint64 SDLCALL MIX_AudioFramesToMS(MIX_Audio *audio, Uint64 frames)
  /// ```
  /// {@category mixer}
  int framesToMs(int frames) => mixAudioFramesToMs(this, frames);
}
