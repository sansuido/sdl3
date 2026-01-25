import 'dart:ffi';
import 'dart:math' as math;

import 'package:ffi/ffi.dart';
import 'package:sdl3/sdl3.dart';

import 'polygon2d.dart';

Pointer<SdlWindow> gWindow = nullptr;
Pointer<SdlRenderer> gRenderer = nullptr;
const double gCellSize = 32;
late Map gMap;
late Player gPlayer;

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

class Object {
  Object({this.polygon, this.type = 0});

  int type;
  Polygon? polygon;

  void debugDraw(Pointer<SdlRenderer> renderer) {}

  math.Rectangle<double>? getBoundingBox() {
    double? left;
    double? right;
    double? top;
    double? bottom;
    if (polygon != null && polygon!.points.isNotEmpty) {
      for (final point in polygon!.points) {
        if (left == null || point.x < left) {
          left = point.x;
        }
        if (right == null || point.x > right) {
          right = point.x;
        }
        if (top == null || point.y < top) {
          top = point.y;
        }
        if (bottom == null || point.y > bottom) {
          bottom = point.y;
        }
      }
      return math.Rectangle.fromPoints(
        math.Point<double>(left!, top!),
        math.Point<double>(right!, bottom!),
      );
    }
    return null;
  }
}

class Wall extends Object {
  Wall({super.polygon}) {
    type = 1;
  }

  @override
  void debugDraw(Pointer<SdlRenderer> renderer) {
    super.debugDraw(renderer);
    if (polygon != null) {
      gRenderer.filledPolygonRgba(polygon!.points, 255, 255, 255, 255);
    }
  }
}

class Player extends Object {
  Player(this.size);

  //  static var gravity = 0.3;
  static var speed = 3.0;
  //  static var maxSpeed = 5.0;
  //  static double decline = speed / 5;
  math.Point<double> size;
  var _x = 0.0;
  var _y = 0.0;
  //  var downSpeed = 0.0;
  //  var velocityX = 0.0;
  //  var jumpPower = 9.0;
  //  var jumpFlag = false;

  void setPosition(double x, double y) {
    _x = x;
    _y = y;
    polygon = Polygon.fromCenter(math.Point<double>(_x, y), size);
  }

  //  math.Rectangle<double> getRect() =>
  //      RectangleEx.fromCenter(math.Point<double>(_x, _y), size);

  void update(Map map) {
    var velocityX = 0.0;
    var velocityY = 0.0;
    final keys = sdlGetKeyboardState(nullptr);
    if (keys[SdlkScancode.left] != 0) {
      velocityX -= speed;
    }
    if (keys[SdlkScancode.right] != 0) {
      velocityX += speed;
    }
    if (keys[SdlkScancode.up] != 0) {
      velocityY -= speed;
    }
    if (keys[SdlkScancode.down] != 0) {
      velocityY += speed;
    }
    setPosition(_x + velocityX, _y + velocityY);
  }

  //  void update(Map map) {
  //    final wall = <int>[1];
  //    final floors = <int>[2, 3];
  //    List<int>? mask;
  //    final keys = sdlGetKeyboardState(nullptr);
  //    double moveX = 0;
  //    double moveY = 0;
  //    if (map.intersection(getRect(), mask: floors) != null) {
  //      mask = wall;
  //    } else if (downSpeed < 0) {
  //      mask = wall;
  //    }
  //    if (keys[SdlkScancode.left] != 0) {
  //      velocityX -= speed;
  //      velocityX = math.max(velocityX, -(maxSpeed + decline));
  //    }
  //    if (keys[SdlkScancode.right] != 0) {
  //      velocityX += speed;
  //      velocityX = math.min(velocityX, maxSpeed + decline);
  //    }
  //    if (keys[SdlkScancode.z] != 0) {
  //      if (keys[SdlkScancode.down] != 0) {
  //        if (map.intersection(
  //              getRect(),
  //              move: const math.Point<double>(0, 0.1),
  //              mask: floors,
  //            ) !=
  //            null) {
  //          mask = wall;
  //        }
  //      } else {
  //        if (!jumpFlag) {
  //          downSpeed = -jumpPower;
  //          jumpFlag = true;
  //        }
  //      }
  //    }
  //    downSpeed += gravity;
  //    if (velocityX != 0) {
  //      final signVelocityX = velocityX.sign;
  //      velocityX += decline * signVelocityX * -1;
  //      if (signVelocityX != velocityX.sign) {
  //        velocityX = 0;
  //      }
  //    }
  //    moveY = downSpeed;
  //    moveX = velocityX;
  //    if (moveY != 0) {
  //      final interRect = map.intersection(
  //        getRect(),
  //        move: math.Point<double>(0, moveY),
  //        mask: mask,
  //      );
  //      final originY = _y;
  //      _y += moveY;
  //      if (interRect != null) {
  //        _y -= interRect.height * moveY.sign;
  //        if (moveY < 0) {
  //          downSpeed *= -1;
  //        } else {
  //          downSpeed = 0;
  //        }
  //      }
  //      if (map.intersection(getRect(), mask: mask) != null) {
  //        _y = originY;
  //      }
  //    }
  //    if (moveX != 0) {
  //      final interRect = map.intersection(
  //        getRect(),
  //        move: math.Point<double>(moveX, 0),
  //        mask: mask,
  //      );
  //      final originX = _x;
  //      _x += moveX;
  //      if (interRect != null) {
  //        _x -= interRect.width * moveX.sign;
  //        velocityX = 0;
  //      }
  //      if (map.intersection(getRect(), mask: mask) != null) {
  //        _x = originX;
  //      }
  //    }
  //    if (map.intersection(
  //          getRect(),
  //          move: const math.Point<double>(0, 0.1),
  //          mask: mask,
  //        ) ==
  //        null) {
  //      jumpFlag = true;
  //    } else {
  //      jumpFlag = false;
  //      downSpeed = 0;
  //    }
  //  }

  @override
  void debugDraw(Pointer<SdlRenderer> renderer) {
    //final rect = getRect();
    //renderer.boxInRgba(rect, 255, 0, 0, 255);
    if (polygon != null) {
      renderer.filledPolygonRgba(polygon!.points, 255, 0, 0, 255);
    }
  }
}

class Map {
  Map(this.cellSize);

  double cellSize;
  List<List<int>> _cellData = [];
  List<Object> objects = [];

  int get cellDataWidth => _cellData[0].length;
  int get cellDataHeight => _cellData.length;

  void loadCellData(List<List<int>> cellData) {
    _cellData = [];
    for (var cy = 0; cy < cellData.length; cy++) {
      _cellData.add([...cellData[cy]]);
    }
    objects = [];
    for (var h = 0; h < cellDataHeight; h++) {
      for (var w = 0; w < cellDataWidth; w++) {
        if (_cellData[h][w] == 1) {
          objects.add(
            Wall(
              polygon: Polygon.fromLTWH(
                math.Point<double>(w * cellSize, h * cellSize),
                math.Point<double>(cellSize, cellSize),
              ),
            ),
          );
        }
      }
    }
  }

  //  math.Rectangle<double>? intersection(
  //    math.Rectangle<double> originRect, {
  //    math.Point<double> move = const math.Point<double>(0, 0),
  //    List<int>? mask,
  //  }) {
  //    //late math.Rectangle<double> afterRect;
  //    //afterRect = originRect.shift(move);
  //    //final cellRects = getRectsFromArea(afterRect, mask: mask);
  //    //for (final cellRect in cellRects) {
  //    //  final interRect = afterRect.intersection(cellRect);
  //    //  if (interRect != null && interRect.width != 0 && interRect.height != 0) {
  //    //    return interRect;
  //    //  }
  //    //}
  //    return null;
  //  }

  void debugDraw(Pointer<SdlRenderer> renderer) {
    for (final object in objects) {
      object.debugDraw(gRenderer);
    }
  }
}

bool appInit() {
  if (!sdlInit(SdlkInit.video)) {
    return false;
  }
  gWindow = SdlWindowEx.create(title: 'polygon2d action', w: 640, h: 480);
  if (gWindow == nullptr) {
    return false;
  }
  gRenderer = gWindow.createRenderer();
  if (gRenderer == nullptr) {
    return false;
  }
  gMap = Map(gCellSize);
  gMap.loadCellData(gMapData);
  gPlayer = Player(const math.Point<double>(gCellSize - 2, gCellSize - 2))
    ..setPosition(320, 240);

  return true;
}

void appQuit() {
  gRenderer.destroy();
  gWindow.destroy();
  sdlQuit();
}

bool appEvent(Pointer<SdlEvent> event) {
  switch (event.type) {
    case SdlkEvent.quit:
      return true;
  }
  return false;
}

bool appIterate() {
  gPlayer.update(gMap);
  gRenderer
    ..setDrawColor(0, 0, 0, 255)
    ..clear();
  gMap.debugDraw(gRenderer);
  gPlayer.debugDraw(gRenderer);
  gRenderer.present();
  return false;
}

void main() async {
  if (appInit()) {
    var quit = false;
    final event = calloc<SdlEvent>();
    while (!quit) {
      while (event.poll()) {
        quit = appEvent(event);
        if (quit) {
          break;
        }
      }
      if (!quit) {
        quit = appIterate();
      }
      await Future.delayed(const Duration(milliseconds: 16));
    }
    event.callocFree();
  }
  appQuit();
}
