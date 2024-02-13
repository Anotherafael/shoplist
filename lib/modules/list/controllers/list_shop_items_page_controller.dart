import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/presenter/notifiers/shop_item_notifier.dart';

import '../../../app/presenter/core/injection_container.dart';
import '../../../app/presenter/core/navigation_service.dart';
import '../../../app/presenter/core/routes/route_strings.dart';

class ListPageController {
  ListPageController();

  final _navigationService = getIt<NavigationService>();

  Future<void> fetch(WidgetRef ref) =>
      ref.watch(shopItemProvider.notifier).fetch();

  List<ShopItemModel> getShopItems(WidgetRef ref) {
    fetch(ref);
    return ref.read(shopItemProvider);
  }

  void delete(WidgetRef ref, ShopItemModel shopItem) {
    ref.read(shopItemProvider.notifier).delete(shopItem);
  }

  void pushToDetails(ShopItemModel shopItem) {
    _navigationService.toNamed(
      RouteStrings.detail,
      arguments: shopItem,
    );
  }
}
