import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(title: 'draw triangle', w: 640, h: 480);
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
  final lines = <SdlxFPoint>[
    SdlxFPoint(320, 200),
    SdlxFPoint(300, 240),
    SdlxFPoint(340, 240),
    SdlxFPoint(320, 200),
  ];
  var running = true;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      // Uncomment the line below to analyze event types in hexadecimal.
      //print('id: 0x${event!.type.toRadixString(16).toUpperCase().padLeft(4, '0')} type: ${event.runtimeType}');
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
      ..setDrawColor(SdlxColor(255, 255, 255))
      ..lines(lines)
      ..present();
  }
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
