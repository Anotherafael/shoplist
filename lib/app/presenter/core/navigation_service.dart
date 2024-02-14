import 'package:flutter/material.dart';

class NavigationService {
  NavigationService();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> toNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceToNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> removeToNamed(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void back() {
    return navigatorKey.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }
}
