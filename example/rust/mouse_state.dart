// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/mouse-state.rs
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (sdlInit(SDL_INIT_VIDEO) == false) {
    print(sdlGetError());
    return -1;
  }
  var window = SdlWindowEx.create(title: 'Mouse', w: 800, h: 600);
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  var event = calloc<SdlEvent>();
  var running = true;
  Point<double> oldPoint = Point(0, 0);
  int oldButton = 0;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
          break;
        case SDL_EVENT_KEY_DOWN:
          if (event.key.ref.key == SDLK_ESCAPE) {
            running = false;
          }
          break;
        default:
          break;
      }
    }
    var newPoint = PointEx.getMousePosition();
    var newButton = sdlGetMouseState(nullptr, nullptr);
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
