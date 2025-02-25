import 'package:webspark_test_task/domain/task_repository/itask_response.dart';

abstract interface class ITaskRepository {
  Future<ITaskResponse?> fetchTasksToCalculate({required String baseUrl});

  Future postTasksSolutions({required String baseUrl});
}
