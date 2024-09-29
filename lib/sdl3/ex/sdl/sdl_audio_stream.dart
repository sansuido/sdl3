import 'dart:ffi';

import '../../generated/lib_sdl.dart';
import '../../generated/lib_sdl_audio.dart';
import '../../generated/struct_sdl.dart';

extension SdlAudioStreamEx on SdlAudioStream {
  // lib_sdl_audio.dart

  ///
  /// Create a new audio stream.
  ///
  /// \param src_spec the format details of the input audio.
  /// \param dst_spec the format details of the output audio.
  /// \returns a new audio stream on success or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
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
  static Pointer<SdlAudioStream> create(
      Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec) {
    return sdlCreateAudioStream(srcSpec, dstSpec);
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
  /// with `SDL_ResumeAudioStreamDevice(stream);`
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetAudioStreamDevice
  /// \sa SDL_ResumeAudioStreamDevice
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_AudioStream * SDLCALL SDL_OpenAudioDeviceStream(SDL_AudioDeviceID devid, const SDL_AudioSpec *spec, SDL_AudioStreamCallback callback, void *userdata)
  /// ```
  static Pointer<SdlAudioStream> open(
      int devid,
      Pointer<SdlAudioSpec> spec,
      Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
      Pointer<NativeType> userdata) {
    return sdlOpenAudioDeviceStream(devid, spec, callback, userdata);
  }
}

extension SdlAudioStreamPointerEx on Pointer<SdlAudioStream> {
  // lib_sdl_audio.dart

  ///
  /// Get the human-readable name of a specific audio device.
  ///
  /// \param devid the instance ID of the device to query.
  /// \returns the name of the audio device, or NULL on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetAudioPlaybackDevices
  /// \sa SDL_GetAudioRecordingDevices
  /// \sa SDL_GetDefaultAudioInfo
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char * SDLCALL SDL_GetAudioDeviceName(SDL_AudioDeviceID devid)
  /// ```
  String? getName() {
    return sdlGetAudioDeviceName(getDevice());
  }

  ///
  /// Use this function to query if an audio device is paused.
  ///
  /// Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
  /// has to bind a stream before any audio will flow.
  ///
  /// Physical devices can not be paused or unpaused, only logical devices
  /// created through SDL_OpenAudioDevice() can be. Physical and invalid device
  /// IDs will report themselves as unpaused here.
  ///
  /// \param dev a device opened by SDL_OpenAudioDevice().
  /// \returns true if device is valid and paused, false otherwise.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_PauseAudioDevice
  /// \sa SDL_ResumeAudioDevice
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_AudioDevicePaused(SDL_AudioDeviceID dev)
  /// ```
  bool paused() {
    return sdlAudioDevicePaused(getDevice());
  }

  ///
  /// Close a previously-opened audio device.
  ///
  /// The application should close open audio devices once they are no longer
  /// needed.
  ///
  /// This function may block briefly while pending audio data is played by the
  /// hardware, so that applications don't drop the last buffer of data they
  /// supplied if terminating immediately afterwards.
  ///
  /// \param devid an audio device id previously returned by
  /// SDL_OpenAudioDevice().
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_OpenAudioDevice
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_CloseAudioDevice(SDL_AudioDeviceID devid)
  /// ```
  void close() {
    return sdlCloseAudioDevice(getDevice());
  }

  ///
  /// Query an audio stream for its currently-bound device.
  ///
  /// This reports the audio device that an audio stream is currently bound to.
  ///
  /// If not bound, or invalid, this returns zero, which is not a valid device
  /// ID.
  ///
  /// \param stream the audio stream to query.
  /// \returns the bound audio device, or 0 if not bound or invalid.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_BindAudioStream
  /// \sa SDL_BindAudioStreams
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_AudioDeviceID SDLCALL SDL_GetAudioStreamDevice(SDL_AudioStream *stream)
  /// ```
  int getDevice() {
    return sdlGetAudioStreamDevice(this);
  }

  ///
  /// Get the properties associated with an audio stream.
  ///
  /// \param stream the SDL_AudioStream to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL SDL_GetAudioStreamProperties(SDL_AudioStream *stream)
  /// ```
  int getProperties() {
    return sdlGetAudioStreamProperties(this);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetAudioStreamFormat
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_GetAudioStreamFormat(SDL_AudioStream *stream, SDL_AudioSpec *src_spec, SDL_AudioSpec *dst_spec)
  /// ```
  bool getFormat(Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec) {
    return sdlGetAudioStreamFormat(this, srcSpec, dstSpec);
  }

  ///
  /// Change the input and output formats of an audio stream.
  ///
  /// Future calls to and SDL_GetAudioStreamAvailable and SDL_GetAudioStreamData
  /// will reflect the new format, and future calls to SDL_PutAudioStreamData
  /// must provide data in the new input formats.
  ///
  /// Data that was previously queued in the stream will still be operated on in
  /// the format that was current when it was added, which is to say you can put
  /// the end of a sound file in one format to a stream, change formats for the
  /// next sound file, and start putting that new data while the previous sound
  /// file is still queued, and everything will still play back correctly.
  ///
  /// \param stream the stream the format is being changed.
  /// \param src_spec the new format of the audio input; if NULL, it is not
  /// changed.
  /// \param dst_spec the new format of the audio output; if NULL, it is not
  /// changed.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread, as it holds
  /// a stream-specific mutex while running.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetAudioStreamFormat
  /// \sa SDL_SetAudioStreamFrequencyRatio
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamFormat(SDL_AudioStream *stream, const SDL_AudioSpec *src_spec, const SDL_AudioSpec *dst_spec)
  /// ```
  bool setFormat(Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec) {
    return sdlSetAudioStreamFormat(this, srcSpec, dstSpec);
  }

  ///
  /// Get the frequency ratio of an audio stream.
  ///
  /// \param stream the SDL_AudioStream to query.
  /// \returns the frequency ratio of the stream or 0.0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread, as it holds
  /// a stream-specific mutex while running.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetAudioStreamFrequencyRatio
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL SDL_GetAudioStreamFrequencyRatio(SDL_AudioStream *stream)
  /// ```
  double getFrequencyRatio() {
    return sdlGetAudioStreamFrequencyRatio(this);
  }

  ///
  /// Change the frequency ratio of an audio stream.
  ///
  /// The frequency ratio is used to adjust the rate at which input data is
  /// consumed. Changing this effectively modifies the speed and pitch of the
  /// audio. A value greater than 1.0 will play the audio faster, and at a higher
  /// pitch. A value less than 1.0 will play the audio slower, and at a lower
  /// pitch.
  ///
  /// This is applied during SDL_GetAudioStreamData, and can be continuously
  /// changed to create various effects.
  ///
  /// \param stream the stream the frequency ratio is being changed.
  /// \param ratio the frequency ratio. 1.0 is normal speed. Must be between 0.01
  /// and 100.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread, as it holds
  /// a stream-specific mutex while running.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetAudioStreamFrequencyRatio
  /// \sa SDL_SetAudioStreamFormat
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamFrequencyRatio(SDL_AudioStream *stream, float ratio)
  /// ```
  bool setFrequencyRatio(double ratio) {
    return sdlSetAudioStreamFrequencyRatio(this, ratio);
  }

  ///
  /// Get the gain of an audio stream.
  ///
  /// The gain of a stream is its volume; a larger gain means a louder output,
  /// with a gain of zero being silence.
  ///
  /// Audio streams default to a gain of 1.0f (no change in output).
  ///
  /// \param stream the SDL_AudioStream to query.
  /// \returns the gain of the stream or -1.0f on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread, as it holds
  /// a stream-specific mutex while running.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetAudioStreamGain
  ///
  /// ```c
  /// extern SDL_DECLSPEC float SDLCALL SDL_GetAudioStreamGain(SDL_AudioStream *stream)
  /// ```
  double getGain() {
    return sdlGetAudioStreamGain(this);
  }

  ///
  /// Change the gain of an audio stream.
  ///
  /// The gain of a stream is its volume; a larger gain means a louder output,
  /// with a gain of zero being silence.
  ///
  /// Audio streams default to a gain of 1.0f (no change in output).
  ///
  /// This is applied during SDL_GetAudioStreamData, and can be continuously
  /// changed to create various effects.
  ///
  /// \param stream the stream on which the gain is being changed.
  /// \param gain the gain. 1.0f is no change, 0.0f is silence.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread, as it holds
  /// a stream-specific mutex while running.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetAudioStreamGain
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamGain(SDL_AudioStream *stream, float gain)
  /// ```
  bool setGain(double gain) {
    return sdlSetAudioStreamGain(this, gain);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetAudioStreamInputChannelMap
  ///
  /// ```c
  /// extern SDL_DECLSPEC int * SDLCALL SDL_GetAudioStreamInputChannelMap(SDL_AudioStream *stream, int *count)
  /// ```
  Pointer<Int32> getInputChannelMap(Pointer<Int32> count) {
    return sdlGetAudioStreamInputChannelMap(this, count);
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
  /// right channel to both channels of a stereo signal. You cannot change the
  /// number of channels through a channel map, just reorder them.
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
  /// stream's format, this will fail. This is a safety measure to make sure a a
  /// race condition hasn't changed the format while you this call is setting the
  /// channel map.
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetAudioStreamInputChannelMap
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamInputChannelMap(SDL_AudioStream *stream, const int *chmap, int count)
  /// ```
  bool setInputChannelMap(Pointer<Int32> chmap, int count) {
    return sdlSetAudioStreamInputChannelMap(this, chmap, count);
  }

  ///
  /// Set the current output channel map of an audio stream.
  ///
  /// Channel maps are optional; most things do not need them, instead passing
  /// data in the [order that SDL expects](CategoryAudio#channel-layouts).
  ///
  /// The output channel map reorders data that leaving a stream via
  /// SDL_GetAudioStreamData.
  ///
  /// Each item in the array represents an output channel, and its value is the
  /// channel that it should be remapped to. To reverse a stereo signal's left
  /// and right values, you'd have an array of `{ 1, 0 }`. It is legal to remap
  /// multiple channels to the same thing, so `{ 1, 1 }` would duplicate the
  /// right channel to both channels of a stereo signal. You cannot change the
  /// number of channels through a channel map, just reorder them.
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
  /// stream's format, this will fail. This is a safety measure to make sure a a
  /// race condition hasn't changed the format while you this call is setting the
  /// channel map.
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetAudioStreamInputChannelMap
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamOutputChannelMap(SDL_AudioStream *stream, const int *chmap, int count)
  /// ```
  bool setOutputChannelMap(Pointer<Int32> chmap, int count) {
    return sdlSetAudioStreamOutputChannelMap(this, chmap, count);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_ClearAudioStream
  /// \sa SDL_FlushAudioStream
  /// \sa SDL_GetAudioStreamData
  /// \sa SDL_GetAudioStreamQueued
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_PutAudioStreamData(SDL_AudioStream *stream, const void *buf, int len)
  /// ```
  bool putData(Pointer<NativeType> buf, int len) {
    return sdlPutAudioStreamData(this, buf, len);
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
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_ClearAudioStream
  /// \sa SDL_GetAudioStreamAvailable
  /// \sa SDL_PutAudioStreamData
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL SDL_GetAudioStreamData(SDL_AudioStream *stream, void *buf, int len)
  /// ```
  int getData(Pointer<NativeType> buf, int len) {
    return sdlGetAudioStreamData(this, buf, len);
  }

  ///
  /// Get the number of converted/resampled bytes available.
  ///
  /// The stream may be buffering data behind the scenes until it has enough to
  /// resample correctly, so this number might be lower than what you expect, or
  /// even be zero. Add more data or flush the stream if you need the data now.
  ///
  /// If the stream has so much data that it would overflow an int, the return
  /// value is clamped to a maximum value, but no queued data is lost; if there
  /// are gigabytes of data queued, the app might need to read some of it with
  /// SDL_GetAudioStreamData before this function's return value is no longer
  /// clamped.
  ///
  /// \param stream the audio stream to query.
  /// \returns the number of converted/resampled bytes available or -1 on
  /// failure; call SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetAudioStreamData
  /// \sa SDL_PutAudioStreamData
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL SDL_GetAudioStreamAvailable(SDL_AudioStream *stream)
  /// ```
  int getAvailable() {
    return sdlGetAudioStreamAvailable(this);
  }

  ///
  /// Get the number of bytes currently queued.
  ///
  /// Note that audio streams can change their input format at any time, even if
  /// there is still data queued in a different format, so the returned byte
  /// count will not necessarily match the number of _sample frames_ available.
  /// Users of this API should be aware of format changes they make when feeding
  /// a stream and plan accordingly.
  ///
  /// Queued data is not converted until it is consumed by
  /// SDL_GetAudioStreamData, so this value should be representative of the exact
  /// data that was put into the stream.
  ///
  /// If the stream has so much data that it would overflow an int, the return
  /// value is clamped to a maximum value, but no queued data is lost; if there
  /// are gigabytes of data queued, the app might need to read some of it with
  /// SDL_GetAudioStreamData before this function's return value is no longer
  /// clamped.
  ///
  /// \param stream the audio stream to query.
  /// \returns the number of bytes queued or -1 on failure; call SDL_GetError()
  /// for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_PutAudioStreamData
  /// \sa SDL_ClearAudioStream
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL SDL_GetAudioStreamQueued(SDL_AudioStream *stream)
  /// ```
  int getQueued() {
    return sdlGetAudioStreamQueued(this);
  }

  ///
  /// Tell the stream that you're done sending data, and anything being buffered
  /// should be converted/resampled and made available immediately.
  ///
  /// It is legal to add more data to a stream after flushing, but there may be
  /// audio gaps in the output. Generally this is intended to signal the end of
  /// input, so the complete output becomes available.
  ///
  /// \param stream the audio stream to flush.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_PutAudioStreamData
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_FlushAudioStream(SDL_AudioStream *stream)
  /// ```
  bool flush() {
    return sdlFlushAudioStream(this);
  }

  ///
  /// Clear any pending data in the stream.
  ///
  /// This drops any queued data, so there will be nothing to read from the
  /// stream until more is added.
  ///
  /// \param stream the audio stream to clear.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetAudioStreamAvailable
  /// \sa SDL_GetAudioStreamData
  /// \sa SDL_GetAudioStreamQueued
  /// \sa SDL_PutAudioStreamData
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_ClearAudioStream(SDL_AudioStream *stream)
  /// ```
  bool clear() {
    return sdlClearAudioStream(this);
  }

  ///
  /// Use this function to pause audio playback on the audio device associated
  /// with an audio stream.
  ///
  /// This function pauses audio processing for a given device. Any bound audio
  /// streams will not progress, and no audio will be generated. Pausing one
  /// device does not prevent other unpaused devices from running.
  ///
  /// Pausing a device can be useful to halt all audio without unbinding all the
  /// audio streams. This might be useful while a game is paused, or a level is
  /// loading, etc.
  ///
  /// \param stream the audio stream associated with the audio device to pause.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_ResumeAudioStreamDevice
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_PauseAudioStreamDevice(SDL_AudioStream *stream)
  /// ```
  bool pause() {
    return sdlPauseAudioStreamDevice(this);
  }

  ///
  /// Use this function to unpause audio playback on the audio device associated
  /// with an audio stream.
  ///
  /// This function unpauses audio processing for a given device that has
  /// previously been paused. Once unpaused, any bound audio streams will begin
  /// to progress again, and audio can be generated.
  ///
  /// \param stream the audio stream associated with the audio device to resume.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_PauseAudioStreamDevice
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_ResumeAudioStreamDevice(SDL_AudioStream *stream)
  /// ```
  bool resume() {
    return sdlResumeAudioStreamDevice(this);
  }

  ///
  /// Lock an audio stream for serialized access.
  ///
  /// Each SDL_AudioStream has an internal mutex it uses to protect its data
  /// structures from threading conflicts. This function allows an app to lock
  /// that mutex, which could be useful if registering callbacks on this stream.
  ///
  /// One does not need to lock a stream to use in it most cases, as the stream
  /// manages this lock internally. However, this lock is held during callbacks,
  /// which may run from arbitrary threads at any time, so if an app needs to
  /// protect shared data during those callbacks, locking the stream guarantees
  /// that the callback is not running while the lock is held.
  ///
  /// As this is just a wrapper over SDL_LockMutex for an internal lock; it has
  /// all the same attributes (recursive locks are allowed, etc).
  ///
  /// \param stream the audio stream to lock.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_UnlockAudioStream
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_LockAudioStream(SDL_AudioStream *stream)
  /// ```
  bool lock() {
    return sdlLockAudioStream(this);
  }

  ///
  /// Unlock an audio stream for serialized access.
  ///
  /// This unlocks an audio stream after a call to SDL_LockAudioStream.
  ///
  /// \param stream the audio stream to unlock.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \threadsafety You should only call this from the same thread that
  /// previously called SDL_LockAudioStream.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_LockAudioStream
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_UnlockAudioStream(SDL_AudioStream *stream)
  /// ```
  bool unlock() {
    return sdlUnlockAudioStream(this);
  }

  ///
  /// Set a callback that runs when data is requested from an audio stream.
  ///
  /// This callback is called _before_ data is obtained from the stream, giving
  /// the callback the chance to add more on-demand.
  ///
  /// The callback can (optionally) call SDL_PutAudioStreamData() to add more
  /// audio to the stream during this call; if needed, the request that triggered
  /// this callback will obtain the new data immediately.
  ///
  /// The callback's `approx_request` argument is roughly how many bytes of
  /// _unconverted_ data (in the stream's input format) is needed by the caller,
  /// although this may overestimate a little for safety. This takes into account
  /// how much is already in the stream and only asks for any extra necessary to
  /// resolve the request, which means the callback may be asked for zero bytes,
  /// and a different amount on each call.
  ///
  /// The callback is not required to supply exact amounts; it is allowed to
  /// supply too much or too little or none at all. The caller will get what's
  /// available, up to the amount they requested, regardless of this callback's
  /// outcome.
  ///
  /// Clearing or flushing an audio stream does not call this callback.
  ///
  /// This function obtains the stream's lock, which means any existing callback
  /// (get or put) in progress will finish running before setting the new
  /// callback.
  ///
  /// Setting a NULL function turns off the callback.
  ///
  /// \param stream the audio stream to set the new callback on.
  /// \param callback the new callback function to call when data is requested
  /// from the stream.
  /// \param userdata an opaque pointer provided to the callback for its own
  /// personal use.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information. This only fails if `stream` is NULL.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetAudioStreamPutCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamGetCallback(SDL_AudioStream *stream, SDL_AudioStreamCallback callback, void *userdata)
  /// ```
  bool setGetCallback(Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
      Pointer<NativeType> userdata) {
    return sdlSetAudioStreamGetCallback(this, callback, userdata);
  }

  ///
  /// Set a callback that runs when data is added to an audio stream.
  ///
  /// This callback is called _after_ the data is added to the stream, giving the
  /// callback the chance to obtain it immediately.
  ///
  /// The callback can (optionally) call SDL_GetAudioStreamData() to obtain audio
  /// from the stream during this call.
  ///
  /// The callback's `approx_request` argument is how many bytes of _converted_
  /// data (in the stream's output format) was provided by the caller, although
  /// this may underestimate a little for safety. This value might be less than
  /// what is currently available in the stream, if data was already there, and
  /// might be less than the caller provided if the stream needs to keep a buffer
  /// to aid in resampling. Which means the callback may be provided with zero
  /// bytes, and a different amount on each call.
  ///
  /// The callback may call SDL_GetAudioStreamAvailable to see the total amount
  /// currently available to read from the stream, instead of the total provided
  /// by the current call.
  ///
  /// The callback is not required to obtain all data. It is allowed to read less
  /// or none at all. Anything not read now simply remains in the stream for
  /// later access.
  ///
  /// Clearing or flushing an audio stream does not call this callback.
  ///
  /// This function obtains the stream's lock, which means any existing callback
  /// (get or put) in progress will finish running before setting the new
  /// callback.
  ///
  /// Setting a NULL function turns off the callback.
  ///
  /// \param stream the audio stream to set the new callback on.
  /// \param callback the new callback function to call when data is added to the
  /// stream.
  /// \param userdata an opaque pointer provided to the callback for its own
  /// personal use.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information. This only fails if `stream` is NULL.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetAudioStreamGetCallback
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL SDL_SetAudioStreamPutCallback(SDL_AudioStream *stream, SDL_AudioStreamCallback callback, void *userdata)
  /// ```
  bool setPutCallback(Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
      Pointer<NativeType> userdata) {
    return sdlSetAudioStreamPutCallback(this, callback, userdata);
  }

  ///
  /// Free an audio stream.
  ///
  /// This will release all allocated data, including any audio that is still
  /// queued. You do not need to manually clear the stream first.
  ///
  /// If this stream was bound to an audio device, it is unbound during this
  /// call. If this stream was created with SDL_OpenAudioDeviceStream, the audio
  /// device that was opened alongside this stream's creation will be closed,
  /// too.
  ///
  /// \param stream the audio stream to destroy.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CreateAudioStream
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL SDL_DestroyAudioStream(SDL_AudioStream *stream)
  /// ```
  void destroy() {
    return sdlDestroyAudioStream(this);
  }
}
