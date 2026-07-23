// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/gfx-demo.rs
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';
import 'package:sdl3/sdl3gfx.dart' as gfx;

const gScreenWidth = 800;
const gScreenHeight = 600;

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(
    title: 'rust-sdl2_gfx: draw line & FPSManager',
    w: gScreenWidth,
    h: gScreenHeight,
    flags: SDL_WINDOW_OPENGL,
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
  final fpsManager = gfx.FpsManager();
  final clickPoints = <SdlxFPoint>[];
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
      if (event is SdlxMouseButtonEvent &&
          event.type == SdlkEvent.mouseButtonDown) {
        switch (event.button) {
          case SdlkButton.left:
            final position = SdlxFPoint(0, 0);
            sdlxGetMouseState(position);
            clickPoints.add(position);
          case SdlkButton.right:
            if (clickPoints.isNotEmpty) {
              clickPoints.removeLast();
            }
        }
      }
    }
    renderer
      ..setDrawColor(SdlxColor(0, 0, 0))
      ..clear()
      ..filledPolygonColor(clickPoints, SdlxColor(255, 255, 255, 64))
      ..polygonColor(clickPoints, SdlxColor(255, 255, 255))
      ..bezierColor(clickPoints, 10, SdlxColor(255, 0, 0));
    for (var n = 0; n < clickPoints.length; n++) {
      renderer.stringColor(
        clickPoints[n],
        (n + 1).toString(),
        SdlxColor(0, 255, 0),
      );
    }
    renderer.present();
    fpsManager.delaySync();
  }
  gfx.gfxFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
