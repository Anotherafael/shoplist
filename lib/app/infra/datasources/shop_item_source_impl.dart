import 'package:shoplist/app/domain/core/error/failures.dart';
import 'package:shoplist/app/domain/entities/shop_item_entity.dart';
import 'package:shoplist/app/infra/core/http/http_client.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';

import '../../domain/datasources/shop_item_source.dart';

class ShopItemSource implements IShopItemSource {
  ShopItemSource({
    required this.httpClient,
  });

  List<ShopItemEntity> _shopItemList = [];
  HttpClient httpClient = getIt<HttpClient>();
  final _baseJson = 'shoplist';

  @override
  Future<List<ShopItemEntity>> fetch() async {
    final response = await httpClient.get('$_baseJson.json');

    if (response.statusCode != 200) {
      throw DatabaseFailure();
    }

    if (response.data.isEmpty || response.data == null) {
      return [];
    }

    final data = response.data;
    List<ShopItemEntity> tempShopItemList = [];
    for (var item in data.entries) {
      final shopItem = ShopItemModel.fromMap(item.value);
      tempShopItemList.add(shopItem);
    }
    _shopItemList = tempShopItemList;
    return _shopItemList;
  }

  @override
  Future<void> add(ShopItemEntity item) async {
    final response = await httpClient.post(
      '$_baseJson.json',
      data: ShopItemModel.fromEntity(item).toJson(),
    );

    if (response.statusCode != 200) {
      throw DatabaseFailure();
    }

    _shopItemList.add(item);
  }

  @override
  Future<void> delete(ShopItemEntity item) async {
    _shopItemList.removeWhere(
      (element) => element == ShopItemModel.fromEntity(item),
    );
  }
}
