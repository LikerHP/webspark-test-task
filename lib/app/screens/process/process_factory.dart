import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test_task/app/screens/process/process_screen.dart';
import 'package:webspark_test_task/app/screens/process/process_view_model.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class ProcessRoutingArguments {
  const ProcessRoutingArguments({required this.baseUrl});

  final String baseUrl;
}

class ProcessFactory {
  static Widget build(ProcessRoutingArguments args) {
    return ChangeNotifierProvider<ProcessViewModel>(
      create:
          (BuildContext context) =>
              ProcessViewModel(navigationUtil: context.read<INavigationUtil>()),
      child: Consumer<ProcessViewModel>(
        builder: (BuildContext context, ProcessViewModel model, Widget? child) {
          return ProcessScreen(viewModel: model);
        },
      ),
    );
  }
}
