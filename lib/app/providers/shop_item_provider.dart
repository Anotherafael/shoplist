import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/shop_item_entity.dart';
import '../presenter/notifiers/shop_item_notifier.dart';

final shopItemProvider =
    StateNotifierProvider<ShopItemNotifier, List<ShopItemEntity>>(
  (ref) => ShopItemNotifier(),
);
