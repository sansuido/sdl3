import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';
import 'package:sdl3/sdl3gfx.dart' as gfx;

const gWindowWidth = 640;
const gWindowHeight = 480;

void setTitle(Pointer<SdlWindow> window, gfx.FpsManager fpsManager) {
  window.setTitle('FPSmanager example (${fpsManager.getFramerate()})');
}

int main() {
  if (sdlInit(SDL_INIT_VIDEO) == false) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  var window = SdlWindowEx.create(
      title: '', w: gWindowWidth, h: gWindowHeight, flags: SDL_WINDOW_OPENGL);
  if (window == nullptr) {
    print(sdlGetError());
    sdlQuit();
    return -1;
  }
  var renderer = window.createRenderer();
  if (renderer == nullptr) {
    print(sdlGetError());
    window.destroy();
    sdlQuit();
    return -1;
  }
  var fpsManager = gfx.FpsManager();
  setTitle(window, fpsManager);
  var event = calloc<SdlEvent>();
  var time = sdlGetTicks();
  var frameRate = 0;
  var frameCount = 0;
  var running = true;
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SDL_EVENT_QUIT:
          running = false;
          break;
        case SDL_EVENT_KEY_DOWN:
          switch (event.key.ref.key) {
            case SDLK_UP:
              fpsManager.setFramerate(fpsManager.getFramerate() + 1);
              setTitle(window, fpsManager);
              break;
            case SDLK_DOWN:
              fpsManager.setFramerate(fpsManager.getFramerate() - 1);
              setTitle(window, fpsManager);
              break;
            default:
              break;
          }
          break;
        default:
          break;
      }
    }
    fpsManager.delay();
    if ((sdlGetTicks() - time) > 1000) {
      frameRate = frameCount;
      frameCount = 0;
      time = sdlGetTicks();
    } else {
      frameCount++;
    }
    renderer
      ..setDrawColor(0, 0, 0, 0)
      ..clear()
      ..stringColor(
          Point(15, 15), 'FPS:$frameRate', SdlColorEx.rgbaToU32(0, 255, 0, 255))
      ..present();
  }
  gfx.gfxFree();
  event.callocFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
