part of '../sdl_rect.dart';

class SdlxFRect {
  const SdlxFRect([this.x = 0, this.y = 0, this.w = 0, this.h = 0]);

  factory SdlxFRect.fromPointer(Pointer<SdlFRect> pointer) =>
      SdlxFRect(pointer.ref.x, pointer.ref.y, pointer.ref.w, pointer.ref.h);

  factory SdlxFRect.fromPosition(SdlxFPoint topLeft, SdlxFPoint size) =>
      SdlxFRect(topLeft.x, topLeft.y, size.x, size.y);

  factory SdlxFRect.fromPoints(SdlxFPoint p1, SdlxFPoint p2) {
    final left = math.min(p1.x, p2.x);
    final width = math.max(p1.x, p2.x) - left;
    final top = math.min(p1.y, p2.y);
    final height = math.max(p1.y, p2.y) - top;
    return SdlxFRect(left, top, width, height);
  }

  factory SdlxFRect.fromCenter({
    required SdlxFPoint center,
    required SdlxFPoint size,
  }) => SdlxFRect(
    center.x - size.x * 0.5,
    center.y - size.y * 0.5,
    size.x,
    size.y,
  );

  final double x;
  final double y;
  final double w;
  final double h;

  double get right => x + w;
  double get bottom => y + h;

  SdlxFPoint get size => SdlxFPoint(w, h);
  SdlxFPoint get topLeft => SdlxFPoint(x, y);
  SdlxFPoint get topRight => SdlxFPoint(right, y);
  SdlxFPoint get center => SdlxFPoint(x + w * 0.5, y + h * 0.5);
  SdlxFPoint get bottomRight => SdlxFPoint(right, bottom);
  SdlxFPoint get bottomLeft => SdlxFPoint(x, bottom);

  SdlxFRect copyWith({double? x, double? y, double? w, double? h}) =>
      SdlxFRect(x ?? this.x, y ?? this.y, w ?? this.w, h ?? this.h);

  SdlxFRect moveBy(SdlxFPoint offset) =>
      SdlxFRect(x + offset.x, y + offset.y, w, h);

  SdlxFRect moveTo(SdlxFPoint position) =>
      SdlxFRect(position.x, position.y, w, h);

  SdlxFRect sizeBy(SdlxFPoint offset) =>
      SdlxFRect(x, y, w + offset.x, h + offset.y);

  SdlxFRect sizeTo(SdlxFPoint newSize) => SdlxFRect(x, y, newSize.x, newSize.y);

  SdlxFRect withTopLeft(SdlxFPoint point) => SdlxFRect(point.x, point.y, w, h);

  SdlxFRect withTopRight(SdlxFPoint point) =>
      SdlxFRect(x, point.y, point.x - x, h);

  SdlxFRect withCenter(SdlxFPoint point) =>
      SdlxFRect(point.x - w * 0.5, point.y - h * 0.5, w, h);

  SdlxFRect withBottomRight(SdlxFPoint point) =>
      SdlxFRect(x, y, point.x - x, point.y - y);

  SdlxFRect withBottomLeft(SdlxFPoint point) =>
      SdlxFRect(point.x, y, w, point.y - y);

  SdlxRect toInt() => SdlxRect(x.toInt(), y.toInt(), w.toInt(), h.toInt());

  static SdlxFRect from({
    double x = 0,
    double y = 0,
    double w = 0,
    double h = 0,
  }) => SdlxFRect(x, y, w, h);

  Pointer<SdlFRect> calloc() {
    final pointer = ffi.calloc<SdlFRect>();
    pointer.ref.x = x;
    pointer.ref.y = y;
    pointer.ref.w = w;
    pointer.ref.h = h;
    return pointer;
  }

  SdlxFRect? intersection(SdlxFRect other) {
    final x0 = math.max(x, other.x);
    final x1 = math.min(x + w, other.x + other.w);
    if (x0 <= x1) {
      final y0 = math.max(y, other.y);
      final y1 = math.min(y + h, other.y + other.h);
      if (y0 <= y1) {
        return SdlxFRect(x0, y0, x1 - x0, y1 - y0);
      }
    }
    return null;
  }
}

extension SdlxFRectListExtension on List<SdlxFRect> {
  Pointer<SdlFRect> calloc() {
    final buffersPointer = ffi.calloc<SdlFRect>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.x = this[n].x;
      bufferPointer.ref.y = this[n].y;
      bufferPointer.ref.w = this[n].w;
      bufferPointer.ref.h = this[n].h;
    }
    return buffersPointer;
  }
}
