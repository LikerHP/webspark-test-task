import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test_task/app/screens/result/result_screen.dart';
import 'package:webspark_test_task/app/screens/result/result_view_model.dart';
import 'package:webspark_test_task/data/task/solution.dart';
import 'package:webspark_test_task/data/task/task.dart';
import 'package:webspark_test_task/data/task_repository/task_result.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class ResultRoutingArguments {
  const ResultRoutingArguments({
    required this.tasks,
    required this.answers,
    required this.solutions,
  });

  final List<Task> tasks;
  final List<TaskResult> answers;
  final List<Solution> solutions;
}

class ResultFactory {
  static Widget build(ResultRoutingArguments args) {
    return ChangeNotifierProvider<ResultViewModel>(
      create: (BuildContext context) {
        return ResultViewModel(
          routingArgs: args,
          navigationUtil: context.read<INavigationUtil>(),
        );
      },
      child: Consumer<ResultViewModel>(
        builder: (context, model, child) {
          return ResultScreen(viewModel: model);
        },
      ),
    );
  }
}
