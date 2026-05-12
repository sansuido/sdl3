import 'dart:ffi';
//import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  Pointer<SdlWindow> window = nullptr;
  Pointer<SdlRenderer> renderer = nullptr;
  Pointer<SdlTexture> texture = nullptr;
  double width = 50;
  double height = 50;
  if (!sdlInit(SDL_INIT_VIDEO)) {
    return -1;
  }
  window = sdlCreateWindow('texture9grid demo', 640, 320, SDL_WINDOW_RESIZABLE);
  if (window == nullptr) {
    sdlQuit();
    return -1;
  }
  renderer = sdlCreateRenderer(window, null);
  if (renderer == nullptr) {
    sdlDestroyWindow(window);
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  texture = renderer.loadTexture('assets/jap/gate.png');
  var running = true;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        switch (event.scancode) {
          case SdlkScancode.escape:
            running = false;
          case SdlkScancode.left:
            width += 1;
          case SdlkScancode.right:
            width -= 1;
          case SdlkScancode.up:
            height += 1;
          case SdlkScancode.down:
            height -= 1;
        }
      }
    }
    sdlRenderClear(renderer);
    sdlRenderTexture9Grid(
      renderer,
      texture,
      nullptr,
      width,
      width,
      height,
      height,
      1,
      nullptr,
    );
    sdlSetRenderDrawColor(renderer, 255, 255, 255, 255);
    sdlRenderDebugText(
      renderer,
      5,
      5,
      'usage: key left(+) or key right(-) change to width',
    );
    sdlRenderDebugText(
      renderer,
      5,
      25,
      'usage: key up(+) or key down(-) change to height',
    );
    sdlRenderDebugText(renderer, 5, 45, 'width: $width height: $height');
    sdlRenderPresent(renderer);
  }
  sdlDestroyRenderer(renderer);
  sdlDestroyWindow(window);
  sdlQuit();
  return 0;
}
