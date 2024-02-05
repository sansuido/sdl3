import 'dart:ffi';
import 'dart:math' as math show Point, Rectangle;
import 'package:ffi/ffi.dart';
import '../../generated/const_sdl.dart';
import '../../gfx/primitives.dart' as gfx;
import '../../generated/struct_sdl.dart';
import '../../generated/lib_sdl_image.dart';
import '../../generated/lib_sdl_render.dart';
import '../dart/rectangle.dart';
import '../dart/point.dart';
import 'sdl_rect.dart';

extension SdlRendererPointerEx on Pointer<SdlRenderer> {
  // lib_sdl_gfx.dart

  // 65
  int pixelColor(math.Point<double> p, int color) {
    return gfx.pixelColor(this, p.x, p.y, color);
  }

  int pixelRgba(math.Point<double> p, int r, int g, int b, int a) {
    // 77
    return gfx.pixelRgba(this, p.x, p.y, r, g, b, a);
  }

  int hlineColor(double x1, double x2, double y, int color) {
    // 91
    return gfx.hlineColor(this, x1, x2, y, color);
  }

  int hlineRgba(double x1, double x2, double y, int r, int g, int b, int a) {
    // 104
    return gfx.hlineRgba(this, x1, x2, y, r, g, b, a);
  }

  int vlineColor(double x, double y1, double y2, int color) {
    // 118
    return gfx.vlineColor(this, x, y1, y2, color);
  }

  int vlineRgba(double x, double y1, double y2, int r, int g, int b, int a) {
    // 131
    return gfx.vlineRgba(this, x, y1, y2, r, g, b, a);
  }

  int rectangleColor(math.Rectangle<double> rect, int color) {
    // 145
    return gfx.rectangleColor(
        this, rect.left, rect.top, rect.right, rect.bottom, color);
  }

  int rectangleRgba(math.Rectangle<double> rect, int r, int g, int b, int a) {
    // 158
    return gfx.rectangleRgba(
        this, rect.left, rect.top, rect.right, rect.bottom, r, g, b, a);
  }

  int roundedRectangleColor(
      math.Rectangle<double> rect, double rad, int color) {
    // 172
    return gfx.roundedRectangleColor(
        this, rect.left, rect.top, rect.right, rect.bottom, rad, color);
  }

  int roundedRectangleRgba(
      math.Rectangle<double> rect, double rad, int r, int g, int b, int a) {
    // 186
    return gfx.roundedRectangleRgba(
        this, rect.left, rect.top, rect.right, rect.bottom, rad, r, g, b, a);
  }

  int boxColor(math.Rectangle<double> rect, int color) {
    // 201
    return gfx.boxColor(
        this, rect.left, rect.top, rect.right, rect.bottom, color);
  }

  int boxRgba(math.Rectangle<double> rect, int r, int g, int b, int a) {
    // 214
    return gfx.boxRgba(
        this, rect.left, rect.top, rect.right, rect.bottom, r, g, b, a);
  }

  int roundedBoxColor(math.Rectangle<double> rect, double rad, int color) {
    // 228
    return gfx.roundedBoxColor(
        this, rect.left, rect.top, rect.right, rect.bottom, rad, color);
  }

  int roundedBoxRgba(
      math.Rectangle<double> rect, double rad, int r, int g, int b, int a) {
    // 241
    return gfx.roundedBoxRgba(
        this, rect.left, rect.top, rect.right, rect.bottom, rad, r, g, b, a);
  }

  int lineColor(math.Point<double> p1, math.Point<double> p2, int color) {
    // 256
    return gfx.lineColor(this, p1.x, p1.y, p2.x, p2.y, color);
  }

  int lineRgba(math.Point<double> p1, math.Point<double> p2, int r, int g,
      int b, int a) {
    // 269
    return gfx.lineRgba(this, p1.x, p1.y, p2.x, p2.y, r, g, b, a);
  }

  int aaLineColor(math.Point<double> p1, math.Point<double> p2, int color) {
    // 283
    return gfx.aalineColor(this, p1.x, p1.y, p2.x, p2.y, color);
  }

  int aaLineRgba(math.Point<double> p1, math.Point<double> p2, int r, int g,
      int b, int a) {
    // 296
    return gfx.aalineRgba(this, p1.x, p1.y, p2.x, p2.y, r, g, b, a);
  }

  int thickLineColor(
      math.Point<double> p1, math.Point<double> p2, double width, int color) {
    // 310
    return gfx.thickLineColor(this, p1.x, p1.y, p2.x, p2.y, width, color);
  }

  int thickLineRgba(math.Point<double> p1, math.Point<double> p2, double width,
      int r, int g, int b, int a) {
    // 323
    return gfx.thickLineRgba(this, p1.x, p1.y, p2.x, p2.y, width, r, g, b, a);
  }

  int circleColor(math.Point<double> p, double rad, int color) {
    // 338
    return gfx.circleColor(this, p.x, p.y, rad, color);
  }

  int circleRgba(math.Point<double> p, double rad, int r, int g, int b, int a) {
    // 351
    return gfx.circleRgba(this, p.x, p.y, rad, r, g, b, a);
  }

  int arcColor(
      math.Point<double> p, double rad, double start, double end, int color) {
    // 338
    return gfx.arcColor(this, p.x, p.y, rad, start, end, color);
  }

  int arcRgba(math.Point<double> p, double rad, double start, double end, int r,
      int g, int b, int a) {
    // 378
    return gfx.arcRgba(this, p.x, p.y, rad, start, end, r, g, b, a);
  }

  int aaCircleColor(math.Point<double> p, double rad, int color) {
    // 392
    return gfx.aacircleColor(this, p.x, p.y, rad, color);
  }

  int aaCircleRgba(
      math.Point<double> p, double rad, int r, int g, int b, int a) {
    // 405
    return gfx.aacircleRgba(this, p.x, p.y, rad, r, g, b, a);
  }

  int filledCircleColor(math.Point<double> p, double rad, int color) {
    // 419
    return gfx.filledCircleColor(this, p.x, p.y, rad, color);
  }

  int filledCircleRgba(
      math.Point<double> p, double rad, int r, int g, int b, int a) {
    // 432
    return gfx.filledCircleRgba(this, p.x, p.y, rad, r, g, b, a);
  }

  int ellipseColor(math.Point<double> p, math.Point<double> rad, int color) {
    // 446
    return gfx.ellipseColor(this, p.x, p.y, rad.x, rad.y, color);
  }

  int ellipseRgba(math.Point<double> p, math.Point<double> rad, int r, int g,
      int b, int a) {
    // 459
    return gfx.ellipseRgba(this, p.x, p.y, rad.x, rad.y, r, g, b, a);
  }

  int aaEllipseColor(math.Point<double> p, math.Point<double> rad, int color) {
    // 473
    return gfx.aaellipseColor(this, p.x, p.y, rad.x, rad.y, color);
  }

  int aaEllipseRgba(math.Point<double> p, math.Point<double> rad, int r, int g,
      int b, int a) {
    // 486
    return gfx.aaellipseRgba(this, p.x, p.y, rad.x, rad.y, r, g, b, a);
  }

  int filledEllipseColor(
      math.Point<double> p, math.Point<double> rad, int color) {
    // 500
    return gfx.filledEllipseColor(this, p.x, p.y, rad.x, rad.y, color);
  }

  int filledEllipseRgba(math.Point<double> p, math.Point<double> rad, int r,
      int g, int b, int a) {
    // 513
    return gfx.filledEllipseRgba(this, p.x, p.y, rad.x, rad.y, r, g, b, a);
  }

  int pieColor(
      math.Point<double> p, double rad, double start, double end, int color) {
    // 527
    return gfx.pieColor(this, p.x, p.y, rad, start, end, color);
  }

  int pieRgba(math.Point<double> p, double rad, double start, double end, int r,
      int g, int b, int a) {
    // 540
    return gfx.pieRgba(this, p.x, p.y, rad, start, end, r, g, b, a);
  }

  int filledPieColor(
      math.Point<double> p, double rad, double start, double end, int color) {
    // 554
    return gfx.filledPieColor(this, p.x, p.y, rad, start, end, color);
  }

  int filledPieRgba(math.Point<double> p, double rad, double start, double end,
      int r, int g, int b, int a) {
    // 567
    return gfx.filledPieRgba(this, p.x, p.y, rad, start, end, r, g, b, a);
  }

  int trigonColor(math.Point<double> p1, math.Point<double> p2,
      math.Point<double> p3, int color) {
    // 582
    return gfx.trigonColor(this, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, color);
  }

  int trigonRgba(math.Point<double> p1, math.Point<double> p2,
      math.Point<double> p3, int r, int g, int b, int a) {
    // 585
    return gfx.trigonRgba(this, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, r, g, b, a);
  }

  int aaTrigonColor(math.Point<double> p1, math.Point<double> p2,
      math.Point<double> p3, int color) {
    // 619
    return gfx.aatrigonColor(this, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, color);
  }

  int aaTrigonRgba(math.Point<double> p1, math.Point<double> p2,
      math.Point<double> p3, int r, int g, int b, int a) {
    // 639
    return gfx.aatrigonRgba(
        this, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, r, g, b, a);
  }

  int filledTrigonColor(math.Point<double> p1, math.Point<double> p2,
      math.Point<double> p3, int color) {
    // 657
    return gfx.filledTrigonColor(
        this, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, color);
  }

  int filledTrigonRgba(math.Point<double> p1, math.Point<double> p2,
      math.Point<double> p3, int r, int g, int b, int a) {
    // 671
    return gfx.filledTrigonRgba(
        this, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, r, g, b, a);
  }

  int polygonColor(List<math.Point<double>> ps, int color) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 706
    var result = gfx.polygonColor(this, xsPointer, ysPointer, ps.length, color);
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int polygonRgba(List<math.Point<double>> ps, int r, int g, int b, int a) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 719
    var result =
        gfx.polygonRgba(this, xsPointer, ysPointer, ps.length, r, g, b, a);
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int aaPolygonColor(List<math.Point<double>> ps, int color) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 733
    var result =
        gfx.aapolygonColor(this, xsPointer, ysPointer, ps.length, color);
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int aaPolygonRgba(List<math.Point<double>> ps, int r, int g, int b, int a) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 746
    var result =
        gfx.aapolygonRgba(this, xsPointer, ysPointer, ps.length, r, g, b, a);
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int filledPolygonColor(List<math.Point<double>> ps, int color) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 767
    var result =
        gfx.filledPolygonColor(this, xsPointer, ysPointer, ps.length, color);
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int filledPolygonRgba(
      List<math.Point<double>> ps, int r, int g, int b, int a) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 780
    var result = gfx.filledPolygonRgba(
        this, xsPointer, ysPointer, ps.length, r, g, b, a);
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int texturedPolygon(List<math.Point<double>> ps, Pointer<SdlSurface> texture,
      math.Point<double> texturePos) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 801
    var result = gfx.texturedPolygon(this, xsPointer, ysPointer, ps.length,
        texture, texturePos.x.toInt(), texturePos.y.toInt());
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int bezierColor(List<math.Point<double>> ps, int s, int color) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 834
    var result =
        gfx.bezierColor(this, xsPointer, ysPointer, ps.length, s, color);
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int bezierRgba(
      List<math.Point<double>> ps, int s, int r, int g, int b, int a) {
    var xsPointer = ps.callocInt16X();
    var ysPointer = ps.callocInt16Y();
    // 847
    var result =
        gfx.bezierRgba(this, xsPointer, ysPointer, ps.length, s, r, g, b, a);
    calloc.free(xsPointer);
    calloc.free(ysPointer);
    return result;
  }

  int characterColor(math.Point<double> p, int c, int color) {
    // 898
    return gfx.characterColor(this, p.x, p.y, c, color);
  }

  int characterRgba(math.Point<double> p, int c, int r, int g, int b, int a) {
    // 811
    return gfx.characterRgba(this, p.x, p.y, c, r, g, b, a);
  }

  int stringColor(math.Point<double> p, String s, int color) {
    // 924
    return gfx.stringColor(this, p.x, p.y, s, color);
  }

  int stringRgba(math.Point<double> p, String s, int r, int g, int b, int a) {
    // 940
    return gfx.stringRgba(this, p.x, p.y, s, r, g, b, a);
  }

  // lib_sdl_image.dart
  Pointer<SdlTexture> loadTexture(String file) {
    // 358
    return imgLoadTexture(this, file);
  }

  Pointer<SdlTexture> loadTextureRw(Pointer<SdlRWops> src, bool freesrc) {
    // 418
    return imgLoadTextureRw(this, src, freesrc);
  }

  Pointer<SdlTexture> loadTextureTypedRw(
      Pointer<SdlRWops> src, bool freesrc, String type) {
    // 484
    return imgLoadTextureTypedRw(this, src, freesrc, type);
  }

  // lib_sdl_renderer.dart
  Pointer<SdlRenderer> createSoftware(Pointer<SdlSurface> surface) {
    // 154
    return sdlCreateSoftwareRenderer(surface);
  }

  Pointer<SdlWindow> getWindow() {
    // 196
    return sdlGetRenderWindow(this);
  }

  math.Point<double> getOutputSize() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    // 250
    sdlGetCurrentRenderOutputSize(this, wPointer, hPointer);
    var result = math.Point<double>(
        wPointer.value.toDouble(), hPointer.value.toDouble());
    calloc.free(wPointer);
    calloc.free(hPointer);
    return result;
  }

  Pointer<SdlTexture> createTexture(int format, int access, int w, int h) {
    // 285
    return sdlCreateTexture(this, format, access, w, h);
  }

  Pointer<SdlTexture> createTextureFromSurface(Pointer<SdlSurface> surface) {
    // 322
    return sdlCreateTextureFromSurface(this, surface);
  }

  int setTarget(Pointer<SdlTexture> texture) {
    // 940
    return sdlSetRenderTarget(this, texture);
  }

  Pointer<SdlTexture> getTarget() {
    // 966
    return sdlGetRenderTarget(this);
  }

  int setLogicalPresentation(int w, int h, int mode, int scaleMode) {
    // 1003
    return sdlSetRenderLogicalPresentation(this, w, h, mode, scaleMode);
  }

  math.Point<double> getLogicalPresentation() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    var modePointer = calloc<Int32>();
    var scaleModePointer = calloc<Int32>();
    // 1033
    sdlGetRenderLogicalPresentation(
        this, wPointer, hPointer, modePointer, scaleModePointer);
    var result = math.Point<double>(
        wPointer.value.toDouble(), hPointer.value.toDouble());
    calloc.free(wPointer);
    calloc.free(hPointer);
    calloc.free(modePointer);
    calloc.free(scaleModePointer);
    return result;
  }

//  int setIntegerScale(bool enable) {
//    // 1063
//    return sdlRenderSetIntegerScale(this, enable);
//  }
//
//  bool getIntegerScale() {
//    // 1085
//    return sdlRenderGetIntegerScale(this);
//  }

  int setViewport([math.Rectangle<double>? rect]) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    // 1111
    var result = sdlSetRenderViewport(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  math.Rectangle<double> getViewport() {
    var rectPointer = calloc<SdlRect>();
    // 1132
    sdlGetRenderViewport(this, rectPointer);
    var result = rectPointer.create();
    calloc.free(rectPointer);
    return result;
  }

  int setClipRect([math.Rectangle<double>? rect]) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    // 1159
    var result = sdlSetRenderClipRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  math.Rectangle<double> getClipRect() {
    var rectPointer = calloc<SdlRect>();
    // 1183
    sdlGetRenderClipRect(this, rectPointer);
    var result = rectPointer.create();
    calloc.free(rectPointer);
    return result;
  }

  bool clipEnabled() {
    // 1207
    return sdlRenderClipEnabled(this);
  }

  int setScale(double scaleX, double scaleY) {
    // 1239
    return sdlSetRenderScale(this, scaleX, scaleY);
  }

  // sdlRenderGetScale
  // sdlRenderWindowToLogical
  // sdlRenderLogicalToWindow

  int setDrawColor(int r, int g, int b, int alpha) {
    // 1382
    return sdlSetRenderDrawColor(this, r, g, b, alpha);
  }

  int getDrawColor() {
    var rPointer = calloc<Uint8>();
    var gPointer = calloc<Uint8>();
    var bPointer = calloc<Uint8>();
    var alphaPointer = calloc<Uint8>();
    // 1414
    sdlGetRenderDrawColor(this, rPointer, gPointer, bPointer, alphaPointer);
    int result = 0;
    result += rPointer.value << 16;
    result += gPointer.value << 8;
    result += bPointer.value << 0;
    result += alphaPointer.value << 24;
    calloc.free(rPointer);
    calloc.free(gPointer);
    calloc.free(bPointer);
    calloc.free(alphaPointer);
    return result;
  }

  int setDrawBlendMode(int blendMode) {
    // 1453
    return sdlSetRenderDrawBlendMode(this, blendMode);
  }

  int getDrawBlendMode() {
    var blendModePointer = calloc<Int32>();
    // 1476
    sdlGetRenderDrawBlendMode(this, blendModePointer);
    var result = blendModePointer.value;
    calloc.free(blendModePointer);
    return result;
  }

  int clear() {
    // 1502
    return sdlRenderClear(this);
  }

  int point(math.Point<double> point) {
    // 1537
    return sdlRenderPoint(this, point.x, point.y);
  }

  int points(List<math.Point<double>> points) {
    var pointsPointer = points.calloc();
    // 1571
    var result = sdlRenderPoints(this, pointsPointer, points.length);
    calloc.free(pointsPointer);
    return result;
  }

  int line(math.Point<double> p1, math.Point<double> p2) {
    // 1611
    return sdlRenderLine(this, p1.x, p1.y, p2.x, p2.y);
  }

  int lines(List<math.Point<double>> points) {
    var pointsPointer = points.calloc();
    // 1647
    var result = sdlRenderLines(this, pointsPointer, points.length);
    calloc.free(pointsPointer);
    return result;
  }

  int rect(math.Rectangle<double>? rect) {
    Pointer<SdlFRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.calloc();
    }
    // 1682
    var result = sdlRenderRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  int rects(List<math.Rectangle<double>> rects) {
    var rectsPointer = rects.calloc();
    // 1716
    var result = sdlRenderRects(this, rectsPointer, rects.length);
    calloc.free(rectsPointer);
    return result;
  }

  int fillRect(math.Rectangle<double>? rect) {
    Pointer<SdlFRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.calloc();
    }
    // 1755
    var result = sdlRenderFillRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  int fillRects(List<math.Rectangle<double>> rects) {
    var rectsPointer = rects.calloc();
    // 1788
    var result = sdlRenderFillRects(this, rectsPointer, rects.length);
    calloc.free(rectsPointer);
    return result;
  }

  int texture(Pointer<SdlTexture> texture,
      {math.Rectangle<double>? srcrect, math.Rectangle<double>? dstrect}) {
    Pointer<SdlFRect> srcrectPointer = nullptr;
    Pointer<SdlFRect> dstrectPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.calloc();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.calloc();
    }
    // 1829
    var result =
        sdlRenderTexture(this, texture, srcrectPointer, dstrectPointer);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    return result;
  }

  int textureRotated(Pointer<SdlTexture> texture,
      {math.Rectangle<double>? srcrect,
      math.Rectangle<double>? dstrect,
      double angle = 0,
      math.Point<double>? center,
      int flip = SDL_FLIP_NONE}) {
    Pointer<SdlFRect> srcrectPointer = nullptr;
    Pointer<SdlFRect> dstrectPointer = nullptr;
    Pointer<SdlFPoint> centerPointer = nullptr;
    if (srcrect != null) {
      srcrectPointer = srcrect.calloc();
    }
    if (dstrect != null) {
      dstrectPointer = dstrect.calloc();
    }
    if (center != null) {
      centerPointer = center.calloc();
    }
    // 1884
    var result = sdlRenderTextureRotated(this, texture, srcrectPointer,
        dstrectPointer, angle, centerPointer, flip);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    calloc.free(centerPointer);
    return result;
  }

  void present() {
    // 2390
    sdlRenderPresent(this);
  }

  bool destroy() {
    if (this != nullptr) {
      // 2432
      sdlDestroyRenderer(this);
      return true;
    }
    return false;
  }
}