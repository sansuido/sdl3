import 'dart:ffi';
import 'package:sdl3/sdl3.dart';
import 'polygon2d.dart';

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
