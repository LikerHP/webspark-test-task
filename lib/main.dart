import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test_task/app/app.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

import 'app/routing/navigation_util.dart';

void main() {
  final INavigationUtil navigationUtil = NavigationUtil();

  runApp(
    MultiProvider(
      providers: [Provider<INavigationUtil>.value(value: navigationUtil)],
      child: const MyApp(),
    ),
  );
}
