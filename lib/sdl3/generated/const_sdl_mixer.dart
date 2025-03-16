// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.
// ignore_for_file: constant_identifier_names
//const SDL_MIXER_H_ = ;
const SDL_MIXER_MAJOR_VERSION = 3;
const SDL_MIXER_MINOR_VERSION = 0;
const SDL_MIXER_MICRO_VERSION = 0;
//const SDL_MIXER_VERSION = SDL_VERSIONNUM(SDL_MIXER_MAJOR_VERSION, SDL_MIXER_MINOR_VERSION, SDL_MIXER_MICRO_VERSION);
//const SDL_MIXER_VERSION_ATLEAST = (X, Y, Z) ((SDL_MIXER_MAJOR_VERSION >= X) && (SDL_MIXER_MAJOR_VERSION > X || SDL_MIXER_MINOR_VERSION >= Y) && (SDL_MIXER_MAJOR_VERSION > X || SDL_MIXER_MINOR_VERSION > Y || SDL_MIXER_MICRO_VERSION >= Z));
const MIX_INIT_FLAC = 0x00000001;
const MIX_INIT_MOD = 0x00000002;
const MIX_INIT_MP3 = 0x00000008;
const MIX_INIT_OGG = 0x00000010;
const MIX_INIT_MID = 0x00000020;
const MIX_INIT_OPUS = 0x00000040;
const MIX_INIT_WAVPACK = 0x00000080;
const MIX_CHANNELS = 8;
const MIX_DEFAULT_FREQUENCY = 44100;
//const MIX_DEFAULT_FORMAT = SDL_AUDIO_S16;
const MIX_DEFAULT_CHANNELS = 2;
const MIX_MAX_VOLUME = 128;
const MIX_NO_FADING = 0;
const MIX_FADING_OUT = 1;
const MIX_FADING_IN = 2;
const MUS_NONE = 0;
const MUS_WAV = 1;
const MUS_MOD = 2;
const MUS_MID = 3;
const MUS_OGG = 4;
const MUS_MP3 = 5;
const MUS_FLAC = 6;
const MUS_OPUS = 7;
const MUS_WAVPACK = 8;
const MUS_GME = 9;
const MIX_CHANNEL_POST = (-2);
const MIX_EFFECTSMAXSPEED = 'MIX_EFFECTSMAXSPEED';

class MixkInit {
  static const flac = MIX_INIT_FLAC;
  static const mod = MIX_INIT_MOD;
  static const mp3 = MIX_INIT_MP3;
  static const ogg = MIX_INIT_OGG;
  static const mid = MIX_INIT_MID;
  static const opus = MIX_INIT_OPUS;
  static const wavpack = MIX_INIT_WAVPACK;
}

class Mus {
  static const none = MUS_NONE;
  static const wav = MUS_WAV;
  static const mod = MUS_MOD;
  static const mid = MUS_MID;
  static const ogg = MUS_OGG;
  static const mp3 = MUS_MP3;
  static const flac = MUS_FLAC;
  static const opus = MUS_OPUS;
  static const wavpack = MUS_WAVPACK;
  static const gme = MUS_GME;
}
