import 'package:flutter/material.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({required this.value, super.key});

  final int value;

  @override
  Widget build(BuildContext context) {
    return Text('$value%', style: TextStyle(fontSize: 26));
  }
}
