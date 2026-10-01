// ignore_for_file: non_constant_identifier_names
part of '../sdl_mixer.dart';

final int SDL_MIXER_COMPILEDVERSION = sdlVersionnum(
  SDL_MIXER_MAJOR_VERSION,
  SDL_MIXER_MINOR_VERSION,
  SDL_MIXER_MICRO_VERSION,
);

bool sdlMixerVersionAtleast(int x, int y, int z) =>
    SDL_MIXER_COMPILEDVERSION >= sdlVersionnum(x, y, z);

//const MIX_MAX_VOLUME = SDL_MIX_MAXVOLUME;

bool mixSetError(String fmt) => sdlSetError(fmt);

String? mixGetError() => sdlGetError();

bool mixClearError() => sdlClearError();
