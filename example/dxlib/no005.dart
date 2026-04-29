// https://dxlib.xsrv.jp/dxprogram.html#N5
// 5.シューティング基本
// 5.Shooting basics
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gTitle = 'DXLIB Tutorial 05';
const gScreenWidth = 640;
const gScreenHeight = 480;
const gMaxShot = 4;

Pointer<SdlWindow> gWindow = nullptr;
Pointer<SdlRenderer> gRenderer = nullptr;
var gPlayer = Position();
var gShotList = <Position>[];

class Position {
  var x = 0;
  var y = 0;
}

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
  gPlayer.x = 320;
  gPlayer.y = 400;
  return true;
}

void close() {
  gRenderer.destroy();
  gWindow.destroy();
  sdlQuit();
}

void update() {
  final keys = sdlGetKeyboardState(nullptr);
  if (keys[SDL_SCANCODE_LEFT] != 0) {
    gPlayer.x -= 3;
  }
  if (keys[SDL_SCANCODE_RIGHT] != 0) {
    gPlayer.x += 3;
  }
  var index = 0;
  while (index < gShotList.length) {
    gShotList[index].y -= 8;
    if (gShotList[index].y < -32) {
      gShotList.removeAt(index);
    } else {
      index++;
    }
  }
  if (keys[SDL_SCANCODE_Z] != 0 && gShotList.length < gMaxShot) {
    gShotList.add(
      Position()
        ..x = gPlayer.x
        ..y = gPlayer.y,
    );
  }
}

bool handleEvents() {
  var quit = false;
  final event = calloc<SdlEvent>();
  while (event.poll()) {
    switch (event.type) {
      case SDL_EVENT_QUIT:
        quit = true;
      default:
        break;
    }
  }
  event.callocFree();
  return quit;
}

void renderer() {
  // init
  gRenderer
    ..setDrawColor(SdlxColor(0, 0, 0))
    ..clear()
    // draw player
    ..setDrawColor(SdlxColor(0xff, 0, 0))
    ..fillRect(SdlxFRect(x: gPlayer.x - 24, y: gPlayer.y - 24, w: 48, h: 48))
    // shot
    ..setDrawColor(SdlxColor(0xff, 0xff, 0xff));
  for (final shot in gShotList) {
    gRenderer.fillRect(SdlxFRect(x: shot.x - 8, y: shot.y - 8, w: 16, h: 16));
  }
  // term
  gRenderer.present();
}

int main() {
  if (init()) {
    var quit = false;
    while (!quit) {
      // update
      update();
      // handleEvents
      quit = handleEvents();
      // renderer
      renderer();
    }
  }
  close();
  return 0;
}
