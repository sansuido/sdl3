// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/renderer-target.rs
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(
    title: 'rust-sdl2 resource-manager demo',
    w: 800,
    h: 600,
  );
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  final renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    sdlQuit();
    return -1;
  }
  final texture = renderer.createTexture(
    SDL_PIXELFORMAT_RGBA8888,
    SDL_TEXTUREACCESS_TARGET,
    400,
    300,
  );
  final event = calloc<SdlEvent>();
  var running = true;
  var angle = 0.0;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
        case SDL_EVENT_KEY_DOWN:
          if (event.key.ref.key == SDLK_ESCAPE) {
            running = false;
          }
        default:
          break;
      }
    }
    angle += 0.5;
    const dstrect = Rectangle<double>(0, 0, 400, 300);
    renderer
      ..setTarget(texture)
      ..clear()
      ..setDrawColor(255, 0, 0, SDL_ALPHA_OPAQUE)
      ..fillRect(dstrect)
      ..setTarget(nullptr)
      ..setDrawColor(0, 0, 0, SDL_ALPHA_OPAQUE)
      ..clear()
      ..textureRotated(
        texture,
        dstrect: dstrect,
        angle: angle,
        center: const Point(400, 300),
      )
      ..present();
  }
  texture.destroy();
  event.callocFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
