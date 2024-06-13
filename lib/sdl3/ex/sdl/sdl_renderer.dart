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

  int boxInColor(math.Rectangle<double> rect, int color) {
    // 201
    return gfx.boxColor(
        this, rect.left, rect.top, rect.right - 1, rect.bottom - 1, color);
  }

  int boxRgba(math.Rectangle<double> rect, int r, int g, int b, int a) {
    // 214
    return gfx.boxRgba(
        this, rect.left, rect.top, rect.right, rect.bottom, r, g, b, a);
  }

  int boxInRgba(math.Rectangle<double> rect, int r, int g, int b, int a) {
    // 214
    return gfx.boxRgba(
        this, rect.left, rect.top, rect.right - 1, rect.bottom - 1, r, g, b, a);
  }

  int roundedBoxColor(math.Rectangle<double> rect, double rad, int color) {
    // 228
    return gfx.roundedBoxColor(
        this, rect.left, rect.top, rect.right, rect.bottom, rad, color);
  }

  int roundedBoxInColor(math.Rectangle<double> rect, double rad, int color) {
    // 228
    return gfx.roundedBoxColor(
        this, rect.left, rect.top, rect.right - 1, rect.bottom - 1, rad, color);
  }

  int roundedBoxRgba(
      math.Rectangle<double> rect, double rad, int r, int g, int b, int a) {
    // 241
    return gfx.roundedBoxRgba(
        this, rect.left, rect.top, rect.right, rect.bottom, rad, r, g, b, a);
  }

  int roundedBoxInRgba(
      math.Rectangle<double> rect, double rad, int r, int g, int b, int a) {
    // 241
    return gfx.roundedBoxRgba(this, rect.left, rect.top, rect.right - 1,
        rect.bottom - 1, rad, r, g, b, a);
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

  int stringAnchorRgba(math.Point<double> p, String s,
      math.Point<double> anchorPoint, int r, int g, int b, int a,
      {int? charRotation}) {
    int result = 0;
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
      result |= gfx.characterRgba(
          this, curx + calcx, cury + calcy, curchar.codeUnitAt(0), r, g, b, a);
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

  // lib_sdl_image.dart
  Pointer<SdlTexture> loadTexture(String file) {
    // 358
    return imgLoadTexture(this, file);
  }

  Pointer<SdlTexture> loadTextureIo(Pointer<SdlIoStream> src, bool freesrc) {
    // 418
    return imgLoadTextureIo(this, src, freesrc);
  }

  Pointer<SdlTexture> loadTextureTypedIo(
      Pointer<SdlIoStream> src, bool freesrc, String type) {
    // 484
    return imgLoadTextureTypedIo(this, src, freesrc, type);
  }

  // lib_sdl_renderer.dart
  ///
  /// Create a 2D software rendering context for a surface.
  ///
  /// Two other API which can be used to create SDL_Renderer:
  /// SDL_CreateRenderer() and SDL_CreateWindowAndRenderer(). These can _also_
  /// create a software renderer, but they are intended to be used with an
  /// SDL_Window as the final destination and not an SDL_Surface.
  ///
  /// \param surface the SDL_Surface structure representing the surface where
  /// rendering is done
  /// \returns a valid rendering context or NULL if there was an error; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CreateRenderer
  /// \sa SDL_CreateWindowRenderer
  /// \sa SDL_DestroyRenderer
  ///
  /// ```c
  /// extern DECLSPEC SDL_Renderer *SDLCALL SDL_CreateSoftwareRenderer(SDL_Surface *surface)
  /// ```
  Pointer<SdlRenderer> createSoftware(Pointer<SdlSurface> surface) {
    return sdlCreateSoftwareRenderer(surface);
  }

  ///
  /// Get the window associated with a renderer.
  ///
  /// \param renderer the renderer to query
  /// \returns the window on success or NULL on failure; call SDL_GetError() for
  /// more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC SDL_Window *SDLCALL SDL_GetRenderWindow(SDL_Renderer *renderer)
  /// ```
  Pointer<SdlWindow> getWindow() {
    return sdlGetRenderWindow(this);
  }

  ///
  /// Get the properties associated with a renderer.
  ///
  /// The following read-only properties are provided by SDL:
  ///
  /// - `SDL_PROP_RENDERER_NAME_STRING`: the name of the rendering driver
  /// - `SDL_PROP_RENDERER_WINDOW_POINTER`: the window where rendering is
  /// displayed, if any
  /// - `SDL_PROP_RENDERER_SURFACE_POINTER`: the surface where rendering is
  /// displayed, if this is a software renderer without a window
  /// - `SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER`: an SDL_ColorSpace value
  /// describing the colorspace for output to the display, defaults to
  /// SDL_COLORSPACE_SRGB.
  /// - `SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN`: true if the output colorspace is
  /// SDL_COLORSPACE_SRGB_LINEAR and the renderer is showing on a display with
  /// HDR enabled.
  /// - `SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT`: the value of SDR white in the
  /// SDL_COLORSPACE_SRGB_LINEAR colorspace. When HDR is enabled, this value is
  /// automatically multiplied into the color scale.
  /// - `SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT`: the additional high dynamic range
  /// that can be displayed, in terms of the SDR white point. When HDR is not
  /// enabled, this will be 1.0.
  /// - `SDL_PROP_RENDERER_D3D9_DEVICE_POINTER`: the IDirect3DDevice9 associated
  /// with the renderer
  /// - `SDL_PROP_RENDERER_D3D11_DEVICE_POINTER`: the ID3D11Device associated
  /// with the renderer
  /// - `SDL_PROP_RENDERER_D3D12_DEVICE_POINTER`: the ID3D12Device associated
  /// with the renderer
  /// - `SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER`: the ID3D12CommandQueue
  /// associated with the renderer
  ///
  /// \param renderer the rendering context
  /// \returns a valid property ID on success or 0 on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetProperty
  /// \sa SDL_SetProperty
  ///
  /// ```c
  /// extern DECLSPEC SDL_PropertiesID SDLCALL SDL_GetRendererProperties(SDL_Renderer *renderer)
  /// ```
  int getProperties() {
    return sdlGetRendererProperties(this);
  }

  ///
  /// Get the output size in pixels of a rendering context.
  ///
  /// This returns the true output size in pixels, ignoring any render targets or
  /// logical size and presentation.
  ///
  /// \param renderer the rendering context
  /// \param w a pointer filled in with the width in pixels
  /// \param h a pointer filled in with the height in pixels
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderer
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderOutputSize(SDL_Renderer *renderer, int *w, int *h)
  /// ```
  math.Point<double> getOutputSize() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    sdlGetRenderOutputSize(this, wPointer, hPointer);
    var result = math.Point<double>(
        wPointer.value.toDouble(), hPointer.value.toDouble());
    calloc.free(wPointer);
    calloc.free(hPointer);
    return result;
  }

  ///
  /// Get the current output size in pixels of a rendering context.
  ///
  /// If a rendering target is active, this will return the size of the rendering
  /// target in pixels, otherwise if a logical size is set, it will return the
  /// logical size, otherwise it will return the value of
  /// SDL_GetRenderOutputSize().
  ///
  /// \param renderer the rendering context
  /// \param w a pointer filled in with the current width
  /// \param h a pointer filled in with the current height
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderOutputSize
  /// \sa SDL_GetRenderer
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetCurrentRenderOutputSize(SDL_Renderer *renderer, int *w, int *h)
  /// ```
  math.Point<double> getCurrentOutputSize() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    sdlGetCurrentRenderOutputSize(this, wPointer, hPointer);
    var result = math.Point<double>(
        wPointer.value.toDouble(), hPointer.value.toDouble());
    calloc.free(wPointer);
    calloc.free(hPointer);
    return result;
  }

  ///
  /// Create a texture for a rendering context.
  ///
  /// You can set the texture scaling method by setting
  /// `SDL_HINT_RENDER_SCALE_QUALITY` before creating the texture.
  ///
  /// \param renderer the rendering context
  /// \param format one of the enumerated values in SDL_PixelFormatEnum
  /// \param access one of the enumerated values in SDL_TextureAccess
  /// \param w the width of the texture in pixels
  /// \param h the height of the texture in pixels
  /// \returns a pointer to the created texture or NULL if no rendering context
  /// was active, the format was unsupported, or the width or height
  /// were out of range; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CreateTextureFromSurface
  /// \sa SDL_CreateTextureWithProperties
  /// \sa SDL_DestroyTexture
  /// \sa SDL_QueryTexture
  /// \sa SDL_UpdateTexture
  ///
  /// ```c
  /// extern DECLSPEC SDL_Texture *SDLCALL SDL_CreateTexture(SDL_Renderer *renderer, Uint32 format, int access, int w, int h)
  /// ```
  Pointer<SdlTexture> createTexture(int format, int access, int w, int h) {
    return sdlCreateTexture(this, format, access, w, h);
  }

  ///
  /// Create a texture from an existing surface.
  ///
  /// The surface is not modified or freed by this function.
  ///
  /// The SDL_TextureAccess hint for the created texture is
  /// `SDL_TEXTUREACCESS_STATIC`.
  ///
  /// The pixel format of the created texture may be different from the pixel
  /// format of the surface. Use SDL_QueryTexture() to query the pixel format of
  /// the texture.
  ///
  /// \param renderer the rendering context
  /// \param surface the SDL_Surface structure containing pixel data used to fill
  /// the texture
  /// \returns the created texture or NULL on failure; call SDL_GetError() for
  /// more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CreateTexture
  /// \sa SDL_CreateTextureWithProperties
  /// \sa SDL_DestroyTexture
  /// \sa SDL_QueryTexture
  ///
  /// ```c
  /// extern DECLSPEC SDL_Texture *SDLCALL SDL_CreateTextureFromSurface(SDL_Renderer *renderer, SDL_Surface *surface)
  /// ```
  Pointer<SdlTexture> createTextureFromSurface(Pointer<SdlSurface> surface) {
    return sdlCreateTextureFromSurface(this, surface);
  }

  ///
  /// Create a texture for a rendering context with the specified properties.
  ///
  /// These are the supported properties:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER`: an SDL_ColorSpace value
  /// describing the texture colorspace, defaults to SDL_COLORSPACE_SRGB_LINEAR
  /// for floating point textures, SDL_COLORSPACE_HDR10 for 10-bit textures,
  /// SDL_COLORSPACE_SRGB for other RGB textures and SDL_COLORSPACE_JPEG for
  /// YUV textures.
  /// - `SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER`: one of the enumerated values in
  /// SDL_PixelFormatEnum, defaults to the best RGBA format for the renderer
  /// - `SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER`: one of the enumerated values in
  /// SDL_TextureAccess, defaults to SDL_TEXTUREACCESS_STATIC
  /// - `SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER`: the width of the texture in
  /// pixels, required
  /// - `SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER`: the height of the texture in
  /// pixels, required
  /// - `SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating
  /// point textures, this defines the value of 100% diffuse white, with higher
  /// values being displayed in the High Dynamic Range headroom. This defaults
  /// to 100 for HDR10 textures and 1.0 for floating point textures.
  /// - `SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT`: for HDR10 and floating
  /// point textures, this defines the maximum dynamic range used by the
  /// content, in terms of the SDR white point. This would be equivalent to
  /// maxCLL / SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT for HDR10 content.
  /// If this is defined, any values outside the range supported by the display
  /// will be scaled into the available HDR headroom, otherwise they are
  /// clipped.
  ///
  /// With the direct3d11 renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER`: the ID3D11Texture2D
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER`: the ID3D11Texture2D
  /// associated with the U plane of a YUV texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER`: the ID3D11Texture2D
  /// associated with the V plane of a YUV texture, if you want to wrap an
  /// existing texture.
  ///
  /// With the direct3d12 renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER`: the ID3D12Resource
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER`: the ID3D12Resource
  /// associated with the U plane of a YUV texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER`: the ID3D12Resource
  /// associated with the V plane of a YUV texture, if you want to wrap an
  /// existing texture.
  ///
  /// With the metal renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER`: the CVPixelBufferRef
  /// associated with the texture, if you want to create a texture from an
  /// existing pixel buffer.
  ///
  /// With the opengl renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER`: the GLuint texture
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER`: the GLuint texture
  /// associated with the UV plane of an NV12 texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER`: the GLuint texture
  /// associated with the U plane of a YUV texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER`: the GLuint texture
  /// associated with the V plane of a YUV texture, if you want to wrap an
  /// existing texture.
  ///
  /// With the opengles2 renderer:
  ///
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
  /// associated with the texture, if you want to wrap an existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER`: the GLuint texture
  /// associated with the UV plane of an NV12 texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER`: the GLuint texture
  /// associated with the U plane of a YUV texture, if you want to wrap an
  /// existing texture.
  /// - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER`: the GLuint texture
  /// associated with the V plane of a YUV texture, if you want to wrap an
  /// existing texture.
  ///
  /// \param renderer the rendering context
  /// \param props the properties to use
  /// \returns a pointer to the created texture or NULL if no rendering context
  /// was active, the format was unsupported, or the width or height
  /// were out of range; call SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CreateTextureFromSurface
  /// \sa SDL_CreateTexture
  /// \sa SDL_DestroyTexture
  /// \sa SDL_QueryTexture
  /// \sa SDL_UpdateTexture
  ///
  /// ```c
  /// extern DECLSPEC SDL_Texture *SDLCALL SDL_CreateTextureWithProperties(SDL_Renderer *renderer, SDL_PropertiesID props)
  /// ```
  Pointer<SdlTexture> createTextureWithProperties(int props) {
    return sdlCreateTextureWithProperties(this, props);
  }

  ///
  /// Set a texture as the current rendering target.
  ///
  /// The default render target is the window for which the renderer was created.
  /// To stop rendering to a texture and render to the window again, call this
  /// function with a NULL `texture`.
  ///
  /// \param renderer the rendering context
  /// \param texture the targeted texture, which must be created with the
  /// `SDL_TEXTUREACCESS_TARGET` flag, or NULL to render to the
  /// window instead of a texture.
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderTarget
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderTarget(SDL_Renderer *renderer, SDL_Texture *texture)
  /// ```
  int setTarget(Pointer<SdlTexture> texture) {
    return sdlSetRenderTarget(this, texture);
  }

  ///
  /// Get the current render target.
  ///
  /// The default render target is the window for which the renderer was created,
  /// and is reported a NULL here.
  ///
  /// \param renderer the rendering context
  /// \returns the current render target or NULL for the default render target.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderTarget
  ///
  /// ```c
  /// extern DECLSPEC SDL_Texture *SDLCALL SDL_GetRenderTarget(SDL_Renderer *renderer)
  /// ```
  Pointer<SdlTexture> getTarget() {
    return sdlGetRenderTarget(this);
  }

  ///
  /// Set a device independent resolution and presentation mode for rendering.
  ///
  /// This function sets the width and height of the logical rendering output. A
  /// render target is created at the specified size and used for rendering and
  /// then copied to the output during presentation.
  ///
  /// You can disable logical coordinates by setting the mode to
  /// SDL_LOGICAL_PRESENTATION_DISABLED, and in that case you get the full pixel
  /// resolution of the output window.
  ///
  /// You can convert coordinates in an event into rendering coordinates using
  /// SDL_ConvertEventToRenderCoordinates().
  ///
  /// \param renderer the rendering context
  /// \param w the width of the logical resolution
  /// \param h the height of the logical resolution
  /// \param mode the presentation mode used
  /// \param scale_mode the scale mode used
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_ConvertEventToRenderCoordinates
  /// \sa SDL_GetRenderLogicalPresentation
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderLogicalPresentation(SDL_Renderer *renderer, int w, int h, SDL_RendererLogicalPresentation mode, SDL_ScaleMode scale_mode)
  /// ```
  int setLogicalPresentation(int w, int h, int mode, int scaleMode) {
    return sdlSetRenderLogicalPresentation(this, w, h, mode, scaleMode);
  }

  ///
  /// Get device independent resolution and presentation mode for rendering.
  ///
  /// This function gets the width and height of the logical rendering output, or
  /// the output size in pixels if a logical resolution is not enabled.
  ///
  /// \param renderer the rendering context
  /// \param w an int to be filled with the width
  /// \param h an int to be filled with the height
  /// \param mode a pointer filled in with the presentation mode
  /// \param scale_mode a pointer filled in with the scale mode
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderLogicalPresentation
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderLogicalPresentation(SDL_Renderer *renderer, int *w, int *h, SDL_RendererLogicalPresentation *mode, SDL_ScaleMode *scale_mode)
  /// ```
  int getLogicalPresentation(Pointer<Int32> w, Pointer<Int32> h,
      Pointer<Int32> mode, Pointer<Int32> scaleMode) {
    return sdlGetRenderLogicalPresentation(this, w, h, mode, scaleMode);
  }

  math.Point<double> getLogicalSize() {
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

  int getLogicalMode() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    var modePointer = calloc<Int32>();
    var scaleModePointer = calloc<Int32>();
    // 1033
    sdlGetRenderLogicalPresentation(
        this, wPointer, hPointer, modePointer, scaleModePointer);
    var result = modePointer.value;
    calloc.free(wPointer);
    calloc.free(hPointer);
    calloc.free(modePointer);
    calloc.free(scaleModePointer);
    return result;
  }

  int getLogicalScaleMode() {
    var wPointer = calloc<Int32>();
    var hPointer = calloc<Int32>();
    var modePointer = calloc<Int32>();
    var scaleModePointer = calloc<Int32>();
    // 1033
    sdlGetRenderLogicalPresentation(
        this, wPointer, hPointer, modePointer, scaleModePointer);
    var result = scaleModePointer.value;
    calloc.free(wPointer);
    calloc.free(hPointer);
    calloc.free(modePointer);
    calloc.free(scaleModePointer);
    return result;
  }

  ///
  /// Get a point in render coordinates when given a point in window coordinates.
  ///
  /// \param renderer the rendering context
  /// \param window_x the x coordinate in window coordinates
  /// \param window_y the y coordinate in window coordinates
  /// \param x a pointer filled with the x coordinate in render coordinates
  /// \param y a pointer filled with the y coordinate in render coordinates
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderLogicalPresentation
  /// \sa SDL_SetRenderScale
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderCoordinatesFromWindow(SDL_Renderer *renderer, float window_x, float window_y, float *x, float *y)
  /// ```
  math.Point<double> coordinatesFromWindow(double windowX, double windowY) {
    var xPointer = calloc<Float>();
    var yPointer = calloc<Float>();
    sdlRenderCoordinatesFromWindow(this, windowX, windowY, xPointer, yPointer);
    var result = math.Point<double>(xPointer.value, yPointer.value);
    calloc.free(xPointer);
    calloc.free(yPointer);
    return result;
  }

  ///
  /// Get a point in window coordinates when given a point in render coordinates.
  ///
  /// \param renderer the rendering context
  /// \param x the x coordinate in render coordinates
  /// \param y the y coordinate in render coordinates
  /// \param window_x a pointer filled with the x coordinate in window
  /// coordinates
  /// \param window_y a pointer filled with the y coordinate in window
  /// coordinates
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderLogicalPresentation
  /// \sa SDL_SetRenderScale
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderCoordinatesToWindow(SDL_Renderer *renderer, float x, float y, float *window_x, float *window_y)
  /// ```
  math.Point<double> coordinatesToWindow(Pointer<SdlRenderer> renderer,
      double x, double y, Pointer<Float> windowX, Pointer<Float> windowY) {
    var windowXPointer = calloc<Float>();
    var windowYPointer = calloc<Float>();
    sdlRenderCoordinatesToWindow(this, x, y, windowX, windowY);
    var result = math.Point<double>(windowXPointer.value, windowYPointer.value);
    calloc.free(windowXPointer);
    calloc.free(windowYPointer);
    return result;
  }

  ///
  /// Convert the coordinates in an event to render coordinates.
  ///
  /// Touch coordinates are converted from normalized coordinates in the window
  /// to non-normalized rendering coordinates.
  ///
  /// Once converted, the coordinates may be outside the rendering area.
  ///
  /// \param renderer the rendering context
  /// \param event the event to modify
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderCoordinatesFromWindowCoordinates
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_ConvertEventToRenderCoordinates(SDL_Renderer *renderer, SDL_Event *event)
  /// ```
  int convertEventToCoordinates(Pointer<SdlEvent> event) {
    return sdlConvertEventToRenderCoordinates(this, event);
  }

  ///
  /// Set the drawing area for rendering on the current target.
  ///
  /// \param renderer the rendering context
  /// \param rect the SDL_Rect structure representing the drawing area, or NULL
  /// to set the viewport to the entire target
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderViewport
  /// \sa SDL_RenderViewportSet
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderViewport(SDL_Renderer *renderer, const SDL_Rect *rect)
  /// ```
  int setViewport([math.Rectangle<double>? rect]) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    var result = sdlSetRenderViewport(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Get the drawing area for the current target.
  ///
  /// \param renderer the rendering context
  /// \param rect an SDL_Rect structure filled in with the current drawing area
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_RenderViewportSet
  /// \sa SDL_SetRenderViewport
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderViewport(SDL_Renderer *renderer, SDL_Rect *rect)
  /// ```
  math.Rectangle<double> getViewport() {
    var rectPointer = calloc<SdlRect>();
    sdlGetRenderViewport(this, rectPointer);
    var result = rectPointer.create();
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Set the clip rectangle for rendering on the specified target.
  ///
  /// \param renderer the rendering context
  /// \param rect an SDL_Rect structure representing the clip area, relative to
  /// the viewport, or NULL to disable clipping
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderClipRect
  /// \sa SDL_RenderClipEnabled
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderClipRect(SDL_Renderer *renderer, const SDL_Rect *rect)
  /// ```
  int setClipRect([math.Rectangle<double>? rect]) {
    Pointer<SdlRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.callocInt();
    }
    var result = sdlSetRenderClipRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Get the clip rectangle for the current target.
  ///
  /// \param renderer the rendering context
  /// \param rect an SDL_Rect structure filled in with the current clipping area
  /// or an empty rectangle if clipping is disabled
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_RenderClipEnabled
  /// \sa SDL_SetRenderClipRect
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderClipRect(SDL_Renderer *renderer, SDL_Rect *rect)
  /// ```
  math.Rectangle<double> getClipRect() {
    var rectPointer = calloc<SdlRect>();
    sdlGetRenderClipRect(this, rectPointer);
    var result = rectPointer.create();
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Get whether clipping is enabled on the given renderer.
  ///
  /// \param renderer the rendering context
  /// \returns SDL_TRUE if clipping is enabled or SDL_FALSE if not; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderClipRect
  /// \sa SDL_SetRenderClipRect
  ///
  /// ```c
  /// extern DECLSPEC SDL_bool SDLCALL SDL_RenderClipEnabled(SDL_Renderer *renderer)
  /// ```
  bool clipEnabled() {
    return sdlRenderClipEnabled(this);
  }

  ///
  /// Set the drawing scale for rendering on the current target.
  ///
  /// The drawing coordinates are scaled by the x/y scaling factors before they
  /// are used by the renderer. This allows resolution independent drawing with a
  /// single coordinate system.
  ///
  /// If this results in scaling or subpixel drawing by the rendering backend, it
  /// will be handled using the appropriate quality hints. For best results use
  /// integer scaling factors.
  ///
  /// \param renderer the rendering context
  /// \param scaleX the horizontal scaling factor
  /// \param scaleY the vertical scaling factor
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderScale
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderScale(SDL_Renderer *renderer, float scaleX, float scaleY)
  /// ```
  int setScale(double scaleX, double scaleY) {
    return sdlSetRenderScale(this, scaleX, scaleY);
  }

  ///
  /// Get the drawing scale for the current target.
  ///
  /// \param renderer the rendering context
  /// \param scaleX a pointer filled in with the horizontal scaling factor
  /// \param scaleY a pointer filled in with the vertical scaling factor
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderScale
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderScale(SDL_Renderer *renderer, float *scaleX, float *scaleY)
  /// ```
  math.Point<double> getScale() {
    var scaleXPointer = calloc<Float>();
    var scaleYPointer = calloc<Float>();
    sdlGetRenderScale(this, scaleXPointer, scaleYPointer);
    var result = math.Point<double>(scaleXPointer.value, scaleYPointer.value);
    calloc.free(scaleXPointer);
    calloc.free(scaleYPointer);
    return result;
  }

  ///
  /// Set the color used for drawing operations.
  ///
  /// Set the color for drawing or filling rectangles, lines, and points, and for
  /// SDL_RenderClear().
  ///
  /// \param renderer the rendering context
  /// \param r the red value used to draw on the rendering target
  /// \param g the green value used to draw on the rendering target
  /// \param b the blue value used to draw on the rendering target
  /// \param a the alpha value used to draw on the rendering target; usually
  /// `SDL_ALPHA_OPAQUE` (255). Use SDL_SetRenderDrawBlendMode to
  /// specify how the alpha channel is used
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderDrawColor
  /// \sa SDL_RenderClear
  /// \sa SDL_RenderFillRect
  /// \sa SDL_RenderFillRects
  /// \sa SDL_RenderLine
  /// \sa SDL_RenderLines
  /// \sa SDL_RenderPoint
  /// \sa SDL_RenderPoints
  /// \sa SDL_RenderRect
  /// \sa SDL_RenderRects
  /// \sa SDL_SetRenderDrawColorFloat
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderDrawColor(SDL_Renderer *renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
  /// ```
  int setDrawColor(int r, int g, int b, int a) {
    return sdlSetRenderDrawColor(this, r, g, b, a);
  }

  ///
  /// Set the color used for drawing operations (Rect, Line and Clear).
  ///
  /// Set the color for drawing or filling rectangles, lines, and points, and for
  /// SDL_RenderClear().
  ///
  /// \param renderer the rendering context
  /// \param r the red value used to draw on the rendering target
  /// \param g the green value used to draw on the rendering target
  /// \param b the blue value used to draw on the rendering target
  /// \param a the alpha value used to draw on the rendering target. Use
  /// SDL_SetRenderDrawBlendMode to specify how the alpha channel is
  /// used
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderDrawColorFloat
  /// \sa SDL_RenderClear
  /// \sa SDL_RenderFillRect
  /// \sa SDL_RenderFillRects
  /// \sa SDL_RenderLine
  /// \sa SDL_RenderLines
  /// \sa SDL_RenderPoint
  /// \sa SDL_RenderPoints
  /// \sa SDL_RenderRect
  /// \sa SDL_RenderRects
  /// \sa SDL_SetRenderDrawColor
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderDrawColorFloat(SDL_Renderer *renderer, float r, float g, float b, float a)
  /// ```
  int setDrawColorFloat(double r, double g, double b, double a) {
    return sdlSetRenderDrawColorFloat(this, r, g, b, a);
  }

  ///
  /// Get the color used for drawing operations (Rect, Line and Clear).
  ///
  /// \param renderer the rendering context
  /// \param r a pointer filled in with the red value used to draw on the
  /// rendering target
  /// \param g a pointer filled in with the green value used to draw on the
  /// rendering target
  /// \param b a pointer filled in with the blue value used to draw on the
  /// rendering target
  /// \param a a pointer filled in with the alpha value used to draw on the
  /// rendering target; usually `SDL_ALPHA_OPAQUE` (255)
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderDrawColorFloat
  /// \sa SDL_SetRenderDrawColor
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderDrawColor(SDL_Renderer *renderer, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a)
  /// ```
  int getDrawColor(Pointer<SdlColor> color) {
    var rPointer = calloc<Uint8>();
    var gPointer = calloc<Uint8>();
    var bPointer = calloc<Uint8>();
    var aPointer = calloc<Uint8>();
    var result =
        sdlGetRenderDrawColor(this, rPointer, gPointer, bPointer, aPointer);
    color.ref.r = rPointer.value;
    color.ref.g = gPointer.value;
    color.ref.b = bPointer.value;
    color.ref.a = aPointer.value;
    calloc.free(rPointer);
    calloc.free(gPointer);
    calloc.free(bPointer);
    calloc.free(aPointer);
    return result;
  }

  ///
  /// Get the color used for drawing operations (Rect, Line and Clear).
  ///
  /// \param renderer the rendering context
  /// \param r a pointer filled in with the red value used to draw on the
  /// rendering target
  /// \param g a pointer filled in with the green value used to draw on the
  /// rendering target
  /// \param b a pointer filled in with the blue value used to draw on the
  /// rendering target
  /// \param a a pointer filled in with the alpha value used to draw on the
  /// rendering target
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderDrawColorFloat
  /// \sa SDL_GetRenderDrawColor
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderDrawColorFloat(SDL_Renderer *renderer, float *r, float *g, float *b, float *a)
  /// ```
  int getDrawColorFloat(Pointer<SdlFColor> color) {
    var rPointer = calloc<Float>();
    var gPointer = calloc<Float>();
    var bPointer = calloc<Float>();
    var aPointer = calloc<Float>();
    var result = sdlGetRenderDrawColorFloat(
        this, rPointer, gPointer, bPointer, aPointer);
    color.ref.r = rPointer.value;
    color.ref.g = gPointer.value;
    color.ref.b = bPointer.value;
    color.ref.a = aPointer.value;
    calloc.free(rPointer);
    calloc.free(gPointer);
    calloc.free(bPointer);
    calloc.free(aPointer);
    return result;
  }

  ///
  /// Set the color scale used for render operations.
  ///
  /// The color scale is an additional scale multiplied into the pixel color
  /// value while rendering. This can be used to adjust the brightness of colors
  /// during HDR rendering, or changing HDR video brightness when playing on an
  /// SDR display.
  ///
  /// The color scale does not affect the alpha channel, only the color
  /// brightness.
  ///
  /// \param renderer the rendering context
  /// \param scale the color scale value
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderColorScale
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderColorScale(SDL_Renderer *renderer, float scale)
  /// ```
  int setColorScale(double scale) {
    return sdlSetRenderColorScale(this, scale);
  }

  ///
  /// Get the color scale used for render operations.
  ///
  /// \param renderer the rendering context
  /// \param scale a pointer filled in with the current color scale value
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderColorScale
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderColorScale(SDL_Renderer *renderer, float *scale)
  /// ```
  double getColorScale() {
    var scalePointer = calloc<Float>();
    sdlGetRenderColorScale(this, scalePointer);
    var result = scalePointer.value;
    calloc.free(scalePointer);
    return result;
  }

  ///
  /// Set the blend mode used for drawing operations (Fill and Line).
  ///
  /// If the blend mode is not supported, the closest supported mode is chosen.
  ///
  /// \param renderer the rendering context
  /// \param blendMode the SDL_BlendMode to use for blending
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderDrawBlendMode
  /// \sa SDL_RenderLine
  /// \sa SDL_RenderLines
  /// \sa SDL_RenderPoint
  /// \sa SDL_RenderPoints
  /// \sa SDL_RenderRect
  /// \sa SDL_RenderRects
  /// \sa SDL_RenderFillRect
  /// \sa SDL_RenderFillRects
  ///
  /// ```c
  int setDrawBlendMode(int blendMode) {
    return sdlSetRenderDrawBlendMode(this, blendMode);
  }

  ///
  /// Get the blend mode used for drawing operations.
  ///
  /// \param renderer the rendering context
  /// \param blendMode a pointer filled in with the current SDL_BlendMode
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderDrawBlendMode
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderDrawBlendMode(SDL_Renderer *renderer, SDL_BlendMode *blendMode)
  /// ```
  int getDrawBlendMode() {
    var blendModePointer = calloc<Uint32>();
    sdlGetRenderDrawBlendMode(this, blendModePointer);
    var result = blendModePointer.value;
    calloc.free(blendModePointer);
    return result;
  }

  ///
  /// Clear the current rendering target with the drawing color.
  ///
  /// This function clears the entire rendering target, ignoring the viewport and
  /// the clip rectangle.
  ///
  /// \param renderer the rendering context
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_SetRenderDrawColor
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderClear(SDL_Renderer *renderer)
  /// ```
  int clear() {
    return sdlRenderClear(this);
  }

  ///
  /// Draw a point on the current rendering target at subpixel precision.
  ///
  /// \param renderer The renderer which should draw a point.
  /// \param x The x coordinate of the point.
  /// \param y The y coordinate of the point.
  /// \returns 0 on success, or -1 on error
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderPoint(SDL_Renderer *renderer, float x, float y)
  /// ```
  int point(math.Point<double> point) {
    return sdlRenderPoint(this, point.x, point.y);
  }

  ///
  /// Draw multiple points on the current rendering target at subpixel precision.
  ///
  /// \param renderer The renderer which should draw multiple points.
  /// \param points The points to draw
  /// \param count The number of points to draw
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderPoints(SDL_Renderer *renderer, const SDL_FPoint *points, int count)
  /// ```
  int points(List<math.Point<double>> points) {
    var pointsPointer = points.calloc();
    var result = sdlRenderPoints(this, pointsPointer, points.length);
    calloc.free(pointsPointer);
    return result;
  }

  ///
  /// Draw a line on the current rendering target at subpixel precision.
  ///
  /// \param renderer The renderer which should draw a line.
  /// \param x1 The x coordinate of the start point.
  /// \param y1 The y coordinate of the start point.
  /// \param x2 The x coordinate of the end point.
  /// \param y2 The y coordinate of the end point.
  /// \returns 0 on success, or -1 on error
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderLine(SDL_Renderer *renderer, float x1, float y1, float x2, float y2)
  /// ```
  int line(math.Point<double> p1, math.Point<double> p2) {
    return sdlRenderLine(this, p1.x, p1.y, p2.x, p2.y);
  }

  ///
  /// Draw a series of connected lines on the current rendering target at
  /// subpixel precision.
  ///
  /// \param renderer The renderer which should draw multiple lines.
  /// \param points The points along the lines
  /// \param count The number of points, drawing count-1 lines
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderLines(SDL_Renderer *renderer, const SDL_FPoint *points, int count)
  /// ```
  int lines(List<math.Point<double>> points) {
    var pointsPointer = points.calloc();
    var result = sdlRenderLines(this, pointsPointer, points.length);
    calloc.free(pointsPointer);
    return result;
  }

  ///
  /// Draw a rectangle on the current rendering target at subpixel precision.
  ///
  /// \param renderer The renderer which should draw a rectangle.
  /// \param rect A pointer to the destination rectangle, or NULL to outline the
  /// entire rendering target.
  /// \returns 0 on success, or -1 on error
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderRect(SDL_Renderer *renderer, const SDL_FRect *rect)
  /// ```
  int rect(math.Rectangle<double>? rect) {
    Pointer<SdlFRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.calloc();
    }
    var result = sdlRenderRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Draw some number of rectangles on the current rendering target at subpixel
  /// precision.
  ///
  /// \param renderer The renderer which should draw multiple rectangles.
  /// \param rects A pointer to an array of destination rectangles.
  /// \param count The number of rectangles.
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderRects(SDL_Renderer *renderer, const SDL_FRect *rects, int count)
  /// ```
  int rects(List<math.Rectangle<double>> rects) {
    var rectsPointer = rects.calloc();
    var result = sdlRenderRects(this, rectsPointer, rects.length);
    calloc.free(rectsPointer);
    return result;
  }

  ///
  /// Fill a rectangle on the current rendering target with the drawing color at
  /// subpixel precision.
  ///
  /// \param renderer The renderer which should fill a rectangle.
  /// \param rect A pointer to the destination rectangle, or NULL for the entire
  /// rendering target.
  /// \returns 0 on success, or -1 on error
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderFillRect(SDL_Renderer *renderer, const SDL_FRect *rect)
  /// ```
  int fillRect(math.Rectangle<double>? rect) {
    Pointer<SdlFRect> rectPointer = nullptr;
    if (rect != null) {
      rectPointer = rect.calloc();
    }
    var result = sdlRenderFillRect(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Fill some number of rectangles on the current rendering target with the
  /// drawing color at subpixel precision.
  ///
  /// \param renderer The renderer which should fill multiple rectangles.
  /// \param rects A pointer to an array of destination rectangles.
  /// \param count The number of rectangles.
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderFillRects(SDL_Renderer *renderer, const SDL_FRect *rects, int count)
  /// ```
  int fillRects(List<math.Rectangle<double>> rects) {
    var rectsPointer = rects.calloc();
    var result = sdlRenderFillRects(this, rectsPointer, rects.length);
    calloc.free(rectsPointer);
    return result;
  }

  ///
  /// Copy a portion of the texture to the current rendering target at subpixel
  /// precision.
  ///
  /// \param renderer The renderer which should copy parts of a texture.
  /// \param texture The source texture.
  /// \param srcrect A pointer to the source rectangle, or NULL for the entire
  /// texture.
  /// \param dstrect A pointer to the destination rectangle, or NULL for the
  /// entire rendering target.
  /// \returns 0 on success, or -1 on error
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderTexture(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, const SDL_FRect *dstrect)
  /// ```
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
    var result =
        sdlRenderTexture(this, texture, srcrectPointer, dstrectPointer);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    return result;
  }

  ///
  /// Copy a portion of the source texture to the current rendering target, with
  /// rotation and flipping, at subpixel precision.
  ///
  /// \param renderer The renderer which should copy parts of a texture.
  /// \param texture The source texture.
  /// \param srcrect A pointer to the source rectangle, or NULL for the entire
  /// texture.
  /// \param dstrect A pointer to the destination rectangle, or NULL for the
  /// entire rendering target.
  /// \param angle An angle in degrees that indicates the rotation that will be
  /// applied to dstrect, rotating it in a clockwise direction
  /// \param center A pointer to a point indicating the point around which
  /// dstrect will be rotated (if NULL, rotation will be done
  /// around dstrect.w/2, dstrect.h/2).
  /// \param flip An SDL_FlipMode value stating which flipping actions should be
  /// performed on the texture
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderTextureRotated(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_FRect *srcrect, const SDL_FRect *dstrect, const double angle, const SDL_FPoint *center, const SDL_FlipMode flip)
  /// ```
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
    var result = sdlRenderTextureRotated(this, texture, srcrectPointer,
        dstrectPointer, angle, centerPointer, flip);
    calloc.free(srcrectPointer);
    calloc.free(dstrectPointer);
    calloc.free(centerPointer);
    return result;
  }

  ///
  /// Render a list of triangles, optionally using a texture and indices into the
  /// vertex array Color and alpha modulation is done per vertex
  /// (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  ///
  /// \param renderer The rendering context.
  /// \param texture (optional) The SDL texture to use.
  /// \param vertices Vertices.
  /// \param num_vertices Number of vertices.
  /// \param indices (optional) An array of integer indices into the 'vertices'
  /// array, if NULL all vertices will be rendered in sequential
  /// order.
  /// \param num_indices Number of indices.
  /// \returns 0 on success, or -1 if the operation is not supported
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_RenderGeometryRaw
  /// \sa SDL_Vertex
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderGeometry(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Vertex *vertices, int num_vertices, const int *indices, int num_indices)
  /// ```
  int geometry(Pointer<SdlVertex> vertices, Pointer<SdlTexture> texture,
      int numVertices, Pointer<Int32> indices, int numIndices) {
    return sdlRenderGeometry(
        this, texture, vertices, numVertices, indices, numIndices);
  }

  ///
  /// Render a list of triangles, optionally using a texture and indices into the
  /// vertex arrays Color and alpha modulation is done per vertex
  /// (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  ///
  /// \param renderer The rendering context.
  /// \param texture (optional) The SDL texture to use.
  /// \param xy Vertex positions
  /// \param xy_stride Byte size to move from one element to the next element
  /// \param color Vertex colors (as SDL_Color)
  /// \param color_stride Byte size to move from one element to the next element
  /// \param uv Vertex normalized texture coordinates
  /// \param uv_stride Byte size to move from one element to the next element
  /// \param num_vertices Number of vertices.
  /// \param indices (optional) An array of indices into the 'vertices' arrays,
  /// if NULL all vertices will be rendered in sequential order.
  /// \param num_indices Number of indices.
  /// \param size_indices Index size: 1 (byte), 2 (short), 4 (int)
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_RenderGeometry
  /// \sa SDL_Vertex
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderGeometryRaw(SDL_Renderer *renderer, SDL_Texture *texture, const float *xy, int xy_stride, const SDL_Color *color, int color_stride, const float *uv, int uv_stride, int num_vertices, const void *indices, int num_indices, int size_indices)
  /// ```
  int geometryRaw(
      Pointer<SdlTexture> texture,
      Pointer<Float> xy,
      int xyStride,
      Pointer<SdlColor> color,
      int colorStride,
      Pointer<Float> uv,
      int uvStride,
      int numVertices,
      Pointer<NativeType> indices,
      int numIndices,
      int sizeIndices) {
    return sdlRenderGeometryRaw(this, texture, xy, xyStride, color, colorStride,
        uv, uvStride, numVertices, indices, numIndices, sizeIndices);
  }

  ///
  /// Render a list of triangles, optionally using a texture and indices into the
  /// vertex arrays Color and alpha modulation is done per vertex
  /// (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  ///
  /// \param renderer The rendering context.
  /// \param texture (optional) The SDL texture to use.
  /// \param xy Vertex positions
  /// \param xy_stride Byte size to move from one element to the next element
  /// \param color Vertex colors (as SDL_FColor)
  /// \param color_stride Byte size to move from one element to the next element
  /// \param uv Vertex normalized texture coordinates
  /// \param uv_stride Byte size to move from one element to the next element
  /// \param num_vertices Number of vertices.
  /// \param indices (optional) An array of indices into the 'vertices' arrays,
  /// if NULL all vertices will be rendered in sequential order.
  /// \param num_indices Number of indices.
  /// \param size_indices Index size: 1 (byte), 2 (short), 4 (int)
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_RenderGeometry
  /// \sa SDL_Vertex
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderGeometryRawFloat(SDL_Renderer *renderer, SDL_Texture *texture, const float *xy, int xy_stride, const SDL_FColor *color, int color_stride, const float *uv, int uv_stride, int num_vertices, const void *indices, int num_indices, int size_indices)
  /// ```
  int geometryRawFloat(
      Pointer<SdlTexture> texture,
      Pointer<Float> xy,
      int xyStride,
      Pointer<SdlFColor> color,
      int colorStride,
      Pointer<Float> uv,
      int uvStride,
      int numVertices,
      Pointer<NativeType> indices,
      int numIndices,
      int sizeIndices) {
    return sdlRenderGeometryRawFloat(
        this,
        texture,
        xy,
        xyStride,
        color,
        colorStride,
        uv,
        uvStride,
        numVertices,
        indices,
        numIndices,
        sizeIndices);
  }

  Pointer<SdlSurface> readPixels(math.Rectangle<double> rect) {
    var rectPointer = rect.callocInt();
    var result = sdlRenderReadPixels(this, rectPointer);
    calloc.free(rectPointer);
    return result;
  }

  ///
  /// Update the screen with any rendering performed since the previous call.
  ///
  /// SDL's rendering functions operate on a backbuffer; that is, calling a
  /// rendering function such as SDL_RenderLine() does not directly put a line on
  /// the screen, but rather updates the backbuffer. As such, you compose your
  /// entire scene and *present* the composed backbuffer to the screen as a
  /// complete picture.
  ///
  /// Therefore, when using SDL's rendering API, one does all drawing intended
  /// for the frame, and then calls this function once per frame to present the
  /// final drawing to the user.
  ///
  /// The backbuffer should be considered invalidated after each present; do not
  /// assume that previous contents will exist between frames. You are strongly
  /// encouraged to call SDL_RenderClear() to initialize the backbuffer before
  /// starting each new frame's drawing, even if you plan to overwrite every
  /// pixel.
  ///
  /// \param renderer the rendering context
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \threadsafety You may only call this function on the main thread.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_RenderClear
  /// \sa SDL_RenderLine
  /// \sa SDL_RenderLines
  /// \sa SDL_RenderPoint
  /// \sa SDL_RenderPoints
  /// \sa SDL_RenderRect
  /// \sa SDL_RenderRects
  /// \sa SDL_RenderFillRect
  /// \sa SDL_RenderFillRects
  /// \sa SDL_SetRenderDrawBlendMode
  /// \sa SDL_SetRenderDrawColor
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_RenderPresent(SDL_Renderer *renderer)
  /// ```
  void present() {
    sdlRenderPresent(this);
  }

  ///
  /// Destroy the rendering context for a window and free associated textures.
  ///
  /// If `renderer` is NULL, this function will return immediately after setting
  /// the SDL error message to "Invalid renderer". See SDL_GetError().
  ///
  /// \param renderer the rendering context
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_CreateRenderer
  ///
  /// ```c
  /// extern DECLSPEC void SDLCALL SDL_DestroyRenderer(SDL_Renderer *renderer)
  /// ```
  bool destroy() {
    if (this != nullptr) {
      sdlDestroyRenderer(this);
      return true;
    }
    return false;
  }

  ///
  /// Force the rendering context to flush any pending commands and state.
  ///
  /// You do not need to (and in fact, shouldn't) call this function unless you
  /// are planning to call into OpenGL/Direct3D/Metal/whatever directly, in
  /// addition to using an SDL_Renderer.
  ///
  /// This is for a very-specific case: if you are using SDL's render API, and
  /// you plan to make OpenGL/D3D/whatever calls in addition to SDL render API
  /// calls. If this applies, you should call this function between calls to
  /// SDL's render API and the low-level API you're using in cooperation.
  ///
  /// In all other cases, you can ignore this function.
  ///
  /// This call makes SDL flush any pending rendering work it was queueing up to
  /// do later in a single batch, and marks any internal cached state as invalid,
  /// so it'll prepare all its state again later, from scratch.
  ///
  /// This means you do not need to save state in your rendering code to protect
  /// the SDL renderer. However, there lots of arbitrary pieces of Direct3D and
  /// OpenGL state that can confuse things; you should use your best judgement
  /// and be prepared to make changes if specific state needs to be protected.
  ///
  /// \param renderer the rendering context
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_FlushRenderer(SDL_Renderer *renderer)
  /// ```
  int flush() {
    return sdlFlushRenderer(this);
  }

  ///
  /// Get the CAMetalLayer associated with the given Metal renderer.
  ///
  /// This function returns `void *`, so SDL doesn't have to include Metal's
  /// headers, but it can be safely cast to a `CAMetalLayer *`.
  ///
  /// \param renderer The renderer to query
  /// \returns a `CAMetalLayer *` on success, or NULL if the renderer isn't a
  /// Metal renderer
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderMetalCommandEncoder
  ///
  /// ```c
  /// extern DECLSPEC void *SDLCALL SDL_GetRenderMetalLayer(SDL_Renderer *renderer)
  /// ```
  Pointer<NativeType> getMetalLayer() {
    return sdlGetRenderMetalLayer(this);
  }

  ///
  /// Get the Metal command encoder for the current frame
  ///
  /// This function returns `void *`, so SDL doesn't have to include Metal's
  /// headers, but it can be safely cast to an `id<MTLRenderCommandEncoder>`.
  ///
  /// Note that as of SDL 2.0.18, this will return NULL if Metal refuses to give
  /// SDL a drawable to render to, which might happen if the window is
  /// hidden/minimized/offscreen. This doesn't apply to command encoders for
  /// render targets, just the window's backbuffer. Check your return values!
  ///
  /// \param renderer The renderer to query
  /// \returns an `id<MTLRenderCommandEncoder>` on success, or NULL if the
  /// renderer isn't a Metal renderer or there was an error.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// \sa SDL_GetRenderMetalLayer
  ///
  /// ```c
  /// extern DECLSPEC void *SDLCALL SDL_GetRenderMetalCommandEncoder(SDL_Renderer *renderer)
  /// ```
  Pointer<NativeType> getMetalCommandEncoder() {
    return sdlGetRenderMetalCommandEncoder(this);
  }

  ///
  /// Toggle VSync of the given renderer.
  ///
  /// \param renderer The renderer to toggle
  /// \param vsync 1 for on, 0 for off. All other values are reserved
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_SetRenderVSync(SDL_Renderer *renderer, int vsync)
  /// ```
  int setVSync(int vsync) {
    return sdlSetRenderVSync(this, vsync);
  }

  ///
  /// Get VSync of the given renderer.
  ///
  /// \param renderer The renderer to toggle
  /// \param vsync an int filled with 1 for on, 0 for off. All other values are
  /// reserved
  /// \returns 0 on success or a negative error code on failure; call
  /// SDL_GetError() for more information.
  ///
  /// \since This function is available since SDL 3.0.0.
  ///
  /// ```c
  /// extern DECLSPEC int SDLCALL SDL_GetRenderVSync(SDL_Renderer *renderer, int *vsync)
  /// ```
  int getVSync() {
    var vSyncPointer = calloc<Int32>();
    sdlGetRenderVSync(this, vSyncPointer);
    var result = vSyncPointer.value;
    calloc.free(vSyncPointer);
    return result;
  }
}
