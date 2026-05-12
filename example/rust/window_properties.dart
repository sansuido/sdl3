// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/window-properties.rs
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(
    title: 'rust-sdl2 demo: Window',
    w: 800,
    h: 600,
    flags: SDL_WINDOW_RESIZABLE,
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
  }
  var running = true;
  var tick = 0;
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
    final position = SdlxPoint(0, 0);
    final size = SdlxPoint(0, 0);
    if (window.getPosition(position) && window.getSize(size)) {
      window.setTitle(
        'Window - pos(${position.x}x${position.y}), size(${size.x}x${size.y}): $tick',
      );
    }
    tick++;
    renderer
      ..setDrawColor(SdlxColor(0, 0, 0))
      ..clear()
      ..present();
  }
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
