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
