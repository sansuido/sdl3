import 'dart:ffi';
import 'package:sdl3/sdl3.dart';
import 'package:sdl3/sdl3gfx.dart' as gfx;

const gWindowWidth = 640;
const gWindowHeight = 480;

void setTitle(Pointer<SdlWindow> window, gfx.FpsManager fpsManager) {
  window.setTitle('FPSmanager example (${fpsManager.getFramerate()})');
}

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  final window = SdlWindowEx.create(
    title: '',
    w: gWindowWidth,
    h: gWindowHeight,
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
  setTitle(window, fpsManager);
  var time = sdlGetTicks();
  var frameRate = 0;
  var frameCount = 0;
  var running = true;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        switch (event.scancode) {
          case SdlkScancode.up:
            fpsManager.setFramerate(fpsManager.getFramerate() + 1);
            setTitle(window, fpsManager);
          case SdlkScancode.down:
            fpsManager.setFramerate(fpsManager.getFramerate() - 1);
            setTitle(window, fpsManager);
          case SdlkScancode.escape:
            running = false;
        }
      }
    }
    fpsManager.delaySync();
    if ((sdlGetTicks() - time) > 1000) {
      frameRate = frameCount;
      frameCount = 0;
      time = sdlGetTicks();
    } else {
      frameCount++;
    }
    renderer
      ..setDrawColor(SdlxColor(0, 0, 0))
      ..clear()
      ..stringColor(SdlxFPoint(15, 15), 'FPS:$frameRate', SdlxColor(0, 255, 0))
      ..present();
  }
  gfx.gfxFree();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
