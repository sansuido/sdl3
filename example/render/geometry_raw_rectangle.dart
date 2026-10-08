import 'dart:ffi';

import 'package:sdl3/sdl3.dart';

int main() {
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');

  final window = SdlWindowEx.create(title: 'geometry raw quad', w: 800, h: 600);
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

  var textureOn = false;
  final texture = renderer.loadTexture('assets/jap/gate.png');

  final positions = <SdlxFPoint>[
    const SdlxFPoint(200, 150),
    const SdlxFPoint(600, 150),
    const SdlxFPoint(600, 450),
    const SdlxFPoint(200, 450),
  ];

  final colors = <SdlxFColor>[
    const SdlxFColor(1, 0, 0),
    const SdlxFColor(0, 1, 0),
    const SdlxFColor(0, 0, 1),
    const SdlxFColor(1, 1, 0),
  ];

  final texCoords = <SdlxFPoint>[
    const SdlxFPoint(0, 0),
    const SdlxFPoint(1, 0),
    const SdlxFPoint(1, 1),
    const SdlxFPoint(0, 1),
  ];

  final indices = <int>[0, 1, 2, 0, 2, 3];

  var running = true;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) {
        running = false;
      }
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        switch (event.scancode) {
          case SdlkScancode.escape:
            running = false;
          case SdlkScancode.onReturn:
            textureOn = !textureOn;
        }
      }
      if (event is SdlxMouseButtonEvent &&
          event.type == SdlkEvent.mouseButtonDown) {
        if (event.button == 1) {
          textureOn = !textureOn;
        }
      }
    }

    renderer
      ..setDrawColor(const SdlxColor(0, 0, 0))
      ..clear();
    if (textureOn) {
      renderer.geometryRaw(
        positions,
        texture: texture,
        colors: colors,
        texCoords: texCoords,
        indices: indices,
      );
    } else {
      renderer.geometryRaw(positions, colors: colors, indices: indices);
    }
    renderer.present();
  }
  texture.destroy();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
