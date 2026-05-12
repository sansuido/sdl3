// https://dxlib.xsrv.jp/dxprogram.html#N1
// 1.キー入力の基本
// 1.Keystroke basics
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

const gTitle = 'DXLIB Tutorial 01';
const gScreenWidth = 640;
const gScreenHeight = 480;
const gPlayerWidth = 32;
const gPlayerHeight = 32;

Pointer<SdlWindow> gWindow = nullptr;
Pointer<SdlRenderer> gRenderer = nullptr;
double gPlayerX = (gScreenWidth - gPlayerWidth) / 2;
double gPlayerY = (gScreenHeight - gPlayerHeight) / 2;

bool init() {
  var success = true;
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    success = false;
  } else {
    sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
    gWindow = SdlWindowEx.create(
      title: gTitle,
      w: gScreenWidth,
      h: gScreenHeight,
    );
    if (gWindow == nullptr) {
      print(sdlGetError());
      success = false;
    } else {
      gRenderer = gWindow.createRenderer();
      if (gRenderer == nullptr) {
        success = false;
      }
    }
  }
  return success;
}

void close() {
  gRenderer.destroy();
  gWindow.destroy();
  sdlQuit();
}

int main() {
  // initialize
  if (init()) {
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
      final keys = sdlxGetKeyboardState();
      if (keys[SdlkScancode.up]) {
        gPlayerY -= gPlayerHeight ~/ 2;
      }
      if (keys[SdlkScancode.down]) {
        gPlayerY += gPlayerHeight ~/ 2;
      }
      if (keys[SdlkScancode.left]) {
        gPlayerX -= gPlayerWidth ~/ 2;
      }
      if (keys[SdlkScancode.right]) {
        gPlayerX += gPlayerWidth ~/ 2;
      }
      // draw
      gRenderer
        ..setDrawColor(SdlxColor(0, 0, 0))
        ..clear()
        ..setDrawColor(SdlxColor(0, 255, 0))
        ..fillRect(
          SdlxFRect(
            x: gPlayerX,
            y: gPlayerY,
            w: gPlayerWidth.toDouble(),
            h: gPlayerHeight.toDouble(),
          ),
        )
        ..present();
    }
  }
  // close
  close();
  return 0;
}
