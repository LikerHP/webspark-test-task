import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/common/widgets/main_outlined_button.dart';
import 'package:webspark_test_task/app/screens/process/process_view_model.dart';
import 'package:webspark_test_task/app/common/widgets/main_progress_indicator.dart';
import 'package:webspark_test_task/app/screens/process/widgets/percent_indicator.dart';
import 'package:webspark_test_task/app/utils/process_utils.dart';

const String _screenTitle = 'Process screen';
const String _buttonTitle = 'Send results to server';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({required this.viewModel, super.key});

  final ProcessViewModel viewModel;

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
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            spacing: 18,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                ProcessUtils.getMessageForProgress(
                  progress: viewModel.processingProgress,
                  isErrorOccurred: viewModel.isErrorOccurred,
                  isUploadingData: viewModel.isUploadingResults,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              if (!viewModel.isUploadingResults || !viewModel.isErrorOccurred)
                PercentIndicator(value: viewModel.processingProgress),
              MainProgressIndicator(
                value:
                    viewModel.isUploadingResults
                        ? null
                        : viewModel.processingProgress.ceil() / 100,
              ),
              const Spacer(),
              if (viewModel.processingProgress >= 100)
                MainOutlinedButton(
                  isActive: !viewModel.isUploadingResults,
                  buttonText: _buttonTitle,
                  onPressed: viewModel.onSendResultsButtonPressed,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
