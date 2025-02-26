import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/screens/result/result_factory.dart';
import 'package:webspark_test_task/data/task/solution.dart';
import 'package:webspark_test_task/data/task_repository/task_result.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class ResultViewModel extends ChangeNotifier {
  ResultViewModel({
    required INavigationUtil navigationUtil,
    required ResultRoutingArguments routingArgs,
  }) : _routingArgs = routingArgs,
       _navigationUtil = navigationUtil;

  final INavigationUtil _navigationUtil;
  final ResultRoutingArguments _routingArgs;

  int get tasksAmount => _routingArgs.answers.length;

  List<Solution> get solutions => _routingArgs.solutions;

  List<TaskResult> get answers => _routingArgs.answers;

  void onResultTapped(String id) {}
}
