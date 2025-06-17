import 'package:sdl3/sdl3.dart';

int main() {
  print(sdlGetRevision());
  final _ =
      <String, int>{
        'SDL_COMPILEDVERSION': SDL_COMPILEDVERSION,
        'SDL_IMAGE_COMPILEDVERSION': SDL_IMAGE_COMPILEDVERSION,
        'SDL_MIXER_COMPILEDVERSION': SDL_MIXER_COMPILEDVERSION,
        'SDL_NET_COMPILEDVERSION': SDL_NET_COMPILEDVERSION,
        'SDL_TTF_COMPILEDVERSION': SDL_TTF_COMPILEDVERSION,
        'SDL_GFX_COMPILEDVERSION': SDL_GFX_COMPILEDVERSION,
      }..forEach((name, version) {
        print('$name: $version');
      });
  return 0;
}
