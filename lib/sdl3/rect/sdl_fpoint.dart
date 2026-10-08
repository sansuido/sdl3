part of '../sdl_rect.dart';

class SdlxFPoint {
  const SdlxFPoint(this.x, this.y);

  factory SdlxFPoint.fromPointer(Pointer<SdlFPoint> pointer) =>
      SdlxFPoint(pointer.ref.x, pointer.ref.y);

  final double x;
  final double y;

  static SdlxFPoint get zero => const SdlxFPoint(0, 0);

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
    for (var i = 0; i < length; i++) {
      final bufferPointer = buffersPointer + i;
      bufferPointer.ref.x = this[i].x;
      bufferPointer.ref.y = this[i].y;
    }
    return buffersPointer;
  }

  Pointer<Float> callocXy() {
    final buffersPointer = ffi.calloc<Float>(length * 2);
    for (var i = 0; i < length; i++) {
      (buffersPointer + i * 2).value = this[i].x;
      (buffersPointer + i * 2 + 1).value = this[i].y;
    }
    return buffersPointer;
  }
}
