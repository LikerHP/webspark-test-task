import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test_task/app/screens/preview/preview_screen.dart';
import 'package:webspark_test_task/app/screens/preview/preview_view_model.dart';
import 'package:webspark_test_task/data/task/point.dart';

class PreviewRoutingArgs {
  const PreviewRoutingArgs({
    required this.id,
    required this.path,
    required this.grid,
    required this.steps,
    required this.endPoint,
    required this.startPoint,
  });

  final String id;
  final String path;
  final Point endPoint;
  final Point startPoint;
  final List<String> grid;
  final List<Map<String, String>> steps;
}

class PreviewFactory {
  static Widget build(PreviewRoutingArgs args) {
    return ChangeNotifierProvider<PreviewViewModel>(
      create: (_) {
        return PreviewViewModel(routingArgs: args);
      },
      child: Consumer<PreviewViewModel>(
        builder: (context, model, child) {
          return PreviewScreen(viewModel: model);
        },
      ),
    );
  }
}
