// https://dxlib.xsrv.jp/dxprogram.html#N4
// 4.マップスクロール基本
// 4.Map scroll basics
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

const gTitle = 'DXLIB Tutorial 04';
const gScreenWidth = 640;
const gScreenHeight = 480;
const gMapSize = 64;
const int gMoveFrame = 32 ~/ 4;

Pointer<SdlWindow> gWindow = nullptr;
Pointer<SdlRenderer> gRenderer = nullptr;
var gPlayerX = 2;
var gPlayerY = 2;
var gMoveX = 0;
var gMoveY = 0;
var gMove = 0;
var gMoveCounter = 0;
double gScrollX = 0;
double gScrollY = 0;
var gMapData = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
  [0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
  [0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0],
  [0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0],
  [0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0],
  [0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0],
  [0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0],
  [0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0],
  [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0],
  [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0],
  [0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0],
  [0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0],
  [0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
  [0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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

void update() {
  if (gMove == 0) {
    final keys = sdlxGetKeyboardState();
    if (keys[SDL_SCANCODE_UP]) {
      gMove = 1;
      gMoveX = 0;
      gMoveY = -1;
    }
    if (keys[SDL_SCANCODE_DOWN]) {
      gMove = 1;
      gMoveX = 0;
      gMoveY = 1;
    }
    if (keys[SDL_SCANCODE_LEFT]) {
      gMove = 1;
      gMoveX = -1;
      gMoveY = 0;
    }
    if (keys[SDL_SCANCODE_RIGHT]) {
      gMove = 1;
      gMoveX = 1;
      gMoveY = 0;
    }
    if (gMove == 1) {
      if (gMapData[gPlayerY + gMoveY][gPlayerX + gMoveX] == 0) {
        gMove = 0;
      } else {
        gMoveCounter = 0;
      }
    }
    gScrollX = 0;
    gScrollY = 0;
  }
  if (gMove == 1) {
    gMoveCounter++;
    if (gMoveCounter == gMoveFrame) {
      gMove = 0;
      gPlayerX += gMoveX;
      gPlayerY += gMoveY;
      gScrollX = 0;
      gScrollY = 0;
    } else {
      gScrollX = -(gMoveX * gMapSize * gMoveCounter / gMoveFrame);
      gScrollY = -(gMoveY * gMapSize * gMoveCounter / gMoveFrame);
    }
  }
}

bool handleEvents() {
  var running = true;
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
  }
  return running;
}

void render() {
  // calc
  const drawMapChipNumX = gScreenWidth ~/ gMapSize + 1;
  const drawMapChipNumY = gScreenHeight ~/ gMapSize + 1;
  final mapDrawPointX = gPlayerX - drawMapChipNumX ~/ 2;
  final mapDrawPointY = gPlayerY - drawMapChipNumY ~/ 2;
  // init
  gRenderer
    ..setDrawColor(SdlxColor(0, 0, 0))
    ..clear()
    // map
    ..setDrawColor(SdlxColor(0xff, 0, 0));
  for (var y = 0; y < gMapData.length; y++) {
    final drawY = y + mapDrawPointY;
    if (drawY < 0 || drawY >= gMapData.length) {
      continue;
    }
    for (var x = 0; x < gMapData[y].length; x++) {
      final drawX = x + mapDrawPointX;
      if (drawX < 0 || drawX >= gMapData[y].length) {
        continue;
      }
      if (gMapData[drawY][drawX] == 0) {
        gRenderer.fillRect(
          SdlxFRect(
            x: x * gMapSize + gScrollX,
            y: y * gMapSize + gScrollY,
            w: gMapSize.toDouble(),
            h: gMapSize.toDouble(),
          ),
        );
      }
    }
  }
  // player
  gRenderer
    ..setDrawColor(SdlxColor(0xff, 0xff, 0xff))
    ..fillRect(
      SdlxFRect(
        x: (gPlayerX - mapDrawPointX) * gMapSize.toDouble(),
        y: (gPlayerY - mapDrawPointY) * gMapSize.toDouble(),
        w: gMapSize.toDouble(),
        h: gMapSize.toDouble(),
      ),
    )
    // term
    ..present();
}

int main() {
  if (init()) {
    var running = true;
    while (running) {
      // handleEvents
      running = handleEvents();
      // update
      update();
      // render
      render();
    }
  }
  close();
  return 0;
}
