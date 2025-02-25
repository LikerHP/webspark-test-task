import 'package:webspark_test_task/domain/task_repository/itask_response.dart';

class TaskResponse implements ITaskResponse {
  const TaskResponse({required this.isError, required this.message});

  @override
  final bool isError;

  @override
  final String message;
}
