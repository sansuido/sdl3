// ignore_for_file: non_constant_identifier_names
part of '../sdl_image.dart';

/// ```c
/// const SDL_IMAGE_COMPILEDVERSION = \ SDL_VERSIONNUM(SDL_IMAGE_MAJOR_VERSION, SDL_IMAGE_MINOR_VERSION, SDL_IMAGE_PATCHLEVEL);
/// ```
final int SDL_IMAGE_COMPILEDVERSION = sdlVersionnum(
  SDL_IMAGE_MAJOR_VERSION,
  SDL_IMAGE_MINOR_VERSION,
  SDL_IMAGE_MICRO_VERSION,
);

/// ```c
/// const SDL_IMAGE_VERSION_ATLEAST = (X, Y, Z) \ (SDL_IMAGE_COMPILEDVERSION >= SDL_VERSIONNUM(X, Y, Z));
/// ```
bool sdlImageVersionAtleast(int x, int y, int z) =>
    SDL_IMAGE_COMPILEDVERSION >= sdlVersionnum(x, y, z);

/// ```c
/// const IMG_SetError = SDL_SetError;
/// ```
bool imgSetError(String fmt) => sdlSetError(fmt);

/// ```c
/// const IMG_GetError = SDL_GetError;
/// ```
String? imgGetError() => sdlGetError();
