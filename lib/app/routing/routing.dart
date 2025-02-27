import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/routing/route_constatnts.dart';
import 'package:webspark_test_task/app/screens/home/home_factory.dart';
import 'package:webspark_test_task/app/screens/preview/preview_factory.dart';
import 'package:webspark_test_task/app/screens/process/process_factory.dart';
import 'package:webspark_test_task/app/screens/result/result_factory.dart';

class Routing {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return _buildHomeScreen(settings);
      case routeProcess:
        return _buildProcessScreen(settings);
      case routeResultList:
        return _buildResultListScreen(settings);
      case routePreview:
        return _buildPreviewScreen(settings);
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

  static Widget buildHomeScreen() {
    return HomeFactory.build();
  }

  static MaterialPageRoute _buildHomeScreen(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return HomeFactory.build();
      },
    );
  }

  static MaterialPageRoute _buildProcessScreen(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ProcessFactory.build(
          settings.arguments as ProcessRoutingArguments,
        );
      },
    );
  }

  static MaterialPageRoute _buildResultListScreen(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ResultFactory.build(
          settings.arguments as ResultRoutingArguments,
        );
      },
    );
  }

  static MaterialPageRoute _buildPreviewScreen(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return PreviewFactory.build(settings.arguments as PreviewRoutingArgs);
      },
    );
  }
}
