part of '../../sdl.dart';

class SdlxFRect {
  SdlxFRect({this.x = 0, this.y = 0, this.w = 0, this.h = 0});
  double x;
  double y;
  double w;
  double h;

  double get right => x + w;
  double get bottom => y + h;

  SdlxFPoint get size => SdlxFPoint(w, h);
  set size(SdlxFPoint point) {
    w = point.x;
    h = point.y;
  }

  SdlxFPoint get topLeft => SdlxFPoint(x, y);
  set topLeft(SdlxFPoint point) {
    x = point.x;
    y = point.y;
  }

  SdlxFPoint get topRight => SdlxFPoint(right, y);
  set topRight(SdlxFPoint point) {
    w = point.x - x;
    y = point.y;
  }

  SdlxFPoint get center => SdlxFPoint(x + w * 0.5, y + h * 0.5);
  set center(SdlxFPoint point) {
    x = point.x - w * 0.5;
    y = point.y - h * 0.5;
  }

  SdlxFPoint get bottomRight => SdlxFPoint(right, bottom);
  set bottomRight(SdlxFPoint point) {
    w = point.x - x;
    h = point.y - y;
  }

  SdlxFPoint get bottomLeft => SdlxFPoint(x, bottom);
  set bottomLeft(SdlxFPoint point) {
    x = point.x;
    h = point.y - y;
  }

  void moveBy(SdlxFPoint offset) {
    x += offset.x;
    y += offset.y;
  }

  void moveTo(SdlxFPoint position) {
    x = position.x;
    y = position.y;
  }

  void sizeBy(SdlxFPoint offset) {
    w += offset.x;
    h += offset.y;
  }

  void sizeTo(SdlxFPoint size) {
    w = size.x;
    h = size.y;
  }

  SdlxRect toInt() =>
      SdlxRect(x: x.toInt(), y: y.toInt(), w: w.toInt(), h: h.toInt());

  static SdlxFRect from(double x, double y, double w, double h) =>
      SdlxFRect(x: x, y: y, w: w, h: h);
  static SdlxFRect fromPosition(SdlxFPoint topLeft, SdlxFPoint size) =>
      SdlxFRect()..loadFromPosition(topLeft, size);
  static SdlxFRect fromPoints(SdlxFPoint p1, SdlxFPoint p2) =>
      SdlxFRect()..loadFromPoints(p1, p2);
  static SdlxFRect fromCenter(SdlxFPoint center, SdlxFPoint size) =>
      SdlxFRect()..loadFromCenter(center, size);
  static SdlxFRect fromRect(SdlxFRect rect) => SdlxFRect()..loadFromRect(rect);
  static SdlxFRect fromPointer(Pointer<SdlFRect> pointer) =>
      SdlxFRect()..loadFromPointer(pointer);

  void loadFrom(double x, double y, double w, double h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void loadFromPosition(SdlxFPoint topLeft, SdlxFPoint size) {
    this.topLeft = topLeft;
    this.size = size;
  }

  void loadFromPoints(SdlxFPoint p1, SdlxFPoint p2) {
    final left = math.min(p1.x, p2.x);
    final width = math.max(p1.x, p2.x) - left;
    final top = math.min(p1.y, p2.y);
    final height = math.max(p1.y, p2.y) - top;
    x = left;
    y = top;
    w = width;
    h = height;
  }

  void loadFromCenter(SdlxFPoint center, SdlxFPoint size) {
    loadFromPoints(
      SdlxFPoint(center.x - size.x / 2, center.y - size.y / 2),
      SdlxFPoint(center.x + size.x / 2, center.y + size.y / 2),
    );
  }

  void loadFromRect(SdlxFRect rect) {
    x = rect.x;
    y = rect.y;
    w = rect.w;
    h = rect.h;
  }

  void loadFromPointer(Pointer<SdlFRect> pointer) {
    x = pointer.ref.x;
    y = pointer.ref.y;
    w = pointer.ref.w;
    h = pointer.ref.h;
  }

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
        return SdlxFRect(x: x0, y: y0, w: x1 - x0, h: y1 - y0);
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
