import 'dart:ffi';
import 'dart:math' as math;

import 'package:ffi/ffi.dart';
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
      Polygon.fromLTWH(
        const math.Point<double>(0, 0),
        const math.Point<double>(32, 64),
      )..shift(const math.Point<double>(320 - 64, 240 - 64)),
    )
    ..add(
      Polygon([
        const math.Point<double>(64 + 18, 0 + 18),
        const math.Point<double>(64 + 18, 64 + 18),
        const math.Point<double>(0 + 18, 64 + 18),
      ])..shift(const math.Point<double>(320 - 64, 240 - 64)),
    )
    ..add(
      Polygon.fromLTWH(
        const math.Point<double>(0, 0),
        const math.Point<double>(64, 64),
      )..shift(const math.Point<double>(320 + 16, 240 + 16)),
    );
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
    case SdlkEvent.mouseButtonDown:
      if (event.button.ref.button == SdlkButton.left) {
        final mouse = Polygon.fromCenter(
          math.Point<double>(event.button.ref.x, event.button.ref.y),
          const math.Point<double>(1, 1),
        );
        for (var i = gPolygons.length - 1; i >= 0; i--) {
          final polygon = gPolygons[i];
          if (mouse.isCollide(polygon)) {
            gHoldPolygon = polygon;
            break;
          }
        }
      }
    case SdlkEvent.mouseButtonUp:
      if (event.button.ref.button == SdlkButton.left) {
        gHoldPolygon = null;
      }
    case SdlkEvent.mouseMotion:
      if (gHoldPolygon != null) {
        gHoldPolygon!.shift(
          math.Point<double>(event.motion.ref.xrel, event.motion.ref.yrel),
        );
      }
  }
  return false;
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
  const i1 = math.Point<double>(0, 480 / 4);
  const i2 = math.Point<double>(640, 480 / 4 * 3);
  gRenderer
    ..setDrawColor(0, 0, 0, 255)
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
