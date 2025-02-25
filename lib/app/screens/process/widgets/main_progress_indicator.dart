import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/utils/process_utils.dart';

class MainProgressIndicator extends StatelessWidget {
  const MainProgressIndicator({required this.status, super.key});

  final ProcessStatus status;

  @override
  Widget build(BuildContext context) {
    final double screenWith = MediaQuery.sizeOf(context).width;
    return CircularProgressIndicator(
      color: Colors.blueAccent,
      backgroundColor: Colors.grey.shade300,
      constraints: BoxConstraints(
        minHeight: screenWith * 0.4,
        minWidth: screenWith * 0.4,
      ),
      value: ProcessUtils.getPercentageByStatus(status) / 100,
    );
  }
}
