import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(title: 'geometry', w: 800, h: 600);
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
  final vertices = <SdlxVertex>[
    SdlxVertex()
      ..position = SdlxFPoint(400, 150)
      ..color = SdlxFColor(1, 0, 0),
    SdlxVertex()
      ..position = SdlxFPoint(200, 450)
      ..color = SdlxFColor(0, 0, 1),
    SdlxVertex()
      ..position = SdlxFPoint(600, 450)
      ..color = SdlxFColor(0, 1, 0),
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
      ..setDrawColor(SdlxColor(0, 0, 0))
      ..clear()
      ..geometry(nullptr, vertices: vertices)
      ..present();
  }
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
