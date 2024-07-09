import 'dart:ffi';
import '../../generated/lib_sdl_mixer.dart';
import '../../generated/struct_sdl_mixer.dart';

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
  static Pointer<MixMusic> load(String file) {
    return mixLoadMus(file);
  }
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
  int getType() {
    return mixGetMusicType(this);
  }

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
  String? getTitle() {
    return mixGetMusicTitle(this);
  }

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
  String? getTitleTag() {
    return mixGetMusicTitleTag(this);
  }

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
  String? getArtistTag() {
    return mixGetMusicArtistTag(this);
  }

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
  String? getAlbumTag() {
    return mixGetMusicAlbumTag(this);
  }

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
  String? getCopyrightTag() {
    return mixGetMusicCopyrightTag(this);
  }

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
  /// \returns zero on success, -1 on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_PlayMusic(Mix_Music *music, int loops)
  /// ```
  int play(int loops) {
    return mixPlayMusic(this, loops);
  }

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
  /// \returns zero on success, -1 on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_FadeInMusic(Mix_Music *music, int loops, int ms)
  /// ```
  int fadeIn(int loops, int ms) {
    return mixFadeInMusic(this, loops, ms);
  }

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
  /// \returns zero on success, -1 on error.
  ///
  /// \since This function is available since SDL_mixer 3.0.0.
  ///
  /// ```c
  /// extern SDL_DECLSPEC int SDLCALL Mix_FadeInMusicPos(Mix_Music *music, int loops, int ms, double position)
  /// ```
  int fadeInPos(int loops, int ms, double position) {
    return mixFadeInMusicPos(this, loops, ms, position);
  }

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
  int getVolume() {
    return mixGetMusicVolume(this);
  }

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
  double getPosition() {
    return mixGetMusicPosition(this);
  }

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
  double duration() {
    return mixMusicDuration(this);
  }

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
  double getLoopStartTime() {
    return mixGetMusicLoopStartTime(this);
  }

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
  double getLoopEndTime() {
    return mixGetMusicLoopEndTime(this);
  }

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
  double getLoopLengthTime() {
    return mixGetMusicLoopLengthTime(this);
  }
}
