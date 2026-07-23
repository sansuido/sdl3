import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

const gScreenWidth = 800;
const gScreenHeight = 600;

int main() {
  if (!sdlInit(SDL_INIT_VIDEO | SDL_INIT_GAMEPAD | SDL_INIT_JOYSTICK)) {
    print(sdlGetError());
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(
    title: 'Gamepad',
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
  final gamePad = SdlGamepadEx.open(0);
  if (gamePad == nullptr) {
    print(sdlGetError());
    renderer.destroy();
    window.destroy();
    sdlQuit();
    return -1;
  }
  window.setTitle(SdlGamepadEx.getNameForId(0)!);
  final buttonNames = [
    'A',
    'B',
    'X',
    'Y',
    'BACK',
    'GUIDE',
    'START',
    'LEFTSTICK',
    'RIGHTSTICK',
    'LEFTSHOULDER',
    'RIGHTSHOULDER',
    'DPAD_UP',
    'DPAD_DOWN',
    'DPAD_LEFT',
    'DPAD_RIGHT',
    'MISC1',
    'PADDLE1',
    'PADDLE2',
    'PADDLE3',
    'PADDLE4',
    'TOUCHPAD',
  ];
  final buttonEnables = <bool>[];
  for (var n = 0; n < SDL_GAMEPAD_BUTTON_COUNT; n++) {
    buttonEnables.add(false);
  }
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
        }
      }
      if (event is SdlxGamepadButtonEvent) {
        if (event.type == SdlkEvent.gamepadButtonDown) {
          buttonEnables[event.button] = true;
        } else {
          buttonEnables[event.button] = false;
        }
      }
    }
    renderer
      ..setDrawColor(SdlxColor(0xff, 0xff, 0xff))
      ..clear();
    for (var n = 0; n < buttonEnables.length; n++) {
      var color = SdlxColor(255, 0, 0);
      if (buttonEnables[n]) {
        color = SdlxColor(0, 255, 0);
      }
      renderer
        ..filledCircleColor(SdlxFPoint(20, (n + 1) * 20), 10, color)
        ..stringColor(
          SdlxFPoint(20 + 20, (n + 1) * 20),
          buttonNames[n],
          SdlxColor(0, 0, 0),
        );
    }
    renderer.present();
  }
  gamePad.close();
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
