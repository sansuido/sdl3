import 'dart:ffi';
import 'dart:math' as math;

import 'package:sdl3/sdl3.dart';

void renderDottedLineGeometry(
  Pointer<SdlRenderer> renderer,
  double x1,
  double y1,
  double x2,
  double y2, {
  required SdlxFColor color,
  double dashLen = 1.0,
  double gapLen = 1.0,
  double thickness = 1.0,
  bool useGlobalSync = false,
  bool autoFitCorners = false,
}) {
  final dx = x2 - x1;
  final dy = y2 - y1;
  final totalDist = math.sqrt(dx * dx + dy * dy);
  if (totalDist == 0) return;

  var actualDashLen = dashLen;
  var actualGapLen = gapLen;
  var startOffset = 0.0;

  final period = dashLen + gapLen;

  if (useGlobalSync) {
    final globalPos = (dy == 0)
        ? x1
        : (dx == 0)
        ? y1
        : math.sqrt(x1 * x1 + y1 * y1);

    startOffset = (period - (globalPos % period)) % period;
  } else if (autoFitCorners) {
    var numSegments = ((totalDist - dashLen) / period).round();
    if (numSegments < 1) numSegments = 1;

    final actualPeriod = (totalDist - dashLen) / numSegments;
    final scale = actualPeriod / period;

    actualDashLen = dashLen * scale;
    actualGapLen = actualPeriod - actualDashLen;
  }

  final ux = dx / totalDist;
  final uy = dy / totalDist;

  final nx = -uy * (thickness * 0.5);
  final ny = ux * (thickness * 0.5);

  final vertices = <SdlxVertex>[];

  var currentDist = startOffset;

  while (currentDist < totalDist) {
    var nextDist = currentDist + actualDashLen;
    if (nextDist > totalDist) nextDist = totalDist;

    final sx = x1 + ux * currentDist;
    final sy = y1 + uy * currentDist;
    final ex = x1 + ux * nextDist;
    final ey = y1 + uy * nextDist;

    final p0 = SdlxFPoint(sx + nx, sy + ny);
    final p1 = SdlxFPoint(ex + nx, ey + ny);
    final p2 = SdlxFPoint(ex - nx, ey - ny);
    final p3 = SdlxFPoint(sx - nx, sy - ny);

    vertices.addAll([
      SdlxVertex(position: p0, color: color),
      SdlxVertex(position: p1, color: color),
      SdlxVertex(position: p2, color: color),
      SdlxVertex(position: p0, color: color),
      SdlxVertex(position: p2, color: color),
      SdlxVertex(position: p3, color: color),
    ]);

    currentDist = nextDist + actualGapLen;
  }

  if (vertices.isNotEmpty) {
    sdlxRenderGeometry(renderer, vertices);
  }
}

void renderDottedRectGeometry(
  Pointer<SdlRenderer> renderer,
  double x,
  double y,
  double width,
  double height, {
  required SdlxFColor color,
  double dashLen = 1.0,
  double gapLen = 1.0,
  double thickness = 1.0,
  bool useGlobalSync = true,
  bool autoFitCorners = false,
}) {
  final x2 = x + width;
  final y2 = y + height;

  renderDottedLineGeometry(
    renderer,
    x,
    y,
    x2,
    y,
    color: color,
    dashLen: dashLen,
    gapLen: gapLen,
    thickness: thickness,
    useGlobalSync: useGlobalSync,
    autoFitCorners: autoFitCorners,
  );
  renderDottedLineGeometry(
    renderer,
    x2,
    y,
    x2,
    y2,
    color: color,
    dashLen: dashLen,
    gapLen: gapLen,
    thickness: thickness,
    useGlobalSync: useGlobalSync,
    autoFitCorners: autoFitCorners,
  );
  renderDottedLineGeometry(
    renderer,
    x2,
    y2,
    x,
    y2,
    color: color,
    dashLen: dashLen,
    gapLen: gapLen,
    thickness: thickness,
    useGlobalSync: useGlobalSync,
    autoFitCorners: autoFitCorners,
  );
  renderDottedLineGeometry(
    renderer,
    x,
    y2,
    x,
    y,
    color: color,
    dashLen: dashLen,
    gapLen: gapLen,
    thickness: thickness,
    useGlobalSync: useGlobalSync,
    autoFitCorners: autoFitCorners,
  );
}

int main() {
  if (sdlInit(SDL_INIT_VIDEO)) {
    sdlSetHint(SDL_HINT_RENDER_VSYNC, '1');
    final rec = sdlxCreateWindowAndRenderer(
      'Global Dotted Sync Test',
      640,
      480,
      0,
    );
    if (rec != null) {
      final window = rec.window;
      final renderer = rec.renderer;
      var running = true;
      var angle = 0.0;

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

        angle += 0.03;
        final moveX = math.sin(angle) * 60.0;
        final moveY = math.cos(angle) * 40.0;

        sdlSetRenderDrawColor(renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
        sdlRenderClear(renderer);

        renderDottedRectGeometry(
          renderer,
          100.0 + moveX,
          120.0 + moveY,
          200,
          120,
          color: const SdlxFColor(0.4, 1, 0.4),
          dashLen: 8,
          gapLen: 8,
          thickness: 2,
        );

        renderDottedRectGeometry(
          renderer,
          340.0 + moveX,
          120.0 + moveY,
          200,
          120,
          color: const SdlxFColor(1, 0.4, 0.4),
          dashLen: 8,
          gapLen: 8,
          thickness: 2,
          useGlobalSync: false,
        );

        sdlRenderPresent(renderer);
      }
      sdlDestroyRenderer(renderer);
      sdlDestroyWindow(window);
    }
    sdlQuit();
  }
  return 0;
}
