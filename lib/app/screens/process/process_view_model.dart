import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/utils/process_utils.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';
import 'package:webspark_test_task/domain/task_repository/itask_repository.dart';

class ProcessViewModel extends ChangeNotifier {
  ProcessViewModel({
    required INavigationUtil navigationUtil,
    required ITaskRepository taskRepository,
  }) : _navigationUtil = navigationUtil,
       _taskRepository = taskRepository;

  final INavigationUtil _navigationUtil;
  final ITaskRepository _taskRepository;

  ProcessStatus _status = ProcessStatus.receivingData;

  ProcessStatus get status => _status;

  bool _isCalculationsFinished = false;

  bool get isCalculationsFinished => _isCalculationsFinished;

  Future<void> onSendResultsButtonPressed() async {}

  void updateUI() {
    notifyListeners();
  }
}
