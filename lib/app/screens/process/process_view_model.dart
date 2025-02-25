import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/utils/process_utils.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class ProcessViewModel extends ChangeNotifier {
  ProcessViewModel({required INavigationUtil navigationUtil})
    : _navigationUtil = navigationUtil {
    _onScreenOpened();
  }

  final INavigationUtil _navigationUtil;

  ProcessStatus _status = ProcessStatus.receivingData;

  ProcessStatus get status => _status;

  bool _isCalculationsFinished = false;

  bool get isCalculationsFinished => _isCalculationsFinished;

  Future<void> _onScreenOpened() async {

  }

  Future<void> onSendResultsButtonPressed() async {}

  void updateUI() {
    notifyListeners();
  }
}
