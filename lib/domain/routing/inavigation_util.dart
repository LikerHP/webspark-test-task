import 'package:flutter/material.dart';

abstract class INavigationUtil {
  GlobalKey<NavigatorState> get navigatorKey;

  bool get canPop;

  Future<dynamic> navigateTo<T extends Object?>(
    String routeName, {
    bool allowBackNavigation = true,
    dynamic data,
  });

  void navigateBack({data});
}
