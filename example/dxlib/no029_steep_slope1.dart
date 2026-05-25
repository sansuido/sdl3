// https://dxlib.xsrv.jp/program/ActionSample2.cpp
// 29.アクションサンプルプログラム( 坂道あり )
// 29.Action sample program (steep slope)

import 'dart:ffi';
import 'package:sdl3/sdl3.dart';
import 'package:sdl3/sdl3gfx.dart' as gfx;

const gScreenWidth = 640.0;
const gScreenHeight = 480.0;
const gChipSize = 32.0;
const gMapWidth = 20;
const gMapHeight = 15;

const gGravity = 0.3;
const gJumpPower = 9.0;
const gSpeed = 5.0;
const gCharSize = 30.0;

// dart format off
final gMapData = <int>[
  0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1,
  1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,2,1,
  1,0,0,1,6, 3,0,0,0,0, 0,0,0,0,0, 0,0,2,7,1,
  1,0,0,4,7, 7,3,0,0,0, 0,0,0,0,0, 0,2,7,7,1,
  1,0,0,0,4, 6,1,0,0,0, 0,0,0,0,0, 1,1,1,1,1,
  1,0,0,0,0, 0,0,0,1,1, 0,0,0,0,0, 0,0,1,0,1,
  1,0,0,0,0, 0,0,0,0,0, 0,0,1,1,0, 0,0,1,0,1,
  1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,0,1,
  1,0,1,1,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1,
  1,0,0,0,0, 0,0,1,6,3, 0,0,0,0,2, 6,1,0,0,1,
  1,0,0,0,0, 0,0,4,7,1, 0,0,0,2,7, 7,1,0,0,1,
  1,0,0,0,0, 0,0,0,1,1, 0,0,0,1,1, 1,1,0,0,1,
  1,0,0,2,6, 3,0,0,0,0, 0,0,0,1,1, 1,1,0,0,1,
  1,0,2,7,7, 7,3,0,0,0, 0,0,0,0,0, 0,0,0,0,1,
  1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,
];
// dart format on

var gPlayerX = 320.0;
var gPlayerY = 240.0;
var gPlayerDownSpeed = 0.0;
var gPlayerJumpFlag = false;

int getChipParam(double x, double y) {
  final tx = x ~/ gChipSize;
  final ty = y ~/ gChipSize;
  if (tx < 0 || tx >= gMapWidth || ty < 0 || ty >= gMapHeight) return 0;
  return gMapData[ty * gMapWidth + tx];
}

int getChipParam2(double x, double y) {
  var chip = getChipParam(x, y);
  if (chip < 2 || chip > 7) return chip;

  final blx = (x ~/ gChipSize) * gChipSize;
  var bty = (y ~/ gChipSize) * gChipSize;
  var bby = bty + gChipSize;
  final xr = (x - blx) / gChipSize;
  final yr = (y - bty) / gChipSize;

  if (chip == 7) {
    final addy = (yr < 0.5) ? -gChipSize : gChipSize;
    chip = getChipParam(x, y + addy);
    bty = ((y + addy) ~/ gChipSize) * gChipSize;
    bby = bty + gChipSize;
  }

  double blh;
  switch (chip) {
    case 2:
      blh = bby - xr * gChipSize;
      if (y > blh) return chip;
    case 3:
      blh = bty + xr * gChipSize;
      if (y > blh) return chip;
    case 4:
      blh = bty + xr * gChipSize;
      if (y < blh) return chip;
    case 5:
      blh = bby - xr * gChipSize;
      if (y < blh) return chip;
    case 6:
      return chip;
  }
  return 0;
}

(int hit, double moveX, double moveY) mapHitCheck(
  double x,
  double y,
  double mX,
  double mY,
) {
  final afX = x + mX;
  final afY = y + mY;

  if (getChipParam(afX, afY) == 1) {
    final blx = (afX ~/ gChipSize) * gChipSize;
    final brx = blx + gChipSize;
    final bty = (afY ~/ gChipSize) * gChipSize;
    final bby = bty + gChipSize;

    if (mY > 0) return (3, mX, bty - y - 1.0);
    if (mY < 0) return (4, mX, bby - y + 1.0);
    if (mX > 0) return (1, blx - x - 1.0, mY);
    if (mX < 0) return (2, brx - x + 1.0, mY);
    return (4, mX, mY);
  }
  return (0, mX, mY);
}

(int hit, double moveX, double moveY) mapHitCheck2(
  double x,
  double y,
  double mX,
  double mY,
) {
  final afX = x + mX;
  final afY = y + mY;
  var chip = getChipParam(afX, afY);

  if (chip != 0) {
    final blx = (afX ~/ gChipSize) * gChipSize;
    var bty = (afY ~/ gChipSize) * gChipSize;
    var bby = bty + gChipSize;
    final plxRel = (afX - blx) / gChipSize;
    final plyRel = (afY - bty) / gChipSize;

    if (chip == 7) {
      final addy = (plyRel < 0.5) ? -gChipSize : gChipSize;
      chip = getChipParam(afX, afY + addy);
      bty = ((afY + addy) ~/ gChipSize) * gChipSize;
      bby = bty + gChipSize;
    }

    double blh;
    switch (chip) {
      case 2:
        blh = bby - plxRel * gChipSize;
        if (afY > blh) return (1, mX, blh - y - 1.0);
      case 3:
        blh = bty + plxRel * gChipSize;
        if (afY > blh) return (1, mX, blh - y - 1.0);
      case 4:
        blh = bty + plxRel * gChipSize;
        if (afY < blh) return (2, mX, blh - y + 1.0);
      case 5:
        blh = bby - plxRel * gChipSize;
        if (afY < blh) return (2, mX, blh - y + 1.0);
      case 1:
      case 6:
        if (mY > 0) return (1, mX, bty - y - 1.0);
        if (mY < 0) return (2, mX, bby - y + 1.0);
        return (1, mX, mY);
    }
  }
  return (0, mX, mY);
}

void charMove(double moveX, double moveY) {
  var moveX0 = moveX;
  var moveY0 = moveY;
  const hsize = gCharSize * 0.5;
  var res = (0, 0.0, 0.0);

  res = mapHitCheck(gPlayerX - hsize, gPlayerY + hsize, 0, moveY0);
  if (res.$1 == 3) gPlayerDownSpeed = 0;
  moveY0 = res.$3;

  res = mapHitCheck(gPlayerX + hsize, gPlayerY + hsize, 0, moveY0);
  if (res.$1 == 3) gPlayerDownSpeed = 0;
  moveY0 = res.$3;

  res = mapHitCheck(gPlayerX - hsize, gPlayerY - hsize, 0, moveY0);
  if (res.$1 == 4 && gPlayerDownSpeed < 0) gPlayerDownSpeed *= -1;
  moveY0 = res.$3;

  res = mapHitCheck(gPlayerX + hsize, gPlayerY - hsize, 0, moveY0);
  if (res.$1 == 4 && gPlayerDownSpeed < 0) gPlayerDownSpeed *= -1;
  moveY0 = res.$3;

  res = mapHitCheck(gPlayerX - hsize, gPlayerY + hsize, moveX0, 0);
  moveX0 = res.$2;
  res = mapHitCheck(gPlayerX + hsize, gPlayerY + hsize, moveX0, 0);
  moveX0 = res.$2;
  res = mapHitCheck(gPlayerX - hsize, gPlayerY - hsize, moveX0, 0);
  moveX0 = res.$2;
  res = mapHitCheck(gPlayerX + hsize, gPlayerY - hsize, moveX0, 0);
  moveX0 = res.$2;

  gPlayerX += moveX0;

  res = mapHitCheck2(gPlayerX, gPlayerY + hsize, 0, moveY0);
  if (res.$1 == 1) gPlayerDownSpeed = 0;
  moveY0 = res.$3;

  res = mapHitCheck2(gPlayerX, gPlayerY - hsize, 0, moveY0);
  if (res.$1 == 2 && gPlayerDownSpeed < 0) gPlayerDownSpeed *= -1;
  moveY0 = res.$3;

  gPlayerY += moveY0;

  final cL = getChipParam2(gPlayerX - hsize, gPlayerY + hsize + 2.0);
  final cC = getChipParam2(gPlayerX, gPlayerY + hsize + 2.0);
  final cR = getChipParam2(gPlayerX + hsize, gPlayerY + hsize + 2.0);

  if (cL == 1 || cC != 0 || cR == 1) {
    gPlayerJumpFlag = false;
    gPlayerDownSpeed = 0;
  } else {
    if (gPlayerJumpFlag || moveY0 <= 0) {
      gPlayerJumpFlag = true;
    } else {
      var snapped = false;
      for (var checkDist = 1.0; checkDist <= gChipSize / 2; checkDist += 1.0) {
        final snapRes = mapHitCheck2(gPlayerX, gPlayerY + hsize, 0, checkDist);
        if (snapRes.$1 == 1) {
          gPlayerY += snapRes.$3;
          gPlayerDownSpeed = 0;
          gPlayerJumpFlag = false;
          snapped = true;
          break;
        }
      }
      if (!snapped) {
        gPlayerJumpFlag = true;
      }
    }
  }
}

void drawTriangle(
  Pointer<SdlRenderer> renderer,
  SdlxFPoint p1,
  SdlxFPoint p2,
  SdlxFPoint p3,
) {
  final color = SdlxFColor(1, 1, 1);
  final vertices = <SdlxVertex>[
    SdlxVertex()
      ..position = p1
      ..color = color,
    SdlxVertex()
      ..position = p2
      ..color = color,
    SdlxVertex()
      ..position = p3
      ..color = color,
  ];
  sdlxRenderGeometry(renderer, nullptr, vertices: vertices);
}

Future<void> main() async {
  sdlInit(SDL_INIT_VIDEO | SDL_INIT_EVENTS);
  final window = SdlWindowEx.create(
    title: 'Slope Action - Dart SDL3',
    w: gScreenWidth.toInt(),
    h: gScreenHeight.toInt(),
  );
  if (window == nullptr) {
    print('Failed to create window: ${sdlGetError()}');
    return;
  }
  final renderer = window.createRenderer();
  if (renderer == nullptr) {
    print('Failed to create renderer: ${sdlGetError()}');
    window.destroy();
    sdlQuit();
    return;
  }
  renderer.setVSync(1);
  final fps = gfx.FpsManager();
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
    double mX = 0;
    final keys = sdlxGetKeyboardState();
    if (keys[SdlkScancode.left]) {
      mX -= gSpeed;
    }
    if (keys[SdlkScancode.right]) {
      mX += gSpeed;
    }
    if (!gPlayerJumpFlag && keys[SdlkScancode.z]) {
      gPlayerDownSpeed = -gJumpPower;
      gPlayerJumpFlag = true;
    }

    gPlayerDownSpeed += gGravity;
    charMove(mX, gPlayerDownSpeed);

    sdlSetRenderDrawColor(renderer, 0, 0, 40, 255);
    sdlRenderClear(renderer);

    sdlSetRenderDrawColor(renderer, 255, 255, 255, 255);
    for (var y = 0; y < gMapHeight; y++) {
      for (var x = 0; x < gMapWidth; x++) {
        final chip = gMapData[y * gMapWidth + x];
        final xPos = x * gChipSize;
        final yPos = y * gChipSize;

        if (chip == 1 || chip == 6 || chip == 7) {
          final rect = SdlxFRect()
            ..x = xPos
            ..y = yPos
            ..w = gChipSize
            ..h = gChipSize;
          renderer.fillRect(rect);
        } else if (chip == 2) {
          drawTriangle(
            renderer,
            SdlxFPoint(xPos, yPos + gChipSize),
            SdlxFPoint(xPos + gChipSize, yPos),
            SdlxFPoint(xPos + gChipSize, yPos + gChipSize),
          );
        } else if (chip == 3) {
          drawTriangle(
            renderer,
            SdlxFPoint(xPos, yPos),
            SdlxFPoint(xPos + gChipSize, yPos + gChipSize),
            SdlxFPoint(xPos, yPos + gChipSize),
          );
        } else if (chip == 4) {
          drawTriangle(
            renderer,
            SdlxFPoint(xPos, yPos),
            SdlxFPoint(xPos + gChipSize, yPos),
            SdlxFPoint(xPos + gChipSize, yPos + gChipSize),
          );
        } else if (chip == 5) {
          drawTriangle(
            renderer,
            SdlxFPoint(xPos, yPos + gChipSize),
            SdlxFPoint(xPos, yPos),
            SdlxFPoint(xPos + gChipSize, yPos),
          );
        }
      }
    }
    sdlSetRenderDrawColor(renderer, 255, 0, 0, 255);
    final pRect = SdlxFRect()
      ..x = (gPlayerX - gCharSize / 2).floorToDouble()
      ..y = (gPlayerY - gCharSize / 2).floorToDouble()
      ..w = gCharSize
      ..h = gCharSize;
    renderer.fillRect(pRect);
    sdlRenderPresent(renderer);
    await fps.delay();
  }
  sdlDestroyRenderer(renderer);
  sdlDestroyWindow(window);
  sdlQuit();
}
