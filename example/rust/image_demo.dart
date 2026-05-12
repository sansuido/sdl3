// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/image-demo.rs
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(
    title: 'rust-sdl2 demo: Video [usage: drag and drop file.(png|jpg|bmp)]',
    w: 800,
    h: 600,
    flags: SDL_WINDOW_RESIZABLE,
  );
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  sdlSetEventEnabled(SDL_EVENT_DROP_FILE, true);
  final renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    sdlQuit();
    return -1;
  }
  Pointer<SdlTexture> texture = nullptr;
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
      if (event is SdlxDropEvent && event.type == SdlkEvent.dropFile) {
        print(event.data);
        final loadTexture = renderer.loadTexture(event.data);
        if (loadTexture != nullptr) {
          if (texture != nullptr) {
            texture.destroy();
            texture = nullptr;
          }
          texture = loadTexture;
          final size = SdlxFPoint(0, 0);
          if (loadTexture.getSize(size)) {
            print('X=${size.x} Y=${size.y}');
          }
        } else {
          sdlShowSimpleMessageBox(0, 'imgGetError', imgGetError(), window);
        }
      }
    }
    renderer
      ..setDrawColor(SdlxColor(0xff, 0xff, 0xff))
      ..clear();
    if (texture != nullptr) {
      renderer.texture(texture);
    }
    renderer.present();
  }
  texture.destroy();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
