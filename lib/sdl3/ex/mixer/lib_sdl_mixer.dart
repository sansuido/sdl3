part of '../../sdl_mixer.dart';

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
/// \param spec the audio format to request from the device. May be NULL.
/// \returns a mixer that can be used to play audio, or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety This function should only be called on the main thread.
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
Pointer<MixMixer> mixxCreateMixerDevice(int devid, SdlxAudioSpec? spec) {
  Pointer<SdlAudioSpec> specPointer = nullptr;
  if (spec != null) {
    specPointer = spec.calloc();
  }
  final result = mixCreateMixerDevice(devid, specPointer);
  if (specPointer != nullptr) {
    specPointer.callocFree();
  }
  return result;
}

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
Pointer<MixMixer> mixxCreateMixer(SdlxAudioSpec spec) {
  final specPointer = spec.calloc();
  final result = mixCreateMixer(specPointer);
  specPointer.callocFree();
  return result;
}

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
bool mixxGetMixerFormat(Pointer<MixMixer> mixer, SdlxAudioSpec spec) {
  final specPointer = spec.calloc();
  final result = mixGetMixerFormat(mixer, specPointer);
  if (result) {
    spec.loadFromPointer(specPointer);
  }
  specPointer.callocFree();
  return result;
}

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
Pointer<MixAudio> mixxLoadRawAudioIo(
  Pointer<MixMixer> mixer,
  Pointer<SdlIoStream> io,
  SdlxAudioSpec spec, {
  bool closeio = false,
}) {
  final specPointer = spec.calloc();
  final result = mixLoadRawAudioIo(mixer, io, specPointer, closeio);
  specPointer.callocFree();
  return result;
}

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
Pointer<MixAudio> mixxLoadRawAudio(
  Pointer<MixMixer> mixer,
  Pointer<Void> data,
  int datalen,
  SdlxAudioSpec spec,
) {
  final specPointer = spec.calloc();
  final result = mixLoadRawAudio(
    mixer,
    data.cast<Void>(),
    datalen,
    specPointer,
  );
  specPointer.callocFree();
  return result;
}

///
/// Load raw PCM data from a memory buffer without making a copy.
///
/// This buffer must live for the entire time the returned MIX_Audio lives, as
/// the mixer will access the buffer whenever it needs to mix more data.
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
Pointer<MixAudio> mixxLoadRawAudioNoCopy(
  Pointer<MixMixer> mixer,
  Pointer<Void> data,
  int datalen,
  SdlxAudioSpec spec, {
  bool freeWhenDone = false,
}) {
  final specPointer = spec.calloc();
  final result = mixLoadRawAudioNoCopy(
    mixer,
    data,
    datalen,
    specPointer,
    freeWhenDone,
  );
  specPointer.callocFree();
  return result;
}

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
bool mixxGetAudioFormat(Pointer<MixAudio> audio, SdlxAudioSpec spec) {
  final specPointer = spec.calloc();
  final result = mixGetAudioFormat(audio, specPointer);
  if (result) {
    spec.loadFromPointer(specPointer);
  }
  specPointer.callocFree();
  return result;
}

///
/// Set a MIX_Track's input to an SDL_IOStream providing raw PCM data.
///
/// This is not the recommended way to set a track's input, but this can be
/// useful for a very specific scenario: a large file, to be played once, that
/// must be read from disk in small chunks as needed. In most cases, however,
/// it is preferable to create a MIX_Audio ahead of time and use
/// MIX_SetTrackAudio() instead.
///
/// Also, an MIX_SetTrackAudioStream() can _also_ provide raw PCM audio to a
/// track, via an SDL_AudioStream, which might be preferable unless the data is
/// already coming directly from an SDL_IOStream.
///
/// The stream supplied here should provide an audio in raw PCM format.
///
/// A given IOStream may only be assigned to a single track at a time;
/// duplicate assignments won't return an error, but assigning a stream to
/// multiple tracks will cause each track to read from the stream arbitrarily,
/// causing confusion and incorrect mixing.
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
/// \param spec the format of the PCM data that the SDL_IOStream will provide.
/// \param closeio if true, close the stream when done with it.
/// \returns true on success, false on error; call SDL_GetError() for details.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_mixer 3.0.0.
///
/// \sa MIX_SetTrackAudioStream
/// \sa MIX_SetTrackIOStream
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL MIX_SetTrackRawIOStream(MIX_Track *track, SDL_IOStream *io, const SDL_AudioSpec *spec, bool closeio)
/// ```
/// {@category mixer}
bool mixxSetTrackRawIoStream(
  Pointer<MixTrack> track,
  Pointer<SdlIoStream> io,
  SdlxAudioSpec spec, {
  bool closeio = false,
}) {
  final specPointer = spec.calloc();
  final result = mixSetTrackRawIoStream(track, io, specPointer, closeio);
  specPointer.callocFree();
  return result;
}

///
/// Get the tags currently associated with a track.
///
/// Tags are not provided in any guaranteed order.
///
/// \param track the track to query.
/// \param count a pointer filled in with the number of tags returned, can be
/// NULL.
/// \returns an array of the tags, NULL-terminated, or NULL on failure; call
/// SDL_GetError() for more information. This is a single allocation
/// that should be freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_mixer 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC char ** SDLCALL MIX_GetTrackTags(MIX_Track *track, int *count)
/// ```
/// {@category mixer}
List<String> mixxGetTrackTags(Pointer<MixTrack> track) {
  final result = <String>[];
  final countPointer = ffi.calloc<Int32>();
  final tagsPointer = mixGetTrackTags(track, countPointer);
  if (tagsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(tagsPointer[i].cast<Utf8>().toDartString());
    }
    sdlFree(tagsPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}

///
/// Get all tracks with a specific tag.
///
/// Tracks are not provided in any guaranteed order.
///
/// \param mixer the mixer to query.
/// \param tag the tag to search.
/// \param count a pointer filled in with the number of tracks returned, can be
/// NULL.
/// \returns an array of the tracks, NULL-terminated, or NULL on failure; call
/// SDL_GetError() for more information. The returned pointer should
/// be freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_mixer 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC MIX_Track ** SDLCALL MIX_GetTaggedTracks(MIX_Mixer *mixer, const char *tag, int *count)
/// ```
/// {@category mixer}
List<Pointer<MixTrack>> mixxGetTaggedTracks(
  Pointer<MixMixer> mixer,
  String tag,
) {
  final result = <Pointer<MixTrack>>[];
  final countPointer = ffi.calloc<Int32>();
  final tracksPointer = mixGetTaggedTracks(mixer, tag, countPointer);
  if (tracksPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(tracksPointer[i]);
    }
    sdlFree(tracksPointer.cast<Void>());
  }
  countPointer.callocFree();
  return result;
}

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
bool mixxSetTrackOutputChannelMap(Pointer<MixTrack> track, List<int>? chmap) {
  Pointer<Int32> chmapPointer = nullptr;
  var count = 0;
  if (chmap != null) {
    count = chmap.length;
    chmapPointer = ffi.calloc<Int32>(count);
    chmapPointer.asTypedList(count).setAll(0, chmap);
  }
  final result = mixSetTrackOutputChannelMap(track, chmapPointer, count);
  if (chmapPointer != nullptr) {
    chmapPointer.callocFree();
  }
  return result;
}

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
bool mixxSetTrackStereo(Pointer<MixTrack> track, MixxStereoGains? gains) {
  Pointer<MixStereoGains> gainsPointer = nullptr;
  if (gains != null) {
    gainsPointer = gains.calloc();
  }
  final result = mixSetTrackStereo(track, gainsPointer);
  if (gainsPointer != nullptr) {
    gainsPointer.callocFree();
  }
  return result;
}

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
bool mixxSetTrack3DPosition(Pointer<MixTrack> track, MixxPoint3D? position) {
  Pointer<MixPoint3D> positionPointer = nullptr;
  if (position != null) {
    positionPointer = position.calloc();
  }
  final result = mixSetTrack3DPosition(track, positionPointer);
  if (positionPointer != nullptr) {
    positionPointer.callocFree();
  }
  return result;
}

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
bool mixxGetTrack3DPosition(Pointer<MixTrack> track, MixxPoint3D position) {
  final positionPointer = position.calloc();
  final result = mixGetTrack3DPosition(track, positionPointer);
  if (result) {
    position.loadFromPointer(positionPointer);
  }
  positionPointer.callocFree();
  return result;
}

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
/// This function returns the number of _bytes_ of real audio mixed, which
/// might be less than `buflen`. While all `buflen` bytes of `buffer` will be
/// initialized, if available tracks to mix run out, the end of the buffer will
/// be initialized with silence; this silence will not be counted in the return
/// value, so the caller has the option to identify how much of the buffer has
/// legimitate contents vs appended silence. As such, any value >= 0 signifies
/// success. A return value of -1 means failure (out of memory, invalid
/// parameters, etc).
///
/// \param mixer the mixer for which to generate more audio.
/// \param buffer a pointer to a buffer to store audio in.
/// \param buflen the number of bytes to store in buffer.
/// \returns The number of bytes of mixed audio, discounting appended silence,
/// on success, or -1 on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_mixer 3.0.0.
///
/// \sa MIX_CreateMixer
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL MIX_Generate(MIX_Mixer *mixer, void *buffer, int buflen)
/// ```
/// {@category mixer}
int mixxGenerate(Pointer<MixMixer> mixer, TypedData buffer) {
  final byteView = buffer.buffer.asUint8List(
    buffer.offsetInBytes,
    buffer.lengthInBytes,
  );
  final buflen = byteView.length;
  final bufferPointer = sdlMalloc(buflen).cast<Uint8>();
  if (bufferPointer == nullptr) {
    return 0;
  }
  final bytesWritten = mixGenerate(mixer, bufferPointer.cast(), buflen);
  if (bytesWritten > 0) {
    byteView.setAll(0, bufferPointer.asTypedList(bytesWritten));
  }
  sdlFree(bufferPointer.cast<Void>());
  return bytesWritten;
}

///
/// Query the initial audio format of a MIX_AudioDecoder.
///
/// Note that some audio files can change format in the middle; some explicitly
/// support this, but a more common example is two MP3 files concatenated
/// together. In many cases, SDL_mixer will correctly handle these sort of
/// files, but this function will only report the initial format a file uses.
///
/// \param audiodecoder the audio decoder to query.
/// \param spec on success, audio format details will be stored here.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_mixer 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL MIX_GetAudioDecoderFormat(MIX_AudioDecoder *audiodecoder, SDL_AudioSpec *spec)
/// ```
/// {@category mixer}
bool mixxGetAudioDecoderFormat(
  Pointer<MixAudioDecoder> audiodecoder,
  SdlxAudioSpec spec,
) {
  final specPointer = spec.calloc();
  final result = mixGetAudioDecoderFormat(audiodecoder, specPointer);
  if (result) {
    spec.loadFromPointer(specPointer);
  }
  specPointer.callocFree();
  return result;
}

///
/// Decode more audio from a MIX_AudioDecoder.
///
/// Data is decoded on demand in whatever format is requested. The format is
/// permitted to change between calls.
///
/// This function will return the number of bytes decoded, which may be less
/// than requested if there was an error or end-of-file. A return value of zero
/// means the entire file was decoded, -1 means an unrecoverable error
/// happened.
///
/// \param audiodecoder the decoder from which to retrieve more data.
/// \param buffer the memory buffer to store decoded audio.
/// \param buflen the maximum number of bytes to store to `buffer`.
/// \param spec the format that audio data will be stored to `buffer`.
/// \returns number of bytes decoded, or -1 on error; call SDL_GetError() for
/// more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL_mixer 3.0.0.
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL MIX_DecodeAudio(MIX_AudioDecoder *audiodecoder, void *buffer, int buflen, const SDL_AudioSpec *spec)
/// ```
/// {@category mixer}
int mixxDecodeAudio(
  Pointer<MixAudioDecoder> audiodecoder,
  TypedData buffer,
  SdlxAudioSpec spec,
) {
  final byteView = buffer.buffer.asUint8List(
    buffer.offsetInBytes,
    buffer.lengthInBytes,
  );
  final buflen = byteView.length;
  final specPointer = spec.calloc();
  final bufferPointer = sdlMalloc(buflen).cast<Uint8>();
  if (bufferPointer == nullptr) {
    specPointer.callocFree();
    return 0;
  }
  final bytesWritten = mixDecodeAudio(
    audiodecoder,
    bufferPointer.cast(),
    buflen,
    specPointer,
  );
  if (bytesWritten > 0) {
    byteView.setAll(0, bufferPointer.asTypedList(bytesWritten));
  }
  sdlFree(bufferPointer.cast<Void>());
  specPointer.callocFree();
  return bytesWritten;
}
