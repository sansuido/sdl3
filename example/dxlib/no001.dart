// https://dxlib.xsrv.jp/dxprogram.html#N1
// 1.キー入力の基本
// 1.Keystroke basics
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
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
  if (sdlInit(SDL_INIT_VIDEO) == false) {
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
    var quit = false;
    var event = calloc<SdlEvent>();
    while (!quit) {
      while (event.poll()) {
        switch (event.type) {
          case SDL_EVENT_QUIT:
            quit = true;
            break;
          case SDL_EVENT_KEY_DOWN:
            var keys = sdlGetKeyboardState(nullptr);
            if (keys[SDL_SCANCODE_UP] != 0) {
              gPlayerY -= gPlayerHeight ~/ 2;
            }
            if (keys[SDL_SCANCODE_DOWN] != 0) {
              gPlayerY += gPlayerHeight ~/ 2;
            }
            if (keys[SDL_SCANCODE_LEFT] != 0) {
              gPlayerX -= gPlayerWidth ~/ 2;
            }
            if (keys[SDL_SCANCODE_RIGHT] != 0) {
              gPlayerX += gPlayerWidth ~/ 2;
            }
            break;
          default:
            break;
        }
      }
      // draw
      gRenderer
        ..setDrawColor(0x00, 0x00, 0x00, SDL_ALPHA_OPAQUE)
        ..clear()
        ..setDrawColor(0x00, 0xff, 0x00, SDL_ALPHA_OPAQUE)
        ..fillRect(
          Rectangle(
            gPlayerX,
            gPlayerY,
            gPlayerWidth.toDouble(),
            gPlayerHeight.toDouble(),
          ),
        )
        ..present();
    }
    event.callocFree();
  }
  // close
  close();
  return 0;
}
