import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/handlers/a_star_algorithm_handler.dart';
import 'package:webspark_test_task/app/screens/process/process_factory.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';
import 'package:webspark_test_task/domain/task_repository/itask_repository.dart';

class ProcessViewModel extends ChangeNotifier {
  ProcessViewModel({
    required INavigationUtil navigationUtil,
    required ITaskRepository taskRepository,
    required ProcessRoutingArguments routingArgs,
  }) : _routingArgs = routingArgs,
       _navigationUtil = navigationUtil,
       _taskRepository = taskRepository {
    _startCalculations();
  }

  final INavigationUtil _navigationUtil;
  final ITaskRepository _taskRepository;
  final ProcessRoutingArguments _routingArgs;

  double _processingProgress = 0.0;

  int get processingProgress => _processingProgress.ceil();

  void _updateProgressCallback(double progress) {
    _processingProgress = progress;
    updateUI();
  }

  Future _startCalculations() async {
    final AStarAlgorithmHandler handler = AStarAlgorithmHandler(
      tasks: _routingArgs.tasks,
      progressCallback: _updateProgressCallback,
    );

    /// Waiting for 1 second to give UI the time to draw
    Future.delayed(const Duration(seconds: 1), () {
      handler.startAlgorithm();
    });
  }

  Future<void> onSendResultsButtonPressed() async {}

  void updateUI() {
    notifyListeners();
  }
}
