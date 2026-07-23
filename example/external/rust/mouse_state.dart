// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/mouse-state.rs
import 'dart:ffi';
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
  var running = true;
  var oldPoint = SdlxFPoint(0, 0);
  var oldButton = 0;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        if (event.scancode == SdlkScancode.escape) {
          running = false;
        }
      }
    }
    final newPoint = SdlxFPoint(0, 0);
    final newButton = sdlxGetMouseState(newPoint);
    if (oldPoint != newPoint || oldButton != newButton) {
      print('X = ${newPoint.x} Y = ${newPoint.y} : $oldButton => $newButton');
      oldPoint = newPoint;
      oldButton = newButton;
    }
  }
  window.destroy();
  sdlQuit();
  return 0;
}
