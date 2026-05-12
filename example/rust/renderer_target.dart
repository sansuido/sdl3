// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/renderer-target.rs
import 'dart:ffi';
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
  var running = true;
  var angle = 0.0;
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
    angle += 0.5;
    final dstrect = SdlxFRect(w: 400, h: 300);
    renderer
      ..setTarget(texture)
      ..clear()
      ..setDrawColor(SdlxColor(0xff, 0, 0))
      ..fillRect(dstrect)
      ..setTarget(nullptr)
      ..setDrawColor(SdlxColor(0, 0, 0))
      ..clear()
      ..textureRotated(
        texture,
        dstrect: dstrect,
        angle: angle,
        center: SdlxFPoint(400, 300),
      )
      ..present();
  }
  texture.destroy();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
