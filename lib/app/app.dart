import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webspark_test_task/app/routing/routing.dart';
import 'package:webspark_test_task/app/screens/home/home_factory.dart';
import 'package:webspark_test_task/domain/routing/inavigation_util.dart';

const String appTitle = 'Webspark Test Task';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      onGenerateRoute:
          (RouteSettings settings) => Routing.onGenerateRoute(settings),
      navigatorKey: Provider.of<INavigationUtil>(context).navigatorKey,
      home: HomeFactory.build(),
    );
  }
}
