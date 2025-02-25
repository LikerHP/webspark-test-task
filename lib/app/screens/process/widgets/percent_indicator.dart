import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/utils/process_utils.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({
    required this.status,
    super.key,
  });

  final ProcessStatus status;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${ProcessUtils.getPercentageByStatus(status)}%',
      style: TextStyle(fontSize: 26),
    );
  }
}
