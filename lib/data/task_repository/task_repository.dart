import 'dart:convert';

import 'package:http/http.dart';
import 'package:webspark_test_task/data/task_repository/error_opload_response.dart';
import 'package:webspark_test_task/data/task_repository/successful_upload_response.dart';
import 'package:webspark_test_task/data/task_repository/task_response.dart';
import 'package:webspark_test_task/domain/task_repository/itask_repository.dart';
import 'package:webspark_test_task/domain/task_repository/itask_response.dart';
import 'package:webspark_test_task/domain/task_repository/iupload_response.dart';

const String _urlSubPath = '/flutter/api';

class TaskRepository implements ITaskRepository {
  TaskRepository({required Client client}) : _client = client;

  final Client _client;

  @override
  Future<ITaskResponse?> fetchTasksToCalculate({
    required String baseUrl,
  }) async {
    try {
      final Uri url = Uri.https(baseUrl, _urlSubPath);
      final Response response = await _client.get(url);

      if (response.statusCode == 200) {
        return TaskResponse.fromJson(jsonDecode(response.body));
      }

      return null;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<IUploadResponse?> postTasksSolutions({
    required String baseUrl,
    required List<Map<String, dynamic>> body,
  }) async {
    try {
      final Uri url = Uri.https(baseUrl, _urlSubPath);
      final Response response = await _client.post(
        url,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );

      final Map<String, dynamic> encodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      if (response.statusCode == 400 || response.statusCode == 500) {
        return ErrorUploadResponse.fromJson(encodedResponse);
      }
      if (response.statusCode == 200) {
        return SuccessfulUploadResponse.fromJson(encodedResponse);
      }

      return null;
    } catch (_) {
      rethrow;
    }
  }
}
