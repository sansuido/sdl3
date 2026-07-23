import 'dart:ffi';
import 'dart:math' as math;
import 'package:sdl3/sdl3.dart';

class Polygon {
  Polygon(this.points);

  List<SdlxFPoint> points = [];

  void shift(SdlxFPoint shift) {
    for (var i = 0; i < points.length; i++) {
      points[i] = points[i] + shift;
    }
  }

  static Polygon fromCenter(SdlxFPoint center, SdlxFPoint size) => Polygon([
    center + SdlxFPoint(-size.x * 0.5, -size.y * 0.5),
    center + SdlxFPoint(size.x * 0.5, -size.y * 0.5),
    center + SdlxFPoint(size.x * 0.5, size.y * 0.5),
    center + SdlxFPoint(-size.x * 0.5, size.y * 0.5),
  ]);

  static Polygon fromLTWH(SdlxFPoint topLeft, SdlxFPoint size) => Polygon([
    topLeft,
    topLeft + SdlxFPoint(size.x, 0),
    topLeft + size,
    topLeft + SdlxFPoint(0, size.y),
  ]);

  SdlxFPoint? calculateCentroid() {
    if (points.length < 3) {
      switch (points.length) {
        case 2:
          return SdlxFPoint(
            (points[0].x + points[1].x) / 2,
            (points[0].y + points[1].y) / 2,
          );
        case 1:
          return points[0];
        default:
          return null;
      }
    }
    var area = 0.0;
    var sumCx = 0.0;
    var sumCy = 0.0;
    for (var i = 0; i < points.length; i++) {
      final j = (i + 1) % points.length;
      final crossProduct =
          (points[i].x * points[j].y) - (points[j].x * points[i].y);
      area += crossProduct;
      sumCx += (points[i].x + points[j].x) * crossProduct;
      sumCy += (points[i].y + points[j].y) * crossProduct;
    }
    area /= 2.0;
    if (area.abs() < 1e-9) {
      return null;
    }
    return SdlxFPoint(sumCx / (6.0 * area), sumCy / (6.0 * area));
  }

  void rotateAroundCenter(SdlxFPoint center, double angleRadians) {
    SdlxFPoint rotatePointAroundCenter(
      SdlxFPoint point,
      SdlxFPoint center,
      double angleRadians,
    ) {
      final translatedX = point.x - center.x;
      final translatedY = point.y - center.y;
      final rotatedX =
          translatedX * math.cos(angleRadians) -
          translatedY * math.sin(angleRadians);
      final rotatedY =
          translatedX * math.sin(angleRadians) +
          translatedY * math.cos(angleRadians);
      return SdlxFPoint(rotatedX + center.x, rotatedY + center.y);
    }

    for (var i = 0; i < points.length; i++) {
      points[i] = rotatePointAroundCenter(points[i], center, angleRadians);
    }
  }

  List<SdlxFPoint>? intersectLine(SdlxFPoint a, SdlxFPoint b) {
    double cross(SdlxFPoint a, SdlxFPoint b) => a.x * b.y - a.y * b.x;

    double calculateDistance(SdlxFPoint p1, SdlxFPoint p2) {
      final dx = p1.x - p2.x;
      final dy = p1.y - p2.y;
      return math.sqrt(dx * dx + dy * dy);
    }

    SdlxFPoint? intersection(
      SdlxFPoint a,
      SdlxFPoint b,
      SdlxFPoint c,
      SdlxFPoint d,
    ) {
      final deno = cross(b - a, d - c);
      if (deno == 0.0) {
        return null;
      }
      final s = cross(c - a, d - c) / deno;
      final t = cross(b - a, a - c) / deno;
      if (s < 0.0 || 1.0 < s || t < 0.0 || 1.0 < t) {
        return null;
      }
      return SdlxFPoint(a.x + s * (b - a).x, a.y + s * (b - a).y);
    }

    List<SdlxFPoint>? result;
    double? resultDistance;
    for (var i = 0; i < points.length; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % points.length];
      final c = intersection(a, b, p1, p2);
      if (c != null) {
        final distance = calculateDistance(a, c);
        if (result == null || distance < resultDistance!) {
          result = [p1, p2];
          resultDistance = distance;
        }
      }
    }
    return result;
  }

  bool isCollide(Polygon other) {
    SdlxFPoint edgeVector(SdlxFPoint a, SdlxFPoint b) =>
        SdlxFPoint(b.x - a.x, b.y - a.y);

    SdlxFPoint normalVector(SdlxFPoint edge) => SdlxFPoint(-edge.y, edge.x);

    bool isSeparated(Polygon other, SdlxFPoint axis) {
      double dot(SdlxFPoint a, SdlxFPoint b) => a.x * b.x + a.y * b.y;
      var min1 = double.infinity;
      var max1 = -min1;
      var min2 = min1;
      var max2 = -min1;
      for (final p in points) {
        final porjection = dot(p, axis);
        min1 = math.min(min1, porjection);
        max1 = math.max(max1, porjection);
      }
      for (final p in other.points) {
        final projection = dot(p, axis);
        min2 = math.min(min2, projection);
        max2 = math.max(max2, projection);
      }
      return max1 < min2 || max2 < min1;
    }

    for (var i = 0; i < other.points.length; i++) {
      final edge = edgeVector(
        other.points[i],
        other.points[(i + 1) % other.points.length],
      );
      final axis = normalVector(edge);
      if (isSeparated(other, axis)) {
        return false;
      }
    }
    for (var i = 0; i < points.length; i++) {
      final edge = edgeVector(points[i], points[(i + 1) % points.length]);
      final axis = normalVector(edge);
      if (isSeparated(other, axis)) {
        return false;
      }
    }
    return true;
  }
}

Pointer<SdlWindow> gWindow = nullptr;
Pointer<SdlRenderer> gRenderer = nullptr;
List<Polygon> gPolygons = [];
Polygon? gHoldPolygon;

bool appInit() {
  if (!sdlInit(SdlkInit.video)) {
    return false;
  }
  gWindow = SdlWindowEx.create(title: 'polygon2d rotate', w: 640, h: 480);
  if (gWindow == nullptr) {
    return false;
  }
  gRenderer = gWindow.createRenderer();
  if (gRenderer == nullptr) {
    return false;
  }
  gPolygons = [];
  gPolygons
    ..add(
      Polygon.fromLTWH(SdlxFPoint(0, 0), SdlxFPoint(32, 64))
        ..shift(SdlxFPoint(320 - 64, 240 - 64)),
    )
    ..add(
      Polygon([
        SdlxFPoint(64 + 18, 0 + 18),
        SdlxFPoint(64 + 18, 64 + 18),
        SdlxFPoint(0 + 18, 64 + 18),
      ])..shift(SdlxFPoint(320 - 64, 240 - 64)),
    )
    ..add(
      Polygon.fromLTWH(SdlxFPoint(0, 0), SdlxFPoint(64, 64))
        ..shift(SdlxFPoint(320 + 16, 240 + 16)),
    );
  return true;
}

void appQuit() {
  gRenderer.destroy();
  gWindow.destroy();
  sdlQuit();
}

bool appEvent() {
  var running = true;
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
    if (event is SdlxMouseButtonEvent) {
      if (event.button == SdlkButton.left) {
        switch (event.type) {
          case SdlkEvent.mouseButtonDown:
            final mouse = Polygon.fromCenter(
              SdlxFPoint(event.x, event.y),
              SdlxFPoint(1, 1),
            );
            for (var i = gPolygons.length - 1; i >= 0; i--) {
              final polygon = gPolygons[i];
              if (mouse.isCollide(polygon)) {
                gHoldPolygon = polygon;
                break;
              }
            }
          case SdlkEvent.mouseButtonUp:
            gHoldPolygon = null;
        }
      }
    }
    if (event is SdlxMouseMotionEvent) {
      if (gHoldPolygon != null) {
        gHoldPolygon!.shift(SdlxFPoint(event.xrel, event.yrel));
      }
    }
  }
  return running;
}

bool appIterate() {
  for (final polygon in gPolygons) {
    if (polygon != gHoldPolygon) {
      final center = polygon.calculateCentroid();
      if (center != null) {
        polygon.rotateAroundCenter(center, 0.01);
      }
    }
  }
  final i1 = SdlxFPoint(0, 480 / 4);
  final i2 = SdlxFPoint(640, 480 / 4 * 3);
  gRenderer
    ..setDrawColor(SdlxColor(0, 0, 0))
    ..clear();
  for (final polygon in gPolygons) {
    if (polygon == gHoldPolygon) {
      gRenderer.filledPolygonRgba(polygon.points, 0, 255, 0, 192);
    } else {
      var collide = false;
      for (final other in gPolygons) {
        if (other == polygon) {
          continue;
        }
        collide = polygon.isCollide(other);
        if (collide) {
          break;
        }
      }
      if (collide) {
        gRenderer.filledPolygonRgba(polygon.points, 192, 192, 192, 255);
      }
      gRenderer.polygonRgba(polygon.points, 255, 255, 255, 255);
      final lines = polygon.intersectLine(i1, i2);
      if (lines != null) {
        gRenderer.lineRgba(lines[0], lines[1], 0, 0, 255, 255);
      }
    }
    final center = polygon.calculateCentroid();
    if (center != null) {
      gRenderer.circleRgba(center, 4, 255, 0, 0, 255);
    }
  }
  gRenderer
    ..lineRgba(i1, i2, 255, 255, 0, 255)
    ..present();
  return true;
}

void main() async {
  if (appInit()) {
    var running = true;
    while (running) {
      running = appEvent();
      if (!running) {
        break;
      }
      if (running) {
        running = appIterate();
      }
      await Future.delayed(const Duration(milliseconds: 16));
    }
  }
  appQuit();
}
