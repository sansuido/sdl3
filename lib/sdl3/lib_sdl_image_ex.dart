// ignore_for_file: non_constant_identifier_names
import './generated/const_sdl_image.dart';
import './generated/lib_sdl_error.dart';
import 'lib_sdl_ex.dart';

/// ```c
/// const SDL_IMAGE_COMPILEDVERSION = \ SDL_VERSIONNUM(SDL_IMAGE_MAJOR_VERSION, SDL_IMAGE_MINOR_VERSION, SDL_IMAGE_PATCHLEVEL);
/// ```
final SDL_IMAGE_COMPILEDVERSION = sdlVersionnum(
    SDL_IMAGE_MAJOR_VERSION, SDL_IMAGE_MINOR_VERSION, SDL_IMAGE_MICRO_VERSION);

/// ```c
/// const SDL_IMAGE_VERSION_ATLEAST = (X, Y, Z) \ (SDL_IMAGE_COMPILEDVERSION >= SDL_VERSIONNUM(X, Y, Z));
/// ```
bool sdlImageVersionAtleast(int x, int y, int z) {
  return SDL_IMAGE_COMPILEDVERSION >= sdlVersionnum(x, y, z);
}

/// ```c
/// const IMG_SetError = SDL_SetError;
/// ```
bool imgSetError(String fmt) {
  return sdlSetError(fmt);
}

/// ```c
/// const IMG_GetError = SDL_GetError;
/// ```
String? imgGetError() {
  return sdlGetError();
}
