import 'package:sdl3/sdl3.dart';

int main() {
  print(sdlGetRevision());
  Map<String, int> versions = {
    'SDL_COMPILEDVERSION': SDL_COMPILEDVERSION,
    'SDL_IMAGE_COMPILEDVERSION': SDL_IMAGE_COMPILEDVERSION,
    'SDL_MIXER_COMPILEDVERSION': SDL_MIXER_COMPILEDVERSION,
    'SDL_NET_COMPILEDVERSION': SDL_NET_COMPILEDVERSION,
    'SDL_TTF_COMPILEDVERSION': SDL_TTF_COMPILEDVERSION,
    'SDL_GFX_COMPILEDVERSION': SDL_GFX_COMPILEDVERSION,
  };
  versions.forEach((name, version) {
    print('$name: $version');
  });
  return 0;
}
