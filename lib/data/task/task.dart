import 'package:webspark_test_task/data/task/point.dart';

class Task {
  const Task({
    required this.id,
    required this.field,
    required this.endPoint,
    required this.startPoint,
  });

  final String id;
  final Point endPoint;
  final Point startPoint;
  final List<String> field;

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      endPoint: Point.fromJson(json['start']),
      startPoint: Point.fromJson(json['end']),
      field:
          (json['field'] as List).map((element) => element as String).toList(),
    );
  }
}
