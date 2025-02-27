import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/app/screens/preview/preview_factory.dart';

class PreviewViewModel extends ChangeNotifier {
  PreviewViewModel({required PreviewRoutingArgs routingArgs})
    : _routingArgs = routingArgs;

  final PreviewRoutingArgs _routingArgs;

  int get gridColumnsAmount => _routingArgs.grid.first.length;

  String get path => _routingArgs.path;

  String getElementCoordinates(int index) {
    (int column, int row) coordinates = _getCoordinates(index);

    return '(${coordinates.$1},${coordinates.$2})';
  }

  bool isCoordinatesBlocked(int index) {
    (int column, int row) coordinates = _getCoordinates(index);

    final List<List<String>> splittedRows = _splitRows();

    return splittedRows[coordinates.$2][coordinates.$1] == 'X';
  }

  Color getCellColor({required int index, required bool isBlocked}) {
    if (isBlocked) {
      return Color(0xFF000000);
    }

    (int column, int row) coordinates = _getCoordinates(index);

    if (_routingArgs.startPoint.x == coordinates.$2 &&
        _routingArgs.startPoint.y == coordinates.$1) {
      return Color(0xFF64FFDA);
    }

    if (_routingArgs.endPoint.x == coordinates.$2 &&
        _routingArgs.endPoint.y == coordinates.$1) {
      return Color(0xFF009688);
    }

    final String coordinatesString = '(${coordinates.$2},${coordinates.$1})';
    final List<String> splittedPath = _routingArgs.path.split('->');

    if (splittedPath.contains(coordinatesString)) {
      return Color(0xFF4CAF50);
    }

    return Color(0xFFFFFFFF);
  }

  List<List<String>> _splitRows() {
    final List<List<String>> splittedRows = [];

    for (String row in _routingArgs.grid) {
      splittedRows.add(row.split(''));
    }

    return splittedRows;
  }

  (int column, int row) _getCoordinates(int index) {
    final int row = index ~/ _routingArgs.grid.first.length;
    final int column = (index % _routingArgs.grid.first.length).toInt();

    return (column, row);
  }
}
