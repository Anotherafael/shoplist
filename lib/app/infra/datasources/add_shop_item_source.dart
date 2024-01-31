import 'package:shoplist/app/domain/entities/shop_item_entity.dart';

abstract class IShopItemSource {
  Future<void> add(ShopItemEntity item);
  Future<List<ShopItemEntity>> fetch();
}

class ShopItemSource implements IShopItemSource {
  List<ShopItemEntity> shopItemList = [];

  @override
  Future<void> add(ShopItemEntity item) async {
    shopItemList.add(item);
  }

  @override
  Future<List<ShopItemEntity>> fetch() {
    // TODO: implement fetch
    return Future.value(shopItemList);
  }
}
