import 'package:webspark_test_task/domain/task_repository/itask_response.dart';
import 'package:webspark_test_task/domain/task_repository/iupload_response.dart';

abstract interface class ITaskRepository {
  Future<ITaskResponse?> fetchTasksToCalculate({required String baseUrl});

  Future<IUploadResponse?> postTasksSolutions({
    required String baseUrl,
    required List<Map<String, dynamic>> body,
  });
}
