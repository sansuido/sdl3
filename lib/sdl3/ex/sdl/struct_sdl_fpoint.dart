part of '../../sdl.dart';

class SdlxFPoint {
  SdlxFPoint(this.x, this.y);
  double x;
  double y;

  static SdlxFPoint get zero => SdlxFPoint(0, 0);

  SdlxPoint toInt() => SdlxPoint(x.toInt(), y.toInt());

  SdlxFPoint lerpTo(SdlxFPoint other, double t) =>
      SdlxFPoint(x + (other.x - x) * t, y + (other.y - y) * t);

  double distanceTo(SdlxFPoint other) => math.sqrt(distanceToSq(other));

  double distanceToSq(SdlxFPoint other) {
    final dx = x - other.x;
    final dy = y - other.y;
    return dx * dx + dy * dy;
  }

  double angleTo(SdlxFPoint other) => math.atan2(other.y - y, other.x - x);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SdlxFPoint && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  SdlxFPoint operator +(SdlxFPoint other) =>
      SdlxFPoint(x + other.x, y + other.y);
  SdlxFPoint operator -(SdlxFPoint other) =>
      SdlxFPoint(x - other.x, y - other.y);
  SdlxFPoint operator *(SdlxFPoint other) =>
      SdlxFPoint(x * other.x, y * other.y);
  SdlxFPoint operator /(SdlxFPoint other) =>
      SdlxFPoint(x / other.x, y / other.y);

  Pointer<SdlFPoint> calloc() {
    final pointer = ffi.calloc<SdlFPoint>();
    pointer.ref.x = x;
    pointer.ref.y = y;
    return pointer;
  }
}

extension SdlxFPointListExtension on List<SdlxFPoint> {
  List<SdlxPoint> toInt() {
    final points = <SdlxPoint>[];
    for (final point in this) {
      points.add(point.toInt());
    }
    return points;
  }

  Pointer<SdlFPoint> calloc() {
    final buffersPointer = ffi.calloc<SdlFPoint>(length);
    for (var n = 0; n < length; n++) {
      final bufferPointer = buffersPointer + n;
      bufferPointer.ref.x = this[n].x;
      bufferPointer.ref.y = this[n].y;
    }
    return buffersPointer;
  }
}
