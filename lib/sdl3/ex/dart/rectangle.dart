part of '../../sdl_dart.dart';

extension RectangleEx on math.Rectangle<double> {
  double get widthIn => width - 1;
  double get heightIn => height - 1;
  math.Point<double> get topLeftIn => math.Point<double>(left, top);
  math.Point<double> get topRightIn => math.Point<double>(left + widthIn, top);
  math.Point<double> get bottomRightIn =>
      math.Point<double>(left + widthIn, top + heightIn);
  math.Point<double> get bottomLeftIn =>
      math.Point<double>(left, top + heightIn);

  // dependence package:ffi
  Pointer<SdlFRect> calloc() {
    final result = ffi.calloc<SdlFRect>()
      ..ref.x = left
      ..ref.y = top
      ..ref.w = width
      ..ref.h = height;
    return result;
  }

  Pointer<SdlRect> callocInt() {
    final result = ffi.calloc<SdlRect>()
      ..ref.x = left.toInt()
      ..ref.y = top.toInt()
      ..ref.w = width.toInt()
      ..ref.h = height.toInt();
    return result;
  }

  // utility
  math.Point<double> get size => math.Point<double>(width, height);
  math.Point<double> get center =>
      math.Point<double>(left + width / 2, top + height / 2);

  math.Rectangle<double> setX(double x) =>
      fromLTWH(math.Point<double>(x, top), size);

  math.Rectangle<double> setY(double y) =>
      fromLTWH(math.Point<double>(left, y), size);

  math.Rectangle<double> setWidth(double width_) =>
      fromLTWH(topLeft, math.Point<double>(width_, height));

  math.Rectangle<double> setHeight(double height_) =>
      fromLTWH(topLeft, math.Point<double>(width, height_));

  math.Rectangle<double> shift(math.Point<double> shift) =>
      fromLTWH(math.Point<double>(left + shift.x, top + shift.y), size);

  math.Rectangle<double> centerOn(math.Point<double> center_) =>
      fromCenter(center_, size);

  math.Rectangle<double> expansion(math.Point<double> value) =>
      fromCenter(center, math.Point<double>(width + value.x, height + value.y));

  math.Rectangle<double> expansionLT(math.Point<double> value) =>
      fromLTWH(topLeft, math.Point<double>(width + value.x, height + value.y));

  bool hasIntersection(math.Rectangle<double> b) {
    final aPointer = calloc();
    final bPointer = b.calloc();
    final result = aPointer.hasIntersection(bPointer);
    ffi.calloc.free(aPointer);
    ffi.calloc.free(bPointer);
    return result;
  }

  math.Rectangle<double>? getUnion(math.Rectangle<double> b) {
    final aPointer = calloc();
    final bPointer = b.calloc();
    final resultPointer = ffi.calloc<SdlFRect>();
    final bl = aPointer.getUnion(bPointer, resultPointer);
    final result = resultPointer.create();
    ffi.calloc.free(aPointer);
    ffi.calloc.free(bPointer);
    ffi.calloc.free(resultPointer);
    if (bl) {
      return result;
    }
    return null;
  }

  static math.Rectangle<double> fromCenter(
    math.Point<double> center,
    math.Point<double> size,
  ) => math.Rectangle<double>.fromPoints(
    math.Point<double>(center.x - size.x / 2, center.y - size.y / 2),
    math.Point<double>(center.x + size.x / 2, center.y + size.y / 2),
  );

  static math.Rectangle<double> fromLTWH(
    math.Point<double> topLeft,
    math.Point<double> size,
  ) => math.Rectangle<double>(topLeft.x, topLeft.y, size.x, size.y);
}

extension RectanglesEx on List<math.Rectangle<double>> {
  // dependence package:ffi
  Pointer<SdlFRect> calloc() {
    final rectsPointer = ffi.calloc<SdlFRect>(length);
    for (var n = 0; n < length; n++) {
      final rectPointer = rectsPointer + n;
      rectPointer.ref.x = this[n].left;
      rectPointer.ref.y = this[n].top;
      rectPointer.ref.w = this[n].width;
      rectPointer.ref.h = this[n].height;
    }
    return rectsPointer;
  }

  Pointer<SdlRect> callocInt() {
    final rectsPointer = ffi.calloc<SdlRect>(length);
    for (var n = 0; n < length; n++) {
      final rectPointer = rectsPointer + n;
      rectPointer.ref.x = this[n].left.toInt();
      rectPointer.ref.y = this[n].top.toInt();
      rectPointer.ref.w = this[n].width.toInt();
      rectPointer.ref.h = this[n].height.toInt();
    }
    return rectsPointer;
  }
}
