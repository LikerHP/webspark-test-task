import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:webspark_test_task/app/screens/process/process_screen.dart';
import 'package:webspark_test_task/app/screens/process/process_view_model.dart';
import 'package:webspark_test_task/data/task/task.dart';
import 'package:webspark_test_task/data/task_repository/task_repository.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class ProcessRoutingArguments {
  const ProcessRoutingArguments({required this.baseUrl, required this.tasks});

  final String baseUrl;
  final List<Task> tasks;
}

class ProcessFactory {
  static Widget build(ProcessRoutingArguments args) {
    return ChangeNotifierProvider<ProcessViewModel>(
      create:
          (BuildContext context) => ProcessViewModel(
            routingArgs: args,
            navigationUtil: context.read<INavigationUtil>(),
            taskRepository: TaskRepository(client: http.Client()),
          ),
      child: Consumer<ProcessViewModel>(
        builder: (BuildContext context, ProcessViewModel model, Widget? child) {
          return ProcessScreen(viewModel: model);
        },
      ),
    );
  }
}
