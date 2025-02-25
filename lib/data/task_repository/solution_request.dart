import 'package:webspark_test_task/domain/task_repository/isolution_request.dart';

class SolutionRequest implements ISolutionRequest {
  const SolutionRequest({required this.id});

  @override
  final String id;
}
