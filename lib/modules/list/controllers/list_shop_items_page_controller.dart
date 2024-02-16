import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';

import '../../../app/presenter/components/notification_in_app/notification_in_app.dart';
import '../../../app/presenter/core/injection_container.dart';
import '../../../app/presenter/core/navigation_service.dart';
import '../../../app/presenter/core/routes/route_strings.dart';
import '../../../app/providers/shop_item_provider.dart';

class ListPageController {
  ListPageController();

  final _navigationService = getIt<NavigationService>();

  void delete(WidgetRef ref, ShopItemModel shopItem) async {
    await ref.read(shopItemStateNotifierProvider.notifier).delete(shopItem);
    const NotificationInApp().show(
      title: "Item removido",
      context: _navigationService.navigatorKey.currentContext!,
      color: Colors.red.shade300,
    );
  }

  void pushToDetails(ShopItemModel shopItem) {
    _navigationService.toNamed(
      RouteStrings.detail,
      arguments: shopItem,
    );
  }
}
