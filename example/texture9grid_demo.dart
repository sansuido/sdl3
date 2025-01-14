import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  Pointer<SdlWindow> window = nullptr;
  Pointer<SdlRenderer> renderer = nullptr;
  Pointer<SdlTexture> texture = nullptr;
  double width = 50;
  double height = 50;
  if (sdlInit(SDL_INIT_VIDEO) == false) {
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
  bool done = true;
  var event = calloc<SdlEvent>();
  while (done) {
    while (sdlPollEvent(event)) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          done = false;
          break;
        case SDL_EVENT_KEY_DOWN:
          switch (event.key.ref.key) {
            case SDLK_LEFT:
              width += 1;
              break;
            case SDLK_RIGHT:
              width -= 1;
              break;
            case SDLK_UP:
              height += 1;
              break;
            case SDLK_DOWN:
              height -= 1;
              break;
          }
        default:
          break;
      }
    }
    sdlRenderClear(renderer);
    sdlRenderTexture9Grid(
        renderer, texture, nullptr, width, width, height, height, 1.0, nullptr);
    sdlSetRenderDrawColor(renderer, 255, 255, 255, 255);
    sdlRenderDebugText(
        renderer, 5, 5, 'usage: key left(+) or key right(-) change to width');
    sdlRenderDebugText(
        renderer, 5, 25, 'usage: key up(+) or key down(-) change to height');
    sdlRenderDebugText(renderer, 5, 45, 'width: $width height: $height');
    sdlRenderPresent(renderer);
  }
  calloc.free(event);
  sdlDestroyRenderer(renderer);
  sdlDestroyWindow(window);
  sdlQuit();
  return 0;
}
