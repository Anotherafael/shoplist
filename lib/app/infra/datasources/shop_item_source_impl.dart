import 'package:shoplist/app/domain/entities/shop_item_entity.dart';
import 'package:shoplist/app/infra/mocked_data/shopitems_mock.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';

import '../../domain/datasources/shop_item_source.dart';

class ShopItemSource implements IShopItemSource {
  List<ShopItemEntity> shopItemList = shopItemsMock;

  @override
  Future<void> add(ShopItemEntity item) async {
    shopItemList.add(item);
  }

  @override
  Future<List<ShopItemEntity>> fetch() {
    return Future.value(shopItemList as List<ShopItemModel>);
  }

  @override
  Future<void> delete(ShopItemEntity item) async {
    shopItemList.removeWhere((element) => element == item);
  }
}
