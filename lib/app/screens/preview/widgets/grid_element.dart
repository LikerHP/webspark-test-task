import 'package:flutter/material.dart';

class GridElement extends StatelessWidget {
  const GridElement({
    required this.color,
    required this.coordinates,
    required this.columnsAmount,
    this.isBlocked = false,
    super.key,
  });

  final Color color;
  final bool isBlocked;
  final int columnsAmount;
  final String coordinates;

  @override
  Widget build(BuildContext context) {
    final double elementSize =
        MediaQuery.sizeOf(context).width * (1 / columnsAmount);
    return Container(
      width: elementSize,
      height: elementSize,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Center(
        child: Text(
          coordinates,
          style: TextStyle(
            fontSize: 18,
            color: isBlocked ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
