import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/routing/route_constatnts.dart';

import '../../domain/routing/inavigation_util.dart';

class NavigationUtil extends INavigationUtil {
  static final NavigationUtil _instance = NavigationUtil._internal();

  NavigationUtil._internal();

  factory NavigationUtil() {
    return _instance;
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  bool get canPop => navigatorKey.currentState!.canPop();

  @override
  void navigateBack({data}) {
    navigatorKey.currentState!.pop(data);
  }

  @override
  void navigateBackUntilNamed(String named) {
    navigatorKey.currentState?.popUntil((route) {
      if (named == routeHome && route.settings.name == '/') return true;
      if (route.isFirst && route.settings.name == '/') return true;
      return named == route.settings.name;
    });
  }

  @override
  Future navigateTo<T extends Object?>(
    String routeName, {
    bool allowBackNavigation = true,
    data,
  }) async {
    if (allowBackNavigation == false) {
      return navigatorKey.currentState!.pushReplacementNamed(
        routeName,
        arguments: data,
      );
    }
    return navigatorKey.currentState!.pushNamed(routeName, arguments: data);
  }
}
