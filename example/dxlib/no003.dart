// https://dxlib.xsrv.jp/dxprogram.html#N3
// 3.マップ表示基本
// 3.Map display basics
import 'dart:ffi';
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gTitle = 'DXLIB Tutorial 03';
const gScreenWidth = 640;
const gScreenHeight = 480;

Pointer<SdlWindow> gWindow = nullptr;
Pointer<SdlRenderer> gRenderer = nullptr;
var gMapData = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 1, 1, 1, 1, 1, 1, 0],
  [0, 1, 0, 1, 1, 0, 0, 0, 1, 0],
  [0, 1, 1, 1, 1, 0, 0, 0, 1, 0],
  [0, 1, 0, 1, 0, 0, 0, 0, 1, 0],
  [0, 1, 1, 1, 1, 1, 1, 1, 1, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
];

bool init() {
  if (sdlInit(SDL_INIT_VIDEO) < 0) {
    print(sdlGetError());
    return false;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  gWindow =
      SdlWindowEx.create(title: gTitle, w: gScreenWidth, h: gScreenHeight);
  if (gWindow == nullptr) {
    print(sdlGetError());
    return false;
  }
  gRenderer = gWindow.createRenderer();
  if (gRenderer == nullptr) {
    print(sdlGetError());
    return false;
  }
  return true;
}

void close() {
  gRenderer.destroy();
  gWindow.destroy();
  sdlQuit();
}

bool handleEvents() {
  var quit = false;
  var event = calloc<SdlEvent>();
  while (event.poll()) {
    switch (event.type) {
      case SDL_EVENT_QUIT:
        quit = true;
        break;
      default:
        break;
    }
  }
  event.callocFree();
  return quit;
}

void render() {
  // init
  gRenderer
    ..setDrawColor(0xff, 0xff, 0xff, SDL_ALPHA_OPAQUE)
    ..clear();
  // map
  gRenderer.setDrawColor(0xff, 0x00, 0x00, SDL_ALPHA_OPAQUE);
  var rects = <Rectangle<double>>[];
  for (var y = 0; y < gMapData.length; y++) {
    for (var x = 0; x < gMapData[y].length; x++) {
      if (gMapData[y][x] != 0) {
        rects.add(Rectangle(x * 64, y * 64, 64, 64));
      }
    }
  }
  gRenderer
    ..fillRects(rects)
    // term
    ..present();
}

int main() {
  if (init()) {
    var quit = false;
    while (!quit) {
      // update
      // handleEvents
      quit = handleEvents();
      // render
      render();
    }
  }
  close();
  return 0;
}
