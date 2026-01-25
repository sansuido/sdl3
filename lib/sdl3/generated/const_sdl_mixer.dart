// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: constant_identifier_names, specify_nonobvious_property_types
part of '../sdl_mixer.dart';

//const SDL_MIXER_H_ = ;
const SDL_MIXER_MAJOR_VERSION = 3;
const SDL_MIXER_MINOR_VERSION = 1;
const SDL_MIXER_MICRO_VERSION = 3;
//const SDL_MIXER_VERSION = SDL_VERSIONNUM(SDL_MIXER_MAJOR_VERSION, SDL_MIXER_MINOR_VERSION, SDL_MIXER_MICRO_VERSION);
//const SDL_MIXER_VERSION_ATLEAST = (X, Y, Z) ((SDL_MIXER_MAJOR_VERSION >= X) && (SDL_MIXER_MAJOR_VERSION > X || SDL_MIXER_MINOR_VERSION >= Y) && (SDL_MIXER_MAJOR_VERSION > X || SDL_MIXER_MINOR_VERSION > Y || SDL_MIXER_MICRO_VERSION >= Z));
const MIX_PROP_MIXER_DEVICE_NUMBER = 'SDL_mixer.mixer.device';
const MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER = 'SDL_mixer.audio.load.iostream';
const MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN = 'SDL_mixer.audio.load.closeio';
const MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN = 'SDL_mixer.audio.load.predecode';
const MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER =
    'SDL_mixer.audio.load.preferred_mixer';
const MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN =
    'SDL_mixer.audio.load.skip_metadata_tags';
const MIX_PROP_AUDIO_DECODER_STRING = 'SDL_mixer.audio.decoder';
const MIX_PROP_METADATA_TITLE_STRING = 'SDL_mixer.metadata.title';
const MIX_PROP_METADATA_ARTIST_STRING = 'SDL_mixer.metadata.artist';
const MIX_PROP_METADATA_ALBUM_STRING = 'SDL_mixer.metadata.album';
const MIX_PROP_METADATA_COPYRIGHT_STRING = 'SDL_mixer.metadata.copyright';
const MIX_PROP_METADATA_TRACK_NUMBER = 'SDL_mixer.metadata.track';
const MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER = 'SDL_mixer.metadata.total_tracks';
const MIX_PROP_METADATA_YEAR_NUMBER = 'SDL_mixer.metadata.year';
const MIX_PROP_METADATA_DURATION_FRAMES_NUMBER =
    'SDL_mixer.metadata.duration_frames';
const MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN =
    'SDL_mixer.metadata.duration_infinite';
const MIX_DURATION_UNKNOWN = -1;
const MIX_DURATION_INFINITE = -2;
const MIX_PROP_PLAY_LOOPS_NUMBER = 'SDL_mixer.play.loops';
const MIX_PROP_PLAY_MAX_FRAME_NUMBER = 'SDL_mixer.play.max_frame';
const MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER = 'SDL_mixer.play.max_milliseconds';
const MIX_PROP_PLAY_START_FRAME_NUMBER = 'SDL_mixer.play.start_frame';
const MIX_PROP_PLAY_START_MILLISECOND_NUMBER =
    'SDL_mixer.play.start_millisecond';
const MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER = 'SDL_mixer.play.loop_start_frame';
const MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER =
    'SDL_mixer.play.loop_start_millisecond';
const MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER = 'SDL_mixer.play.fade_in_frames';
const MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER =
    'SDL_mixer.play.fade_in_milliseconds';
const MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT =
    'SDL_mixer.play.fade_in_start_gain';
const MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER =
    'SDL_mixer.play.append_silence_frames';
const MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER =
    'SDL_mixer.play.append_silence_milliseconds';

/// {@category mixer}
class MixkPropAudioLoad {
  static const iostreamPointer = MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER;
  static const closeioBoolean = MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN;
  static const predecodeBoolean = MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN;
  static const preferredMixerPointer =
      MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER;
  static const skipMetadataTagsBoolean =
      MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN;
}

/// {@category mixer}
class MixkPropMetadata {
  static const titleString = MIX_PROP_METADATA_TITLE_STRING;
  static const artistString = MIX_PROP_METADATA_ARTIST_STRING;
  static const albumString = MIX_PROP_METADATA_ALBUM_STRING;
  static const copyrightString = MIX_PROP_METADATA_COPYRIGHT_STRING;
  static const trackNumber = MIX_PROP_METADATA_TRACK_NUMBER;
  static const totalTracksNumber = MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER;
  static const yearNumber = MIX_PROP_METADATA_YEAR_NUMBER;
  static const durationFramesNumber = MIX_PROP_METADATA_DURATION_FRAMES_NUMBER;
  static const durationInfiniteBoolean =
      MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN;
}

/// {@category mixer}
class MixkDuration {
  static const unknown = MIX_DURATION_UNKNOWN;
  static const infinite = MIX_DURATION_INFINITE;
}

/// {@category mixer}
class MixkPropPlay {
  static const loopsNumber = MIX_PROP_PLAY_LOOPS_NUMBER;
  static const maxFrameNumber = MIX_PROP_PLAY_MAX_FRAME_NUMBER;
  static const maxMillisecondsNumber = MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER;
  static const startFrameNumber = MIX_PROP_PLAY_START_FRAME_NUMBER;
  static const startMillisecondNumber = MIX_PROP_PLAY_START_MILLISECOND_NUMBER;
  static const loopStartFrameNumber = MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER;
  static const loopStartMillisecondNumber =
      MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER;
  static const fadeInFramesNumber = MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER;
  static const fadeInMillisecondsNumber =
      MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER;
  static const fadeInStartGainFloat = MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT;
  static const appendSilenceFramesNumber =
      MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER;
  static const appendSilenceMillisecondsNumber =
      MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER;
}
