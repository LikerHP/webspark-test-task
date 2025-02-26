import 'package:webspark_test_task/data/task/point.dart';
import 'package:webspark_test_task/data/task/solution.dart';

class ProcessUtils {
  static String getMessageForProgress({
    required int progress,
    bool isUploadingData = false,
    bool isErrorOccurred = false,
  }) {
    if (isUploadingData) {
      return 'Uploading results to server';
    }
    if(isErrorOccurred){
      return 'Oops, An error occurred during uploading results to server';
    }
    if (progress >= 100) {
      return 'All calculations has finished, you can send your results to server';
    } else {
      return 'Calculations in progress';
    }
  }

  static String getPathFromList(List<Point>? steps) {
    if (steps == null) {
      return 'No solution for task';
    }
    final List<String> path = [];
    for (final Point point in steps) {
      path.add('(${point.x},${point.y})');
    }
    return path.join('->');
  }

  static List<Map<String, String>> getStepsFromList(List<Point>? steps) {
    if (steps == null) {
      return [];
    }
    final List<Map<String, String>> stepsMapsList = [];
    for (final Point point in steps) {
      stepsMapsList.add({'x': '${point.x}', 'y': '${point.y}'});
    }
    return stepsMapsList;
  }

  static List<Map<String, dynamic>> getBodyFromSolutions(
    List<Solution> solutions,
  ) {
    final List<Map<String, dynamic>> body = [];

    for (Solution solution in solutions) {
      body.add({
        'id': solution.id,
        'result': {'steps': solution.steps, 'path': solution.path},
      });
    }
    return body;
  }
}
