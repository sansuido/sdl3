// ignore_for_file: avoid_positional_boolean_parameters
part of '../../sdl_mixer.dart';

extension MixMusicEx on MixMusic {
  // lib_sdl_mxer.dart

  ///
  /// Load a supported audio format into a music object.
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
  /// When done with this music, the app should dispose of it with a call to
  /// Mix_FreeMusic().
  ///
  /// \param file a file path from where to load music data.
  /// \returns a new music object, or NULL on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_FreeMusic
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Music * SDLCALL Mix_LoadMUS(const char *file)
  /// ```
  static Pointer<MixMusic> load(String? file) => mixLoadMus(file);

  ///
  /// Load a supported audio format into a music object.
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
  /// If `closeio` is true, the IOStream will be closed before returning, whether
  /// this function succeeds or not. SDL_mixer reads everything it needs from the
  /// IOStream during this call in any case.
  ///
  /// As a convenience, there is a function to read files from disk without
  /// having to deal with SDL_IOStream: `Mix_LoadMUS("filename.mp3")` will manage
  /// those details for you.
  ///
  /// This function attempts to guess the file format from incoming data. If the
  /// caller knows the format, or wants to force it, it should use
  /// Mix_LoadMUSType_IO() instead.
  ///
  /// When done with this music, the app should dispose of it with a call to
  /// Mix_FreeMusic().
  ///
  /// \param src an SDL_IOStream that data will be read from.
  /// \param closeio true to close the SDL_IOStream before returning, false to
  /// leave it open.
  /// \returns a new music object, or NULL on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_FreeMusic
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Music * SDLCALL Mix_LoadMUS_IO(SDL_IOStream *src, bool closeio)
  /// ```
  static Pointer<MixMusic> loadIo(Pointer<SdlIoStream> src, bool closeio) =>
      mixLoadMusIo(src, closeio);

  ///
  /// Load an audio format into a music object, assuming a specific format.
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
  /// This function loads music data, and lets the application specify the type
  /// of music being loaded, which might be useful if SDL_mixer cannot figure it
  /// out from the data stream itself.
  ///
  /// Currently, the following types are supported:
  ///
  /// - `MUS_NONE` (SDL_mixer should guess, based on the data)
  /// - `MUS_WAV` (Microsoft WAV files)
  /// - `MUS_MOD` (Various tracker formats)
  /// - `MUS_MID` (MIDI files)
  /// - `MUS_OGG` (Ogg Vorbis files)
  /// - `MUS_MP3` (MP3 files)
  /// - `MUS_FLAC` (FLAC files)
  /// - `MUS_OPUS` (Opus files)
  /// - `MUS_WAVPACK` (WavPack files)
  ///
  /// If `closeio` is true, the IOStream will be closed before returning, whether
  /// this function succeeds or not. SDL_mixer reads everything it needs from the
  /// IOStream during this call in any case.
  ///
  /// As a convenience, there is a function to read files from disk without
  /// having to deal with SDL_IOStream: `Mix_LoadMUS("filename.mp3")` will manage
  /// those details for you (but not let you specify the music type explicitly)..
  ///
  /// When done with this music, the app should dispose of it with a call to
  /// Mix_FreeMusic().
  ///
  /// \param src an SDL_IOStream that data will be read from.
  /// \param type the type of audio data provided by `src`.
  /// \param closeio true to close the SDL_IOStream before returning, false to
  /// leave it open.
  /// \returns a new music object, or NULL on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_FreeMusic
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Music * SDLCALL Mix_LoadMUSType_IO(SDL_IOStream *src, Mix_MusicType type, bool closeio)
  /// ```
  static Pointer<MixMusic> loadTypeIo(
    Pointer<SdlIoStream> src,
    int type,
    bool closeio,
  ) => mixLoadMusTypeIo(src, type, closeio);

  ///
  /// Get a list of music decoders that this build of SDL_mixer provides.
  ///
  /// This list can change between builds AND runs of the program, if external
  /// libraries that add functionality become available. You must successfully
  /// call Mix_OpenAudio() before calling this function, as decoders are
  /// activated at device open time.
  ///
  /// Appearing in this list doesn't promise your specific audio file will
  /// decode...but it's handy to know if you have, say, a functioning Ogg Vorbis
  /// install.
  ///
  /// These return values are static, read-only data; do not modify or free it.
  /// The pointers remain valid until you call Mix_CloseAudio().
  ///
  /// \returns number of music decoders available.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_GetMusicDecoder
  /// \sa Mix_HasMusicDecoder
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_GetNumMusicDecoders(void)
  /// ```
  static int getNumDecoders() => mixGetNumMusicDecoders();

  ///
  /// Get a music decoder's name.
  ///
  /// The requested decoder's index must be between zero and
  /// Mix_GetNumMusicDecoders()-1. It's safe to call this with an invalid index;
  /// this function will return NULL in that case.
  ///
  /// This list can change between builds AND runs of the program, if external
  /// libraries that add functionality become available. You must successfully
  /// call Mix_OpenAudio() before calling this function, as decoders are
  /// activated at device open time.
  ///
  /// \param index index of the music decoder.
  /// \returns the music decoder's name.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_GetNumMusicDecoders
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char * SDLCALL Mix_GetMusicDecoder(int index)
  /// ```
  static String? getDecoder(int index) => mixGetMusicDecoder(index);

  ///
  /// Check if a music decoder is available by name.
  ///
  /// This result can change between builds AND runs of the program, if external
  /// libraries that add functionality become available. You must successfully
  /// call Mix_OpenAudio() before calling this function, as decoders are
  /// activated at device open time.
  ///
  /// Decoder names are arbitrary but also obvious, so you have to know what
  /// you're looking for ahead of time, but usually it's the file extension in
  /// capital letters (some example names are "MOD", "MP3", "FLAC").
  ///
  /// \param name the decoder name to query.
  /// \returns true if a decoder by that name is available, false otherwise.
  ///
  /// \since This function is available since SDL_mixer 3.0.0
  ///
  /// \sa Mix_GetNumMusicDecoders
  /// \sa Mix_GetMusicDecoder
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_HasMusicDecoder(const char *name)
  /// ```
  static bool hasDecoder(String? name) => mixHasMusicDecoder(name);
}

extension MixMusicPointerEx on Pointer<MixMusic> {
  // lib_sdl_mixer.dart

  ///
  /// Free a music object.
  ///
  /// If this music is currently playing, it will be stopped.
  ///
  /// If this music is in the process of fading out (via Mix_FadeOutMusic()),
  /// this function will *block* until the fade completes. If you need to avoid
  /// this, be sure to call Mix_HaltMusic() before freeing the music.
  ///
  /// \param music the music object to free.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_LoadMUS
  /// \sa Mix_LoadMUS_IO
  /// \sa Mix_LoadMUSType_IO
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL Mix_FreeMusic(Mix_Music *music)
  /// ```
  void free() {
    mixFreeMusic(this);
  }

  ///
  /// Find out the format of a mixer music.
  ///
  /// If `music` is NULL, this will query the currently playing music (and return
  /// MUS_NONE if nothing is currently playing).
  ///
  /// \param music the music object to query, or NULL for the currently-playing
  /// music.
  /// \returns the Mix_MusicType for the music object.
  ///
  /// \since This function is available since SDL_mixer 3.0.0
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_MusicType SDLCALL Mix_GetMusicType(const Mix_Music *music)
  /// ```
  int getType() => mixGetMusicType(this);

  ///
  /// Get the title for a music object, or its filename.
  ///
  /// This returns format-specific metadata. Not all file formats supply this!
  ///
  /// If `music` is NULL, this will query the currently-playing music.
  ///
  /// If music's title tag is missing or empty, the filename will be returned. If
  /// you'd rather have the actual metadata or nothing, use
  /// Mix_GetMusicTitleTag() instead.
  ///
  /// Please note that if the music was loaded from an SDL_IOStream instead of a
  /// filename, the filename returned will be an empty string ("").
  ///
  /// This function never returns NULL! If no data is available, it will return
  /// an empty string ("").
  ///
  /// \param music the music object to query, or NULL for the currently-playing
  /// music.
  /// \returns the music's title if available, or the filename if not, or "".
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_GetMusicTitleTag
  /// \sa Mix_GetMusicArtistTag
  /// \sa Mix_GetMusicAlbumTag
  /// \sa Mix_GetMusicCopyrightTag
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char *SDLCALL Mix_GetMusicTitle(const Mix_Music *music)
  /// ```
  String? getTitle() => mixGetMusicTitle(this);

  ///
  /// Get the title for a music object.
  ///
  /// This returns format-specific metadata. Not all file formats supply this!
  ///
  /// If `music` is NULL, this will query the currently-playing music.
  ///
  /// Unlike this function, Mix_GetMusicTitle() produce a string with the music's
  /// filename if a title isn't available, which might be preferable for some
  /// applications.
  ///
  /// This function never returns NULL! If no data is available, it will return
  /// an empty string ("").
  ///
  /// \param music the music object to query, or NULL for the currently-playing
  /// music.
  /// \returns the music's title if available, or "".
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_GetMusicTitle
  /// \sa Mix_GetMusicArtistTag
  /// \sa Mix_GetMusicAlbumTag
  /// \sa Mix_GetMusicCopyrightTag
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char *SDLCALL Mix_GetMusicTitleTag(const Mix_Music *music)
  /// ```
  String? getTitleTag() => mixGetMusicTitleTag(this);

  ///
  /// Get the artist name for a music object.
  ///
  /// This returns format-specific metadata. Not all file formats supply this!
  ///
  /// If `music` is NULL, this will query the currently-playing music.
  ///
  /// This function never returns NULL! If no data is available, it will return
  /// an empty string ("").
  ///
  /// \param music the music object to query, or NULL for the currently-playing
  /// music.
  /// \returns the music's artist name if available, or "".
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_GetMusicTitleTag
  /// \sa Mix_GetMusicAlbumTag
  /// \sa Mix_GetMusicCopyrightTag
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char *SDLCALL Mix_GetMusicArtistTag(const Mix_Music *music)
  /// ```
  String? getArtistTag() => mixGetMusicArtistTag(this);

  ///
  /// Get the album name for a music object.
  ///
  /// This returns format-specific metadata. Not all file formats supply this!
  ///
  /// If `music` is NULL, this will query the currently-playing music.
  ///
  /// This function never returns NULL! If no data is available, it will return
  /// an empty string ("").
  ///
  /// \param music the music object to query, or NULL for the currently-playing
  /// music.
  /// \returns the music's album name if available, or "".
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_GetMusicTitleTag
  /// \sa Mix_GetMusicArtistTag
  /// \sa Mix_GetMusicCopyrightTag
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char *SDLCALL Mix_GetMusicAlbumTag(const Mix_Music *music)
  /// ```
  String? getAlbumTag() => mixGetMusicAlbumTag(this);

  ///
  /// Get the copyright text for a music object.
  ///
  /// This returns format-specific metadata. Not all file formats supply this!
  ///
  /// If `music` is NULL, this will query the currently-playing music.
  ///
  /// This function never returns NULL! If no data is available, it will return
  /// an empty string ("").
  ///
  /// \param music the music object to query, or NULL for the currently-playing
  /// music.
  /// \returns the music's copyright text if available, or "".
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_GetMusicTitleTag
  /// \sa Mix_GetMusicArtistTag
  /// \sa Mix_GetMusicAlbumTag
  ///
  /// ```c
  /// extern SDL_DECLSPEC const char *SDLCALL Mix_GetMusicCopyrightTag(const Mix_Music *music)
  /// ```
  String? getCopyrightTag() => mixGetMusicCopyrightTag(this);

  ///
  /// Play a new music object.
  ///
  /// This will schedule the music object to begin mixing for playback.
  ///
  /// There is only ever one music object playing at a time; if this is called
  /// when another music object is playing, the currently-playing music is halted
  /// and the new music will replace it.
  ///
  /// Please note that if the currently-playing music is in the process of fading
  /// out (via Mix_FadeOutMusic()), this function will *block* until the fade
  /// completes. If you need to avoid this, be sure to call Mix_HaltMusic()
  /// before starting new music.
  ///
  /// \param music the new music object to schedule for mixing.
  /// \param loops the number of loops to play the music for (0 means "play once
  /// and stop").
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_PlayMusic(Mix_Music *music, int loops)
  /// ```
  bool play(int loops) => mixPlayMusic(this, loops);

  ///
  /// Play a new music object, fading in the audio.
  ///
  /// This will start the new music playing, much like Mix_PlayMusic() will, but
  /// will start the music playing at silence and fade in to its normal volume
  /// over the specified number of milliseconds.
  ///
  /// If there is already music playing, that music will be halted and the new
  /// music object will take its place.
  ///
  /// If `loops` is greater than zero, loop the music that many times. If `loops`
  /// is -1, loop "infinitely" (~65000 times).
  ///
  /// Fading music will change it's volume progressively, as if Mix_VolumeMusic()
  /// was called on it (which is to say: you probably shouldn't call
  /// Mix_VolumeMusic() on fading music).
  ///
  /// \param music the new music object to play.
  /// \param loops the number of times the chunk should loop, -1 to loop (not
  /// actually) infinitely.
  /// \param ms the number of milliseconds to spend fading in.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_FadeInMusic(Mix_Music *music, int loops, int ms)
  /// ```
  bool fadeIn(int loops, int ms) => mixFadeInMusic(this, loops, ms);

  ///
  /// Play a new music object, fading in the audio, from a starting position.
  ///
  /// This will start the new music playing, much like Mix_PlayMusic() will, but
  /// will start the music playing at silence and fade in to its normal volume
  /// over the specified number of milliseconds.
  ///
  /// If there is already music playing, that music will be halted and the new
  /// music object will take its place.
  ///
  /// If `loops` is greater than zero, loop the music that many times. If `loops`
  /// is -1, loop "infinitely" (~65000 times).
  ///
  /// Fading music will change it's volume progressively, as if Mix_VolumeMusic()
  /// was called on it (which is to say: you probably shouldn't call
  /// Mix_VolumeMusic() on fading music).
  ///
  /// This function allows the caller to start the music playback past the
  /// beginning of its audio data. You may specify a start position, in seconds,
  /// and the playback and fade-in will start there instead of with the first
  /// samples of the music.
  ///
  /// An app can specify a `position` of 0.0 to start at the beginning of the
  /// music (or just call Mix_FadeInMusic() instead).
  ///
  /// To convert from milliseconds, divide by 1000.0.
  ///
  /// \param music the new music object to play.
  /// \param loops the number of times the chunk should loop, -1 to loop (not
  /// actually) infinitely.
  /// \param ms the number of milliseconds to spend fading in.
  /// \param position the start position within the music, in seconds, where
  /// playback should start.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_FadeInMusicPos(Mix_Music *music, int loops, int ms, double position)
  /// ```
  bool fadeInPos(int loops, int ms, double position) =>
      mixFadeInMusicPos(this, loops, ms, position);

  ///
  /// Set the volume for the music channel.
  ///
  /// The volume must be between 0 (silence) and MIX_MAX_VOLUME (full volume).
  /// Note that MIX_MAX_VOLUME is 128. Values greater than MIX_MAX_VOLUME are
  /// clamped to MIX_MAX_VOLUME.
  ///
  /// Specifying a negative volume will not change the current volume; as such,
  /// this can be used to query the current volume without making changes, as
  /// this function returns the previous (in this case, still-current) value.
  ///
  /// The default volume for music is MIX_MAX_VOLUME (no attenuation).
  ///
  /// \param volume the new volume, between 0 and MIX_MAX_VOLUME, or -1 to query.
  /// \returns the previous volume. If the specified volume is -1, this returns
  /// the current volume.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_VolumeMusic(int volume)
  /// ```
  int setVolume(int volume) => mixVolumeMusic(volume);

  ///
  /// Query the current volume value for a music object.
  ///
  /// \param music the music object to query.
  /// \returns the music's current volume, between 0 and MIX_MAX_VOLUME (128).
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_GetMusicVolume(Mix_Music *music)
  /// ```
  int getVolume() => mixGetMusicVolume(this);

  ///
  /// Halt playing of the music stream.
  ///
  /// This will stop further playback of music until a new music object is
  /// started there.
  ///
  /// Any halted music will call any callback specified by
  /// Mix_HookMusicFinished() before this function returns.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL Mix_HaltMusic(void)
  /// ```
  void halt() {
    mixHaltMusic();
  }

  ///
  /// Halt the music stream after fading it out for a specified time.
  ///
  /// This will begin the music fading from its current volume to silence over
  /// `ms` milliseconds. After that time, the music is halted.
  ///
  /// Any halted music will call any callback specified by
  /// Mix_HookMusicFinished() once the halt occurs.
  ///
  /// Fading music will change it's volume progressively, as if Mix_VolumeMusic()
  /// was called on it (which is to say: you probably shouldn't call
  /// Mix_VolumeMusic() on a fading channel).
  ///
  /// Note that this function does not block for the number of milliseconds
  /// requested; it just schedules the music to fade and notes the time for the
  /// mixer to manage later, and returns immediately.
  ///
  /// \param ms number of milliseconds to fade before halting the channel.
  /// \returns true if music was scheduled to fade, false otherwise. If no music
  /// is currently playing, this returns false.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_FadeOutMusic(int ms)
  /// ```
  bool fadeOut(int ms) => mixFadeOutMusic(ms);

  ///
  /// Query the fading status of the music stream.
  ///
  /// This reports one of three values:
  ///
  /// - `MIX_NO_FADING`
  /// - `MIX_FADING_OUT`
  /// - `MIX_FADING_IN`
  ///
  /// If music is not currently playing, this returns `MIX_NO_FADING`.
  ///
  /// \returns the current fading status of the music stream.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC Mix_Fading SDLCALL Mix_FadingMusic(void)
  /// ```
  int fading() => mixFadingMusic();

  ///
  /// Pause the music stream.
  ///
  /// Pausing the music stream will prevent further playback of the assigned
  /// music object, but will maintain the object's current mixing position. When
  /// resumed, this channel will continue to mix the music where it left off.
  ///
  /// Paused music can be resumed by calling Mix_ResumeMusic().
  ///
  /// It is legal to halt paused music. Playing a new music object when music is
  /// paused will replace the current music and unpause the music stream.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL Mix_PauseMusic(void)
  /// ```
  void pause() {
    mixPauseMusic();
  }

  ///
  /// Resume the music stream.
  ///
  /// It is legal to resume an unpaused music stream; it causes no effect and
  /// reports no error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL Mix_ResumeMusic(void)
  /// ```
  void resume() {
    mixResumeMusic();
  }

  ///
  /// Rewind the music stream.
  ///
  /// This causes the currently-playing music to start mixing from the beginning
  /// of the music, as if it were just started.
  ///
  /// It's a legal no-op to rewind the music stream when not playing.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC void SDLCALL Mix_RewindMusic(void)
  /// ```
  void rewind() {
    mixRewindMusic();
  }

  ///
  /// Query whether the music stream is paused.
  ///
  /// \return true if music is paused, false otherwise.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// \sa Mix_PauseMusic
  /// \sa Mix_ResumeMusic
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_PausedMusic(void)
  /// ```
  bool paused() => mixPausedMusic();

  ///
  /// Jump to a given order in mod music.
  ///
  /// This only applies to MOD music formats.
  ///
  /// \param order order.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_ModMusicJumpToOrder(int order)
  /// ```
  bool modJumpToOrder(int order) => mixModMusicJumpToOrder(order);

  ///
  /// Start a track in music object.
  ///
  /// This only applies to GME music formats.
  ///
  /// \param music the music object.
  /// \param track the track number to play. 0 is the first track.
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_StartTrack(Mix_Music *music, int track)
  /// ```
  bool startTrack(int track) => mixStartTrack(this, track);

  ///
  /// Get number of tracks in music object.
  ///
  /// This only applies to GME music formats.
  ///
  /// \param music the music object.
  /// \returns number of tracks if successful, or -1 if failed or isn't
  /// implemented.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_GetNumTracks(Mix_Music *music)
  /// ```
  int getNumTracks() => mixGetNumTracks(this);

  ///
  /// Set the current position in the music stream, in seconds.
  ///
  /// To convert from milliseconds, divide by 1000.0.
  ///
  /// This function is only implemented for MOD music formats (set pattern order
  /// number) and for WAV, OGG, FLAC, MP3, and MOD music at the moment.
  ///
  /// \param position the new position, in seconds (as a double).
  /// \returns true on success or false on failure; call SDL_GetError() for more
  /// information.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_SetMusicPosition(double position)
  /// ```
  bool setPosition(double position) => mixSetMusicPosition(position);

  ///
  /// Get the time current position of music stream, in seconds.
  ///
  /// To convert to milliseconds, multiply by 1000.0.
  ///
  /// \param music the music object to query.
  /// \returns -1.0 if this feature is not supported for some codec.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC double SDLCALL Mix_GetMusicPosition(Mix_Music *music)
  /// ```
  double getPosition() => mixGetMusicPosition(this);

  ///
  /// Get a music object's duration, in seconds.
  ///
  /// To convert to milliseconds, multiply by 1000.0.
  ///
  /// If NULL is passed, returns duration of current playing music.
  ///
  /// \param music the music object to query.
  /// \returns music duration in seconds, or -1.0 on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC double SDLCALL Mix_MusicDuration(Mix_Music *music)
  /// ```
  double duration() => mixMusicDuration(this);

  ///
  /// Get the loop start time position of music stream, in seconds.
  ///
  /// To convert to milliseconds, multiply by 1000.0.
  ///
  /// If NULL is passed, returns duration of current playing music.
  ///
  /// \param music the music object to query.
  /// \returns -1.0 if this feature is not used for this music or not supported
  /// for some codec.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC double SDLCALL Mix_GetMusicLoopStartTime(Mix_Music *music)
  /// ```
  double getLoopStartTime() => mixGetMusicLoopStartTime(this);

  ///
  /// Get the loop end time position of music stream, in seconds.
  ///
  /// To convert to milliseconds, multiply by 1000.0.
  ///
  /// If NULL is passed, returns duration of current playing music.
  ///
  /// \param music the music object to query.
  /// \returns -1.0 if this feature is not used for this music or not supported
  /// for some codec.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC double SDLCALL Mix_GetMusicLoopEndTime(Mix_Music *music)
  /// ```
  double getLoopEndTime() => mixGetMusicLoopEndTime(this);

  ///
  /// Get the loop time length of music stream, in seconds.
  ///
  /// To convert to milliseconds, multiply by 1000.0.
  ///
  /// If NULL is passed, returns duration of current playing music.
  ///
  /// \param music the music object to query.
  /// \returns -1.0 if this feature is not used for this music or not supported
  /// for some codec.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC double SDLCALL Mix_GetMusicLoopLengthTime(Mix_Music *music)
  /// ```
  double getLoopLengthTime() => mixGetMusicLoopLengthTime(this);

  ///
  /// Check the playing status of the music stream.
  ///
  /// If music is currently playing, this function returns 1. Otherwise it
  /// returns 0.
  ///
  /// Paused music is treated as playing, even though it is not currently making
  /// forward progress in mixing.
  ///
  /// \returns true if music is playing, false otherwise.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC bool SDLCALL Mix_PlayingMusic(void)
  /// ```
  bool playing() => mixPlayingMusic();
}
