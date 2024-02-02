import 'package:shoplist/app/domain/entities/shop_item_entity.dart';
import 'package:shoplist/app/infra/mocked_data/shopitems_mock.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';

abstract class IShopItemSource {
  Future<void> add(ShopItemEntity item);
  Future<List<ShopItemEntity>> fetch();
}

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
}
