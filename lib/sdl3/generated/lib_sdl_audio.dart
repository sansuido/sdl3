// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'lib_sdl.dart';
import 'struct_sdl.dart';

///
/// Use this function to get the number of built-in audio drivers.
///
/// This function returns a hardcoded number. This never returns a negative
/// value; if there are no drivers compiled into this build of SDL, this
/// function returns zero. The presence of a driver in this list does not mean
/// it will function, it just means SDL is capable of interacting with that
/// interface. For example, a build of SDL might have esound support, but if
/// there's no esound server available, SDL's esound driver would fail if used.
///
/// By default, SDL tries all drivers, in its preferred order, until one is
/// found to be usable.
///
/// \returns the number of built-in audio drivers.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAudioDriver
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetNumAudioDrivers(void)
/// ```
int sdlGetNumAudioDrivers() {
  final sdlGetNumAudioDriversLookupFunction =
      libSdl3.lookupFunction<Int32 Function(), int Function()>(
          'SDL_GetNumAudioDrivers');
  return sdlGetNumAudioDriversLookupFunction();
}

///
/// Use this function to get the name of a built in audio driver.
///
/// The list of audio drivers is given in the order that they are normally
/// initialized by default; the drivers that seem more reasonable to choose
/// first (as far as the SDL developers believe) are earlier in the list.
///
/// The names of drivers are all simple, low-ASCII identifiers, like "alsa",
/// "coreaudio" or "xaudio2". These never have Unicode characters, and are not
/// meant to be proper names.
///
/// \param index the index of the audio driver; the value ranges from 0 to
/// SDL_GetNumAudioDrivers() - 1
/// \returns the name of the audio driver at the requested index, or NULL if an
/// invalid index was specified.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetNumAudioDrivers
///
/// ```c
/// extern DECLSPEC const char *SDLCALL SDL_GetAudioDriver(int index)
/// ```
String? sdlGetAudioDriver(int index) {
  final sdlGetAudioDriverLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(Int32 index),
      Pointer<Utf8> Function(int index)>('SDL_GetAudioDriver');
  final result = sdlGetAudioDriverLookupFunction(index);
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get the name of the current audio driver.
///
/// The returned string points to internal static memory and thus never becomes
/// invalid, even if you quit the audio subsystem and initialize a new driver
/// (although such a case would return a different static string from another
/// call to this function, of course). As such, you should not modify or free
/// the returned string.
///
/// \returns the name of the current audio driver or NULL if no driver has been
/// initialized.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC const char *SDLCALL SDL_GetCurrentAudioDriver(void)
/// ```
String? sdlGetCurrentAudioDriver() {
  final sdlGetCurrentAudioDriverLookupFunction = libSdl3.lookupFunction<
      Pointer<Utf8> Function(),
      Pointer<Utf8> Function()>('SDL_GetCurrentAudioDriver');
  final result = sdlGetCurrentAudioDriverLookupFunction();
  if (result == nullptr) {
    return null;
  }
  return result.toDartString();
}

///
/// Get a list of currently-connected audio output devices.
///
/// This returns of list of available devices that play sound, perhaps to
/// speakers or headphones ("output" devices). If you want devices that record
/// audio, like a microphone ("capture" devices), use
/// SDL_GetAudioCaptureDevices() instead.
///
/// This only returns a list of physical devices; it will not have any device
/// IDs returned by SDL_OpenAudioDevice().
///
/// \param count a pointer filled in with the number of devices returned
/// \returns a 0 terminated array of device instance IDs which should be freed
/// with SDL_free(), or NULL on error; call SDL_GetError() for more
/// details.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_OpenAudioDevice
/// \sa SDL_GetAudioCaptureDevices
///
/// ```c
/// extern DECLSPEC SDL_AudioDeviceID *SDLCALL SDL_GetAudioOutputDevices(int *count)
/// ```
Pointer<Uint32> sdlGetAudioOutputDevices(Pointer<Int32> count) {
  final sdlGetAudioOutputDevicesLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(
          Pointer<Int32> count)>('SDL_GetAudioOutputDevices');
  return sdlGetAudioOutputDevicesLookupFunction(count);
}

///
/// Get a list of currently-connected audio capture devices.
///
/// This returns of list of available devices that record audio, like a
/// microphone ("capture" devices). If you want devices that play sound,
/// perhaps to speakers or headphones ("output" devices), use
/// SDL_GetAudioOutputDevices() instead.
///
/// This only returns a list of physical devices; it will not have any device
/// IDs returned by SDL_OpenAudioDevice().
///
/// \param count a pointer filled in with the number of devices returned
/// \returns a 0 terminated array of device instance IDs which should be freed
/// with SDL_free(), or NULL on error; call SDL_GetError() for more
/// details.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_OpenAudioDevice
/// \sa SDL_GetAudioOutputDevices
///
/// ```c
/// extern DECLSPEC SDL_AudioDeviceID *SDLCALL SDL_GetAudioCaptureDevices(int *count)
/// ```
Pointer<Uint32> sdlGetAudioCaptureDevices(Pointer<Int32> count) {
  final sdlGetAudioCaptureDevicesLookupFunction = libSdl3.lookupFunction<
      Pointer<Uint32> Function(Pointer<Int32> count),
      Pointer<Uint32> Function(
          Pointer<Int32> count)>('SDL_GetAudioCaptureDevices');
  return sdlGetAudioCaptureDevicesLookupFunction(count);
}

///
/// Get the human-readable name of a specific audio device.
///
/// The string returned by this function is UTF-8 encoded. The caller should
/// call SDL_free on the return value when done with it.
///
/// \param devid the instance ID of the device to query.
/// \returns the name of the audio device, or NULL on error.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAudioOutputDevices
/// \sa SDL_GetAudioCaptureDevices
/// \sa SDL_GetDefaultAudioInfo
///
/// ```c
/// extern DECLSPEC char *SDLCALL SDL_GetAudioDeviceName(SDL_AudioDeviceID devid)
/// ```
Pointer<Int8> sdlGetAudioDeviceName(int devid) {
  final sdlGetAudioDeviceNameLookupFunction = libSdl3.lookupFunction<
      Pointer<Int8> Function(Uint32 devid),
      Pointer<Int8> Function(int devid)>('SDL_GetAudioDeviceName');
  return sdlGetAudioDeviceNameLookupFunction(devid);
}

///
/// Get the current audio format of a specific audio device.
///
/// For an opened device, this will report the format the device is currently
/// using. If the device isn't yet opened, this will report the device's
/// preferred format (or a reasonable default if this can't be determined).
///
/// You may also specify SDL_AUDIO_DEVICE_DEFAULT_OUTPUT or
/// SDL_AUDIO_DEVICE_DEFAULT_CAPTURE here, which is useful for getting a
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
/// \param spec On return, will be filled with device details.
/// \param sample_frames Pointer to store device buffer size, in sample frames.
/// Can be NULL.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetAudioDeviceFormat(SDL_AudioDeviceID devid, SDL_AudioSpec *spec, int *sample_frames)
/// ```
int sdlGetAudioDeviceFormat(
    int devid, Pointer<SdlAudioSpec> spec, Pointer<Int32> sampleFrames) {
  final sdlGetAudioDeviceFormatLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 devid, Pointer<SdlAudioSpec> spec,
          Pointer<Int32> sampleFrames),
      int Function(int devid, Pointer<SdlAudioSpec> spec,
          Pointer<Int32> sampleFrames)>('SDL_GetAudioDeviceFormat');
  return sdlGetAudioDeviceFormatLookupFunction(devid, spec, sampleFrames);
}

///
/// Open a specific audio device.
///
/// You can open both output and capture devices through this function. Output
/// devices will take data from bound audio streams, mix it, and send it to the
/// hardware. Capture devices will feed any bound audio streams with a copy of
/// any incoming data.
///
/// An opened audio device starts out with no audio streams bound. To start
/// audio playing, bind a stream and supply audio data to it. Unlike SDL2,
/// there is no audio callback; you only bind audio streams and make sure they
/// have data flowing into them (however, you can simulate SDL2's semantics
/// fairly closely by using SDL_OpenAudioDeviceStream instead of this
/// function).
///
/// If you don't care about opening a specific device, pass a `devid` of either
/// `SDL_AUDIO_DEVICE_DEFAULT_OUTPUT` or `SDL_AUDIO_DEVICE_DEFAULT_CAPTURE`. In
/// this case, SDL will try to pick the most reasonable default, and may also
/// switch between physical devices seamlessly later, if the most reasonable
/// default changes during the lifetime of this opened device (user changed the
/// default in the OS's system preferences, the default got unplugged so the
/// system jumped to a new default, the user plugged in headphones on a mobile
/// device, etc). Unless you have a good reason to choose a specific device,
/// this is probably what you want.
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
/// SDL_AUDIO_DEVICE_DEFAULT_OUTPUT or
/// SDL_AUDIO_DEVICE_DEFAULT_CAPTURE for the most reasonable
/// default device.
/// \param spec the requested device configuration. Can be NULL to use
/// reasonable defaults.
/// \returns The device ID on success, 0 on error; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CloseAudioDevice
/// \sa SDL_GetAudioDeviceFormat
///
/// ```c
/// extern DECLSPEC SDL_AudioDeviceID SDLCALL SDL_OpenAudioDevice(SDL_AudioDeviceID devid, const SDL_AudioSpec *spec)
/// ```
int sdlOpenAudioDevice(int devid, Pointer<SdlAudioSpec> spec) {
  final sdlOpenAudioDeviceLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Uint32 devid, Pointer<SdlAudioSpec> spec),
      int Function(
          int devid, Pointer<SdlAudioSpec> spec)>('SDL_OpenAudioDevice');
  return sdlOpenAudioDeviceLookupFunction(devid, spec);
}

///
/// Use this function to pause audio playback on a specified device.
///
/// This function pauses audio processing for a given device. Any bound audio
/// streams will not progress, and no audio will be generated. Pausing one
/// device does not prevent other unpaused devices from running.
///
/// Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
/// has to bind a stream before any audio will flow. Pausing a paused device is
/// a legal no-op.
///
/// Pausing a device can be useful to halt all audio without unbinding all the
/// audio streams. This might be useful while a game is paused, or a level is
/// loading, etc.
///
/// Physical devices can not be paused or unpaused, only logical devices
/// created through SDL_OpenAudioDevice() can be.
///
/// \param dev a device opened by SDL_OpenAudioDevice()
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_ResumeAudioDevice
/// \sa SDL_AudioDevicePaused
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_PauseAudioDevice(SDL_AudioDeviceID dev)
/// ```
int sdlPauseAudioDevice(int dev) {
  final sdlPauseAudioDeviceLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Uint32 dev), int Function(int dev)>(
          'SDL_PauseAudioDevice');
  return sdlPauseAudioDeviceLookupFunction(dev);
}

///
/// Use this function to unpause audio playback on a specified device.
///
/// This function unpauses audio processing for a given device that has
/// previously been paused with SDL_PauseAudioDevice(). Once unpaused, any
/// bound audio streams will begin to progress again, and audio can be
/// generated.
///
/// Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
/// has to bind a stream before any audio will flow. Unpausing an unpaused
/// device is a legal no-op.
///
/// Physical devices can not be paused or unpaused, only logical devices
/// created through SDL_OpenAudioDevice() can be.
///
/// \param dev a device opened by SDL_OpenAudioDevice()
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_AudioDevicePaused
/// \sa SDL_PauseAudioDevice
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_ResumeAudioDevice(SDL_AudioDeviceID dev)
/// ```
int sdlResumeAudioDevice(int dev) {
  final sdlResumeAudioDeviceLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Uint32 dev), int Function(int dev)>(
          'SDL_ResumeAudioDevice');
  return sdlResumeAudioDeviceLookupFunction(dev);
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
/// \param dev a device opened by SDL_OpenAudioDevice()
/// \returns SDL_TRUE if device is valid and paused, SDL_FALSE otherwise.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PauseAudioDevice
/// \sa SDL_ResumeAudioDevice
///
/// ```c
/// extern DECLSPEC SDL_bool SDLCALL SDL_AudioDevicePaused(SDL_AudioDeviceID dev)
/// ```
bool sdlAudioDevicePaused(int dev) {
  final sdlAudioDevicePausedLookupFunction =
      libSdl3.lookupFunction<Int32 Function(Uint32 dev), int Function(int dev)>(
          'SDL_AudioDevicePaused');
  return sdlAudioDevicePausedLookupFunction(dev) == 1;
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
/// SDL_OpenAudioDevice()
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_OpenAudioDevice
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_CloseAudioDevice(SDL_AudioDeviceID devid)
/// ```
void sdlCloseAudioDevice(int devid) {
  final sdlCloseAudioDeviceLookupFunction = libSdl3.lookupFunction<
      Void Function(Uint32 devid),
      void Function(int devid)>('SDL_CloseAudioDevice');
  return sdlCloseAudioDeviceLookupFunction(devid);
}

///
/// Bind a list of audio streams to an audio device.
///
/// Audio data will flow through any bound streams. For an output device, data
/// for all bound streams will be mixed together and fed to the device. For a
/// capture device, a copy of recorded data will be provided to each bound
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
/// Binding a stream to a device will set its output format for output devices,
/// and its input format for capture devices, so they match the device's
/// settings. The caller is welcome to change the other end of the stream's
/// format at any time.
///
/// \param devid an audio device to bind a stream to.
/// \param streams an array of audio streams to unbind.
/// \param num_streams Number streams listed in the `streams` array.
/// \returns 0 on success, -1 on error; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BindAudioStreams
/// \sa SDL_UnbindAudioStream
/// \sa SDL_GetAudioStreamDevice
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_BindAudioStreams(SDL_AudioDeviceID devid, SDL_AudioStream **streams, int num_streams)
/// ```
int sdlBindAudioStreams(
    int devid, Pointer<Pointer<SdlAudioStream>> streams, int numStreams) {
  final sdlBindAudioStreamsLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 devid, Pointer<Pointer<SdlAudioStream>> streams,
          Int32 numStreams),
      int Function(int devid, Pointer<Pointer<SdlAudioStream>> streams,
          int numStreams)>('SDL_BindAudioStreams');
  return sdlBindAudioStreamsLookupFunction(devid, streams, numStreams);
}

///
/// Bind a single audio stream to an audio device.
///
/// This is a convenience function, equivalent to calling
/// `SDL_BindAudioStreams(devid, &stream, 1)`.
///
/// \param devid an audio device to bind a stream to.
/// \param stream an audio stream to bind to a device.
/// \returns 0 on success, -1 on error; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BindAudioStreams
/// \sa SDL_UnbindAudioStream
/// \sa SDL_GetAudioStreamDevice
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_BindAudioStream(SDL_AudioDeviceID devid, SDL_AudioStream *stream)
/// ```
int sdlBindAudioStream(int devid, Pointer<SdlAudioStream> stream) {
  final sdlBindAudioStreamLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint32 devid, Pointer<SdlAudioStream> stream),
      int Function(
          int devid, Pointer<SdlAudioStream> stream)>('SDL_BindAudioStream');
  return sdlBindAudioStreamLookupFunction(devid, stream);
}

///
/// Unbind a list of audio streams from their audio devices.
///
/// The streams being unbound do not all have to be on the same device. All
/// streams on the same device will be unbound atomically (data will stop
/// flowing through them all unbound streams on the same device at the same
/// time).
///
/// Unbinding a stream that isn't bound to a device is a legal no-op.
///
/// \param streams an array of audio streams to unbind.
/// \param num_streams Number streams listed in the `streams` array.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BindAudioStreams
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_UnbindAudioStreams(SDL_AudioStream **streams, int num_streams)
/// ```
void sdlUnbindAudioStreams(
    Pointer<Pointer<SdlAudioStream>> streams, int numStreams) {
  final sdlUnbindAudioStreamsLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<Pointer<SdlAudioStream>> streams, Int32 numStreams),
      void Function(Pointer<Pointer<SdlAudioStream>> streams,
          int numStreams)>('SDL_UnbindAudioStreams');
  return sdlUnbindAudioStreamsLookupFunction(streams, numStreams);
}

///
/// Unbind a single audio stream from its audio device.
///
/// This is a convenience function, equivalent to calling
/// `SDL_UnbindAudioStreams(&stream, 1)`.
///
/// \param stream an audio stream to unbind from a device.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BindAudioStream
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_UnbindAudioStream(SDL_AudioStream *stream)
/// ```
void sdlUnbindAudioStream(Pointer<SdlAudioStream> stream) {
  final sdlUnbindAudioStreamLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlAudioStream> stream),
      void Function(Pointer<SdlAudioStream> stream)>('SDL_UnbindAudioStream');
  return sdlUnbindAudioStreamLookupFunction(stream);
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
/// \returns The bound audio device, or 0 if not bound or invalid.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_BindAudioStream
/// \sa SDL_BindAudioStreams
///
/// ```c
/// extern DECLSPEC SDL_AudioDeviceID SDLCALL SDL_GetAudioStreamDevice(SDL_AudioStream *stream)
/// ```
int sdlGetAudioStreamDevice(Pointer<SdlAudioStream> stream) {
  final sdlGetAudioStreamDeviceLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlAudioStream> stream),
      int Function(Pointer<SdlAudioStream> stream)>('SDL_GetAudioStreamDevice');
  return sdlGetAudioStreamDeviceLookupFunction(stream);
}

///
/// Create a new audio stream.
///
/// \param src_spec The format details of the input audio
/// \param dst_spec The format details of the output audio
/// \returns a new audio stream on success, or NULL on failure.
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
/// \sa SDL_ChangeAudioStreamOutput
/// \sa SDL_DestroyAudioStream
///
/// ```c
/// extern DECLSPEC SDL_AudioStream *SDLCALL SDL_CreateAudioStream(const SDL_AudioSpec *src_spec, const SDL_AudioSpec *dst_spec)
/// ```
Pointer<SdlAudioStream> sdlCreateAudioStream(
    Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec) {
  final sdlCreateAudioStreamLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlAudioStream> Function(
          Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec),
      Pointer<SdlAudioStream> Function(Pointer<SdlAudioSpec> srcSpec,
          Pointer<SdlAudioSpec> dstSpec)>('SDL_CreateAudioStream');
  return sdlCreateAudioStreamLookupFunction(srcSpec, dstSpec);
}

///
/// Get the properties associated with an audio stream.
///
/// \param stream the SDL_AudioStream to query
/// \returns a valid property ID on success or 0 on failure; call
/// SDL_GetError() for more information.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetProperty
/// \sa SDL_SetProperty
///
/// ```c
/// extern DECLSPEC SDL_PropertiesID SDLCALL SDL_GetAudioStreamProperties(SDL_AudioStream *stream)
/// ```
int sdlGetAudioStreamProperties(Pointer<SdlAudioStream> stream) {
  final sdlGetAudioStreamPropertiesLookupFunction = libSdl3.lookupFunction<
      Uint32 Function(Pointer<SdlAudioStream> stream),
      int Function(
          Pointer<SdlAudioStream> stream)>('SDL_GetAudioStreamProperties');
  return sdlGetAudioStreamPropertiesLookupFunction(stream);
}

///
/// Query the current format of an audio stream.
///
/// \param stream the SDL_AudioStream to query.
/// \param src_spec Where to store the input audio format; ignored if NULL.
/// \param dst_spec Where to store the output audio format; ignored if NULL.
/// \returns 0 on success, or -1 on error.
///
/// \threadsafety It is safe to call this function from any thread, as it holds
/// a stream-specific mutex while running.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetAudioStreamFormat(SDL_AudioStream *stream, SDL_AudioSpec *src_spec, SDL_AudioSpec *dst_spec)
/// ```
int sdlGetAudioStreamFormat(Pointer<SdlAudioStream> stream,
    Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec) {
  final sdlGetAudioStreamFormatLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream,
          Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec),
      int Function(
          Pointer<SdlAudioStream> stream,
          Pointer<SdlAudioSpec> srcSpec,
          Pointer<SdlAudioSpec> dstSpec)>('SDL_GetAudioStreamFormat');
  return sdlGetAudioStreamFormatLookupFunction(stream, srcSpec, dstSpec);
}

///
/// Change the input and output formats of an audio stream.
///
/// Future calls to and SDL_GetAudioStreamAvailable and SDL_GetAudioStreamData
/// will reflect the new format, and future calls to SDL_PutAudioStreamData
/// must provide data in the new input formats.
///
/// \param stream The stream the format is being changed
/// \param src_spec The new format of the audio input; if NULL, it is not
/// changed.
/// \param dst_spec The new format of the audio output; if NULL, it is not
/// changed.
/// \returns 0 on success, or -1 on error.
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
/// extern DECLSPEC int SDLCALL SDL_SetAudioStreamFormat(SDL_AudioStream *stream, const SDL_AudioSpec *src_spec, const SDL_AudioSpec *dst_spec)
/// ```
int sdlSetAudioStreamFormat(Pointer<SdlAudioStream> stream,
    Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec) {
  final sdlSetAudioStreamFormatLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream,
          Pointer<SdlAudioSpec> srcSpec, Pointer<SdlAudioSpec> dstSpec),
      int Function(
          Pointer<SdlAudioStream> stream,
          Pointer<SdlAudioSpec> srcSpec,
          Pointer<SdlAudioSpec> dstSpec)>('SDL_SetAudioStreamFormat');
  return sdlSetAudioStreamFormatLookupFunction(stream, srcSpec, dstSpec);
}

///
/// Get the frequency ratio of an audio stream.
///
/// \param stream the SDL_AudioStream to query.
/// \returns the frequency ratio of the stream, or 0.0 on error
///
/// \threadsafety It is safe to call this function from any thread, as it holds
/// a stream-specific mutex while running.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetAudioStreamFrequencyRatio
///
/// ```c
/// extern DECLSPEC float SDLCALL SDL_GetAudioStreamFrequencyRatio(SDL_AudioStream *stream)
/// ```
double sdlGetAudioStreamFrequencyRatio(Pointer<SdlAudioStream> stream) {
  final sdlGetAudioStreamFrequencyRatioLookupFunction = libSdl3.lookupFunction<
      Float Function(Pointer<SdlAudioStream> stream),
      double Function(
          Pointer<SdlAudioStream> stream)>('SDL_GetAudioStreamFrequencyRatio');
  return sdlGetAudioStreamFrequencyRatioLookupFunction(stream);
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
/// \param stream The stream the frequency ratio is being changed
/// \param ratio The frequency ratio. 1.0 is normal speed. Must be between 0.01
/// and 100.
/// \returns 0 on success, or -1 on error.
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
/// extern DECLSPEC int SDLCALL SDL_SetAudioStreamFrequencyRatio(SDL_AudioStream *stream, float ratio)
/// ```
int sdlSetAudioStreamFrequencyRatio(
    Pointer<SdlAudioStream> stream, double ratio) {
  final sdlSetAudioStreamFrequencyRatioLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream, Float ratio),
      int Function(Pointer<SdlAudioStream> stream,
          double ratio)>('SDL_SetAudioStreamFrequencyRatio');
  return sdlSetAudioStreamFrequencyRatioLookupFunction(stream, ratio);
}

///
/// Add data to be converted/resampled to the stream.
///
/// This data must match the format/channels/samplerate specified in the latest
/// call to SDL_SetAudioStreamFormat, or the format specified when creating the
/// stream if it hasn't been changed.
///
/// Note that this call simply queues unconverted data for later. This is
/// different than SDL2, where data was converted during the Put call and the
/// Get call would just dequeue the previously-converted data.
///
/// \param stream The stream the audio data is being added to
/// \param buf A pointer to the audio data to add
/// \param len The number of bytes to write to the stream
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
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
/// extern DECLSPEC int SDLCALL SDL_PutAudioStreamData(SDL_AudioStream *stream, const void *buf, int len)
/// ```
int sdlPutAudioStreamData(
    Pointer<SdlAudioStream> stream, Pointer<NativeType> buf, int len) {
  final sdlPutAudioStreamDataLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlAudioStream> stream, Pointer<NativeType> buf, Int32 len),
      int Function(Pointer<SdlAudioStream> stream, Pointer<NativeType> buf,
          int len)>('SDL_PutAudioStreamData');
  return sdlPutAudioStreamDataLookupFunction(stream, buf, len);
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
/// \param stream The stream the audio is being requested from
/// \param buf A buffer to fill with audio data
/// \param len The maximum number of bytes to fill
/// \returns the number of bytes read from the stream, or -1 on error
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
/// extern DECLSPEC int SDLCALL SDL_GetAudioStreamData(SDL_AudioStream *stream, void *buf, int len)
/// ```
int sdlGetAudioStreamData(
    Pointer<SdlAudioStream> stream, Pointer<NativeType> buf, int len) {
  final sdlGetAudioStreamDataLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlAudioStream> stream, Pointer<NativeType> buf, Int32 len),
      int Function(Pointer<SdlAudioStream> stream, Pointer<NativeType> buf,
          int len)>('SDL_GetAudioStreamData');
  return sdlGetAudioStreamDataLookupFunction(stream, buf, len);
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
/// \param stream The audio stream to query
/// \returns the number of converted/resampled bytes available.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAudioStreamData
/// \sa SDL_PutAudioStreamData
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetAudioStreamAvailable(SDL_AudioStream *stream)
/// ```
int sdlGetAudioStreamAvailable(Pointer<SdlAudioStream> stream) {
  final sdlGetAudioStreamAvailableLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream),
      int Function(
          Pointer<SdlAudioStream> stream)>('SDL_GetAudioStreamAvailable');
  return sdlGetAudioStreamAvailableLookupFunction(stream);
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
/// \param stream The audio stream to query
/// \returns the number of bytes queued.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PutAudioStreamData
/// \sa SDL_ClearAudioStream
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetAudioStreamQueued(SDL_AudioStream *stream)
/// ```
int sdlGetAudioStreamQueued(Pointer<SdlAudioStream> stream) {
  final sdlGetAudioStreamQueuedLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream),
      int Function(Pointer<SdlAudioStream> stream)>('SDL_GetAudioStreamQueued');
  return sdlGetAudioStreamQueuedLookupFunction(stream);
}

///
/// Tell the stream that you're done sending data, and anything being buffered
/// should be converted/resampled and made available immediately.
///
/// It is legal to add more data to a stream after flushing, but there will be
/// audio gaps in the output. Generally this is intended to signal the end of
/// input, so the complete output becomes available.
///
/// \param stream The audio stream to flush
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_PutAudioStreamData
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_FlushAudioStream(SDL_AudioStream *stream)
/// ```
int sdlFlushAudioStream(Pointer<SdlAudioStream> stream) {
  final sdlFlushAudioStreamLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream),
      int Function(Pointer<SdlAudioStream> stream)>('SDL_FlushAudioStream');
  return sdlFlushAudioStreamLookupFunction(stream);
}

///
/// Clear any pending data in the stream without converting it
///
/// \param stream The audio stream to clear
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
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
/// extern DECLSPEC int SDLCALL SDL_ClearAudioStream(SDL_AudioStream *stream)
/// ```
int sdlClearAudioStream(Pointer<SdlAudioStream> stream) {
  final sdlClearAudioStreamLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream),
      int Function(Pointer<SdlAudioStream> stream)>('SDL_ClearAudioStream');
  return sdlClearAudioStreamLookupFunction(stream);
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
/// As this is just a wrapper over SDL_LockMutex for an internal lock, it has
/// all the same attributes (recursive locks are allowed, etc).
///
/// \param stream The audio stream to lock.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_UnlockAudioStream
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_LockAudioStream(SDL_AudioStream *stream)
/// ```
int sdlLockAudioStream(Pointer<SdlAudioStream> stream) {
  final sdlLockAudioStreamLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream),
      int Function(Pointer<SdlAudioStream> stream)>('SDL_LockAudioStream');
  return sdlLockAudioStreamLookupFunction(stream);
}

///
/// Unlock an audio stream for serialized access.
///
/// This unlocks an audio stream after a call to SDL_LockAudioStream.
///
/// \param stream The audio stream to unlock.
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety You should only call this from the same thread that
/// previously called SDL_LockAudioStream.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_LockAudioStream
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_UnlockAudioStream(SDL_AudioStream *stream)
/// ```
int sdlUnlockAudioStream(Pointer<SdlAudioStream> stream) {
  final sdlUnlockAudioStreamLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<SdlAudioStream> stream),
      int Function(Pointer<SdlAudioStream> stream)>('SDL_UnlockAudioStream');
  return sdlUnlockAudioStreamLookupFunction(stream);
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
/// \param callback the new callback function to call when data is added to the
/// stream.
/// \param userdata an opaque pointer provided to the callback for its own
/// personal use.
/// \returns 0 on success, -1 on error. This only fails if `stream` is NULL.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetAudioStreamPutCallback
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetAudioStreamGetCallback(SDL_AudioStream *stream, SDL_AudioStreamCallback callback, void *userdata)
/// ```
int sdlSetAudioStreamGetCallback(
    Pointer<SdlAudioStream> stream,
    Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlSetAudioStreamGetCallbackLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlAudioStream> stream,
          Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
          Pointer<NativeType> userdata),
      int Function(
          Pointer<SdlAudioStream> stream,
          Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_SetAudioStreamGetCallback');
  return sdlSetAudioStreamGetCallbackLookupFunction(stream, callback, userdata);
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
/// \returns 0 on success, -1 on error. This only fails if `stream` is NULL.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_SetAudioStreamGetCallback
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetAudioStreamPutCallback(SDL_AudioStream *stream, SDL_AudioStreamCallback callback, void *userdata)
/// ```
int sdlSetAudioStreamPutCallback(
    Pointer<SdlAudioStream> stream,
    Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlSetAudioStreamPutCallbackLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlAudioStream> stream,
          Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
          Pointer<NativeType> userdata),
      int Function(
          Pointer<SdlAudioStream> stream,
          Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_SetAudioStreamPutCallback');
  return sdlSetAudioStreamPutCallbackLookupFunction(stream, callback, userdata);
}

///
/// Free an audio stream
///
/// \param stream The audio stream to free
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_CreateAudioStream
///
/// ```c
/// extern DECLSPEC void SDLCALL SDL_DestroyAudioStream(SDL_AudioStream *stream)
/// ```
void sdlDestroyAudioStream(Pointer<SdlAudioStream> stream) {
  final sdlDestroyAudioStreamLookupFunction = libSdl3.lookupFunction<
      Void Function(Pointer<SdlAudioStream> stream),
      void Function(Pointer<SdlAudioStream> stream)>('SDL_DestroyAudioStream');
  return sdlDestroyAudioStreamLookupFunction(stream);
}

///
/// Convenience function for straightforward audio init for the common case.
///
/// If all your app intends to do is provide a single source of PCM audio, this
/// function allows you to do all your audio setup in a single call.
///
/// This is intended to be a clean means to migrate apps from SDL2.
///
/// This function will open an audio device, create a stream and bind it.
/// Unlike other methods of setup, the audio device will be closed when this
/// stream is destroyed, so the app can treat the returned SDL_AudioStream as
/// the only object needed to manage audio playback.
///
/// Also unlike other functions, the audio device begins paused. This is to map
/// more closely to SDL2-style behavior, and since there is no extra step here
/// to bind a stream to begin audio flowing. The audio device should be resumed
/// with SDL_ResumeAudioDevice(SDL_GetAudioStreamDevice(stream));
///
/// This function works with both playback and capture devices.
///
/// The `spec` parameter represents the app's side of the audio stream. That
/// is, for recording audio, this will be the output format, and for playing
/// audio, this will be the input format.
///
/// If you don't care about opening a specific audio device, you can (and
/// probably _should_), use SDL_AUDIO_DEVICE_DEFAULT_OUTPUT for playback and
/// SDL_AUDIO_DEVICE_DEFAULT_CAPTURE for recording.
///
/// One can optionally provide a callback function; if NULL, the app is
/// expected to queue audio data for playback (or unqueue audio data if
/// capturing). Otherwise, the callback will begin to fire once the device is
/// unpaused.
///
/// \param devid an audio device to open, or SDL_AUDIO_DEVICE_DEFAULT_OUTPUT or
/// SDL_AUDIO_DEVICE_DEFAULT_CAPTURE.
/// \param spec the audio stream's data format. Required.
/// \param callback A callback where the app will provide new data for
/// playback, or receive new data for capture. Can be NULL, in
/// which case the app will need to call SDL_PutAudioStreamData
/// or SDL_GetAudioStreamData as necessary.
/// \param userdata App-controlled pointer passed to callback. Can be NULL.
/// Ignored if callback is NULL.
/// \returns an audio stream on success, ready to use. NULL on error; call
/// SDL_GetError() for more information. When done with this stream,
/// call SDL_DestroyAudioStream to free resources and close the
/// device.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_GetAudioStreamDevice
/// \sa SDL_ResumeAudioDevice
///
/// ```c
/// extern DECLSPEC SDL_AudioStream *SDLCALL SDL_OpenAudioDeviceStream(SDL_AudioDeviceID devid, const SDL_AudioSpec *spec, SDL_AudioStreamCallback callback, void *userdata)
/// ```
Pointer<SdlAudioStream> sdlOpenAudioDeviceStream(
    int devid,
    Pointer<SdlAudioSpec> spec,
    Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlOpenAudioDeviceStreamLookupFunction = libSdl3.lookupFunction<
      Pointer<SdlAudioStream> Function(
          Uint32 devid,
          Pointer<SdlAudioSpec> spec,
          Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
          Pointer<NativeType> userdata),
      Pointer<SdlAudioStream> Function(
          int devid,
          Pointer<SdlAudioSpec> spec,
          Pointer<NativeFunction<SdlAudioStreamCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_OpenAudioDeviceStream');
  return sdlOpenAudioDeviceStreamLookupFunction(
      devid, spec, callback, userdata);
}

///
/// Set a callback that fires when data is about to be fed to an audio device.
///
/// This is useful for accessing the final mix, perhaps for writing a
/// visualizer or applying a final effect to the audio data before playback.
///
/// The buffer is the final mix of all bound audio streams on an opened device;
/// this callback will fire regularly for any device that is both opened and
/// unpaused. If there is no new data to mix, either because no streams are
/// bound to the device or all the streams are empty, this callback will still
/// fire with the entire buffer set to silence.
///
/// This callback is allowed to make changes to the data; the contents of the
/// buffer after this call is what is ultimately passed along to the hardware.
///
/// The callback is always provided the data in float format (values from -1.0f
/// to 1.0f), but the number of channels or sample rate may be different than
/// the format the app requested when opening the device; SDL might have had to
/// manage a conversion behind the scenes, or the playback might have jumped to
/// new physical hardware when a system default changed, etc. These details may
/// change between calls. Accordingly, the size of the buffer might change
/// between calls as well.
///
/// This callback can run at any time, and from any thread; if you need to
/// serialize access to your app's data, you should provide and use a mutex or
/// other synchronization device.
///
/// All of this to say: there are specific needs this callback can fulfill, but
/// it is not the simplest interface. Apps should generally provide audio in
/// their preferred format through an SDL_AudioStream and let SDL handle the
/// difference.
///
/// This function is extremely time-sensitive; the callback should do the least
/// amount of work possible and return as quickly as it can. The longer the
/// callback runs, the higher the risk of audio dropouts or other problems.
///
/// This function will block until the audio device is in between iterations,
/// so any existing callback that might be running will finish before this
/// function sets the new callback and returns.
///
/// Setting a NULL callback function disables any previously-set callback.
///
/// \param devid The ID of an opened audio device.
/// \param callback A callback function to be called. Can be NULL.
/// \param userdata App-controlled pointer passed to callback. Can be NULL.
/// \returns zero on success, -1 on error; call SDL_GetError() for more
/// information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_SetAudioPostmixCallback(SDL_AudioDeviceID devid, SDL_AudioPostmixCallback callback, void *userdata)
/// ```
int sdlSetAudioPostmixCallback(
    int devid,
    Pointer<NativeFunction<SdlAudioPostmixCallback>> callback,
    Pointer<NativeType> userdata) {
  final sdlSetAudioPostmixCallbackLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Uint32 devid,
          Pointer<NativeFunction<SdlAudioPostmixCallback>> callback,
          Pointer<NativeType> userdata),
      int Function(
          int devid,
          Pointer<NativeFunction<SdlAudioPostmixCallback>> callback,
          Pointer<NativeType> userdata)>('SDL_SetAudioPostmixCallback');
  return sdlSetAudioPostmixCallbackLookupFunction(devid, callback, userdata);
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
/// SDL_LoadWAV_IO(SDL_IOFromFile("sample.wav", "rb"), 1, &spec, &buf, &len);
/// ```
///
/// Note that the SDL_LoadWAV function does this same thing for you, but in a
/// less messy way:
///
/// ```c
/// SDL_LoadWAV("sample.wav", &spec, &buf, &len);
/// ```
///
/// \param src The data source for the WAVE data
/// \param closeio If SDL_TRUE, calls SDL_CloseIO() on `src` before returning,
/// even in the case of an error
/// \param spec A pointer to an SDL_AudioSpec that will be set to the WAVE
/// data's format details on successful return
/// \param audio_buf A pointer filled with the audio data, allocated by the
/// function
/// \param audio_len A pointer filled with the length of the audio data buffer
/// in bytes
/// \returns This function, if successfully called, returns 0. `audio_buf` will
/// be filled with a pointer to an allocated buffer containing the
/// audio data, and `audio_len` is filled with the length of that
/// audio buffer in bytes.
///
/// This function returns -1 if the .WAV file cannot be opened, uses
/// an unknown data format, or is corrupt; call SDL_GetError() for
/// more information.
///
/// When the application is done with the data returned in
/// `audio_buf`, it should call SDL_free() to dispose of it.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_free
/// \sa SDL_LoadWAV
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_LoadWAV_IO(SDL_IOStream * src, SDL_bool closeio, SDL_AudioSpec * spec, Uint8 ** audio_buf, Uint32 * audio_len)
/// ```
int sdlLoadWavIo(
    Pointer<SdlIoStream> src,
    bool closeio,
    Pointer<SdlAudioSpec> spec,
    Pointer<Pointer<Uint8>> audioBuf,
    Pointer<Uint32> audioLen) {
  final sdlLoadWavIoLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlIoStream> src,
          Int32 closeio,
          Pointer<SdlAudioSpec> spec,
          Pointer<Pointer<Uint8>> audioBuf,
          Pointer<Uint32> audioLen),
      int Function(
          Pointer<SdlIoStream> src,
          int closeio,
          Pointer<SdlAudioSpec> spec,
          Pointer<Pointer<Uint8>> audioBuf,
          Pointer<Uint32> audioLen)>('SDL_LoadWAV_IO');
  return sdlLoadWavIoLookupFunction(
      src, closeio ? 1 : 0, spec, audioBuf, audioLen);
}

///
/// Loads a WAV from a file path.
///
/// This is a convenience function that is effectively the same as:
///
/// ```c
/// SDL_LoadWAV_IO(SDL_IOFromFile(path, "rb"), 1, spec, audio_buf, audio_len);
/// ```
///
/// Note that in SDL2, this was a preprocessor macro and not a real function.
///
/// \param path The file path of the WAV file to open.
/// \param spec A pointer to an SDL_AudioSpec that will be set to the WAVE
/// data's format details on successful return.
/// \param audio_buf A pointer filled with the audio data, allocated by the
/// function.
/// \param audio_len A pointer filled with the length of the audio data buffer
/// in bytes
/// \returns This function, if successfully called, returns 0. `audio_buf` will
/// be filled with a pointer to an allocated buffer containing the
/// audio data, and `audio_len` is filled with the length of that
/// audio buffer in bytes.
///
/// This function returns -1 if the .WAV file cannot be opened, uses
/// an unknown data format, or is corrupt; call SDL_GetError() for
/// more information.
///
/// When the application is done with the data returned in
/// `audio_buf`, it should call SDL_free() to dispose of it.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// \sa SDL_free
/// \sa SDL_LoadWAV_IO
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_LoadWAV(const char *path, SDL_AudioSpec * spec, Uint8 ** audio_buf, Uint32 * audio_len)
/// ```
int sdlLoadWav(String? path, Pointer<SdlAudioSpec> spec,
    Pointer<Pointer<Uint8>> audioBuf, Pointer<Uint32> audioLen) {
  final sdlLoadWavLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Utf8> path, Pointer<SdlAudioSpec> spec,
          Pointer<Pointer<Uint8>> audioBuf, Pointer<Uint32> audioLen),
      int Function(
          Pointer<Utf8> path,
          Pointer<SdlAudioSpec> spec,
          Pointer<Pointer<Uint8>> audioBuf,
          Pointer<Uint32> audioLen)>('SDL_LoadWAV');
  final pathPointer = path != null ? path.toNativeUtf8() : nullptr;
  final result =
      sdlLoadWavLookupFunction(pathPointer, spec, audioBuf, audioLen);
  calloc.free(pathPointer);
  return result;
}

///
/// Mix audio data in a specified format.
///
/// This takes an audio buffer `src` of `len` bytes of `format` data and mixes
/// it into `dst`, performing addition, volume adjustment, and overflow
/// clipping. The buffer pointed to by `dst` must also be `len` bytes of
/// `format` data.
///
/// This is provided for convenience -- you can mix your own audio data.
///
/// Do not use this function for mixing together more than two streams of
/// sample data. The output from repeated application of this function may be
/// distorted by clipping, because there is no accumulator with greater range
/// than the input (not to mention this being an inefficient way of doing it).
///
/// It is a common misconception that this function is required to write audio
/// data to an output stream in an audio callback. While you can do that,
/// SDL_MixAudioFormat() is really only needed when you're mixing a single
/// audio stream with a volume adjustment.
///
/// \param dst the destination for the mixed audio
/// \param src the source audio buffer to be mixed
/// \param format the SDL_AudioFormat structure representing the desired audio
/// format
/// \param len the length of the audio buffer in bytes
/// \param volume ranges from 0 - 128, and should be set to SDL_MIX_MAXVOLUME
/// for full audio volume
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_MixAudioFormat(Uint8 * dst, const Uint8 * src, SDL_AudioFormat format, Uint32 len, int volume)
/// ```
int sdlMixAudioFormat(
    Pointer<Uint8> dst, Pointer<Uint8> src, int format, int len, int volume) {
  final sdlMixAudioFormatLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Pointer<Uint8> dst, Pointer<Uint8> src, Uint16 format,
          Uint32 len, Int32 volume),
      int Function(Pointer<Uint8> dst, Pointer<Uint8> src, int format, int len,
          int volume)>('SDL_MixAudioFormat');
  return sdlMixAudioFormatLookupFunction(dst, src, format, len, volume);
}

///
/// Convert some audio data of one format to another format.
///
/// Please note that this function is for convenience, but should not be used
/// to resample audio in blocks, as it will introduce audio artifacts on the
/// boundaries. You should only use this function if you are converting audio
/// data in its entirety in one call. If you want to convert audio in smaller
/// chunks, use an SDL_AudioStream, which is designed for this situation.
///
/// Internally, this function creates and destroys an SDL_AudioStream on each
/// use, so it's also less efficient than using one directly, if you need to
/// convert multiple times.
///
/// \param src_spec The format details of the input audio
/// \param src_data The audio data to be converted
/// \param src_len The len of src_data
/// \param dst_spec The format details of the output audio
/// \param dst_data Will be filled with a pointer to converted audio data,
/// which should be freed with SDL_free(). On error, it will be
/// NULL.
/// \param dst_len Will be filled with the len of dst_data
/// \returns 0 on success or a negative error code on failure; call
/// SDL_GetError() for more information.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_ConvertAudioSamples(const SDL_AudioSpec *src_spec, const Uint8 *src_data, int src_len, const SDL_AudioSpec *dst_spec, Uint8 **dst_data, int *dst_len)
/// ```
int sdlConvertAudioSamples(
    Pointer<SdlAudioSpec> srcSpec,
    Pointer<Uint8> srcData,
    int srcLen,
    Pointer<SdlAudioSpec> dstSpec,
    Pointer<Pointer<Uint8>> dstData,
    Pointer<Int32> dstLen) {
  final sdlConvertAudioSamplesLookupFunction = libSdl3.lookupFunction<
      Int32 Function(
          Pointer<SdlAudioSpec> srcSpec,
          Pointer<Uint8> srcData,
          Int32 srcLen,
          Pointer<SdlAudioSpec> dstSpec,
          Pointer<Pointer<Uint8>> dstData,
          Pointer<Int32> dstLen),
      int Function(
          Pointer<SdlAudioSpec> srcSpec,
          Pointer<Uint8> srcData,
          int srcLen,
          Pointer<SdlAudioSpec> dstSpec,
          Pointer<Pointer<Uint8>> dstData,
          Pointer<Int32> dstLen)>('SDL_ConvertAudioSamples');
  return sdlConvertAudioSamplesLookupFunction(
      srcSpec, srcData, srcLen, dstSpec, dstData, dstLen);
}

///
/// Get the appropriate memset value for silencing an audio format.
///
/// The value returned by this function can be used as the second argument to
/// memset (or SDL_memset) to set an audio buffer in a specific format to
/// silence.
///
/// \param format the audio data format to query.
/// \returns A byte value that can be passed to memset.
///
/// \threadsafety It is safe to call this function from any thread.
///
/// \since This function is available since SDL 3.0.0.
///
/// ```c
/// extern DECLSPEC int SDLCALL SDL_GetSilenceValueForFormat(SDL_AudioFormat format)
/// ```
int sdlGetSilenceValueForFormat(int format) {
  final sdlGetSilenceValueForFormatLookupFunction = libSdl3.lookupFunction<
      Int32 Function(Uint16 format),
      int Function(int format)>('SDL_GetSilenceValueForFormat');
  return sdlGetSilenceValueForFormatLookupFunction(format);
}
