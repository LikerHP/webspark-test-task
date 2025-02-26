import 'package:webspark_test_task/data/task/point.dart';

class Grid {
  const Grid({
    required this.width,
    required this.height,
    required this.blockedPoints,
  });

  final int width;
  final int height;
  final Set<Point> blockedPoints;

  bool isValid(Point p) {
    return p.x >= 0 &&
        p.x < width &&
        p.y >= 0 &&
        p.y < height &&
        !blockedPoints.contains(p);
  }

  List<Point> getNeighbors(Point p) {
    final List<Point> neighbors = [
      /// Orthogonal
      Point(x: p.x + 1, y: p.y),
      Point(x: p.x - 1, y: p.y),
      Point(x: p.x, y: p.y + 1),
      Point(x: p.x, y: p.y - 1),

      /// Diagonal
      Point(x: p.x + 1, y: p.y + 1),
      Point(x: p.x - 1, y: p.y - 1),
      Point(x: p.x + 1, y: p.y - 1),
      Point(x: p.x - 1, y: p.y + 1),
    ];

    return neighbors.where(isValid).toList();
  }

  int estimateTotalCells(Point start, Point goal) {
    int manhattanDistance = (start.x - goal.x).abs() + (start.y - goal.y).abs();
    return manhattanDistance * 3;
  }
}
