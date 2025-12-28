// ignore_for_file: avoid_positional_boolean_parameters

part of '../../sdl_mixer.dart';

extension MixAudioDecoderEx on MixAudioDecoder {
  ///
  /// Create a MIX_AudioDecoder from a path on the filesystem.
  ///
  /// Most apps won't need this, as SDL_mixer's usual interfaces will decode
  /// audio as needed. However, if one wants to decode an audio file into a
  /// memory buffer without playing it, this interface offers that.
  ///
  /// This function allows properties to be specified. This is intended to supply
  /// file-specific settings, such as where to find SoundFonts for a MIDI file,
  /// etc. In most cases, the caller should pass a zero to specify no extra
  /// properties.
  ///
  /// SDL_PropertiesID are discussed in
  /// [SDL's documentation](https://wiki.libsdl.org/SDL3/CategoryProperties)
  /// .
  ///
  /// When done with the audio decoder, it can be destroyed with
  /// MIX_DestroyAudioDecoder().
  ///
  /// This function requires SDL_mixer to have been initialized with a successful
  /// call to MIX_Init(), but does not need an actual MIX_Mixer to have been
  /// created.
  ///
  /// \param path the path on the filesystem from which to load data.
  /// \param props decoder-specific properties. May be zero.
  /// \returns an audio decoder, ready to decode.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_CreateAudioDecoder_IO
  /// \sa MIX_DecodeAudio
  /// \sa MIX_DestroyAudioDecoder
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_AudioDecoder * SDLCALL MIX_CreateAudioDecoder(const char *path, SDL_PropertiesID props)
  /// ```
  /// {@category mixer}
  static Pointer<MixAudioDecoder> create(String? path, int props) =>
      mixCreateAudioDecoder(path, props);

  ///
  /// Create a MIX_AudioDecoder from an SDL_IOStream.
  ///
  /// Most apps won't need this, as SDL_mixer's usual interfaces will decode
  /// audio as needed. However, if one wants to decode an audio file into a
  /// memory buffer without playing it, this interface offers that.
  ///
  /// This function allows properties to be specified. This is intended to supply
  /// file-specific settings, such as where to find SoundFonts for a MIDI file,
  /// etc. In most cases, the caller should pass a zero to specify no extra
  /// properties.
  ///
  /// If `closeio` is true, then `io` will be closed when this decoder is done
  /// with it. If this function fails and `closeio` is true, then `io` will be
  /// closed before this function returns.
  ///
  /// When done with the audio decoder, it can be destroyed with
  /// MIX_DestroyAudioDecoder().
  ///
  /// This function requires SDL_mixer to have been initialized with a successful
  /// call to MIX_Init(), but does not need an actual MIX_Mixer to have been
  /// created.
  ///
  /// \param io the i/o stream from which to load data.
  /// \param closeio if true, close the i/o stream when done with it.
  /// \param props decoder-specific properties. May be zero.
  /// \returns an audio decoder, ready to decode.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_CreateAudioDecoder_IO
  /// \sa MIX_DecodeAudio
  /// \sa MIX_DestroyAudioDecoder
  ///
  /// ```c
  /// extern SDL_DECLSPEC MIX_AudioDecoder * SDLCALL MIX_CreateAudioDecoder_IO(SDL_IOStream *io, bool closeio, SDL_PropertiesID props)
  /// ```
  /// {@category mixer}
  static Pointer<MixAudioDecoder> createIo(
    Pointer<SdlIoStream> io,
    bool closeio,
    int props,
  ) => mixCreateAudioDecoderIo(io, closeio, props);
}

extension MixAudioDecoderPointerEx on Pointer<MixAudioDecoder> {
  ///
  /// Destroy the specified audio decoder.
  ///
  /// Destroying a NULL MIX_AudioDecoder is a legal no-op.
  ///
  /// \param audiodecoder the audio to destroy.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL MIX_DestroyAudioDecoder(MIX_AudioDecoder *audiodecoder)
  /// ```
  /// {@category mixer}
  void destroy() => mixDestroyAudioDecoder(this);

  ///
  /// Get the properties associated with a MIX_AudioDecoder.
  ///
  /// SDL_mixer offers some properties of its own, but this can also be a
  /// convenient place to store app-specific data.
  ///
  /// A SDL_PropertiesID is created the first time this function is called for a
  /// given MIX_AudioDecoder, if necessary.
  ///
  /// The file-specific metadata exposed through this function is identical to
  /// those available through MIX_GetAudioProperties(). Please refer to that
  /// function's documentation for details.
  ///
  /// \param audiodecoder the audio decoder to query.
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety It is safe to call this function from any thread.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa MIX_GetAudioProperties
  ///
  /// ```c
  /// extern SDL_DECLSPEC SDL_PropertiesID SDLCALL MIX_GetAudioDecoderProperties(MIX_AudioDecoder *audiodecoder)
  /// ```
  /// {@category mixer}
  int getProperties() => mixGetAudioDecoderProperties(this);

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
  bool getFormat(Pointer<SdlAudioSpec> spec) =>
      mixGetAudioDecoderFormat(this, spec);

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
  int decodeAudio(
    Pointer<NativeType> buffer,
    int buflen,
    Pointer<SdlAudioSpec> spec,
  ) => mixDecodeAudio(this, buffer, buflen, spec);
}
