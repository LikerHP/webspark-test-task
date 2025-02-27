import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/screens/preview/preview_view_model.dart';
import 'package:webspark_test_task/app/screens/preview/widgets/grid_element.dart';

const String _screenTitle = 'Preview screen';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({required this.viewModel, super.key});

  final PreviewViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_screenTitle),
      ),
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsetsDirectional.all(8),
            itemCount:
                viewModel.gridColumnsAmount * viewModel.gridColumnsAmount,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: viewModel.gridColumnsAmount,
            ),
            itemBuilder: (_, int index) {
              final bool isBlocked = viewModel.isCoordinatesBlocked(index);
              return GridElement(
                columnsAmount: viewModel.gridColumnsAmount,
                coordinates: viewModel.getElementCoordinates(index),
                isBlocked: isBlocked,
                color: viewModel.getCellColor(
                  index: index,
                  isBlocked: isBlocked,
                ),
              );
            },
          ),
          Text(
            viewModel.path,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
