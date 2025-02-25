import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/routing/route_constatnts.dart';
import 'package:webspark_test_task/app/screens/process/process_factory.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';
import 'package:webspark_test_task/domain/task_repository/itask_repository.dart';

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
      final task = await _taskRepository.getTasksToCalculate(
        baseUrl: _trimUrl(_url),
      );
      _isLoading = false;
      updateUI();

      if (task != null) {
        _navigationUtil.navigateTo(
          routeProcess,
          data: ProcessRoutingArguments(baseUrl: _url),
        );
      }
    } catch (e) {
      _isLoading = false;
    }
  }

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
