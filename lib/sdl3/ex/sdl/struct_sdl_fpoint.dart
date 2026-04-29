part of '../../sdl.dart';

class SdlxFPoint {
  SdlxFPoint(this.x, this.y);
  double x;
  double y;

  SdlxPoint toInt() => SdlxPoint(x.toInt(), y.toInt());

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
