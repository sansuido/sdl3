import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (sdlInit(SDL_INIT_VIDEO) == false) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '60');
  var window = SdlWindowEx.create(
    title: 'draw triangle',
    w: 640,
    h: 480,
  );
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  var renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    sdlQuit();
    return -1;
  }
  var lines = <Point<double>>[
    Point(320, 200),
    Point(300, 240),
    Point(340, 240),
    Point(320, 200)
  ];
  var event = calloc<SdlEvent>();
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
          break;
        default:
          break;
      }
    }
    renderer
      ..setDrawColor(0, 0, 0, SDL_ALPHA_OPAQUE)
      ..clear()
      ..setDrawColor(255, 255, 255, SDL_ALPHA_OPAQUE)
      ..lines(lines)
      ..present();
  }
  event.callocFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
