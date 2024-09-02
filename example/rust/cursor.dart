// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/cursor.rs
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (sdlInit(SDL_INIT_VIDEO) == false) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  var imgFlags = IMG_INIT_PNG | IMG_INIT_JPG;
  if (imgInit(imgFlags) != imgFlags) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  var window = SdlWindowEx.create(
    title: 'rust-sdl2 demo: Cursor [usage: drag and drop file.(png|jpg|bmp)]',
    w: 800,
    h: 600,
  );
  if (window == nullptr) {
    imgQuit();
    sdlQuit();
    return -1;
  }
  sdlSetEventEnabled(SDL_EVENT_DROP_FILE, true);
  var renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    imgQuit();
    sdlQuit();
    return -1;
  }
  Pointer<SdlCursor> cursor = nullptr;
  var surface = imgLoad('assets/rust/cursor.png');
  if (surface != nullptr) {
    cursor = surface.createColorCursor(0, 0)..set();
    surface.destroy();
  }
  var event = calloc<SdlEvent>();
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
          break;
        case SDL_EVENT_DROP_FILE:
          var data = event.drop.ref.data.cast<Utf8>().toDartString();
          var surface = imgLoad(data);
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
          break;
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
  imgQuit();
  sdlQuit();
  return 0;
}
