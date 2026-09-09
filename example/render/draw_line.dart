// https://wiki.libsdl.org/SDL_RenderDrawLine
import 'package:sdl3/sdl3.dart';

int main() {
  if (sdlInit(SDL_INIT_VIDEO)) {
    sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
    final rec = sdlxCreateWindowAndRenderer('Draw Line', 640, 480, 0);
    if (rec != null) {
      final window = rec.window;
      final renderer = rec.renderer;
      var running = true;
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
        sdlSetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
        sdlRenderClear(renderer);
        sdlSetRenderDrawColor(renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
        sdlRenderLine(renderer, 320, 200, 300, 240);
        sdlRenderLine(renderer, 300, 240, 340, 240);
        sdlRenderLine(renderer, 340, 240, 320, 200);
        sdlRenderPresent(renderer);
      }
      sdlDestroyRenderer(renderer);
      sdlDestroyWindow(window);
    }
    sdlQuit();
  }
  return 0;
}
