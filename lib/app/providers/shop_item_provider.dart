import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';

import '../domain/entities/shop_item_entity.dart';
import '../infra/repositories/shop_item_repository_impl.dart';

class ShopItemNotifier extends StateNotifier<List<ShopItemEntity>> {
  ShopItemNotifier() : super([]);

  final _repository = getIt<ShopItemRepository>();
  Future<void> fetch() async {
    final response = await _repository.fetch();
    response.fold(
      (l) => null,
      (r) => state = r,
    );
  }

  Future<void> add(ShopItemEntity item) async {
    final response = await _repository.add(item);
    response.fold(
      (l) => null,
      (r) => state = [...state, item],
    );
  }
}

final shopItemProvider =
    StateNotifierProvider<ShopItemNotifier, List<ShopItemEntity>>(
  (ref) => ShopItemNotifier(),
);
