import 'package:webspark_test_task/data/task/task.dart';

abstract interface class ITaskResponse {
  const ITaskResponse({
    required this.tasks,
    required this.message,
    required this.isError,
  });

  final bool isError;
  final String message;
  final List<Task> tasks;
}
