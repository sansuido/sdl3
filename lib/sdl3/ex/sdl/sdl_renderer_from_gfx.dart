part of '../../sdl.dart';

extension SdlRendererFromGfxPointerEx on Pointer<SdlRenderer> {
  // lib_sdl_gfx.dart

  bool pixelColor(
    SdlxFPoint p,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.pixelColor(this, p.x, p.y, color, blendMode: blendMode);

  bool pixelRgba(
    SdlxFPoint p,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.pixelRgba(this, p.x, p.y, r, g, b, a, blendMode: blendMode);

  bool hlineColor(
    double x1,
    double x2,
    double y,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.hlineColor(this, x1, x2, y, color, blendMode: blendMode);

  bool hlineRgba(
    double x1,
    double x2,
    double y,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.hlineRgba(this, x1, x2, y, r, g, b, a, blendMode: blendMode);

  bool vlineColor(
    double x,
    double y1,
    double y2,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.vlineColor(this, x, y1, y2, color, blendMode: blendMode);

  bool vlineRgba(
    double x,
    double y1,
    double y2,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.vlineRgba(this, x, y1, y2, r, g, b, a, blendMode: blendMode);

  bool rectangleColor(
    SdlxFRect rect,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.rectangleColor(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w,
    rect.y + rect.h,
    color,
    blendMode: blendMode,
  );

  bool rectangleRgba(
    SdlxFRect rect,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.rectangleRgba(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w,
    rect.y + rect.h,
    r,
    g,
    b,
    a,
    blendMode: blendMode,
  );

  bool roundedRectangleColor(
    SdlxFRect rect,
    double rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.roundedRectangleColor(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w,
    rect.y + rect.h,
    rad,
    color,
    blendMode: blendMode,
  );

  bool roundedRectangleRgba(
    SdlxFRect rect,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.roundedRectangleRgba(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w,
    rect.y + rect.h,
    rad,
    r,
    g,
    b,
    a,
    blendMode: blendMode,
  );

  bool boxColor(
    SdlxFRect rect,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.boxColor(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w,
    rect.y + rect.h,
    color,
    blendMode: blendMode,
  );

  bool boxInColor(
    SdlxFRect rect,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.boxColor(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w - 1,
    rect.y + rect.h - 1,
    color,
    blendMode: blendMode,
  );

  bool boxRgba(
    SdlxFRect rect,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.boxRgba(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w,
    rect.y + rect.h,
    r,
    g,
    b,
    a,
    blendMode: blendMode,
  );

  bool boxInRgba(
    SdlxFRect rect,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.boxRgba(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w - 1,
    rect.y + rect.h - 1,
    r,
    g,
    b,
    a,
    blendMode: blendMode,
  );

  bool roundedBoxColor(
    SdlxFRect rect,
    double rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.roundedBoxColor(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w,
    rect.y + rect.h,
    rad,
    color,
    blendMode: blendMode,
  );

  bool roundedBoxInColor(
    SdlxFRect rect,
    double rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.roundedBoxColor(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w - 1,
    rect.y + rect.h - 1,
    rad,
    color,
    blendMode: blendMode,
  );

  bool roundedBoxRgba(
    SdlxFRect rect,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.roundedBoxRgba(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w,
    rect.y + rect.h,
    rad,
    r,
    g,
    b,
    a,
    blendMode: blendMode,
  );

  bool roundedBoxInRgba(
    SdlxFRect rect,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.roundedBoxRgba(
    this,
    rect.x,
    rect.y,
    rect.x + rect.w - 1,
    rect.y + rect.h - 1,
    rad,
    r,
    g,
    b,
    a,
    blendMode: blendMode,
  );

  bool lineColor(
    SdlxFPoint p1,
    SdlxFPoint p2,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) =>
      gfx.lineColor(this, p1.x, p1.y, p2.x, p2.y, color, blendMode: blendMode);

  bool lineRgba(
    SdlxFPoint p1,
    SdlxFPoint p2,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.lineRgba(
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

  bool aaLineColor(
    SdlxFPoint p1,
    SdlxFPoint p2,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.aalineColor(
    this,
    p1.x,
    p1.y,
    p2.x,
    p2.y,
    color,
    blendMode: blendMode,
  );

  bool aaLineRgba(
    SdlxFPoint p1,
    SdlxFPoint p2,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.aalineRgba(
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

  bool thickLineColor(
    SdlxFPoint p1,
    SdlxFPoint p2,
    double width,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.thickLineColor(
    this,
    p1.x,
    p1.y,
    p2.x,
    p2.y,
    width,
    color,
    blendMode: blendMode,
  );

  bool thickLineRgba(
    SdlxFPoint p1,
    SdlxFPoint p2,
    double width,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.thickLineRgba(
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

  bool circleColor(
    SdlxFPoint p,
    double rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.circleColor(this, p.x, p.y, rad, color, blendMode: blendMode);

  bool circleRgba(
    SdlxFPoint p,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.circleRgba(this, p.x, p.y, rad, r, g, b, a, blendMode: blendMode);

  bool arcColor(
    SdlxFPoint p,
    double rad,
    double start,
    double end,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.arcColor(
    this,
    p.x,
    p.y,
    rad,
    start,
    end,
    color,
    blendMode: blendMode,
  );

  bool arcRgba(
    SdlxFPoint p,
    double rad,
    double start,
    double end,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.arcRgba(
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

  bool aaCircleColor(
    SdlxFPoint p,
    double rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.aacircleColor(this, p.x, p.y, rad, color, blendMode: blendMode);

  bool aaCircleRgba(
    SdlxFPoint p,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.aacircleRgba(this, p.x, p.y, rad, r, g, b, a, blendMode: blendMode);

  bool filledCircleColor(
    SdlxFPoint p,
    double rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.filledCircleColor(this, p.x, p.y, rad, color, blendMode: blendMode);

  bool filledCircleRgba(
    SdlxFPoint p,
    double rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.filledCircleRgba(
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

  bool ellipseColor(
    SdlxFPoint p,
    SdlxFPoint rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.ellipseColor(
    this,
    p.x,
    p.y,
    rad.x,
    rad.y,
    color,
    blendMode: blendMode,
  );

  bool ellipseRgba(
    SdlxFPoint p,
    SdlxFPoint rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.ellipseRgba(
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

  bool aaEllipseColor(
    SdlxFPoint p,
    SdlxFPoint rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.aaellipseColor(
    this,
    p.x,
    p.y,
    rad.x,
    rad.y,
    color,
    blendMode: blendMode,
  );

  bool aaEllipseRgba(
    SdlxFPoint p,
    SdlxFPoint rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.aaellipseRgba(
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

  bool filledEllipseColor(
    SdlxFPoint p,
    SdlxFPoint rad,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.filledEllipseColor(
    this,
    p.x,
    p.y,
    rad.x,
    rad.y,
    color,
    blendMode: blendMode,
  );

  bool filledEllipseRgba(
    SdlxFPoint p,
    SdlxFPoint rad,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.filledEllipseRgba(
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

  bool pieColor(
    SdlxFPoint p,
    double rad,
    double start,
    double end,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.pieColor(
    this,
    p.x,
    p.y,
    rad,
    start,
    end,
    color,
    blendMode: blendMode,
  );

  bool pieRgba(
    SdlxFPoint p,
    double rad,
    double start,
    double end,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.pieRgba(
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

  bool filledPieColor(
    SdlxFPoint p,
    double rad,
    double start,
    double end,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.filledPieColor(
    this,
    p.x,
    p.y,
    rad,
    start,
    end,
    color,
    blendMode: blendMode,
  );

  bool filledPieRgba(
    SdlxFPoint p,
    double rad,
    double start,
    double end,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.filledPieRgba(
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

  bool trigonColor(
    SdlxFPoint p1,
    SdlxFPoint p2,
    SdlxFPoint p3,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.trigonColor(
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

  bool trigonRgba(
    SdlxFPoint p1,
    SdlxFPoint p2,
    SdlxFPoint p3,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.trigonRgba(
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

  bool aaTrigonColor(
    SdlxFPoint p1,
    SdlxFPoint p2,
    SdlxFPoint p3,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.aatrigonColor(
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

  bool aaTrigonRgba(
    SdlxFPoint p1,
    SdlxFPoint p2,
    SdlxFPoint p3,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.aatrigonRgba(
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

  bool filledTrigonColor(
    SdlxFPoint p1,
    SdlxFPoint p2,
    SdlxFPoint p3,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.filledTrigonColor(
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

  bool filledTrigonRgba(
    SdlxFPoint p1,
    SdlxFPoint p2,
    SdlxFPoint p3,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) => gfx.filledTrigonRgba(
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

  bool polygonColor(
    List<SdlxFPoint> points,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    final result = gfx.polygonColor(this, points, color, blendMode: blendMode);
    return result;
  }

  bool polygonRgba(
    List<SdlxFPoint> points,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    final result = gfx.polygonRgba(
      this,
      points,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
    return result;
  }

  bool aaPolygonColor(
    List<SdlxFPoint> points,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    final result = gfx.aapolygonColor(
      this,
      points,
      color,
      blendMode: blendMode,
    );
    return result;
  }

  bool aaPolygonRgba(
    List<SdlxFPoint> points,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    final result = gfx.aapolygonRgba(
      this,
      points,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
    return result;
  }

  bool filledPolygonColor(
    List<SdlxFPoint> points,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    final result = gfx.filledPolygonColor(
      this,
      points,
      color,
      blendMode: blendMode,
    );
    return result;
  }

  bool filledPolygonRgba(
    List<SdlxFPoint> points,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    final result = gfx.filledPolygonRgba(
      this,
      points,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
    return result;
  }

  bool texturedPolygon(
    List<SdlxFPoint> points,
    Pointer<SdlSurface> texture,
    SdlxFPoint texturePos,
  ) {
    final result = gfx.texturedPolygon(
      this,
      points,
      texture,
      texturePos.x.toInt(),
      texturePos.y.toInt(),
    );
    return result;
  }

  bool bezierColor(
    List<SdlxFPoint> points,
    int s,
    SdlxColor color, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    final result = gfx.bezierColor(
      this,
      points,
      s,
      color,
      blendMode: blendMode,
    );
    return result;
  }

  bool bezierRgba(
    List<SdlxFPoint> points,
    int s,
    int r,
    int g,
    int b,
    int a, {
    int blendMode = SDL_BLENDMODE_BLEND,
  }) {
    final result = gfx.bezierRgba(
      this,
      points,
      s,
      r,
      g,
      b,
      a,
      blendMode: blendMode,
    );
    return result;
  }

  bool characterColor(SdlxFPoint p, int c, SdlxColor color) =>
      gfx.characterColor(this, p.x, p.y, c, color);

  bool characterRgba(SdlxFPoint p, int c, int r, int g, int b, int a) =>
      gfx.characterRgba(this, p.x, p.y, c, r, g, b, a);

  bool stringColor(SdlxFPoint p, String s, SdlxColor color) =>
      gfx.stringColor(this, p.x, p.y, s, color);

  bool stringRgba(SdlxFPoint p, String s, int r, int g, int b, int a) =>
      gfx.stringRgba(this, p.x, p.y, s, r, g, b, a);

  bool stringAnchorColor(
    SdlxFPoint p,
    String s,
    SdlxFPoint anchorPoint,
    SdlxColor color, {
    int? charRotation,
  }) => stringAnchorRgba(
    p,
    s,
    anchorPoint,
    color.r,
    color.g,
    color.b,
    color.a,
    charRotation: charRotation,
  );

  bool stringAnchorRgba(
    SdlxFPoint p,
    String s,
    SdlxFPoint anchorPoint,
    int r,
    int g,
    int b,
    int a, {
    int? charRotation,
  }) {
    var result = true;
    var curx = p.x;
    var cury = p.y;
    final stringWidth = s.length * gfx.charWidthLocal.toDouble();
    final stringHeight = gfx.charHeightLocal.toDouble();
    double calcx = 0;
    double calcy = 0;
    charRotation ??= gfx.charRotation;
    switch (charRotation) {
      case 0:
        calcx = -stringWidth * anchorPoint.x;
        calcy = -stringHeight * anchorPoint.y;
      case 2:
        calcx = stringWidth * anchorPoint.x;
        calcy = -stringHeight * anchorPoint.y;
      case 1:
        calcx = -stringHeight * anchorPoint.y;
        calcy = -stringWidth * anchorPoint.x;
      case 3:
        calcx = -stringHeight * anchorPoint.y;
        calcy = stringWidth * anchorPoint.x;
    }
    for (var i = 0; i < s.length; i++) {
      final curchar = s[i];
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
        case 2:
          curx -= gfx.charWidthLocal;
        case 1:
          cury += gfx.charHeightLocal;
        case 3:
          cury -= gfx.charHeightLocal;
      }
    }
    return result;
  }
}
