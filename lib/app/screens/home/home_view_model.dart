import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/routing/route_constatnts.dart';
import 'package:webspark_test_task/app/screens/process/process_factory.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';
import 'package:webspark_test_task/domain/task_repository/itask_repository.dart';
import 'package:webspark_test_task/domain/task_repository/itask_response.dart';

const String _validationReferenceString = 'https://flutter.webspark.dev';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required INavigationUtil navigationUtil,
    required ITaskRepository taskRepository,
  }) : _navigationUtil = navigationUtil,
       _taskRepository = taskRepository;

  final INavigationUtil _navigationUtil;
  final ITaskRepository _taskRepository;

  String _url = '';
  String? errorMessage;
  bool _isLoading = false;
  bool _isUrlValid = false;
  bool _shouldShowErrorMessage = false;

  bool get isLoading => _isLoading;

  bool get shouldShowErrorMessage => _shouldShowErrorMessage;

  void onUrlEntered(String? url) {
    if ((url == null || url.isEmpty) && !_isUrlValid) {
      _shouldShowErrorMessage = false;
      _isUrlValid = false;
      updateUI();
    }
  }

  void onUrlSubmitted(String? enteredUrl) {
    if (enteredUrl == null || enteredUrl.isEmpty) {
      return;
    }
    _validateUrl(enteredUrl);
  }

  void _validateUrl(String url) {
    if (url.trim() == _validationReferenceString) {
      _url = url;
      _isUrlValid = true;
      _shouldShowErrorMessage = !_isUrlValid;
    } else {
      _isUrlValid = false;
      _shouldShowErrorMessage = !_isUrlValid;
    }
    updateUI();
  }

  Future<void> onStartProcessButtonPressed() async {
    _isLoading = true;
    updateUI();
    try {
      final ITaskResponse? taskResponse = await _taskRepository
          .fetchTasksToCalculate(baseUrl: _trimUrl(_url));

      if (taskResponse != null) {
        if (taskResponse.isError) {
          errorMessage = taskResponse.message;
          _isLoading = false;
          updateUI();
        } else {
          _navigationUtil.navigateTo(
            routeProcess,
            data: ProcessRoutingArguments(
              baseUrl: _url,
              tasks: taskResponse.tasks,
            ),
          );
        }
      }
    } catch (e) {
      _isLoading = false;
    }
  }

  /// Needed only for getting raw url to create [Uri.https]
  String _trimUrl(String url) {
    if (url.contains('https://')) {
      return url.replaceAll('https://', '');
    }
    return url;
  }

  void updateUI() {
    notifyListeners();
  }
}
