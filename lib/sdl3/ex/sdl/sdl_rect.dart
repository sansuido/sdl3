import 'dart:ffi';
import 'dart:math' as math show Rectangle;

import '../../generated/lib_sdl_rect.dart';
import '../../generated/struct_sdl.dart';

extension SdlFRectPointerEx on Pointer<SdlFRect> {
  math.Rectangle<double> create() {
    return math.Rectangle<double>(ref.x, ref.y, ref.w, ref.h);
  }
}

extension SdlRectPointerEx on Pointer<SdlRect> {
  math.Rectangle<double> create() {
    return math.Rectangle<double>(
        ref.x.toDouble(), ref.y.toDouble(), ref.w.toDouble(), ref.h.toDouble());
  }

  bool hasIntersection(Pointer<SdlRect> b) {
    // 22
    return sdlHasRectIntersection(this, b);
  }

  bool getIntersection(Pointer<SdlRect> b, Pointer<SdlRect> result) {
    // 48
    return sdlGetRectIntersection(this, b, result);
  }

  int union(Pointer<SdlRect> b, Pointer<SdlRect> result) {
    // 71
    return sdlGetRectUnion(this, b, result);
  }

  bool getLineIntersection(Pointer<Int32> x1, Pointer<Int32> y1,
      Pointer<Int32> x2, Pointer<Int32> y2) {
    // 132
    return sdlGetRectAndLineIntersection(this, x1, y1, x2, y2);
  }
}
