import 'package:http/http.dart';
import 'package:webspark_test_task/domain/task_repository/itask_repository.dart';

const String _urlSubPath = '/flutter/api';

class TaskRepository implements ITaskRepository {
  TaskRepository({required Client client}) : _client = client;

  final Client _client;

  @override
  Future getTasksToCalculate({required String baseUrl}) async {
    try {
      final Uri url = Uri.https(baseUrl, _urlSubPath);
      final Response response = await _client.get(url);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future postTasksSolutions({required String baseUrl}) async {
    try {
      final Uri url = Uri.https(baseUrl, _urlSubPath);
      final Response response = await _client.post(url, body: {});
    } catch (_) {
      rethrow;
    }
  }
}
