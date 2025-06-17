// https://github.com/Rust-SDL2/rust-sdl2/blob/master/examples/gfx-demo.rs
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
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
  final event = calloc<SdlEvent>();
  final clickPoints = <Point<double>>[];
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
        case SDL_EVENT_KEY_DOWN:
          switch (event.key.ref.key) {
            case SDLK_ESCAPE:
              running = false;
          }
        case SDL_EVENT_MOUSE_BUTTON_DOWN:
          switch (event.button.ref.button) {
            case SDL_BUTTON_LEFT:
              clickPoints.add(PointEx.getMousePosition());
            case SDL_BUTTON_RIGHT:
              if (clickPoints.isNotEmpty) {
                clickPoints.removeLast();
              }
            default:
              break;
          }
        default:
          break;
      }
    }
    renderer
      ..setDrawColor(0, 0, 0, 0)
      ..clear()
      ..filledPolygonColor(clickPoints, SdlColorEx.rgbaToU32(255, 255, 255, 64))
      ..polygonColor(clickPoints, SdlColorEx.rgbaToU32(255, 255, 255, 255))
      ..bezierColor(clickPoints, 10, SdlColorEx.rgbaToU32(255, 0, 0, 255));
    for (var n = 0; n < clickPoints.length; n++) {
      renderer.stringColor(
        clickPoints[n],
        (n + 1).toString(),
        SdlColorEx.rgbaToU32(0, 255, 0, 255),
      );
    }
    renderer.present();
    fpsManager.delay();
  }
  gfx.gfxFree();
  event.callocFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
