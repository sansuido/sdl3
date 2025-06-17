import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  Pointer<SdlWindow> window = nullptr;
  Pointer<SdlRenderer> renderer = nullptr;
  Pointer<SdlTexture> texture = nullptr;
  var resizeCount = 0;
  if (!sdlInit(SDL_INIT_VIDEO)) {
    return -1;
  }
  window = sdlCreateWindow('resize demo', 640, 320, SDL_WINDOW_RESIZABLE);
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
  if (texture != nullptr) {
    final size = texture.getSize();
    if (size != null) {
      renderer.setLogicalPresentation(
        size.x.toInt(),
        size.y.toInt(),
        SDL_LOGICAL_PRESENTATION_LETTERBOX,
      );
    }
  }
  var done = true;
  final event = calloc<SdlEvent>();
  while (done) {
    while (sdlPollEvent(event)) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          done = false;
        case SDL_EVENT_WINDOW_RESIZED:
          //resizeCount = 2;
          break;
        default:
          break;
      }
    }
    sdlRenderClear(renderer);
    sdlRenderTexture(renderer, texture, nullptr, nullptr);
    sdlRenderPresent(renderer);
    if (resizeCount > 0) {
      sdlShowSimpleMessageBox(
        SDL_MESSAGEBOX_INFORMATION,
        'resize',
        'count=$resizeCount',
        window,
      );
      resizeCount -= 1;
    }
  }
  calloc.free(event);
  sdlDestroyRenderer(renderer);
  sdlDestroyWindow(window);
  sdlQuit();
  return 0;
}
