import 'dart:ffi';

import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(title: 'geometry raw', w: 800, h: 600);
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
  final positions = <SdlxFPoint>[
    const SdlxFPoint(400, 150),
    const SdlxFPoint(200, 450),
    const SdlxFPoint(600, 450),
  ];
  final colors = <SdlxFColor>[
    const SdlxFColor(1, 0, 0),
    const SdlxFColor(0, 0, 1),
    const SdlxFColor(0, 1, 0),
  ];
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
    }
    renderer
      ..setDrawColor(const SdlxColor(0, 0, 0))
      ..clear()
      ..geometryRaw(positions, colors: colors)
      ..present();
  }
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
