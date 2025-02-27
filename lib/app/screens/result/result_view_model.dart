import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/routing/route_constatnts.dart';
import 'package:webspark_test_task/app/screens/preview/preview_factory.dart';
import 'package:webspark_test_task/app/screens/result/result_factory.dart';
import 'package:webspark_test_task/data/task/solution.dart';
import 'package:webspark_test_task/data/task/task.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class ResultViewModel extends ChangeNotifier {
  ResultViewModel({
    required INavigationUtil navigationUtil,
    required ResultRoutingArguments routingArgs,
  }) : _routingArgs = routingArgs,
       _navigationUtil = navigationUtil;

  final INavigationUtil _navigationUtil;
  final ResultRoutingArguments _routingArgs;

  int get solutionsLength => _routingArgs.solutions.length;

  List<Solution> get solutions => _routingArgs.solutions;


  void onResultTapped(String id) {
    _navigationUtil.navigateTo(
      routePreview,
      data: PreviewRoutingArgs(
        id: id,
        path:
            _routingArgs.solutions
                .firstWhere((Solution solution) => solution.id == id)
                .path,
        grid: _routingArgs.tasks.firstWhere((Task task) => task.id == id).field,
        steps:
            _routingArgs.solutions
                .firstWhere((Solution solution) => solution.id == id)
                .steps,
        endPoint:
            _routingArgs.tasks
                .firstWhere((Task task) => task.id == id)
                .endPoint,
        startPoint:
            _routingArgs.tasks
                .firstWhere((Task task) => task.id == id)
                .startPoint,
      ),
    );
  }
}
