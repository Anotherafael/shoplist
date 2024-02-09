import 'package:shoplist/app/domain/entities/category_entity.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/shop_item_entity.dart';

class ShopItemModel implements ShopItemEntity {
  ShopItemModel({
    required this.name,
    required this.quantity,
    required this.category,
  }) : id = const Uuid().v4();

  @override
  String id;

  @override
  String name;

  @override
  int quantity;

  @override
  CategoryEntity category;
}
