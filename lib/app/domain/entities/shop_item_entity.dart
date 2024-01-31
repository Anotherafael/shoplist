// import 'category_entity.dart';

abstract class ShopItemEntity {
  String id;
  String name;
  // CategoryEntity category;

  ShopItemEntity({
    required this.id,
    required this.name,
    // required this.category,
  });
}
