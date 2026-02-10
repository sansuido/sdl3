// ignore_for_file: non_constant_identifier_names
part of '../sdl_mixer.dart';

/// ```c
/// const SDL_MIXER_COMPILEDVERSION = \ SDL_VERSIONNUM(SDL_MIXER_MAJOR_VERSION, SDL_MIXER_MINOR_VERSION, SDL_MIXER_PATCHLEVEL);
/// ```
final int SDL_MIXER_COMPILEDVERSION = sdlVersionnum(
  SDL_MIXER_MAJOR_VERSION,
  SDL_MIXER_MINOR_VERSION,
  SDL_MIXER_MICRO_VERSION,
);

/// ```c
/// const SDL_MIXER_VERSION_ATLEAST = (X, Y, Z) \ (SDL_MIXER_COMPILEDVERSION >= SDL_VERSIONNUM(X, Y, Z));
/// ```
bool sdlMixerVersionAtleast(int x, int y, int z) =>
    SDL_MIXER_COMPILEDVERSION >= sdlVersionnum(x, y, z);

/// ```c
/// const MIX_MAX_VOLUME = SDL_MIX_MAXVOLUME;
/// ```
//const MIX_MAX_VOLUME = SDL_MIX_MAXVOLUME;

/// ```c
/// const Mix_SetError = SDL_SetError;
/// ```
bool mixSetError(String fmt) => sdlSetError(fmt);

/// ```c
/// const Mix_GetError = SDL_GetError;
/// ```
String? mixGetError() => sdlGetError();

/// ```c
/// const Mix_ClearError = SDL_ClearError;
/// ```
bool mixClearError() => sdlClearError();
