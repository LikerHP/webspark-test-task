import 'package:webspark_test_task/data/task/task.dart';
import 'package:webspark_test_task/domain/task_repository/itask_response.dart';

class TaskResponse implements ITaskResponse {
  const TaskResponse({
    required this.tasks,
    required this.message,
    required this.isError,
  });

  @override
  final bool isError;

  @override
  final String message;

  @override
  final List<Task> tasks;

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    return TaskResponse(
      isError: json['error'] as bool,
      message: json['message'] as String,
      tasks:
          (json['data'] as List).isEmpty
              ? []
              : (json['data'] as List)
                  .map((element) => Task.fromJson(element))
                  .toList(),
    );
  }
}
