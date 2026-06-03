part of '../../sdl.dart';

///
/// Get a list of currently-connected audio playback devices.
///
/// This returns of list of available devices that play sound, perhaps to
/// speakers or headphones ("playback" devices). If you want devices that
/// record audio, like a microphone ("recording" devices), use
/// SDL_GetAudioRecordingDevices() instead.
///
/// This only returns a list of physical devices; it will not have any device
/// IDs returned by SDL_OpenAudioDevice().
///
/// If this function returns NULL, to signify an error, `*count` will be set to
/// zero.
///
/// \param count a pointer filled in with the number of devices returned, may
/// be NULL.
/// \returns a 0 terminated array of device instance IDs or NULL on error; call
/// SDL_GetError() for more information. This should be freed with
/// SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenAudioDevice
/// \sa SDL_GetAudioRecordingDevices
///
/// ```c
/// extern SDL_DECLSPEC SDL_AudioDeviceID * SDLCALL SDL_GetAudioPlaybackDevices(int *count)
/// ```
/// {@category audio}
List<int> sdlxGetAudioPlaybackDevices() {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final devicesPointer = sdlGetAudioPlaybackDevices(countPointer);
  if (devicesPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(devicesPointer[i]);
    }
    sdlFree(devicesPointer);
  }
  countPointer.callocFree();
  return result;
}

///
/// Get a list of currently-connected audio recording devices.
///
/// This returns of list of available devices that record audio, like a
/// microphone ("recording" devices). If you want devices that play sound,
/// perhaps to speakers or headphones ("playback" devices), use
/// SDL_GetAudioPlaybackDevices() instead.
///
/// This only returns a list of physical devices; it will not have any device
/// IDs returned by SDL_OpenAudioDevice().
///
/// If this function returns NULL, to signify an error, `*count` will be set to
/// zero.
///
/// \param count a pointer filled in with the number of devices returned, may
/// be NULL.
/// \returns a 0 terminated array of device instance IDs, or NULL on failure;
/// call SDL_GetError() for more information. This should be freed
/// with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_OpenAudioDevice
/// \sa SDL_GetAudioPlaybackDevices
///
/// ```c
/// extern SDL_DECLSPEC SDL_AudioDeviceID * SDLCALL SDL_GetAudioRecordingDevices(int *count)
/// ```
/// {@category audio}
List<int> sdlxGetAudioRecordingDevices() {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final devicesPointer = sdlGetAudioRecordingDevices(countPointer);
  if (devicesPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(devicesPointer[i]);
    }
    sdlFree(devicesPointer);
  }
  countPointer.callocFree();
  return result;
}

///
/// Get the current audio format of a specific audio device.
///
/// For an opened device, this will report the format the device is currently
/// using. If the device isn't yet opened, this will report the device's
/// preferred format (or a reasonable default if this can't be determined).
///
/// You may also specify SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or
/// SDL_AUDIO_DEVICE_DEFAULT_RECORDING here, which is useful for getting a
/// reasonable recommendation before opening the system-recommended default
/// device.
///
/// You can also use this to request the current device buffer size. This is
/// specified in sample frames and represents the amount of data SDL will feed
/// to the physical hardware in each chunk. This can be converted to
/// milliseconds of audio with the following equation:
///
/// `ms = (int) ((((Sint64) frames) * 1000) / spec.freq);`
///
/// Buffer size is only important if you need low-level control over the audio
/// playback timing. Most apps do not need this.
///
/// \param devid the instance ID of the device to query.
/// \param spec on return, will be filled with device details.
/// \param sample_frames pointer to store device buffer size, in sample frames.
/// Can be NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetAudioDeviceFormat(SDL_AudioDeviceID devid, SDL_AudioSpec *spec, int *sample_frames)
/// ```
/// {@category audio}
bool sdlxGetAudioDeviceFormat(int devid, SdlxAudioSpec spec) {
  final specPointer = spec.calloc();
  final sampleFramesPointer = ffi.calloc<Int32>();
  final result = sdlGetAudioDeviceFormat(
    devid,
    specPointer,
    sampleFramesPointer,
  );
  if (result) {
    spec
      ..loadFromPointer(specPointer)
      ..sampleFrames = sampleFramesPointer.value;
  }
  specPointer.callocFree();
  sampleFramesPointer.callocFree();
  return result;
}

///
/// Get the current channel map of an audio device.
///
/// Channel maps are optional; most things do not need them, instead passing
/// data in the [order that SDL expects](CategoryAudio#channel-layouts).
///
/// Audio devices usually have no remapping applied. This is represented by
/// returning NULL, and does not signify an error.
///
/// \param devid the instance ID of the device to query.
/// \param count On output, set to number of channels in the map. Can be NULL.
/// \returns an array of the current channel mapping, with as many elements as
/// the current output spec's channels, or NULL if default. This
/// should be freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAudioStreamInputChannelMap
///
/// ```c
/// extern SDL_DECLSPEC int * SDLCALL SDL_GetAudioDeviceChannelMap(SDL_AudioDeviceID devid, int *count)
/// ```
/// {@category audio}
List<int> sdlxGetAudioDeviceChannelMap(int devid) {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final channelMapsPointer = sdlGetAudioDeviceChannelMap(devid, countPointer);
  if (channelMapsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(channelMapsPointer[i]);
    }
    sdlFree(channelMapsPointer);
  }
  countPointer.callocFree();
  return result;
}

///
/// Open a specific audio device.
///
/// You can open both playback and recording devices through this function.
/// Playback devices will take data from bound audio streams, mix it, and send
/// it to the hardware. Recording devices will feed any bound audio streams
/// with a copy of any incoming data.
///
/// An opened audio device starts out with no audio streams bound. To start
/// audio playing, bind a stream and supply audio data to it. Unlike SDL2,
/// there is no audio callback; you only bind audio streams and make sure they
/// have data flowing into them (however, you can simulate SDL2's semantics
/// fairly closely by using SDL_OpenAudioDeviceStream instead of this
/// function).
///
/// If you don't care about opening a specific device, pass a `devid` of either
/// `SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK` or
/// `SDL_AUDIO_DEVICE_DEFAULT_RECORDING`. In this case, SDL will try to pick
/// the most reasonable default, and may also switch between physical devices
/// seamlessly later, if the most reasonable default changes during the
/// lifetime of this opened device (user changed the default in the OS's system
/// preferences, the default got unplugged so the system jumped to a new
/// default, the user plugged in headphones on a mobile device, etc). Unless
/// you have a good reason to choose a specific device, this is probably what
/// you want.
///
/// You may request a specific format for the audio device, but there is no
/// promise the device will honor that request for several reasons. As such,
/// it's only meant to be a hint as to what data your app will provide. Audio
/// streams will accept data in whatever format you specify and manage
/// conversion for you as appropriate. SDL_GetAudioDeviceFormat can tell you
/// the preferred format for the device before opening and the actual format
/// the device is using after opening.
///
/// It's legal to open the same device ID more than once; each successful open
/// will generate a new logical SDL_AudioDeviceID that is managed separately
/// from others on the same physical device. This allows libraries to open a
/// device separately from the main app and bind its own streams without
/// conflicting.
///
/// It is also legal to open a device ID returned by a previous call to this
/// function; doing so just creates another logical device on the same physical
/// device. This may be useful for making logical groupings of audio streams.
///
/// This function returns the opened device ID on success. This is a new,
/// unique SDL_AudioDeviceID that represents a logical device.
///
/// Some backends might offer arbitrary devices (for example, a networked audio
/// protocol that can connect to an arbitrary server). For these, as a change
/// from SDL2, you should open a default device ID and use an SDL hint to
/// specify the target if you care, or otherwise let the backend figure out a
/// reasonable default. Most backends don't offer anything like this, and often
/// this would be an end user setting an environment variable for their custom
/// need, and not something an application should specifically manage.
///
/// When done with an audio device, possibly at the end of the app's life, one
/// should call SDL_CloseAudioDevice() on the returned device id.
///
/// \param devid the device instance id to open, or
/// SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or
/// SDL_AUDIO_DEVICE_DEFAULT_RECORDING for the most reasonable
/// default device.
/// \param spec the requested device configuration. Can be NULL to use
/// reasonable defaults.
/// \returns the device ID on success or 0 on failure; call SDL_GetError() for
/// more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_CloseAudioDevice
/// \sa SDL_GetAudioDeviceFormat
///
/// ```c
/// extern SDL_DECLSPEC SDL_AudioDeviceID SDLCALL SDL_OpenAudioDevice(SDL_AudioDeviceID devid, const SDL_AudioSpec *spec)
/// ```
/// {@category audio}
int sdlxOpenAudioDevice(int devid, SdlxAudioSpec? spec) {
  Pointer<SdlAudioSpec> specPointer = nullptr;
  if (spec != null) {
    specPointer = spec.calloc();
  }
  final result = sdlOpenAudioDevice(devid, specPointer);
  if (specPointer != nullptr) {
    specPointer.callocFree();
  }
  return result;
}

///
/// Bind a list of audio streams to an audio device.
///
/// Audio data will flow through any bound streams. For a playback device, data
/// for all bound streams will be mixed together and fed to the device. For a
/// recording device, a copy of recorded data will be provided to each bound
/// stream.
///
/// Audio streams can only be bound to an open device. This operation is
/// atomic--all streams bound in the same call will start processing at the
/// same time, so they can stay in sync. Also: either all streams will be bound
/// or none of them will be.
///
/// It is an error to bind an already-bound stream; it must be explicitly
/// unbound first.
///
/// Binding a stream to a device will set its output format for playback
/// devices, and its input format for recording devices, so they match the
/// device's settings. The caller is welcome to change the other end of the
/// stream's format at any time with SDL_SetAudioStreamFormat(). If the other
/// end of the stream's format has never been set (the audio stream was created
/// with a NULL audio spec), this function will set it to match the device
/// end's format.
///
/// \param devid an audio device to bind a stream to.
/// \param streams an array of audio streams to bind.
/// \param num_streams number streams listed in the `streams` array.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_BindAudioStreams
/// \sa SDL_UnbindAudioStream
/// \sa SDL_GetAudioStreamDevice
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_BindAudioStreams(SDL_AudioDeviceID devid, SDL_AudioStream * const *streams, int num_streams)
/// ```
/// {@category audio}
bool sdlxBindAudioStreams(int devid, List<Pointer<SdlAudioStream>> streams) {
  final streamsPointer = ffi.calloc<Pointer<SdlAudioStream>>(streams.length);
  for (var i = 0; i < streams.length; i++) {
    streamsPointer[i] = streams[i];
  }
  final result = sdlBindAudioStreams(devid, streamsPointer, streams.length);
  streamsPointer.callocFree();
  return result;
}

///
/// Unbind a list of audio streams from their audio devices.
///
/// The streams being unbound do not all have to be on the same device. All
/// streams on the same device will be unbound atomically (data will stop
/// flowing through all unbound streams on the same device at the same time).
///
/// Unbinding a stream that isn't bound to a device is a legal no-op.
///
/// \param streams an array of audio streams to unbind. Can be NULL or contain
/// NULL.
/// \param num_streams number streams listed in the `streams` array.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_BindAudioStreams
///
/// ```c
/// extern SDL_DECLSPEC void SDLCALL SDL_UnbindAudioStreams(SDL_AudioStream * const *streams, int num_streams)
/// ```
/// {@category audio}
void sdlxUnbindAudioStreams(List<Pointer<SdlAudioStream>> streams) {
  final streamsPointer = ffi.calloc<Pointer<SdlAudioStream>>(streams.length);
  for (var i = 0; i < streams.length; i++) {
    streamsPointer[i] = streams[i];
  }
  sdlUnbindAudioStreams(streamsPointer, streams.length);
  streamsPointer.callocFree();
}

///
/// Create a new audio stream.
///
/// Note that `src_spec` or `dst_spec` may be NULL, but any attempts to put or
/// get data from an audio stream will fail until it has valid specs assigned
/// to both ends of the stream. Specs can be assigned later through
/// SDL_SetAudioStreamFormat(), or binding the stream to an audio device (which
/// will set the format of only the input or output, depending on what kind of
/// device the stream was bound to).
///
/// \param src_spec the format details of the input audio. May be NULL.
/// \param dst_spec the format details of the output audio. May be NULL.
/// \returns a new audio stream on success or NULL on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_PutAudioStreamData
/// \sa SDL_GetAudioStreamData
/// \sa SDL_GetAudioStreamAvailable
/// \sa SDL_FlushAudioStream
/// \sa SDL_ClearAudioStream
/// \sa SDL_SetAudioStreamFormat
/// \sa SDL_DestroyAudioStream
///
/// ```c
/// extern SDL_DECLSPEC SDL_AudioStream * SDLCALL SDL_CreateAudioStream(const SDL_AudioSpec *src_spec, const SDL_AudioSpec *dst_spec)
/// ```
/// {@category audio}
Pointer<SdlAudioStream> sdlxCreateAudioStream(
  SdlxAudioSpec srcSpec,
  SdlxAudioSpec? dstSpec,
) {
  final srcSpecPointer = srcSpec.calloc();
  Pointer<SdlAudioSpec> dstSpecPointer = nullptr;
  if (dstSpec != null) {
    dstSpecPointer = dstSpec.calloc();
  }
  final result = sdlCreateAudioStream(srcSpecPointer, dstSpecPointer);
  srcSpecPointer.callocFree();
  if (dstSpecPointer != nullptr) {
    dstSpecPointer.callocFree();
  }
  return result;
}

///
/// Query the current format of an audio stream.
///
/// \param stream the SDL_AudioStream to query.
/// \param src_spec where to store the input audio format; ignored if NULL.
/// \param dst_spec where to store the output audio format; ignored if NULL.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread, as it holds
/// a stream-specific mutex while running.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAudioStreamFormat
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_GetAudioStreamFormat(SDL_AudioStream *stream, SDL_AudioSpec *src_spec, SDL_AudioSpec *dst_spec)
/// ```
/// {@category audio}
bool sdlxGetAudioStreamFormat(
  Pointer<SdlAudioStream> stream,
  SdlxAudioSpec? srcSpec,
  SdlxAudioSpec? dstSpec,
) {
  Pointer<SdlAudioSpec> srcSpecPointer = nullptr;
  Pointer<SdlAudioSpec> dstSpecPointer = nullptr;
  if (srcSpec != null) {
    srcSpecPointer = srcSpec.calloc();
  }
  if (dstSpec != null) {
    dstSpecPointer = dstSpec.calloc();
  }
  final result = sdlGetAudioStreamFormat(
    stream,
    srcSpecPointer,
    dstSpecPointer,
  );
  if (result) {
    if (srcSpec != null) {
      srcSpec.loadFromPointer(srcSpecPointer);
    }
    if (dstSpec != null) {
      dstSpec.loadFromPointer(dstSpecPointer);
    }
  }
  if (srcSpecPointer != nullptr) {
    srcSpecPointer.callocFree();
  }
  if (dstSpecPointer != nullptr) {
    dstSpecPointer.callocFree();
  }
  return result;
}

bool sdlxSetAudioStreamFormat(
  Pointer<SdlAudioStream> stream,
  SdlxAudioSpec? srcSpec,
  SdlxAudioSpec? dstSpec,
) {
  Pointer<SdlAudioSpec> srcSpecPointer = nullptr;
  Pointer<SdlAudioSpec> dstSpecPointer = nullptr;
  if (srcSpec != null) {
    srcSpecPointer = srcSpec.calloc();
  }
  if (dstSpec != null) {
    dstSpecPointer = dstSpec.calloc();
  }
  final result = sdlSetAudioStreamFormat(
    stream,
    srcSpecPointer,
    dstSpecPointer,
  );
  if (srcSpecPointer != nullptr) {
    srcSpecPointer.callocFree();
  }
  if (dstSpecPointer != nullptr) {
    dstSpecPointer.callocFree();
  }
  return result;
}

///
/// Get the current input channel map of an audio stream.
///
/// Channel maps are optional; most things do not need them, instead passing
/// data in the [order that SDL expects](CategoryAudio#channel-layouts).
///
/// Audio streams default to no remapping applied. This is represented by
/// returning NULL, and does not signify an error.
///
/// \param stream the SDL_AudioStream to query.
/// \param count On output, set to number of channels in the map. Can be NULL.
/// \returns an array of the current channel mapping, with as many elements as
/// the current output spec's channels, or NULL if default. This
/// should be freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread, as it holds
/// a stream-specific mutex while running.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAudioStreamInputChannelMap
///
/// ```c
/// extern SDL_DECLSPEC int * SDLCALL SDL_GetAudioStreamInputChannelMap(SDL_AudioStream *stream, int *count)
/// ```
/// {@category audio}
List<int> sdlxGetAudioStreamInputChannelMap(Pointer<SdlAudioStream> stream) {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final inputChannelMapsPointer = sdlGetAudioStreamInputChannelMap(
    stream,
    countPointer,
  );
  if (inputChannelMapsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(inputChannelMapsPointer[i]);
    }
    sdlFree(inputChannelMapsPointer);
  }
  countPointer.callocFree();
  return result;
}

///
/// Get the current output channel map of an audio stream.
///
/// Channel maps are optional; most things do not need them, instead passing
/// data in the [order that SDL expects](CategoryAudio#channel-layouts).
///
/// Audio streams default to no remapping applied. This is represented by
/// returning NULL, and does not signify an error.
///
/// \param stream the SDL_AudioStream to query.
/// \param count On output, set to number of channels in the map. Can be NULL.
/// \returns an array of the current channel mapping, with as many elements as
/// the current output spec's channels, or NULL if default. This
/// should be freed with SDL_free() when it is no longer needed.
///
/// \threadsafety It is safe to call this function from any thread, as it holds
/// a stream-specific mutex while running.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAudioStreamInputChannelMap
///
/// ```c
/// extern SDL_DECLSPEC int * SDLCALL SDL_GetAudioStreamOutputChannelMap(SDL_AudioStream *stream, int *count)
/// ```
/// {@category audio}
List<int> sdlxGetAudioStreamOutputChannelMap(Pointer<SdlAudioStream> stream) {
  final result = <int>[];
  final countPointer = ffi.calloc<Int32>();
  final inputChannelMapsPointer = sdlGetAudioStreamOutputChannelMap(
    stream,
    countPointer,
  );
  if (inputChannelMapsPointer != nullptr) {
    for (var i = 0; i < countPointer.value; i++) {
      result.add(inputChannelMapsPointer[i]);
    }
    sdlFree(inputChannelMapsPointer);
  }
  countPointer.callocFree();
  return result;
}

///
/// Set the current input channel map of an audio stream.
///
/// Channel maps are optional; most things do not need them, instead passing
/// data in the [order that SDL expects](CategoryAudio#channel-layouts).
///
/// The input channel map reorders data that is added to a stream via
/// SDL_PutAudioStreamData. Future calls to SDL_PutAudioStreamData must provide
/// data in the new channel order.
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
/// Data that was previously queued in the stream will still be operated on in
/// the order that was current when it was added, which is to say you can put
/// the end of a sound file in one order to a stream, change orders for the
/// next sound file, and start putting that new data while the previous sound
/// file is still queued, and everything will still play back correctly.
///
/// Audio streams default to no remapping applied. Passing a NULL channel map
/// is legal, and turns off remapping.
///
/// SDL will copy the channel map; the caller does not have to save this array
/// after this call.
///
/// If `count` is not equal to the current number of channels in the audio
/// stream's format, this will fail. This is a safety measure to make sure a
/// race condition hasn't changed the format while this call is setting the
/// channel map.
///
/// Unlike attempting to change the stream's format, the input channel map on a
/// stream bound to a recording device is permitted to change at any time; any
/// data added to the stream from the device after this call will have the new
/// mapping, but previously-added data will still have the prior mapping.
///
/// \param stream the SDL_AudioStream to change.
/// \param chmap the new channel map, NULL to reset to default.
/// \param count The number of channels in the map.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread, as it holds
/// a stream-specific mutex while running. Don't change the
/// stream's format to have a different number of channels from a
/// different thread at the same time, though!
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAudioStreamOutputChannelMap
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamInputChannelMap(SDL_AudioStream *stream, const int *chmap, int count)
/// ```
/// {@category audio}
bool sdlxSetAudioStreamInputChannelMap(
  Pointer<SdlAudioStream> stream,
  List<int> chmaps,
) {
  final chmapsPointer = ffi.calloc<Int32>(chmaps.length);
  for (var i = 0; i < chmaps.length; i++) {
    chmapsPointer[i] = chmaps[i];
  }
  final result = sdlSetAudioStreamInputChannelMap(
    stream,
    chmapsPointer,
    chmaps.length,
  );
  chmapsPointer.callocFree();
  return result;
}

///
/// Set the current output channel map of an audio stream.
///
/// Channel maps are optional; most things do not need them, instead passing
/// data in the [order that SDL expects](CategoryAudio#channel-layouts).
///
/// The output channel map reorders data that is leaving a stream via
/// SDL_GetAudioStreamData.
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
/// The output channel map can be changed at any time, as output remapping is
/// applied during SDL_GetAudioStreamData.
///
/// Audio streams default to no remapping applied. Passing a NULL channel map
/// is legal, and turns off remapping.
///
/// SDL will copy the channel map; the caller does not have to save this array
/// after this call.
///
/// If `count` is not equal to the current number of channels in the audio
/// stream's format, this will fail. This is a safety measure to make sure a
/// race condition hasn't changed the format while this call is setting the
/// channel map.
///
/// Unlike attempting to change the stream's format, the output channel map on
/// a stream bound to a recording device is permitted to change at any time;
/// any data added to the stream after this call will have the new mapping, but
/// previously-added data will still have the prior mapping. When the channel
/// map doesn't match the hardware's channel layout, SDL will convert the data
/// before feeding it to the device for playback.
///
/// \param stream the SDL_AudioStream to change.
/// \param chmap the new channel map, NULL to reset to default.
/// \param count The number of channels in the map.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread, as it holds
/// a stream-specific mutex while running. Don't change the
/// stream's format to have a different number of channels from a
/// a different thread at the same time, though!
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_SetAudioStreamInputChannelMap
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamOutputChannelMap(SDL_AudioStream *stream, const int *chmap, int count)
/// ```
/// {@category audio}
bool sdlxSetAudioStreamOutputChannelMap(
  Pointer<SdlAudioStream> stream,
  List<int> chmaps,
) {
  final chmapsPointer = ffi.calloc<Int32>(chmaps.length);
  for (var i = 0; i < chmaps.length; i++) {
    chmapsPointer[i] = chmaps[i];
  }
  final result = sdlSetAudioStreamOutputChannelMap(
    stream,
    chmapsPointer,
    chmaps.length,
  );
  chmapsPointer.callocFree();
  return result;
}

///
/// Add data to the stream.
///
/// This data must match the format/channels/samplerate specified in the latest
/// call to SDL_SetAudioStreamFormat, or the format specified when creating the
/// stream if it hasn't been changed.
///
/// Note that this call simply copies the unconverted data for later. This is
/// different than SDL2, where data was converted during the Put call and the
/// Get call would just dequeue the previously-converted data.
///
/// \param stream the stream the audio data is being added to.
/// \param buf a pointer to the audio data to add.
/// \param len the number of bytes to write to the stream.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread, but if the
/// stream has a callback set, the caller might need to manage
/// extra locking.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClearAudioStream
/// \sa SDL_FlushAudioStream
/// \sa SDL_GetAudioStreamData
/// \sa SDL_GetAudioStreamQueued
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_PutAudioStreamData(SDL_AudioStream *stream, const void *buf, int len)
/// ```
/// {@category audio}
bool sdlxPutAudioStreamData(Pointer<SdlAudioStream> stream, TypedData buf) {
  final byteView = buf.buffer.asUint8List(buf.offsetInBytes, buf.lengthInBytes);
  final totalBytes = byteView.length;
  final bufPointer = sdlMalloc(totalBytes).cast<Uint8>();
  if (bufPointer == nullptr) {
    return false;
  }
  bufPointer.asTypedList(totalBytes).setAll(0, byteView);
  final result = sdlPutAudioStreamData(stream, bufPointer.cast(), totalBytes);
  sdlFree(bufPointer);
  return result;
}

///
/// Add external data to an audio stream without copying it.
///
/// Unlike SDL_PutAudioStreamData(), this function does not make a copy of the
/// provided data, instead storing the provided pointer. This means that the
/// put operation does not need to allocate and copy the data, but the original
/// data must remain available until the stream is done with it, either by
/// being read from the stream in its entirety, or a call to
/// SDL_ClearAudioStream() or SDL_DestroyAudioStream().
///
/// The data must match the format/channels/samplerate specified in the latest
/// call to SDL_SetAudioStreamFormat, or the format specified when creating the
/// stream if it hasn't been changed.
///
/// An optional callback may be provided, which is called when the stream no
/// longer needs the data. Once this callback fires, the stream will not access
/// the data again. This callback will fire for any reason the data is no
/// longer needed, including clearing or destroying the stream.
///
/// Note that there is still an allocation to store tracking information, so
/// this function is more efficient for larger blocks of data. If you're
/// planning to put a few samples at a time, it will be more efficient to use
/// SDL_PutAudioStreamData(), which allocates and buffers in blocks.
///
/// \param stream the stream the audio data is being added to.
/// \param buf a pointer to the audio data to add.
/// \param len the number of bytes to add to the stream.
/// \param callback the callback function to call when the data is no longer
/// needed by the stream. May be NULL.
/// \param userdata an opaque pointer provided to the callback for its own
/// personal use.
/// \returns true on success or false on failure; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread, but if the
/// stream has a callback set, the caller might need to manage
/// extra locking.
///
/// \since This function is available since SDL 3.4.0.
///
/// \sa SDL_ClearAudioStream
/// \sa SDL_FlushAudioStream
/// \sa SDL_GetAudioStreamData
/// \sa SDL_GetAudioStreamQueued
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_PutAudioStreamDataNoCopy(SDL_AudioStream *stream, const void *buf, int len, SDL_AudioStreamDataCompleteCallback callback, void *userdata)
/// ```
/// {@category audio}
bool sdlxPutAudioStreamDataNoCopy(
  Pointer<SdlAudioStream> stream,
  Uint8List buf,
  Pointer<NativeFunction<SdlAudioStreamDataCompleteCallback>> callback,
  Pointer<NativeType> userdata,
) {
  final byteView = buf.buffer.asUint8List(buf.offsetInBytes, buf.lengthInBytes);
  final totalBytes = byteView.length;
  final bufPointer = sdlMalloc(totalBytes).cast<Uint8>();
  if (bufPointer == nullptr) {
    return false;
  }
  bufPointer.asTypedList(totalBytes).setAll(0, byteView);
  final result = sdlPutAudioStreamDataNoCopy(
    stream,
    bufPointer,
    buf.length,
    callback,
    userdata,
  );
  sdlFree(bufPointer);
  return result;
}

///
/// Get converted/resampled data from the stream.
///
/// The input/output data format/channels/samplerate is specified when creating
/// the stream, and can be changed after creation by calling
/// SDL_SetAudioStreamFormat.
///
/// Note that any conversion and resampling necessary is done during this call,
/// and SDL_PutAudioStreamData simply queues unconverted data for later. This
/// is different than SDL2, where that work was done while inputting new data
/// to the stream and requesting the output just copied the converted data.
///
/// \param stream the stream the audio is being requested from.
/// \param buf a buffer to fill with audio data.
/// \param len the maximum number of bytes to fill.
/// \returns the number of bytes read from the stream or -1 on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread, but if the
/// stream has a callback set, the caller might need to manage
/// extra locking.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_ClearAudioStream
/// \sa SDL_GetAudioStreamAvailable
/// \sa SDL_PutAudioStreamData
///
/// ```c
/// extern SDL_DECLSPEC int SDLCALL SDL_GetAudioStreamData(SDL_AudioStream *stream, void *buf, int len)
/// ```
/// {@category audio}
TypedData? sdlxGetAudioStreamData(
  Pointer<SdlAudioStream> stream,
  int maxLenInBytes,
) {
  final spec = SdlxAudioSpec();
  final success = sdlxGetAudioStreamFormat(stream, spec, null);
  if (!success) {
    return null;
  }
  final format = spec.format;
  final bufPointer = sdlMalloc(maxLenInBytes).cast<Uint8>();
  if (bufPointer == nullptr) {
    return null;
  }
  final bytesRead = sdlGetAudioStreamData(
    stream,
    bufPointer.cast(),
    maxLenInBytes,
  );
  if (bytesRead <= 0) {
    sdlFree(bufPointer);
    return null;
  }
  TypedData? result;
  final byteBuffer = bufPointer.asTypedList(bytesRead).buffer;
  switch (format) {
    case SDL_AUDIO_S8:
      result = Int8List.fromList(byteBuffer.asInt8List());
    case SDL_AUDIO_U8:
      result = Uint8List.fromList(bufPointer.asTypedList(bytesRead));
    case SDL_AUDIO_S16LE:
    case SDL_AUDIO_S16BE:
      result = Int16List.fromList(byteBuffer.asInt16List());
    case SDL_AUDIO_S32LE:
    case SDL_AUDIO_S32BE:
      result = Int32List.fromList(byteBuffer.asInt32List());
    case SDL_AUDIO_F32LE:
    case SDL_AUDIO_F32BE:
      result = Float32List.fromList(byteBuffer.asFloat32List());
  }
  sdlFree(bufPointer);
  return result;
}

///
/// Convenience function for straightforward audio init for the common case.
///
/// If all your app intends to do is provide a single source of PCM audio, this
/// function allows you to do all your audio setup in a single call.
///
/// This is also intended to be a clean means to migrate apps from SDL2.
///
/// This function will open an audio device, create a stream and bind it.
/// Unlike other methods of setup, the audio device will be closed when this
/// stream is destroyed, so the app can treat the returned SDL_AudioStream as
/// the only object needed to manage audio playback.
///
/// Also unlike other functions, the audio device begins paused. This is to map
/// more closely to SDL2-style behavior, since there is no extra step here to
/// bind a stream to begin audio flowing. The audio device should be resumed
/// with SDL_ResumeAudioStreamDevice().
///
/// This function works with both playback and recording devices.
///
/// The `spec` parameter represents the app's side of the audio stream. That
/// is, for recording audio, this will be the output format, and for playing
/// audio, this will be the input format. If spec is NULL, the system will
/// choose the format, and the app can use SDL_GetAudioStreamFormat() to obtain
/// this information later.
///
/// If you don't care about opening a specific audio device, you can (and
/// probably _should_), use SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK for playback and
/// SDL_AUDIO_DEVICE_DEFAULT_RECORDING for recording.
///
/// One can optionally provide a callback function; if NULL, the app is
/// expected to queue audio data for playback (or unqueue audio data if
/// capturing). Otherwise, the callback will begin to fire once the device is
/// unpaused.
///
/// Destroying the returned stream with SDL_DestroyAudioStream will also close
/// the audio device associated with this stream.
///
/// \param devid an audio device to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK
/// or SDL_AUDIO_DEVICE_DEFAULT_RECORDING.
/// \param spec the audio stream's data format. Can be NULL.
/// \param callback a callback where the app will provide new data for
/// playback, or receive new data for recording. Can be NULL,
/// in which case the app will need to call
/// SDL_PutAudioStreamData or SDL_GetAudioStreamData as
/// necessary.
/// \param userdata app-controlled pointer passed to callback. Can be NULL.
/// Ignored if callback is NULL.
/// \returns an audio stream on success, ready to use, or NULL on failure; call
/// SDL_GetError() for more information. When done with this stream,
/// call SDL_DestroyAudioStream to free resources and close the
/// device.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_GetAudioStreamDevice
/// \sa SDL_ResumeAudioStreamDevice
///
/// ```c
/// extern SDL_DECLSPEC SDL_AudioStream * SDLCALL SDL_OpenAudioDeviceStream(SDL_AudioDeviceID devid, const SDL_AudioSpec *spec, SDL_AudioStreamCallback callback, void *userdata)
/// ```
/// {@category audio}
Pointer<SdlAudioStream> sdlxOpenAudioDeviceStream(
  int devid,
  SdlxAudioSpec? spec,
  Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
  Pointer<NativeType> userdata,
) {
  Pointer<SdlAudioSpec> specPointer = nullptr;
  if (spec != null) {
    specPointer = spec.calloc();
  }
  final result = sdlOpenAudioDeviceStream(
    devid,
    specPointer,
    callback,
    userdata,
  );
  if (specPointer != nullptr) {
    specPointer.callocFree();
  }
  return result;
}

///
/// Load the audio data of a WAVE file into memory.
///
/// Loading a WAVE file requires `src`, `spec`, `audio_buf` and `audio_len` to
/// be valid pointers. The entire data portion of the file is then loaded into
/// memory and decoded if necessary.
///
/// Supported formats are RIFF WAVE files with the formats PCM (8, 16, 24, and
/// 32 bits), IEEE Float (32 bits), Microsoft ADPCM and IMA ADPCM (4 bits), and
/// A-law and mu-law (8 bits). Other formats are currently unsupported and
/// cause an error.
///
/// If this function succeeds, the return value is zero and the pointer to the
/// audio data allocated by the function is written to `audio_buf` and its
/// length in bytes to `audio_len`. The SDL_AudioSpec members `freq`,
/// `channels`, and `format` are set to the values of the audio data in the
/// buffer.
///
/// It's necessary to use SDL_free() to free the audio data returned in
/// `audio_buf` when it is no longer used.
///
/// Because of the underspecification of the .WAV format, there are many
/// problematic files in the wild that cause issues with strict decoders. To
/// provide compatibility with these files, this decoder is lenient in regards
/// to the truncation of the file, the fact chunk, and the size of the RIFF
/// chunk. The hints `SDL_HINT_WAVE_RIFF_CHUNK_SIZE`,
/// `SDL_HINT_WAVE_TRUNCATION`, and `SDL_HINT_WAVE_FACT_CHUNK` can be used to
/// tune the behavior of the loading process.
///
/// Any file that is invalid (due to truncation, corruption, or wrong values in
/// the headers), too big, or unsupported causes an error. Additionally, any
/// critical I/O error from the data source will terminate the loading process
/// with an error. The function returns NULL on error and in all cases (with
/// the exception of `src` being NULL), an appropriate error message will be
/// set.
///
/// It is required that the data source supports seeking.
///
/// Example:
///
/// ```c
/// SDL_LoadWAV_IO(SDL_IOFromFile("sample.wav", "rb"), true, &spec, &buf, &len);
/// ```
///
/// Note that the SDL_LoadWAV function does this same thing for you, but in a
/// less messy way:
///
/// ```c
/// SDL_LoadWAV("sample.wav", &spec, &buf, &len);
/// ```
///
/// \param src the data source for the WAVE data.
/// \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
/// in the case of an error.
/// \param spec a pointer to an SDL_AudioSpec that will be set to the WAVE
/// data's format details on successful return.
/// \param audio_buf a pointer filled with the audio data, allocated by the
/// function.
/// \param audio_len a pointer filled with the length of the audio data buffer
/// in bytes.
/// \returns true on success. `audio_buf` will be filled with a pointer to an
/// allocated buffer containing the audio data, and `audio_len` is
/// filled with the length of that audio buffer in bytes.
///
/// This function returns false if the .WAV file cannot be opened,
/// uses an unknown data format, or is corrupt; call SDL_GetError()
/// for more information.
///
/// When the application is done with the data returned in
/// `audio_buf`, it should call SDL_free() to dispose of it.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_free
/// \sa SDL_LoadWAV
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_LoadWAV_IO(SDL_IOStream *src, bool closeio, SDL_AudioSpec *spec, Uint8 **audio_buf, Uint32 *audio_len)
/// ```
/// {@category audio}
Uint8List? sdlxLoadWavIo(
  Pointer<SdlIoStream> src,
  SdlxAudioSpec spec, {
  bool closeio = false,
}) {
  Uint8List? result;
  final specPointer = spec.calloc();
  final audioBufPointer = ffi.calloc<Pointer<Uint8>>();
  final audioLenPointer = ffi.calloc<Uint32>();
  final bl = sdlLoadWavIo(
    src,
    closeio,
    specPointer,
    audioBufPointer,
    audioLenPointer,
  );
  if (bl) {
    spec.loadFromPointer(specPointer);
    result = Uint8List.fromList(
      audioBufPointer.value.asTypedList(audioLenPointer.value),
    );
    sdlFree(audioBufPointer.value);
  }
  specPointer.callocFree();
  audioBufPointer.callocFree();
  audioLenPointer.callocFree();
  return result;
}

///
/// Loads a WAV from a file path.
///
/// This is a convenience function that is effectively the same as:
///
/// ```c
/// SDL_LoadWAV_IO(SDL_IOFromFile(path, "rb"), true, spec, audio_buf, audio_len);
/// ```
///
/// \param path the file path of the WAV file to open.
/// \param spec a pointer to an SDL_AudioSpec that will be set to the WAVE
/// data's format details on successful return.
/// \param audio_buf a pointer filled with the audio data, allocated by the
/// function.
/// \param audio_len a pointer filled with the length of the audio data buffer
/// in bytes.
/// \returns true on success. `audio_buf` will be filled with a pointer to an
/// allocated buffer containing the audio data, and `audio_len` is
/// filled with the length of that audio buffer in bytes.
///
/// This function returns false if the .WAV file cannot be opened,
/// uses an unknown data format, or is corrupt; call SDL_GetError()
/// for more information.
///
/// When the application is done with the data returned in
/// `audio_buf`, it should call SDL_free() to dispose of it.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.2.0.
///
/// \sa SDL_free
/// \sa SDL_LoadWAV_IO
///
/// ```c
/// extern SDL_DECLSPEC bool SDLCALL SDL_LoadWAV(const char *path, SDL_AudioSpec *spec, Uint8 **audio_buf, Uint32 *audio_len)
/// ```
/// {@category audio}
Uint8List? sdlxLoadWav(String path, SdlxAudioSpec spec) {
  Uint8List? result;
  final specPointer = spec.calloc();
  final audioBufPointer = ffi.calloc<Pointer<Uint8>>();
  final audioLenPointer = ffi.calloc<Uint32>();
  final bl = sdlLoadWav(path, specPointer, audioBufPointer, audioLenPointer);
  if (bl) {
    spec.loadFromPointer(specPointer);
    result = Uint8List.fromList(
      audioBufPointer.value.asTypedList(audioLenPointer.value),
    );
    sdlFree(audioBufPointer.value);
  }
  specPointer.callocFree();
  audioBufPointer.callocFree();
  audioLenPointer.callocFree();
  return result;
}
