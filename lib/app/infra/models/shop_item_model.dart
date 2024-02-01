import 'package:uuid/uuid.dart';

import '../../domain/entities/shop_item_entity.dart';

class ShopItemModel implements ShopItemEntity {
  ShopItemModel({
    required this.name,
    required this.quantity,
  }) : id = const Uuid().v4();

  @override
  String id;

  @override
  String name;

  @override
  int quantity;
}
