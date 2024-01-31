import 'package:flutter/material.dart';
import 'package:shoplist/app/presenter/modules/list/pages/list_page.dart';
import 'package:shoplist/app/presenter/modules/splash/splash_page.dart';

import 'route_strings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case RouteStrings.root:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );

      case RouteStrings.list:
        return MaterialPageRoute(
          builder: (context) => const ListPage(),
        );

      case RouteStrings.add:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Add Item'),
            ),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      );
    });
  }
}
