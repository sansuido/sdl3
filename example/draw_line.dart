// https://wiki.libsdl.org/SDL_RenderDrawLine
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (sdlInit(SDL_INIT_VIDEO)) {
    sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
    final window = calloc<Pointer<SdlWindow>>();
    final renderer = calloc<Pointer<SdlRenderer>>();
    if (sdlCreateWindowAndRenderer(
      'Draw Line',
      640,
      480,
      0,
      window,
      renderer,
    )) {
      var done = true;
      while (done) {
        final event = calloc<SdlEvent>();
        sdlSetRenderDrawColor(renderer.value, 0, 0, 0, SDL_ALPHA_OPAQUE);
        sdlRenderClear(renderer.value);
        sdlSetRenderDrawColor(renderer.value, 255, 255, 255, SDL_ALPHA_OPAQUE);
        sdlRenderLine(renderer.value, 320, 200, 300, 240);
        sdlRenderLine(renderer.value, 300, 240, 340, 240);
        sdlRenderLine(renderer.value, 340, 240, 320, 200);
        sdlRenderPresent(renderer.value);
        while (sdlPollEvent(event)) {
          if (event.type == SDL_EVENT_QUIT) {
            done = false;
          }
        }
        calloc.free(event);
      }
      sdlDestroyRenderer(renderer.value);
      sdlDestroyWindow(window.value);
    } else {}
    calloc
      ..free(window)
      ..free(renderer);
    sdlQuit();
  }
  return 0;
}
