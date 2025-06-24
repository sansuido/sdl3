part of '../sdl_gfx.dart';

List<List<int>> stackLine(List<int> p1, List<int> p2) {
  final stack = <List<int>>[];
  final dx = p2[0] - p1[0];
  final dy = p2[1] - p1[1];
  final length = math.sqrt(dx * dx + dy * dy).toInt();
  final rad = math.atan2(dy, dx);
  for (var l = 0; l < length; l++) {
    final x = p1[0] + l * math.cos(rad);
    final y = p1[1] + l * math.sin(rad);
    stack.add([x.toInt(), y.toInt()]);
  }
  return stack.toSet().toList();
}

List<List<int>> stackRectangle(List<int> p1, List<int> p2) {
  var stack = <List<int>>[];
  final int x1 = math.min(p1[0], p2[0]);
  final int y1 = math.min(p1[1], p2[1]);
  final int x2 = math.max(p1[0], p2[0]);
  final int y2 = math.max(p1[1], p2[1]);
  stack += stackLine([x1, y1], [x2, y1]);
  stack += stackLine([x2, y1], [x2, y2]);
  stack += stackLine([x2, y2], [x1, y2]);
  stack += stackLine([x1, y2], [x1, y1]);
  return stack.toSet().toList();
}

List<List<int>> stackPolygon(List<List<int>> points) {
  var stack = <List<int>>[];
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
  return stack.toSet().toList();
}
