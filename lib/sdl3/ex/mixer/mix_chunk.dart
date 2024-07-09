import 'dart:ffi';
import '../../generated/lib_sdl_mixer.dart';
import '../../generated/struct_sdl.dart';
import '../../generated/struct_sdl_mixer.dart';

extension MixChunkEx on MixChunk {
  // lib_sdl_mxer.dart

  ///
  /// Load a supported audio format into a chunk.
  ///
  /// SDL_mixer has two separate data structures for audio data. One it calls a
  /// "chunk," which is meant to be a file completely decoded into memory up
  /// front, and the other it calls "music" which is a file intended to be
  /// decoded on demand. Originally, simple formats like uncompressed WAV files
  /// were meant to be chunks and compressed things, like MP3s, were meant to be
  /// music, and you would stream one thing for a game's music and make repeating
  /// sound effects with the chunks.
  ///
  /// In modern times, this isn't split by format anymore, and most are
  /// interchangeable, so the question is what the app thinks is worth
  /// predecoding or not. Chunks might take more memory, but once they are loaded
  /// won't need to decode again, whereas music always needs to be decoded on the
  /// fly. Also, crucially, there are as many channels for chunks as the app can
  /// allocate, but SDL_mixer only offers a single "music" channel.
  ///
  /// If `closeio` is SDL_TRUE, the IOStream will be closed before returning,
  /// whether this function succeeds or not. SDL_mixer reads everything it needs
  /// from the IOStream during this call in any case.
  ///
  /// There is a separate function (a macro, before SDL_mixer 3.0.0) to read
  /// files from disk without having to deal with SDL_IOStream:
  /// `Mix_LoadWAV("filename.wav")` will call this function and manage those
  /// details for you.
  ///
  /// When done with a chunk, the app should dispose of it with a call to
  /// Mix_FreeChunk().
  ///
  /// \param src an SDL_IOStream that data will be read from.
  /// \param closeio SDL_TRUE to close the SDL_IOStream before returning,
  /// SDL_FALSE to leave it open.
  /// \returns a new chunk, or NULL on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0
  ///
  /// \sa Mix_LoadWAV
  /// \sa Mix_FreeChunk
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Chunk * SDLCALL Mix_LoadWAV_IO(SDL_IOStream *src, SDL_bool closeio)
  /// ```
  static Pointer<MixChunk> loadWavIo(Pointer<SdlIoStream> src, bool closeio) {
    return mixLoadWavIo(src, closeio);
  }

  ///
  /// Load a supported audio format into a chunk.
  ///
  /// SDL_mixer has two separate data structures for audio data. One it calls a
  /// "chunk," which is meant to be a file completely decoded into memory up
  /// front, and the other it calls "music" which is a file intended to be
  /// decoded on demand. Originally, simple formats like uncompressed WAV files
  /// were meant to be chunks and compressed things, like MP3s, were meant to be
  /// music, and you would stream one thing for a game's music and make repeating
  /// sound effects with the chunks.
  ///
  /// In modern times, this isn't split by format anymore, and most are
  /// interchangeable, so the question is what the app thinks is worth
  /// predecoding or not. Chunks might take more memory, but once they are loaded
  /// won't need to decode again, whereas music always needs to be decoded on the
  /// fly. Also, crucially, there are as many channels for chunks as the app can
  /// allocate, but SDL_mixer only offers a single "music" channel.
  ///
  /// If you would rather use the abstract SDL_IOStream interface to load data
  /// from somewhere other than the filesystem, you can use Mix_LoadWAV_IO()
  /// instead.
  ///
  /// When done with a chunk, the app should dispose of it with a call to
  /// Mix_FreeChunk().
  ///
  /// Note that before SDL_mixer 3.0.0, this function was a macro that called
  /// Mix_LoadWAV_IO(), creating a IOStream and setting `closeio` to SDL_TRUE.
  /// This macro has since been promoted to a proper API function. Older binaries
  /// linked against a newer SDL_mixer will still call Mix_LoadWAV_IO directly,
  /// as they are using the macro, which was available since the dawn of time.
  ///
  /// \param file the filesystem path to load data from.
  /// \returns a new chunk, or NULL on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0
  ///
  /// \sa Mix_LoadWAV_IO
  /// \sa Mix_FreeChunk
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Chunk * SDLCALL Mix_LoadWAV(const char *file)
  /// ```
  static Pointer<MixChunk> loadWav(String? file) {
    return mixLoadWav(file);
  }

  ///
  /// Load a WAV file from memory as quickly as possible.
  ///
  /// Unlike Mix_LoadWAV_IO, this function has several requirements, and unless
  /// you control all your audio data and know what you're doing, you should
  /// consider this function unsafe and not use it.
  ///
  /// - The provided audio data MUST be in Microsoft WAV format.
  /// - The provided audio data shouldn't use any strange WAV extensions.
  /// - The audio data MUST be in the exact same format as the audio device. This
  /// function will not attempt to convert it, or even verify it's in the right
  /// format.
  /// - The audio data must be valid; this function does not know the size of the
  /// memory buffer, so if the WAV data is corrupted, it can read past the end
  /// of the buffer, causing a crash.
  /// - The audio data must live at least as long as the returned Mix_Chunk,
  /// because SDL_mixer will use that data directly and not make a copy of it.
  ///
  /// This function will do NO error checking! Be extremely careful here!
  ///
  /// (Seriously, use Mix_LoadWAV_IO instead.)
  ///
  /// If this function is successful, the provided memory buffer must remain
  /// available until Mix_FreeChunk() is called on the returned chunk.
  ///
  /// \param mem memory buffer containing of a WAV file.
  /// \returns a new chunk, or NULL on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_LoadWAV_IO
  /// \sa Mix_FreeChunk
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Chunk * SDLCALL Mix_QuickLoad_WAV(Uint8 *mem)
  /// ```
  static Pointer<MixChunk> quickLoadWav(Pointer<Uint8> mem) {
    return mixQuickLoadWav(mem);
  }

  ///
  /// Load a raw audio data from memory as quickly as possible.
  ///
  /// The audio data MUST be in the exact same format as the audio device. This
  /// function will not attempt to convert it, or even verify it's in the right
  /// format.
  ///
  /// If this function is successful, the provided memory buffer must remain
  /// available until Mix_FreeChunk() is called on the returned chunk.
  ///
  /// \param mem memory buffer containing raw PCM data.
  /// \param len length of buffer pointed to by `mem`, in bytes.
  /// \returns a new chunk, or NULL on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_FreeChunk
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Chunk * SDLCALL Mix_QuickLoad_RAW(Uint8 *mem, Uint32 len)
  /// ```
  static Pointer<MixChunk> quickLoadRaw(Pointer<Uint8> mem, int len) {
    return mixQuickLoadRaw(mem, len);
  }

  ///
  /// Get the Mix_Chunk currently associated with a mixer channel.
  ///
  /// You may not specify MAX_CHANNEL_POST or -1 for a channel.
  ///
  /// \param channel the channel to query.
  /// \returns the associated chunk, if any, or NULL if it's an invalid channel.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Chunk * SDLCALL Mix_GetChunk(int channel)
  /// ```
  static Pointer<MixChunk> get(int channel) {
    return mixGetChunk(channel);
  }
}

extension MixChunkPointerEx on Pointer<MixChunk> {
  // lib_sdl_mixer.dart

  ///
  /// Free an audio chunk.
  ///
  /// An app should call this function when it is done with a Mix_Chunk and wants
  /// to dispose of its resources.
  ///
  /// SDL_mixer will stop any channels this chunk is currently playing on. This
  /// will deregister all effects on those channels and call any callback
  /// specified by Mix_ChannelFinished() for each removed channel.
  ///
  /// \param chunk the chunk to free.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_LoadWAV
  /// \sa Mix_LoadWAV_IO
  /// \sa Mix_QuickLoad_WAV
  /// \sa Mix_QuickLoad_RAW
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL Mix_FreeChunk(Mix_Chunk *chunk)
  /// ```
  void free() {
    mixFreeChunk(this);
  }

  ///
  /// Play an audio chunk on a specific channel.
  ///
  /// If the specified channel is -1, play on the first free channel (and return
  /// -1 without playing anything new if no free channel was available).
  ///
  /// If a specific channel was requested, and there is a chunk already playing
  /// there, that chunk will be halted and the new chunk will take its place.
  ///
  /// If `loops` is greater than zero, loop the sound that many times. If `loops`
  /// is -1, loop "infinitely" (~65000 times).
  ///
  /// Note that before SDL_mixer 3.0.0, this function was a macro that called
  /// Mix_PlayChannelTimed() with a fourth parameter ("ticks") of -1. This
  /// function still does the same thing, but promotes it to a proper API
  /// function. Older binaries linked against a newer SDL_mixer will still call
  /// Mix_PlayChannelTimed directly, as they are using the macro, which was
  /// available since the dawn of time.
  ///
  /// \param channel the channel on which to play the new chunk.
  /// \param chunk the new chunk to play.
  /// \param loops the number of times the chunk should loop, -1 to loop (not
  /// actually) infinitely.
  /// \returns which channel was used to play the sound, or -1 if sound could not
  /// be played.
  ///
  /// \since This function is available since SDL_mixer 3.0.0
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_PlayChannel(int channel, Mix_Chunk *chunk, int loops)
  /// ```
  int playChannel(int channel, int loops) {
    return mixPlayChannel(channel, this, loops);
  }

  ///
  /// Play an audio chunk on a specific channel for a maximum time.
  ///
  /// If the specified channel is -1, play on the first free channel (and return
  /// -1 without playing anything new if no free channel was available).
  ///
  /// If a specific channel was requested, and there is a chunk already playing
  /// there, that chunk will be halted and the new chunk will take its place.
  ///
  /// If `loops` is greater than zero, loop the sound that many times. If `loops`
  /// is -1, loop "infinitely" (~65000 times).
  ///
  /// `ticks` specifies the maximum number of milliseconds to play this chunk
  /// before halting it. If you want the chunk to play until all data has been
  /// mixed, specify -1.
  ///
  /// Note that this function does not block for the number of ticks requested;
  /// it just schedules the chunk to play and notes the maximum for the mixer to
  /// manage later, and returns immediately.
  ///
  /// \param channel the channel on which to play the new chunk.
  /// \param chunk the new chunk to play.
  /// \param loops the number of times the chunk should loop, -1 to loop (not
  /// actually) infinitely.
  /// \param ticks the maximum number of milliseconds of this chunk to mix for
  /// playback.
  /// \returns which channel was used to play the sound, or -1 if sound could not
  /// be played.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_PlayChannelTimed(int channel, Mix_Chunk *chunk, int loops, int ticks)
  /// ```
  int playChannelTimed(int channel, int loops, int ticks) {
    return mixPlayChannelTimed(channel, this, loops, ticks);
  }

  ///
  /// Play an audio chunk on a specific channel, fading in the audio.
  ///
  /// This will start the new sound playing, much like Mix_PlayChannel() will,
  /// but will start the sound playing at silence and fade in to its normal
  /// volume over the specified number of milliseconds.
  ///
  /// If the specified channel is -1, play on the first free channel (and return
  /// -1 without playing anything new if no free channel was available).
  ///
  /// If a specific channel was requested, and there is a chunk already playing
  /// there, that chunk will be halted and the new chunk will take its place.
  ///
  /// If `loops` is greater than zero, loop the sound that many times. If `loops`
  /// is -1, loop "infinitely" (~65000 times).
  ///
  /// A fading channel will change it's volume progressively, as if Mix_Volume()
  /// was called on it (which is to say: you probably shouldn't call Mix_Volume()
  /// on a fading channel).
  ///
  /// Note that before SDL_mixer 3.0.0, this function was a macro that called
  /// Mix_FadeInChannelTimed() with a fourth parameter ("ticks") of -1. This
  /// function still does the same thing, but promotes it to a proper API
  /// function. Older binaries linked against a newer SDL_mixer will still call
  /// Mix_FadeInChannelTimed directly, as they are using the macro, which was
  /// available since the dawn of time.
  ///
  /// \param channel the channel on which to play the new chunk, or -1 to find
  /// any available.
  /// \param chunk the new chunk to play.
  /// \param loops the number of times the chunk should loop, -1 to loop (not
  /// actually) infinitely.
  /// \param ms the number of milliseconds to spend fading in.
  /// \returns which channel was used to play the sound, or -1 if sound could not
  /// be played.
  ///
  /// \since This function is available since SDL_mixer 3.0.0
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_FadeInChannel(int channel, Mix_Chunk *chunk, int loops, int ms)
  /// ```
  int fadeInChannel(int channel, int loops, int ms) {
    return mixFadeInChannel(channel, this, loops, ms);
  }

  ///
  /// Play an audio chunk on a specific channel, fading in the audio, for a
  /// maximum time.
  ///
  /// This will start the new sound playing, much like Mix_PlayChannel() will,
  /// but will start the sound playing at silence and fade in to its normal
  /// volume over the specified number of milliseconds.
  ///
  /// If the specified channel is -1, play on the first free channel (and return
  /// -1 without playing anything new if no free channel was available).
  ///
  /// If a specific channel was requested, and there is a chunk already playing
  /// there, that chunk will be halted and the new chunk will take its place.
  ///
  /// If `loops` is greater than zero, loop the sound that many times. If `loops`
  /// is -1, loop "infinitely" (~65000 times).
  ///
  /// `ticks` specifies the maximum number of milliseconds to play this chunk
  /// before halting it. If you want the chunk to play until all data has been
  /// mixed, specify -1.
  ///
  /// Note that this function does not block for the number of ticks requested;
  /// it just schedules the chunk to play and notes the maximum for the mixer to
  /// manage later, and returns immediately.
  ///
  /// A fading channel will change it's volume progressively, as if Mix_Volume()
  /// was called on it (which is to say: you probably shouldn't call Mix_Volume()
  /// on a fading channel).
  ///
  /// \param channel the channel on which to play the new chunk, or -1 to find
  /// any available.
  /// \param chunk the new chunk to play.
  /// \param loops the number of times the chunk should loop, -1 to loop (not
  /// actually) infinitely.
  /// \param ms the number of milliseconds to spend fading in.
  /// \param ticks the maximum number of milliseconds of this chunk to mix for
  /// playback.
  /// \returns which channel was used to play the sound, or -1 if sound could not
  /// be played.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_FadeInChannelTimed(int channel, Mix_Chunk *chunk, int loops, int ms, int ticks)
  /// ```
  int fadeInChannelTimed(int channel, int loops, int ms, int ticks) {
    return mixFadeInChannelTimed(channel, this, loops, ms, ticks);
  }

  ///
  /// Set the volume for a specific chunk.
  ///
  /// In addition to channels having a volume setting, individual chunks also
  /// maintain a separate volume. Both values are considered when mixing, so both
  /// affect the final attenuation of the sound. This lets an app adjust the
  /// volume for all instances of a sound in addition to specific instances of
  /// that sound.
  ///
  /// The volume must be between 0 (silence) and MIX_MAX_VOLUME (full volume).
  /// Note that MIX_MAX_VOLUME is 128. Values greater than MIX_MAX_VOLUME are
  /// clamped to MIX_MAX_VOLUME.
  ///
  /// Specifying a negative volume will not change the current volume; as such,
  /// this can be used to query the current volume without making changes, as
  /// this function returns the previous (in this case, still-current) value.
  ///
  /// The default volume for a chunk is MIX_MAX_VOLUME (no attenuation).
  ///
  /// \param chunk the chunk whose volume to adjust.
  /// \param volume the new volume, between 0 and MIX_MAX_VOLUME, or -1 to query.
  /// \returns the previous volume. If the specified volume is -1, this returns
  /// the current volume. If `chunk` is NULL, this returns -1.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_VolumeChunk(Mix_Chunk *chunk, int volume)
  /// ```
  int setVolume(int volume) {
    return mixVolumeChunk(this, volume);
  }
}
