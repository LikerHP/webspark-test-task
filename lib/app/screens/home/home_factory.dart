import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:webspark_test_task/app/screens/home/home_screen.dart';
import 'package:webspark_test_task/app/screens/home/home_view_model.dart';
import 'package:webspark_test_task/data/task_repository/task_repository.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

class HomeFactory {
  static Widget build() {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) {
        return HomeViewModel(
          navigationUtil: context.read<INavigationUtil>(),
          taskRepository: TaskRepository(client: http.Client()),
        );
      },
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return HomeScreen(viewModel: viewModel);
        },
      ),
    );
  }
}
