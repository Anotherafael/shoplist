import 'package:flutter/material.dart';
import 'package:shoplist/modules/auth/pages/login_page.dart';
import 'package:shoplist/modules/detail/pages/detail_shop_item_page.dart';
import 'package:shoplist/modules/list/pages/list_shop_items_page.dart';
import 'package:shoplist/modules/splash/splash_page.dart';

import '../../../infra/models/shop_item_model.dart';
import '../../../../modules/add/pages/add_shop_item_page.dart';
import 'route_strings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteStrings.root:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );

      case RouteStrings.list:
        return MaterialPageRoute(
          builder: (context) => const ListShopItemsPage(),
        );

      case RouteStrings.add:
        return MaterialPageRoute(
          builder: (context) => const AddShopItemPage(),
        );

      case RouteStrings.detail:
        return MaterialPageRoute(
          builder: (context) => DetailShopItemPage(
            shopItem: args as ShopItemModel,
          ),
        );

      case RouteStrings.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
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
