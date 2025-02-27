import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/screens/result/result_view_model.dart';
import 'package:webspark_test_task/app/screens/result/widgets/result_list_widget.dart';

const String _screenTitle = 'Result list screen';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.viewModel, super.key});

  final ResultViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_screenTitle),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: ListView.separated(
          itemCount: viewModel.solutionsLength,
          separatorBuilder: (_, int index) {
            return Container(
              height: 1,
              color: Colors.grey.shade600,
              width: MediaQuery.sizeOf(context).width,
            );
          },
          itemBuilder: (_, int index) {
            return ResultListWidget(
              result: viewModel.solutions[index].path,
              onTap:
                  () => viewModel.onResultTapped(viewModel.solutions[index].id),
            );
          },
        ),
      ),
    );
  }
}
