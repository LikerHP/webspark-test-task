import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required INavigationUtil navigationUtil})
    : _navigationUtil = navigationUtil;

  final INavigationUtil _navigationUtil;

  String _url = '';
  bool shouldShowErrorMessage = false;

  void onUrlEntered(String? url) {
    if ((url == null || url.isEmpty) && shouldShowErrorMessage) {
      shouldShowErrorMessage = false;
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
    if (url.startsWith('https://flutter.webspark.dev')) {
      url = url;
      shouldShowErrorMessage = false;
    } else {
      shouldShowErrorMessage = true;
    }
    updateUI();
  }

  void updateUI() {
    notifyListeners();
  }
}
