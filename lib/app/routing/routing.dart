import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/routing/route_constatnts.dart';
import 'package:webspark_test_task/app/screens/home/home_factory.dart';

class Routing {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return _buildHomeScreen(settings);
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const Scaffold(
              body: Center(child: Text('Ooops, something went wrong')),
            );
          },
        );
    }
  }

  static MaterialPageRoute _buildHomeScreen(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return HomeFactory.build();
      },
    );
  }

  static Widget buildHomeScreen() {
    return HomeFactory.build();
  }
}
