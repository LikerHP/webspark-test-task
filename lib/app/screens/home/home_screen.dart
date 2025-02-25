import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/common/widgets/main_outlined_button.dart';
import 'package:webspark_test_task/app/screens/home/home_view_model.dart';
import 'package:webspark_test_task/app/screens/home/widgets/text_filed_with_error_message.dart';

const String _screenTitle = 'Home screen';
const String _buttonTitle = 'Start counting progress';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.viewModel, super.key});

  final HomeViewModel viewModel;

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
        child: Column(
          children: [
            TextFieldWithErrorMessage(
              onUrlEntered: viewModel.onUrlEntered,
              onUrlSubmitted: viewModel.onUrlSubmitted,
              shouldShowErrorMessage: viewModel.shouldShowErrorMessage,
            ),
            const Spacer(),
            MainOutlinedButton(
              buttonText: _buttonTitle,
              isLoading: viewModel.isLoading,
              onPressed: viewModel.onStartProcessButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
