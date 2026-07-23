// https://dxlib.xsrv.jp/dxprogram.html#N2
// 2.ジャンプ処理
// 2.Jump processing
import 'dart:ffi';
import 'package:sdl3/sdl3.dart';

const gTitle = 'DXLIB Tutorial 02';
const gScreenWidth = 640;
const gScreenHeight = 480;
const gPlayerWidth = 32;
const gPlayerHeight = 32;

Pointer<SdlWindow> gWindow = nullptr;
Pointer<SdlRenderer> gRenderer = nullptr;
double gPlayerX = (gScreenWidth - gPlayerHeight) / 2;
double gPlayerY = (gScreenHeight - gPlayerHeight) / 2;
var gJumpPower = 0;

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
  final keys = sdlxGetKeyboardState();
  if (keys[SDL_SCANCODE_UP]) {
    gPlayerY -= gPlayerHeight ~/ 4;
  }
  if (keys[SDL_SCANCODE_DOWN]) {
    gPlayerY += gPlayerHeight ~/ 4;
  }
  if (keys[SDL_SCANCODE_LEFT]) {
    gPlayerX -= gPlayerWidth ~/ 4;
  }
  if (keys[SDL_SCANCODE_RIGHT]) {
    gPlayerX += gPlayerWidth ~/ 4;
  }
  if (keys[SDL_SCANCODE_SPACE]) {
    if (gPlayerY == 300) {
      gJumpPower = 20;
    }
  }
  gPlayerY -= gJumpPower;
  gJumpPower -= 1;
  if (gPlayerY > 300) {
    gPlayerY = 300;
    gJumpPower = 0;
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
  // init
  gRenderer
    ..setDrawColor(SdlxColor(0, 0, 0))
    ..clear()
    // player
    ..setDrawColor(SdlxColor(0, 255, 0))
    ..fillRect(
      SdlxFRect(
        x: gPlayerX,
        y: gPlayerY,
        w: gPlayerWidth.toDouble(),
        h: gPlayerHeight.toDouble(),
      ),
    )
    // term
    ..present();
}

int main() {
  // initialize
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
  // close
  close();
  return 0;
}
