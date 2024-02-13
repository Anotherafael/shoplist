import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';

import '../../infra/repositories/shop_item_repository_impl.dart';

class ShopItemNotifier extends StateNotifier<List<ShopItemModel>> {
  ShopItemNotifier() : super([]);

  final _repository = getIt<ShopItemRepository>();

  Future<void> fetch() async {
    final response = await _repository.fetch();
    response.fold(
      (l) => null,
      (r) {
        List<ShopItemModel> list = [];
        for (final element in r) {
          list.add(ShopItemModel.fromEntity(element));
        }

        state = list;
      },
    );
  }

  Future<void> add(ShopItemModel item) async {
    final response = await _repository.add(item);
    response.fold(
      (l) => null,
      (r) => null,
    );
  }

  Future<void> delete(ShopItemModel item) async {
    final response = await _repository.delete(item);
    response.fold(
      (l) => null,
      (r) => null,
    );
  }
}

final shopItemProvider =
    StateNotifierProvider<ShopItemNotifier, List<ShopItemModel>>(
  (ref) => ShopItemNotifier(),
);
