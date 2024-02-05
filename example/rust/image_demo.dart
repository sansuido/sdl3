// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/image-demo.rs
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (sdlInit(SDL_INIT_VIDEO) < 0) {
    print(sdlGetError());
    return -1;
  }
  var imgFlags = IMG_INIT_PNG | IMG_INIT_JPG;
  if (imgInit(imgFlags) != imgFlags) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  var window = SdlWindowEx.create(
      title: 'rust-sdl2 demo: Video [usage: drag and drop file.(png|jpg|bmp)]',
      w: 800,
      h: 600,
      flags: SDL_WINDOW_RESIZABLE);
  if (window == nullptr) {
    print(sdlGetError());
    imgQuit();
    sdlQuit();
    return -1;
  }
  sdlSetEventEnabled(SDL_DROPFILE, true);
  var renderer = window
      .createRenderer(SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    imgQuit();
    sdlQuit();
    return -1;
  }
  var event = calloc<SdlEvent>();
  Pointer<SdlTexture> texture = nullptr;
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_QUIT:
          running = false;
          break;
        case SDL_KEYDOWN:
          if (event.key.keysym.ref.sym == SDLK_ESCAPE) {
            running = false;
          }
          break;
        case SDL_DROPFILE:
          var data = event.drop.ref.data.cast<Utf8>().toDartString();
          print(data);
          var loadTexture = renderer.loadTexture(data);
          if (loadTexture != nullptr) {
            if (texture != nullptr) {
              texture.destroy();
              texture = nullptr;
            }
            texture = loadTexture;
            var size = loadTexture.getSize();
            if (size != null) {
              print('X=${size.x} Y=${size.y}');
            }
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
      ..clear();
    if (texture != nullptr) {
      renderer.texture(texture);
    }
    renderer.present();
  }
  event.callocFree();
  texture.destroy();
  renderer.destroy();
  window.destroy();
  imgQuit();
  sdlQuit();
  return 0;
}
