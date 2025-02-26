import 'package:flutter/material.dart';

class ResultListWidget extends StatelessWidget {
  const ResultListWidget({
    required this.onTap,
    required this.result,
    super.key,
  });

  final String result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child: Text(
            result,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
