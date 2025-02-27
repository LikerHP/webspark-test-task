import 'package:collection/collection.dart';
import 'package:webspark_test_task/app/utils/process_utils.dart';
import 'package:webspark_test_task/data/task/grid.dart';
import 'package:webspark_test_task/data/task/point.dart';
import 'package:webspark_test_task/data/task/solution.dart';
import 'package:webspark_test_task/data/task/task.dart';

class AStarAlgorithmHandler {
  AStarAlgorithmHandler({required this.tasks, required this.progressCallback});

  final List<Task> tasks;
  final Function(double) progressCallback;

  int _totalTasksCompleted = 0;

  List<Solution> startAlgorithm() {
    final List<Solution> solutions = [];

    for (Task task in tasks) {
      (String id, List<Point>? solution) taskSolution = _startAlgorithm(task);
      solutions.add(
        Solution(
          id: taskSolution.$1,
          path: ProcessUtils.getPathFromList(taskSolution.$2),
          steps: ProcessUtils.getStepsFromList(taskSolution.$2),
        ),
      );
    }

    return solutions;
  }

  (String id, List<Point>? solution) _startAlgorithm(Task task) {
    int exploredPointsAmount = 0;

    final Point startPoint = task.startPoint;
    final Point endPoint = task.endPoint;
    final Grid grid = _convertStringsIntoGrid(task.field);

    final estimatedTotalPoints = grid.estimateTotalCells(startPoint, endPoint);

    /// Need to store evaluated points
    final Set closedSet = {};

    /// Estimation of the cost from A to B through the current point
    final Map<Point, double> fScores = {};

    /// Const of movement, but in a grid is represents amount of steps from point A to current point in a specific time
    final Map<Point, double> gScores = {};
    final Map<Point, Point> previousPoint = {};

    /// Need to track neighbors of the current point for evaluation
    final PriorityQueue openList = PriorityQueue<Point>(
      (a, b) => (fScores[a] ?? double.infinity).compareTo(
        fScores[b] ?? double.infinity,
      ),
    );

    /// Initialize with starting point
    gScores[startPoint] = 0;
    fScores[startPoint] = _heuristic(startPoint, endPoint);
    openList.add(startPoint);

    _updateProgress(exploredPointsAmount, estimatedTotalPoints);

    while (openList.isNotEmpty) {
      /// Get the point with the lowest fScore
      final Point currentPoint = openList.removeFirst();

      exploredPointsAmount++;

      if (exploredPointsAmount % 10 == 0) {
        _updateProgress(exploredPointsAmount, estimatedTotalPoints);
      }

      /// If we reached the goal, reconstruct and return the path
      if (currentPoint == endPoint) {
        _totalTasksCompleted++;
        _updateProgress(exploredPointsAmount, estimatedTotalPoints);

        final (String id, List<Point>? steps) answer = reconstructPath(
          id: task.id,
          currentPoint: currentPoint,
          previousPoint: previousPoint,
        );

        return answer;
      }

      closedSet.add(currentPoint);

      /// Check all neighbors of the current node
      for (final neighbor in grid.getNeighbors(currentPoint)) {
        /// Skip already evaluated neighbors
        if (closedSet.contains(neighbor)) continue;

        /// Calculate tentative g-score (cost from startPoiny to neighbor through current)
        final tentativeGScore = (gScores[currentPoint] ?? double.infinity) + 1;

        if (!openList.contains(neighbor)) {
          openList.add(neighbor);
        }
        /// If this path to neighbor is worse, skip it
        else if (tentativeGScore >= (gScores[neighbor] ?? double.infinity)) {
          continue;
        }

        /// Recording the best path
        previousPoint[neighbor] = currentPoint;
        gScores[neighbor] = tentativeGScore;
        fScores[neighbor] = gScores[neighbor]! + _heuristic(neighbor, endPoint);
      }
    }
    return (task.id, null);
  }

  Grid _convertStringsIntoGrid(List<String> filed) {
    int amountOfRows = filed.length;
    int amountOfColumns = 0;
    final List<List<String>> splittedRows = [];

    /// Splitting the rows into separate strings
    for (String row in filed) {
      splittedRows.add(row.split(''));
    }
    amountOfRows = splittedRows.length;
    amountOfColumns = splittedRows.first.length;

    final List<Point> blockedPoints = [];
    for (int x = 0; x < splittedRows.length; x++) {
      for (int y = 0; y < splittedRows[x].length; y++) {
        if (splittedRows[y][x] == 'X') {
          blockedPoints.add(Point(x: y, y: x));
        }
      }
    }

    return Grid(
      width: amountOfColumns,
      height: amountOfRows,
      blockedPoints: blockedPoints.toSet(),
    );
  }

  /// Needed to calculate Manhattan distance (distance between start and end points ignoring obstacles)
  double _heuristic(Point start, Point end) {
    return (start.x - end.x).abs() + (start.y - end.y).abs().toDouble();
  }

  /// Reconstruct the path from start to goal
  (String id, List<Point>? solution) reconstructPath({
    required Map<Point, Point> previousPoint,
    required Point currentPoint,
    required String id,
  }) {
    final List<Point> path = [currentPoint];
    while (previousPoint.containsKey(currentPoint)) {
      currentPoint = previousPoint[currentPoint]!;
      path.add(currentPoint);
    }
    return (id, path);
  }

  void _updateProgress(int nodesExplored, int estimatedTotal) {
    /// Emulation of the real percentage of the algorithm execution
    double currentTaskProgress = nodesExplored / estimatedTotal;
    if (currentTaskProgress > 1.0) currentTaskProgress = 1.0;

    double overallPercentage =
        ((_totalTasksCompleted + currentTaskProgress) / tasks.length * 100) +
        33.3;

    progressCallback(overallPercentage);
  }
}
