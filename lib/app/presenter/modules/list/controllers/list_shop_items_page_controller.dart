import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/infra/providers/shop_item_provider.dart';

import '../../../core/injection_container.dart';
import '../../../core/navigation_service.dart';
import '../../../core/routes/route_strings.dart';

class ListPageController {
  ListPageController();

  final _navigationService = getIt<NavigationService>();

  List<ShopItemModel> fetch(WidgetRef ref) {
    return ref.watch(shopItemProvider) as List<ShopItemModel>;
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
