// https://dxlib.xsrv.jp/program/ActionSample3cpp
// 29.アクションサンプルプログラム( 坂道あり、スクロールあり )
// 29.Action sample program (steep slope & scroll)

import 'dart:ffi';
import 'package:sdl3/sdl3.dart';
import 'package:sdl3/sdl3gfx.dart' as gfx;

const gScreenWidth = 640.0;
const gScreenHeight = 480.0;
const gChipSize = 32.0;
const gMapWidth = 60;
const gMapHeight = 15;

const gGravity = 0.3;
const gJumpPower = 9.0;
const gSpeed = 5.0;
const gCharSize = 30.0;

// dart format off
final gMapData = <int>[
  1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 
  1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,1,1, 
  1,0,0,1,6, 3,0,0,0,0, 0,0,0,0,0, 0,0,1,1,0, 0,0,0,1,6, 3,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,6, 3,0,0,0,0, 0,0,0,0,0, 0,0,1,1,1, 
  1,0,0,4,7, 7,3,0,0,0, 0,0,0,0,0, 0,1,1,1,0, 0,0,0,4,7, 7,3,0,0,0, 0,0,0,0,0, 0,1,1,1,0, 0,0,0,4,7, 7,3,0,0,0, 0,0,0,0,0, 0,1,1,1,1, 
  1,0,0,0,4, 6,1,0,0,0, 0,0,0,0,0, 1,1,1,1,0, 0,0,0,0,4, 6,1,0,0,0, 0,0,0,0,0, 1,1,1,1,0, 0,0,0,0,4, 6,1,0,0,0, 0,0,0,0,0, 1,1,1,1,1, 

  1,0,0,0,0, 0,0,0,1,1, 0,0,0,0,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,1,1, 0,0,0,1,1, 1,1,1,0,1, 
  1,0,0,0,0, 0,0,0,1,1, 0,0,1,1,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,1,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,1,1, 1,1,1,0,1, 
  1,0,0,0,0, 0,0,0,0,0, 0,0,1,1,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,0,1, 
  1,0,1,1,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,1,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 
  1,0,0,0,0, 0,0,1,6,3, 0,0,0,0,2, 6,1,0,0,0, 0,0,0,0,0, 0,0,1,1,1, 1,1,1,1,1, 1,1,0,0,0, 0,0,0,0,0, 0,0,1,6,3, 0,0,0,0,2, 6,1,0,0,1, 

  1,0,0,0,0, 0,0,4,7,1, 0,0,0,2,7, 7,1,0,0,0, 0,0,0,0,0, 0,0,1,1,1, 1,1,1,1,1, 1,1,0,0,0, 0,0,0,0,0, 0,0,4,7,1, 0,0,0,2,7, 7,1,0,0,1, 
  1,0,0,0,0, 0,0,0,1,1, 0,0,0,1,1, 1,1,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,1, 1,1,0,0,0, 0,0,0,0,0, 0,0,0,1,1, 0,0,0,1,1, 1,1,0,0,1, 
  1,0,0,2,6, 3,0,0,0,0, 0,0,0,1,1, 1,1,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,1, 1,1,0,0,0, 0,0,0,1,1, 1,0,0,0,0, 0,0,0,1,1, 1,1,0,0,1, 
  1,0,2,7,7, 7,3,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,1,1,1, 1,1,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 
  1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 
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

(int hit, double mX, double mY) mapHitCheck(
  double x,
  double y,
  double moveX,
  double moveY,
) {
  final afX = x + moveX;
  final afY = y + moveY;
  if (getChipParam(afX, afY) == 1) {
    final blx = (afX ~/ gChipSize) * gChipSize;
    final brx = blx + gChipSize;
    final bty = (afY ~/ gChipSize) * gChipSize;
    final bby = bty + gChipSize;
    if (moveY > 0) return (3, moveX, bty - y - 1.0);
    if (moveY < 0) return (4, moveX, bby - y + 1.0);
    if (moveX > 0) return (1, blx - x - 1.0, moveY);
    if (moveX < 0) return (2, brx - x + 1.0, moveY);
    return (4, moveX, moveY);
  }
  return (0, moveX, moveY);
}

(int hit, double mX, double mY) mapHitCheck2(
  double x,
  double y,
  double moveX,
  double moveY,
) {
  final afX = x + moveX;
  final afY = y + moveY;
  var chip = getChipParam(afX, afY);
  if (chip != 0) {
    final blx = (afX ~/ gChipSize) * gChipSize;
    var bty = (afY ~/ gChipSize) * gChipSize;
    var bby = bty + gChipSize;
    final plx = (afX - blx) / gChipSize;
    final ply = (afY - bty) / gChipSize;

    if (chip == 7) {
      final addy = (ply < 0.5) ? -gChipSize : gChipSize;
      chip = getChipParam(afX, afY + addy);
      bty = ((afY + addy) ~/ gChipSize) * gChipSize;
      bby = bty + gChipSize;
    }

    double blh;
    switch (chip) {
      case 2:
        blh = bby - plx * gChipSize;
        if (afY > blh) return (1, moveX, blh - y - 1.0);
      case 3:
        blh = bty + plx * gChipSize;
        if (afY > blh) return (1, moveX, blh - y - 1.0);
      case 4:
        blh = bty + plx * gChipSize;
        if (afY < blh) return (2, moveX, blh - y + 1.0);
      case 5:
        blh = bby - plx * gChipSize;
        if (afY < blh) return (2, moveX, blh - y + 1.0);
      case 1:
      case 6:
        if (moveY > 0) return (1, moveX, bty - y - 1.0);
        if (moveY < 0) return (2, moveX, bby - y + 1.0);
        return (1, moveX, moveY);
    }
  }
  return (0, moveX, moveY);
}

void charMove(double moveX, double moveY) {
  final moveYBackup = moveY;
  const hsize = gCharSize * 0.5;
  const dummyX = 0.0;
  var currentMoveX = moveX;
  var currentMoveY = moveY;

  var res = mapHitCheck(
    gPlayerX - hsize,
    gPlayerY + hsize,
    dummyX,
    currentMoveY,
  );
  if (res.$1 == 3) gPlayerDownSpeed = 0.0;
  currentMoveY = res.$3;

  res = mapHitCheck(gPlayerX + hsize, gPlayerY + hsize, dummyX, currentMoveY);
  if (res.$1 == 3) gPlayerDownSpeed = 0.0;
  currentMoveY = res.$3;

  res = mapHitCheck(gPlayerX - hsize, gPlayerY - hsize, dummyX, currentMoveY);
  if (res.$1 == 4 && gPlayerDownSpeed < 0) gPlayerDownSpeed *= -1.0;
  currentMoveY = res.$3;

  res = mapHitCheck(gPlayerX + hsize, gPlayerY - hsize, dummyX, currentMoveY);
  if (res.$1 == 4 && gPlayerDownSpeed < 0) gPlayerDownSpeed *= -1.0;
  currentMoveY = res.$3;

  const dummyY = 0.0;
  res = mapHitCheck(gPlayerX - hsize, gPlayerY + hsize, currentMoveX, dummyY);
  currentMoveX = res.$2;
  res = mapHitCheck(gPlayerX + hsize, gPlayerY + hsize, currentMoveX, dummyY);
  currentMoveX = res.$2;
  res = mapHitCheck(gPlayerX - hsize, gPlayerY - hsize, currentMoveX, dummyY);
  currentMoveX = res.$2;
  res = mapHitCheck(gPlayerX + hsize, gPlayerY - hsize, currentMoveX, dummyY);
  currentMoveX = res.$2;

  gPlayerX += currentMoveX;

  res = mapHitCheck2(gPlayerX, gPlayerY + hsize, 0, currentMoveY);
  if (res.$1 == 1) gPlayerDownSpeed = 0.0;
  currentMoveY = res.$3;

  res = mapHitCheck2(gPlayerX, gPlayerY - hsize, 0, currentMoveY);
  if (res.$1 == 2 && gPlayerDownSpeed < 0) gPlayerDownSpeed *= -1.0;
  currentMoveY = res.$3;

  gPlayerY += currentMoveY;

  final chipL1 = getChipParam2(gPlayerX - hsize, gPlayerY + hsize + 2.0);
  final chipC1 = getChipParam2(gPlayerX, gPlayerY + hsize + 2.0);
  final chipR1 = getChipParam2(gPlayerX + hsize, gPlayerY + hsize + 2.0);

  if (chipL1 == 1 || chipC1 != 0 || chipR1 == 1) {
    gPlayerJumpFlag = false;
  } else {
    if (gPlayerJumpFlag || moveYBackup <= 0.0) {
      gPlayerJumpFlag = true;
    } else {
      var snapped = false;
      for (var i = 0; i < 2; i++) {
        final checkY = gPlayerY + hsize + (i == 0 ? 0 : gChipSize / 2);
        final chip = getChipParam(gPlayerX, checkY);
        if ([1, 2, 3, 6, 7].contains(chip)) {
          final addcy = (getChipParam(gPlayerX, gPlayerY + hsize) == 0) ? 1 : 0;
          final targetY =
              (((gPlayerY + hsize) ~/ gChipSize + 1 + addcy) * gChipSize -
                  1.0) -
              (gPlayerY + hsize);
          final snapRes = mapHitCheck2(gPlayerX, gPlayerY + hsize, 0, targetY);
          gPlayerY += snapRes.$3;
          gPlayerDownSpeed = 0.0;
          gPlayerJumpFlag = false;
          snapped = true;
          break;
        }
      }
      if (!snapped) gPlayerJumpFlag = true;
    }
  }
}

void drawTriangle(
  Pointer<SdlRenderer> renderer,
  double x,
  double y,
  int type,
  int dx,
  int dy,
) {
  final xPos = x + dx;
  final yPos = y + dy;
  final color = SdlxFColor(1, 1, 1);
  List<SdlxFPoint> points;

  switch (type) {
    case 2:
      points = [
        SdlxFPoint(xPos, yPos + gChipSize),
        SdlxFPoint(xPos + gChipSize, yPos),
        SdlxFPoint(xPos + gChipSize, yPos + gChipSize),
      ];
    case 3:
      points = [
        SdlxFPoint(xPos, yPos),
        SdlxFPoint(xPos + gChipSize, yPos + gChipSize),
        SdlxFPoint(xPos, yPos + gChipSize),
      ];
    case 4:
      points = [
        SdlxFPoint(xPos, yPos),
        SdlxFPoint(xPos + gChipSize, yPos),
        SdlxFPoint(xPos + gChipSize, yPos + gChipSize),
      ];
    case 5:
      points = [
        SdlxFPoint(xPos, yPos + gChipSize),
        SdlxFPoint(xPos, yPos),
        SdlxFPoint(xPos + gChipSize, yPos),
      ];
    default:
      return;
  }

  final vertices = points
      .map(
        (p) => SdlxVertex()
          ..position = p
          ..color = color,
      )
      .toList();
  sdlxRenderGeometry(renderer, nullptr, vertices: vertices);
}

Future<void> main() async {
  sdlInit(SDL_INIT_VIDEO | SDL_INIT_EVENTS);
  final window = SdlWindowEx.create(
    title: 'Slope & Scroll - Dart SDL3',
    w: gScreenWidth.toInt(),
    h: gScreenHeight.toInt(),
  );
  if (window == nullptr) {
    print('Failed to create window: ${sdlGetError()}');
    sdlQuit();
    return;
  }
  final renderer = sdlCreateRenderer(window, null);
  if (renderer == nullptr) {
    print('Failed to create renderer: ${sdlGetError()}');
    sdlDestroyWindow(window);
    sdlQuit();
    return;
  }
  renderer.setVSync(1);
  final fps = gfx.FpsManager();
  var running = true;
  while (running) {
    SdlxEvent? event;
    while ((event = sdlxPollEvent()) != null) {
      if (event is SdlxQuitEvent) running = false;
      if (event is SdlxKeyboardEvent && event.type == SdlkEvent.keyDown) {
        if (event.scancode == SdlkScancode.escape) {
          running = false;
        }
      }
    }

    final keys = sdlxGetKeyboardState();
    double moveX = 0;
    if (keys[SdlkScancode.left]) moveX -= gSpeed;
    if (keys[SdlkScancode.right]) moveX += gSpeed;
    if (!gPlayerJumpFlag && keys[SdlkScancode.z]) {
      gPlayerDownSpeed = -gJumpPower;
      gPlayerJumpFlag = true;
    }

    gPlayerDownSpeed += gGravity;
    charMove(moveX, gPlayerDownSpeed);

    sdlSetRenderDrawColor(renderer, 0, 0, 40, 255);
    sdlRenderClear(renderer);

    var cameraX = gScreenWidth / 2 - gPlayerX;
    var cameraY = gScreenHeight / 2 - gPlayerY;
    if (cameraX > 0) cameraX = 0;
    if (cameraX < -(gMapWidth * gChipSize - gScreenWidth)) {
      cameraX = -(gMapWidth * gChipSize - gScreenWidth);
    }
    if (cameraY > 0) cameraY = 0;
    if (cameraY < -(gMapHeight * gChipSize - gScreenHeight)) {
      cameraY = -(gMapHeight * gChipSize - gScreenHeight);
    }
    final drawOffX = cameraX.toInt();
    final drawOffY = cameraY.toInt();
    final playerDrawX = gPlayerX + drawOffX - gCharSize / 2;
    final playerDrawY = gPlayerY + drawOffY - gCharSize / 2;
    final startX = (-cameraX) ~/ gChipSize;
    final drawCount = (gScreenWidth / gChipSize).toInt() + 2;

    sdlSetRenderDrawColor(renderer, 255, 255, 255, 255);
    for (var y = 0; y < gMapHeight; y++) {
      for (var j = 0; j < drawCount; j++) {
        final x = j + startX;
        if (x < 0 || x >= gMapWidth) continue;

        final chip = gMapData[y * gMapWidth + x];
        final xPos = x * gChipSize;
        final yPos = y * gChipSize;

        if ([1, 6, 7].contains(chip)) {
          final rect = SdlxFRect()
            ..x = (xPos + drawOffX)
            ..y = (yPos + drawOffY)
            ..w = gChipSize
            ..h = gChipSize;
          renderer.fillRect(rect);
        } else if (chip >= 2 && chip <= 5) {
          drawTriangle(renderer, xPos, yPos, chip, drawOffX, drawOffY);
        }
      }
    }

    sdlSetRenderDrawColor(renderer, 255, 0, 0, 255);
    final pRect = SdlxFRect()
      ..x = playerDrawX.floorToDouble()
      ..y = playerDrawY.floorToDouble()
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
