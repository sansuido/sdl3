// ignore_for_file: non_constant_identifier_names
part of '../sdl_image.dart';

final int SDL_IMAGE_COMPILEDVERSION = sdlVersionnum(
  SDL_IMAGE_MAJOR_VERSION,
  SDL_IMAGE_MINOR_VERSION,
  SDL_IMAGE_MICRO_VERSION,
);

bool sdlImageVersionAtleast(int x, int y, int z) =>
    SDL_IMAGE_COMPILEDVERSION >= sdlVersionnum(x, y, z);

bool imgSetError(String fmt) => sdlSetError(fmt);

String? imgGetError() => sdlGetError();
