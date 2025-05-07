import 'dart:math' as math;

List<List<int>> stackLine(List<int> p1, List<int> p2) {
  List<List<int>> stack = [];
  int dx = p2[0] - p1[0];
  int dy = p2[1] - p1[1];
  int length = math.sqrt(dx * dx + dy * dy).toInt();
  double rad = math.atan2(dy, dx);
  for (var l = 0; l < length; l++) {
    var x = p1[0] + l * math.cos(rad);
    var y = p1[1] + l * math.sin(rad);
    stack.add([x.toInt(), y.toInt()]);
  }
  return stack.toSet().toList();
}

List<List<int>> stackRectangle(List<int> p1, List<int> p2) {
  List<List<int>> stack = [];
  int x1 = math.min(p1[0], p2[0]);
  int y1 = math.min(p1[1], p2[1]);
  int x2 = math.max(p1[0], p2[0]);
  int y2 = math.max(p1[1], p2[1]);
  stack += stackLine([x1, y1], [x2, y1]);
  stack += stackLine([x2, y1], [x2, y2]);
  stack += stackLine([x2, y2], [x1, y2]);
  stack += stackLine([x1, y2], [x1, y1]);
  return stack.toSet().toList();
}

List<List<int>> stackPolygon(List<List<int>> points) {
  List<List<int>> stack = [];
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
