import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/routing/route_constatnts.dart';
import 'package:webspark_test_task/app/screens/process/process_factory.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required INavigationUtil navigationUtil})
    : _navigationUtil = navigationUtil;

  final INavigationUtil _navigationUtil;

  String _url = '';
  bool _isUrlValid = false;
  bool _shouldShowErrorMessage = false;

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
    if (url == 'https://flutter.webspark.dev/') {
      _url = url;
      _isUrlValid = true;
      _shouldShowErrorMessage = !_isUrlValid;
    } else {
      _isUrlValid = false;
      _shouldShowErrorMessage = !_isUrlValid;
    }
    updateUI();
  }

  void onStartProcessButtonPressed() {
    if (_isUrlValid) {
      _navigationUtil.navigateTo(
        routeProcess,
        data: ProcessRoutingArguments(baseUrl: _url),
      );
    }
  }

  void updateUI() {
    notifyListeners();
  }
}
