// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/mouse-state.rs
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  final window = SdlWindowEx.create(title: 'Mouse', w: 800, h: 600);
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  final event = calloc<SdlEvent>();
  var running = true;
  var oldPoint = const Point<double>(0, 0);
  var oldButton = 0;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
        case SDL_EVENT_KEY_DOWN:
          if (event.key.ref.key == SDLK_ESCAPE) {
            running = false;
          }
        default:
          break;
      }
    }
    final newPoint = PointEx.getMousePosition();
    final newButton = sdlGetMouseState(nullptr, nullptr);
    if (oldPoint != newPoint || oldButton != newButton) {
      print('X = ${newPoint.x} Y = ${newPoint.y} : $oldButton => $newButton');
      oldPoint = newPoint;
      oldButton = newButton;
    }
  }
  event.callocFree();
  window.destroy();
  sdlQuit();
  return 0;
}
