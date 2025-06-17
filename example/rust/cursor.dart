// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/cursor.rs
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(
    title: 'rust-sdl2 demo: Cursor [usage: drag and drop file.(png|jpg|bmp)]',
    w: 800,
    h: 600,
  );
  if (window == nullptr) {
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
  Pointer<SdlCursor> cursor = nullptr;
  final surface = imgLoad('assets/rust/cursor.png');
  if (surface != nullptr) {
    cursor = surface.createColorCursor(0, 0)..set();
    surface.destroy();
  }
  final event = calloc<SdlEvent>();
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
        case SDL_EVENT_DROP_FILE:
          final data = event.drop.ref.data.cast<Utf8>().toDartString();
          final surface = imgLoad(data);
          if (surface != nullptr) {
            if (cursor != nullptr) {
              cursor.destroy();
              cursor = nullptr;
            }
            cursor = surface.createColorCursor(0, 0)..set();
            surface.destroy();
          } else {
            sdlShowSimpleMessageBox(0, 'imgGetError', imgGetError(), window);
          }
        default:
          break;
      }
    }
    renderer
      ..setDrawColor(255, 255, 255, SDL_ALPHA_OPAQUE)
      ..clear()
      ..present();
  }
  event.callocFree();
  cursor.destroy();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
