import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/handlers/a_star_algorithm_handler.dart';
import 'package:webspark_test_task/app/routing/route_constatnts.dart';
import 'package:webspark_test_task/app/screens/process/process_factory.dart';
import 'package:webspark_test_task/app/screens/result/result_factory.dart';
import 'package:webspark_test_task/app/utils/process_utils.dart';
import 'package:webspark_test_task/app/utils/url_utils.dart';
import 'package:webspark_test_task/data/task/solution.dart';
import 'package:webspark_test_task/data/task_repository/error_opload_response.dart';
import 'package:webspark_test_task/data/task_repository/successful_upload_response.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';
import 'package:webspark_test_task/domain/task_repository/itask_repository.dart';
import 'package:webspark_test_task/domain/task_repository/iupload_response.dart';

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

  List<Solution> _solutions = [];
  double _processingProgress = 0.0;

  int get processingProgress => _processingProgress.ceil();

  bool _isUploadingResults = false;

  bool get isUploadingResults => _isUploadingResults;

  bool _isErrorOccurred = false;

  bool get isErrorOccurred => _isErrorOccurred;

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
      _solutions = handler.startAlgorithm();
    });
  }

  Future<void> onSendResultsButtonPressed() async {
    _isUploadingResults = true;
    updateUI();
    try {
      final IUploadResponse? response = await _taskRepository
          .postTasksSolutions(
            baseUrl: UrlUtils.trimUrl(_routingArgs.baseUrl),
            body: ProcessUtils.getBodyFromSolutions(_solutions),
          );

      _isUploadingResults = false;

      if (response is ErrorUploadResponse) {
        _isErrorOccurred = true;
        updateUI();
      }

      if (response is SuccessfulUploadResponse) {
        _isErrorOccurred =  false;
        updateUI();

        _navigateToAnswerScreenList(response);
      }
    } catch (e) {
      _isErrorOccurred = true;
      _isUploadingResults = false;
      updateUI();
    }
  }

  void _navigateToAnswerScreenList(SuccessfulUploadResponse answers) {
    _navigationUtil.navigateTo(
      routeResultList,
      data: ResultRoutingArguments(
        tasks: _routingArgs.tasks,
        answers: answers.results,
        solutions: _solutions,
      ),
    );
  }

  void updateUI() {
    notifyListeners();
  }
}
