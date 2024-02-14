import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';

import '../../infra/repositories/shop_item_repository_impl.dart';

class ShopItemNotifier extends StateNotifier<List<ShopItemModel>> {
  ShopItemNotifier() : super([]);

  final _repository = getIt<ShopItemRepository>();

  Future<List<ShopItemModel>> fetch() async {
    final response = await _repository.fetch();
    return response.fold(
      (l) {
        return state = [];
      },
      (r) {
        state = [];
        for (final element in r) {
          state.add(ShopItemModel.fromEntity(element));
        }
        return state;
      },
    );
  }

  void add(ShopItemModel item) async {
    final response = await _repository.add(item);
    response.fold(
      (l) => null,
      (r) {
        state = [...state, item];
      },
    );
  }

  void delete(ShopItemModel item) async {
    final response = await _repository.delete(item);
    response.fold(
      (l) => null,
      (r) => state.removeWhere((element) => element.id == item.id),
    );
  }
}

final shopItemProvider =
    StateNotifierProvider<ShopItemNotifier, List<ShopItemModel>>(
  (ref) => ShopItemNotifier(),
);
