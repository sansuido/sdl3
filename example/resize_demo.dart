import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  Pointer<SdlWindow> window = nullptr;
  Pointer<SdlRenderer> renderer = nullptr;
  Pointer<SdlTexture> texture = nullptr;
  int resizeCount = 0;
  if (sdlInit(SDL_INIT_VIDEO) == false) {
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
  sdlSetRenderVSync(renderer, 60);
  texture = renderer.loadTexture('assets/rust/characters.bmp');
  if (texture != nullptr) {
    var size = texture.getSize();
    if (size != null) {
      renderer.setLogicalPresentation(size.x.toInt(), size.y.toInt(),
          SDL_LOGICAL_PRESENTATION_LETTERBOX, SDL_SCALEMODE_NEAREST);
    }
  }
  bool done = true;
  var event = calloc<SdlEvent>();
  while (done) {
    while (sdlPollEvent(event)) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          done = false;
          break;
        case SDL_EVENT_WINDOW_RESIZED:
          //resizeCount = 2;
          break;
        default:
          break;
      }
      sdlRenderClear(renderer);
      sdlRenderTexture(renderer, texture, nullptr, nullptr);
      sdlRenderPresent(renderer);
      if (resizeCount > 0) {
        sdlShowSimpleMessageBox(
            SDL_MESSAGEBOX_INFORMATION, 'resize', 'count=$resizeCount', window);
        resizeCount -= 1;
      }
    }
  }
  calloc.free(event);
  sdlDestroyRenderer(renderer);
  sdlDestroyWindow(window);
  sdlQuit();
  return 0;
}
