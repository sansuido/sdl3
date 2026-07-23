// https://dxlib.xsrv.jp/dxprogram.html#N3
// 3.マップ表示基本
// 3.Map display basics
import 'dart:ffi';
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
  if (!sdlInit(SDL_INIT_VIDEO)) {
    print(sdlGetError());
    return false;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  gWindow = SdlWindowEx.create(
    title: gTitle,
    w: gScreenWidth,
    h: gScreenHeight,
  );
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
  var running = true;
  SdlxEvent? event;
  while ((event = sdlxPollEvent()) != null) {
    if (event is SdlxQuitEvent) {
      running = false;
    }
  }
  return running;
}

void render() {
  // init
  gRenderer
    ..setDrawColor(SdlxColor(0xff, 0xff, 0xff))
    ..clear()
    // map
    ..setDrawColor(SdlxColor(0xff, 0, 0));
  final rects = <SdlxFRect>[];
  for (var y = 0; y < gMapData.length; y++) {
    for (var x = 0; x < gMapData[y].length; x++) {
      if (gMapData[y][x] != 0) {
        rects.add(SdlxFRect(x: x * 64, y: y * 64, w: 64, h: 64));
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
    var running = true;
    while (running) {
      // handleEvents
      running = handleEvents();
      // render
      render();
    }
  }
  close();
  return 0;
}
