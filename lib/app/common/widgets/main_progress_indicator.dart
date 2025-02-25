import 'package:flutter/material.dart';

class MainProgressIndicator extends StatelessWidget {
  const MainProgressIndicator({
    this.size = const Size(150, 150),
    this.value,
    super.key,
  });

  final Size size;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Colors.blueAccent,
      backgroundColor: Colors.grey.shade300,
      constraints: BoxConstraints(minHeight: size.height, minWidth: size.width),
      value: value,
    );
  }
}
