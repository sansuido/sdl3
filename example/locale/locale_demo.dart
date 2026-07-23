import 'package:sdl3/sdl3.dart';

void main() {
  if (sdlInit(0)) {
    final locales = sdlxGetPreferredLocales();
    for (final locale in locales) {
      print('language: ${locale.language} country: ${locale.country}');
    }
    sdlQuit();
  }
}
