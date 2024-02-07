import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/infra/providers/shop_item_provider.dart';

class ListPageController {
  ListPageController();

  List<ShopItemModel> fetch(WidgetRef ref) {
    return ref.watch(shopItemProvider) as List<ShopItemModel>;
  }

  void delete(WidgetRef ref, ShopItemModel shopItem) {
    ref.read(shopItemProvider.notifier).delete(shopItem);
  }
}
