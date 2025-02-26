import 'package:webspark_test_task/domain/task_repository/iupload_response.dart';

class ErrorUploadResponse implements IUploadResponse {
  const ErrorUploadResponse({
    required this.isError,
    required this.message,
    this.data = const {},
  });

  final bool isError;
  final String message;
  final Map<String, dynamic> data;

  factory ErrorUploadResponse.fromJson(Map<String, dynamic> json) {
    return ErrorUploadResponse(
      isError: json['error'],
      message: json['message'],
      data: json['data'] as Map<String, dynamic>,
    );
  }
}
