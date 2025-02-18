import 'dart:ffi';
import 'dart:math' as math show Rectangle, Point;
import 'package:ffi/ffi.dart' as ffi;
import '../sdl/sdl_rect.dart';
import '../../generated/struct_sdl.dart';

extension RectangleEx on math.Rectangle<double> {
  double get widthIn => width - 1;
  double get heightIn => height - 1;
  math.Point<double> get topLeftIn => math.Point<double>(left, top);
  math.Point<double> get topRightIn =>
      math.Point<double>((left + widthIn), top);
  math.Point<double> get bottomRightIn =>
      math.Point<double>((left + widthIn), (top + heightIn));
  math.Point<double> get bottomLeftIn =>
      math.Point<double>(left, (top + heightIn));

  // dependence package:ffi
  Pointer<SdlFRect> calloc() {
    var result =
        ffi.calloc<SdlFRect>()
          ..ref.x = left
          ..ref.y = top
          ..ref.w = width
          ..ref.h = height;
    return result;
  }

  Pointer<SdlRect> callocInt() {
    var result =
        ffi.calloc<SdlRect>()
          ..ref.x = left.toInt()
          ..ref.y = top.toInt()
          ..ref.w = width.toInt()
          ..ref.h = height.toInt();
    return result;
  }

  // utility
  math.Point<double> get size =>
      math.Point<double>(width.toDouble(), height.toDouble());
  math.Point<double> get center =>
      math.Point<double>(left + width / 2, top + height / 2);

  math.Rectangle<double> setX(double x) {
    return fromLTWH(math.Point<double>(x, top), size);
  }

  math.Rectangle<double> setY(double y) {
    return fromLTWH(math.Point<double>(left, y), size);
  }

  math.Rectangle<double> setWidth(double width_) {
    return fromLTWH(topLeft, math.Point<double>(width_, height));
  }

  math.Rectangle<double> setHeight(double height_) {
    return fromLTWH(topLeft, math.Point<double>(width, height_));
  }

  math.Rectangle<double> shift(math.Point<double> shift) {
    return fromLTWH(math.Point<double>(left + shift.x, top + shift.y), size);
  }

  math.Rectangle<double> centerOn(math.Point<double> center_) {
    return fromCenter(center_, size);
  }

  math.Rectangle<double> expansion(math.Point<double> value) {
    return fromCenter(
      center,
      math.Point<double>(width + value.x, height + value.y),
    );
  }

  math.Rectangle<double> expansionLT(math.Point<double> value) {
    return fromLTWH(
      topLeft,
      math.Point<double>(width + value.x, height + value.y),
    );
  }

  math.Rectangle<double> union(math.Rectangle<double> b) {
    var aPointer = callocInt();
    var bPointer = b.callocInt();
    var resultPointer = ffi.calloc<SdlRect>();
    aPointer.union(bPointer, resultPointer);
    var result = resultPointer.create();
    ffi.calloc.free(aPointer);
    ffi.calloc.free(bPointer);
    ffi.calloc.free(resultPointer);
    return result;
  }

  static math.Rectangle<double> fromCenter(
    math.Point<double> center,
    math.Point<double> size,
  ) {
    return math.Rectangle<double>.fromPoints(
      math.Point<double>(center.x - size.x / 2, center.y - size.y / 2),
      math.Point<double>(center.x + size.x / 2, center.y + size.y / 2),
    );
  }

  static math.Rectangle<double> fromLTWH(
    math.Point<double> topLeft,
    math.Point<double> size,
  ) {
    return math.Rectangle<double>(topLeft.x, topLeft.y, size.x, size.y);
  }
}

extension RectanglesEx on List<math.Rectangle<double>> {
  // dependence package:ffi
  Pointer<SdlFRect> calloc() {
    var rectsPointer = ffi.calloc<SdlFRect>(length);
    for (var n = 0; n < length; n++) {
      var rectPointer = rectsPointer + n;
      rectPointer.ref.x = this[n].left;
      rectPointer.ref.y = this[n].top;
      rectPointer.ref.w = this[n].width;
      rectPointer.ref.h = this[n].height;
    }
    return rectsPointer;
  }

  Pointer<SdlRect> callocInt() {
    var rectsPointer = ffi.calloc<SdlRect>(length);
    for (var n = 0; n < length; n++) {
      var rectPointer = rectsPointer + n;
      rectPointer.ref.x = this[n].left.toInt();
      rectPointer.ref.y = this[n].top.toInt();
      rectPointer.ref.w = this[n].width.toInt();
      rectPointer.ref.h = this[n].height.toInt();
    }
    return rectsPointer;
  }
}
