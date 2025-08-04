// https://dxlib.xsrv.jp/program/ActionSample.cpp
// 29.アクションサンプルプログラム
// 29.Action sample program

import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

const gTitle = 'DXLIB Tutorial 29';
const gScreenWidth = 640;
const gScreenHeight = 480;
const double gCellSize = 32;

const gMapData = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
  [1, 0, 0, 1, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],

  [1, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 1, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],

  [1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
];

class Player {
  Player(this.size);

  static var gravity = 0.3;
  static var speed = 3.0;
  static var maxSpeed = 5.0;
  static double decline = speed / 5;
  math.Point<double> size;
  var _x = 0.0;
  var _y = 0.0;
  var downSpeed = 0.0;
  var velocityX = 0.0;
  var jumpPower = 9.0;
  var jumpFlag = false;

  void setPosition(double x, double y) {
    _x = x;
    _y = y;
  }

  math.Rectangle<double> getRect() =>
      RectangleEx.fromCenter(math.Point<double>(_x, _y), size);

  void update(Map map) {
    final wall = <int>[1];
    final floors = <int>[2, 3];
    List<int>? mask;
    final keys = sdlGetKeyboardState(nullptr);
    double moveX = 0;
    double moveY = 0;
    if (map.intersection(getRect(), mask: floors) != null) {
      mask = wall;
    } else if (downSpeed < 0) {
      mask = wall;
    }
    if (keys[SdlkScancode.left] != 0) {
      velocityX -= speed;
      velocityX = math.max(velocityX, -(maxSpeed + decline));
    }
    if (keys[SdlkScancode.right] != 0) {
      velocityX += speed;
      velocityX = math.min(velocityX, maxSpeed + decline);
    }
    if (keys[SdlkScancode.z] != 0) {
      if (keys[SdlkScancode.down] != 0) {
        if (map.intersection(
              getRect(),
              move: const math.Point<double>(0, 0.1),
              mask: floors,
            ) !=
            null) {
          mask = wall;
        }
      } else {
        if (!jumpFlag) {
          downSpeed = -jumpPower;
          jumpFlag = true;
        }
      }
    }
    downSpeed += gravity;
    if (velocityX != 0) {
      final signVelocityX = velocityX.sign;
      velocityX += decline * signVelocityX * -1;
      if (signVelocityX != velocityX.sign) {
        velocityX = 0;
      }
    }
    moveY = downSpeed;
    moveX = velocityX;
    if (moveY != 0) {
      final interRect = map.intersection(
        getRect(),
        move: math.Point<double>(0, moveY),
        mask: mask,
      );
      final originY = _y;
      _y += moveY;
      if (interRect != null) {
        _y -= interRect.height * moveY.sign;
        if (moveY < 0) {
          downSpeed *= -1;
        } else {
          downSpeed = 0;
        }
      }
      if (map.intersection(getRect(), mask: mask) != null) {
        _y = originY;
      }
    }
    if (moveX != 0) {
      final interRect = map.intersection(
        getRect(),
        move: math.Point<double>(moveX, 0),
        mask: mask,
      );
      final originX = _x;
      _x += moveX;
      if (interRect != null) {
        _x -= interRect.width * moveX.sign;
        velocityX = 0;
      }
      if (map.intersection(getRect(), mask: mask) != null) {
        _x = originX;
      }
    }
    if (map.intersection(
          getRect(),
          move: const math.Point<double>(0, 0.1),
          mask: mask,
        ) ==
        null) {
      jumpFlag = true;
    } else {
      jumpFlag = false;
      downSpeed = 0;
    }
  }

  void debugDraw(Pointer<SdlRenderer> renderer) {
    final rect = getRect();
    renderer.boxInRgba(rect, 255, 0, 0, 255);
  }
}

class Map {
  Map(this.cellSize);
  double cellSize;
  List<List<int>> _cellData = [];

  int get cellDataWidth => _cellData[0].length;
  int get cellDataHeight => _cellData.length;

  void loadCellData(List<List<int>> cellData) {
    _cellData = [];
    for (var cy = 0; cy < cellData.length; cy++) {
      _cellData.add([...cellData[cy]]);
    }
  }

  void debugDraw(Pointer<SdlRenderer> renderer) {
    for (var cy = 0; cy < cellDataHeight; cy++) {
      for (var cx = 0; cx < cellDataWidth; cx++) {
        final cellId = getCellId(cx, cy);
        final rect = getRectFromCellCootinates(cellId, cx, cy);
        if (rect != null) {
          late int r;
          late int g;
          late int b;
          switch (cellId) {
            case 1:
              r = 255;
              g = 255;
              b = 255;
            default:
              r = 128;
              g = 128;
              b = 128;
          }
          renderer.boxInRgba(rect, r, g, b, 255);
        }
      }
    }
  }

  math.Rectangle<double>? intersection(
    math.Rectangle<double> originRect, {
    math.Point<double> move = const math.Point<double>(0, 0),
    List<int>? mask,
  }) {
    late math.Rectangle<double> afterRect;
    afterRect = originRect.shift(move);
    final cellRects = getRectsFromArea(afterRect, mask: mask);
    for (final cellRect in cellRects) {
      final interRect = afterRect.intersection(cellRect);
      if (interRect != null && interRect.width != 0 && interRect.height != 0) {
        return interRect;
      }
    }
    return null;
  }

  math.Rectangle<double>? getRectFromCellCootinates(
    int cellId,
    int cx,
    int cy,
  ) {
    switch (cellId) {
      case 1:
        return RectangleEx.fromLTWH(
          math.Point<double>(cx * cellSize, cy * cellSize),
          math.Point<double>(cellSize, cellSize),
        );
      case 2:
        return RectangleEx.fromLTWH(
          math.Point<double>(cx * cellSize, cy * cellSize),
          math.Point<double>(cellSize, cellSize * 0.5),
        );
      case 3:
        return RectangleEx.fromLTWH(
          math.Point<double>(cx * cellSize, cy * cellSize + cellSize * 0.5),
          math.Point<double>(cellSize, cellSize * 0.5),
        );
    }
    return null;
  }

  List<math.Rectangle<double>> getRectsFromArea(
    math.Rectangle<double> area, {
    List<int>? mask,
  }) {
    final result = <math.Rectangle<double>>[];
    final tl = getCellCoodinates(area.topLeft.x, area.topLeft.y);
    final br = getCellCoodinates(area.bottomRight.x, area.bottomRight.y);
    for (var cy = tl.y; cy <= br.y; cy++) {
      for (var cx = tl.x; cx <= br.x; cx++) {
        final cellId = getCellId(cx, cy);
        if (mask == null || mask.contains(cellId)) {
          final rect = getRectFromCellCootinates(cellId, cx, cy);
          if (rect != null) {
            result.add(rect);
          }
        }
      }
    }
    return result;
  }

  math.Point<int> getCellCoodinates(double x, double y) {
    final cx = x ~/ cellSize;
    final cy = y ~/ cellSize;
    return math.Point<int>(cx, cy);
  }

  int getCellId(int cx, int cy) {
    if (cx >= cellDataWidth || cx < 0) {
      return 0;
    }
    if (cy >= cellDataHeight || cy < 0) {
      return 0;
    }
    return _cellData[cy][cx];
  }
}

void update(Map map, Player player) {
  player.update(map);
}

void draw(Pointer<SdlRenderer> renderer, Map map, Player player) {
  renderer
    ..setDrawColor(0, 0, 0, 255)
    ..clear();
  map.debugDraw(renderer);
  player.debugDraw(renderer);
  renderer.present();
}

void actMain(Pointer<SdlRenderer> renderer) {
  final map = Map(gCellSize)..loadCellData(gMapData);
  final player = Player(const math.Point<double>(gCellSize - 2, gCellSize - 2))
    ..setPosition(320, 240);
  var running = true;
  final event = calloc<SdlEvent>();
  while (running) {
    while (event.poll()) {
      switch (event.type) {
        case SdlkEvent.quit:
          running = false;
      }
    }
    update(map, player);
    draw(renderer, map, player);
  }
  event.callocFree();
}

int main() {
  if (!sdlInit(SdlkInit.video)) {
    return -1;
  }
  sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
  final window = SdlWindowEx.create(
    title: gTitle,
    w: gScreenWidth,
    h: gScreenHeight,
  );
  if (window == nullptr) {
    sdlQuit();
    return -1;
  }
  final renderer = window.createRenderer();
  if (renderer == nullptr) {
    window.destroy();
    sdlQuit();
    return -1;
  }
  actMain(renderer);
  renderer.destroy();
  window.destroy();
  sdlQuit();
  return 0;
}
