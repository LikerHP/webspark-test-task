class Point {
  const Point({required this.x, required this.y});

  final int x;
  final int y;

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(x: json['x'] as int, y: json['y'] as int);
  }

  @override
  bool operator ==(Object other) =>
      other is Point && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);
}
