import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';

import '../presenter/notifiers/shop_item_notifier.dart';

final shopItemStateNotifierProvider =
    StateNotifierProvider<ShopItemNotifier, List<ShopItemModel>>(
  (ref) => ShopItemNotifier(),
);
