import 'package:shoplist/app/domain/entities/shop_item_entity.dart';

abstract class IShopItemSource {
  Future<void> add(ShopItemEntity item);
  Future<void> delete(ShopItemEntity item);
  Future<List<ShopItemEntity>> fetch();
}
