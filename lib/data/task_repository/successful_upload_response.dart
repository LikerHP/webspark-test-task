import 'package:webspark_test_task/data/task_repository/task_result.dart';
import 'package:webspark_test_task/domain/task_repository/iupload_response.dart';

class SuccessfulUploadResponse implements IUploadResponse {
  const SuccessfulUploadResponse({
    required this.isError,
    required this.message,
    required this.results,
  });

  final bool isError;
  final String message;
  final List<TaskResult> results;

  factory SuccessfulUploadResponse.fromJson(Map<String, dynamic> json) {
    return SuccessfulUploadResponse(
      isError: json['error'],
      message: json['message'],
      results:
          (json['data'] as List)
              .map(
                (element) =>
                    TaskResult.fromJson(element as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}
