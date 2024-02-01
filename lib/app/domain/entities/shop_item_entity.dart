// import 'category_entity.dart';

abstract class ShopItemEntity {
  String id;
  String name;
  int quantity;
  // CategoryEntity category;

  ShopItemEntity({
    required this.id,
    required this.name,
    required this.quantity,
    // required this.category,
  });
}
