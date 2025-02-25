import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/common/widgets/main_text_field.dart';

const String _errorMessage = 'Set the valid base URL in order to continue';

class TextFieldWithErrorMessage extends StatelessWidget {
  const TextFieldWithErrorMessage({
    required this.onUrlEntered,
    required this.onUrlSubmitted,
    required this.shouldShowErrorMessage,
    super.key,
  });

  final bool shouldShowErrorMessage;
  final Function(String?) onUrlEntered;
  final Function(String?) onUrlSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        shouldShowErrorMessage
          ? Text(
            _errorMessage,
            maxLines: 2,
            style: TextStyle(fontSize: 18, color: Colors.black),
          )
        : const SizedBox(height: 26,),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.compare_arrows_outlined, color: Colors.grey.shade600),
            MainTextField(
              onUrlEntered: onUrlEntered,
              onUrlSubmitted: onUrlSubmitted,
            ),
          ],
        ),
      ],
    );
  }
}
