import 'dart:ffi';
import 'dart:math' as math show Point, Rectangle;
import 'package:ffi/ffi.dart';
import '../../generated//const_sdl.dart';
import '../../gfx/primitives.dart' as gfx;
import '../../generated/struct_sdl.dart';
import '../dart/point.dart';

extension SdlRendererFromGfxPointerEx on Pointer<SdlRenderer> {
  // lib_sdl_gfx.dart

  bool pixelColor(
    math.Point<double> p,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.pixelColor(this, p.x, p.y, color, blendMode: blendMode);
  }

  bool pixelRgba(
    math.Point<double> p,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.pixelRgba(this, p.x, p.y, r, g, b, a, blendMode: blendMode);
  }

  bool hlineColor(
    double x1,
    double x2,
    double y,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.hlineColor(this, x1, x2, y, color, blendMode: blendMode);
  }

  bool hlineRgba(
    double x1,
    double x2,
    double y,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.hlineRgba(this, x1, x2, y, r, g, b, a, blendMode: blendMode);
  }

  bool vlineColor(
    double x,
    double y1,
    double y2,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.vlineColor(this, x, y1, y2, color, blendMode: blendMode);
  }

  bool vlineRgba(
    double x,
    double y1,
    double y2,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.vlineRgba(this, x, y1, y2, r, g, b, a, blendMode: blendMode);
  }

  bool rectangleColor(
    math.Rectangle<double> rect,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.rectangleColor(
      this,
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      color,
      blendMode: blendMode,
    );
  }

  bool rectangleRgba(
    math.Rectangle<double> rect,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.rectangleRgba(
      this,
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool roundedRectangleColor(
    math.Rectangle<double> rect,
    double rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.roundedRectangleColor(
      this,
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      rad,
      color,
      blendMode: blendMode,
    );
  }

  bool roundedRectangleRgba(
    math.Rectangle<double> rect,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.roundedRectangleRgba(
      this,
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      rad,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool boxColor(
    math.Rectangle<double> rect,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.boxColor(
      this,
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      color,
      blendMode: blendMode,
    );
  }

  bool boxInColor(
    math.Rectangle<double> rect,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.boxColor(
      this,
      rect.left,
      rect.top,
      rect.right - 1,
      rect.bottom - 1,
      color,
      blendMode: blendMode,
    );
  }

  bool boxRgba(
    math.Rectangle<double> rect,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.boxRgba(
      this,
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool boxInRgba(
    math.Rectangle<double> rect,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.boxRgba(
      this,
      rect.left,
      rect.top,
      rect.right - 1,
      rect.bottom - 1,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool roundedBoxColor(
    math.Rectangle<double> rect,
    double rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.roundedBoxColor(
      this,
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      rad,
      color,
      blendMode: blendMode,
    );
  }

  bool roundedBoxInColor(
    math.Rectangle<double> rect,
    double rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.roundedBoxColor(
      this,
      rect.left,
      rect.top,
      rect.right - 1,
      rect.bottom - 1,
      rad,
      color,
      blendMode: blendMode,
    );
  }

  bool roundedBoxRgba(
    math.Rectangle<double> rect,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.roundedBoxRgba(
      this,
      rect.left,
      rect.top,
      rect.right,
      rect.bottom,
      rad,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool roundedBoxInRgba(
    math.Rectangle<double> rect,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.roundedBoxRgba(
      this,
      rect.left,
      rect.top,
      rect.right - 1,
      rect.bottom - 1,
      rad,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool lineColor(
    math.Point<double> p1,
    math.Point<double> p2,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.lineColor(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      color,
      blendMode: blendMode,
    );
  }

  bool lineRgba(
    math.Point<double> p1,
    math.Point<double> p2,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.lineRgba(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool aaLineColor(
    math.Point<double> p1,
    math.Point<double> p2,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.aalineColor(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      color,
      blendMode: blendMode,
    );
  }

  bool aaLineRgba(
    math.Point<double> p1,
    math.Point<double> p2,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.aalineRgba(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool thickLineColor(
    math.Point<double> p1,
    math.Point<double> p2,
    double width,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.thickLineColor(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      width,
      color,
      blendMode: blendMode,
    );
  }

  bool thickLineRgba(
    math.Point<double> p1,
    math.Point<double> p2,
    double width,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.thickLineRgba(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      width,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool circleColor(
    math.Point<double> p,
    double rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.circleColor(this, p.x, p.y, rad, color, blendMode: blendMode);
  }

  bool circleRgba(
    math.Point<double> p,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.circleRgba(
      this,
      p.x,
      p.y,
      rad,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool arcColor(
    math.Point<double> p,
    double rad,
    double start,
    double end,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.arcColor(
      this,
      p.x,
      p.y,
      rad,
      start,
      end,
      color,
      blendMode: blendMode,
    );
  }

  bool arcRgba(
    math.Point<double> p,
    double rad,
    double start,
    double end,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.arcRgba(
      this,
      p.x,
      p.y,
      rad,
      start,
      end,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool aaCircleColor(
    math.Point<double> p,
    double rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.aacircleColor(this, p.x, p.y, rad, color, blendMode: blendMode);
  }

  bool aaCircleRgba(
    math.Point<double> p,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.aacircleRgba(
      this,
      p.x,
      p.y,
      rad,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool filledCircleColor(
    math.Point<double> p,
    double rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.filledCircleColor(
      this,
      p.x,
      p.y,
      rad,
      color,
      blendMode: blendMode,
    );
  }

  bool filledCircleRgba(
    math.Point<double> p,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.filledCircleRgba(
      this,
      p.x,
      p.y,
      rad,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool ellipseColor(
    math.Point<double> p,
    math.Point<double> rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.ellipseColor(
      this,
      p.x,
      p.y,
      rad.x,
      rad.y,
      color,
      blendMode: blendMode,
    );
  }

  bool ellipseRgba(
    math.Point<double> p,
    math.Point<double> rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.ellipseRgba(
      this,
      p.x,
      p.y,
      rad.x,
      rad.y,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool aaEllipseColor(
    math.Point<double> p,
    math.Point<double> rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.aaellipseColor(
      this,
      p.x,
      p.y,
      rad.x,
      rad.y,
      color,
      blendMode: blendMode,
    );
  }

  bool aaEllipseRgba(
    math.Point<double> p,
    math.Point<double> rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.aaellipseRgba(
      this,
      p.x,
      p.y,
      rad.x,
      rad.y,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool filledEllipseColor(
    math.Point<double> p,
    math.Point<double> rad,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.filledEllipseColor(
      this,
      p.x,
      p.y,
      rad.x,
      rad.y,
      color,
      blendMode: blendMode,
    );
  }

  bool filledEllipseRgba(
    math.Point<double> p,
    math.Point<double> rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.filledEllipseRgba(
      this,
      p.x,
      p.y,
      rad.x,
      rad.y,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool pieColor(
    math.Point<double> p,
    double rad,
    double start,
    double end,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.pieColor(
      this,
      p.x,
      p.y,
      rad,
      start,
      end,
      color,
      blendMode: blendMode,
    );
  }

  bool pieRgba(
    math.Point<double> p,
    double rad,
    double start,
    double end,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.pieRgba(
      this,
      p.x,
      p.y,
      rad,
      start,
      end,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool filledPieColor(
    math.Point<double> p,
    double rad,
    double start,
    double end,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.filledPieColor(
      this,
      p.x,
      p.y,
      rad,
      start,
      end,
      color,
      blendMode: blendMode,
    );
  }

  bool filledPieRgba(
    math.Point<double> p,
    double rad,
    double start,
    double end,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.filledPieRgba(
      this,
      p.x,
      p.y,
      rad,
      start,
      end,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool trigonColor(
    math.Point<double> p1,
    math.Point<double> p2,
    math.Point<double> p3,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.trigonColor(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      p3.x,
      p3.y,
      color,
      blendMode: blendMode,
    );
  }

  bool trigonRgba(
    math.Point<double> p1,
    math.Point<double> p2,
    math.Point<double> p3,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.trigonRgba(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      p3.x,
      p3.y,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool aaTrigonColor(
    math.Point<double> p1,
    math.Point<double> p2,
    math.Point<double> p3,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.aatrigonColor(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      p3.x,
      p3.y,
      color,
      blendMode: blendMode,
    );
  }

  bool aaTrigonRgba(
    math.Point<double> p1,
    math.Point<double> p2,
    math.Point<double> p3,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.aatrigonRgba(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      p3.x,
      p3.y,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool filledTrigonColor(
    math.Point<double> p1,
    math.Point<double> p2,
    math.Point<double> p3,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.filledTrigonColor(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      p3.x,
      p3.y,
      color,
      blendMode: blendMode,
    );
  }

  bool filledTrigonRgba(
    math.Point<double> p1,
    math.Point<double> p2,
    math.Point<double> p3,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    return gfx.filledTrigonRgba(
      this,
      p1.x,
      p1.y,
      p2.x,
      p2.y,
      p3.x,
      p3.y,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
  }

  bool polygonColor(
    List<math.Point<double>> ps,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.polygonColor(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      color,
      blendMode: blendMode,
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool polygonRgba(
    List<math.Point<double>> ps,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.polygonRgba(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool aaPolygonColor(
    List<math.Point<double>> ps,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.aapolygonColor(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      color,
      blendMode: blendMode,
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool aaPolygonRgba(
    List<math.Point<double>> ps,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.aapolygonRgba(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool filledPolygonColor(
    List<math.Point<double>> ps,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.filledPolygonColor(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      color,
      blendMode: blendMode,
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool filledPolygonRgba(
    List<math.Point<double>> ps,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.filledPolygonRgba(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool texturedPolygon(
    List<math.Point<double>> ps,
    Pointer<SdlSurface> texture,
    math.Point<double> texturePos,
  ) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.texturedPolygon(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      texture,
      texturePos.x.toInt(),
      texturePos.y.toInt(),
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool bezierColor(
    List<math.Point<double>> ps,
    int s,
    int color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.bezierColor(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      s,
      color,
      blendMode: blendMode,
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool bezierRgba(
    List<math.Point<double>> ps,
    int s,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    var result = gfx.bezierRgba(
      this,
      xsPointer,
      ysPointer,
      ps.length,
      s,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  bool characterColor(math.Point<double> p, int c, int color) {
    return gfx.characterColor(this, p.x, p.y, c, color);
  }

  bool characterRgba(math.Point<double> p, int c, int r, int g, int b, int a) {
    return gfx.characterRgba(this, p.x, p.y, c, r, g, b, a);
  }

  bool stringColor(math.Point<double> p, String s, int color) {
    return gfx.stringColor(this, p.x, p.y, s, color);
  }

  bool stringRgba(math.Point<double> p, String s, int r, int g, int b, int a) {
    return gfx.stringRgba(this, p.x, p.y, s, r, g, b, a);
  }

  bool stringAnchorRgba(
    math.Point<double> p,
    String s,
    math.Point<double> anchorPoint,
    int r,
    int g,
    int b,
    int a, {
    int? charRotation,
  }) {
    bool result = true;
    double curx = p.x;
    double cury = p.y;
    double stringWidth = s.length * gfx.charWidthLocal.toDouble();
    double stringHeight = gfx.charHeightLocal.toDouble();
    double calcx = 0;
    double calcy = 0;
    charRotation ??= gfx.charRotation;
    switch (charRotation) {
      case 0:
        calcx = -stringWidth * anchorPoint.x;
        calcy = -stringHeight * anchorPoint.y;
        break;
      case 2:
        calcx = stringWidth * anchorPoint.x;
        calcy = -stringHeight * anchorPoint.y;
        break;
      case 1:
        calcx = -stringHeight * anchorPoint.y;
        calcy = -stringWidth * anchorPoint.x;
        break;
      case 3:
        calcx = -stringHeight * anchorPoint.y;
        calcy = stringWidth * anchorPoint.x;
        break;
    }
    for (var i = 0; i < s.length; i++) {
      var curchar = s[i];
      if (result) {
        result = gfx.characterRgba(
          this,
          curx + calcx,
          cury + calcy,
          curchar.codeUnitAt(0),
          r,
          g,
          b,
          a,
        );
      }
      switch (charRotation) {
        case 0:
          curx += gfx.charWidthLocal;
          break;
        case 2:
          curx -= gfx.charWidthLocal;
          break;
        case 1:
          cury += gfx.charHeightLocal;
          break;
        case 3:
          cury -= gfx.charHeightLocal;
          break;
      }
    }
    return result;
  }
}
