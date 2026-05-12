part of '../sdl_gfx.dart';

List<SdlxFPoint> stackLine(SdlxFPoint p1, SdlxFPoint p2) {
  final stack = <SdlxFPoint>[];
  if (p1 == p2) {
    stack.add(p1);
  } else {
    final dx = p2.x - p1.x;
    final dy = p2.y - p1.y;
    final length = math.sqrt(dx * dx + dy * dy);
    final rad = math.atan2(dy, dx);
    for (var l = 0; l < length; l++) {
      final x = p1.x + l * math.cos(rad);
      final y = p1.y + l * math.sin(rad);
      stack.add(SdlxFPoint(x, y));
    }
  }
  return stack.toList().toList();
}

List<SdlxFPoint> stackRectangle(SdlxFPoint p1, SdlxFPoint p2) {
  var stack = <SdlxFPoint>[];
  final double x1 = math.min(p1.x, p2.x);
  final double y1 = math.min(p1.y, p2.y);
  final double x2 = math.max(p1.x, p2.x);
  final double y2 = math.max(p1.y, p2.y);
  stack += stackLine(SdlxFPoint(x1, y1), SdlxFPoint(x2, y1));
  stack += stackLine(SdlxFPoint(x2, y1), SdlxFPoint(x2, y2));
  stack += stackLine(SdlxFPoint(x2, y2), SdlxFPoint(x1, y2));
  stack += stackLine(SdlxFPoint(x1, y2), SdlxFPoint(x1, y1));
  return stack.toList().toList();
}

List<SdlxFPoint> stackPolygon(List<SdlxFPoint> points) {
  var stack = <SdlxFPoint>[];
  if (points.isEmpty) {
    return stack;
  } else if (points.length == 1) {
    return points;
  } else if (points.length == 2) {
    return stackLine(points[0], points[1]);
  }
  for (var i = 0; i < points.length; i++) {
    stack += stackLine(points[i], points[(i + 1) == points.length ? 0 : i + 1]);
  }
  return stack.toList().toList();
}
