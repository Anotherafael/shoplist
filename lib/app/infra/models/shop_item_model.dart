import 'package:uuid/uuid.dart';

import '../../domain/entities/shop_item_entity.dart';

class ShopItemModel implements ShopItemEntity {
  ShopItemModel({
    required this.name,
  }) : id = const Uuid().v4();

  @override
  String id;

  @override
  String name;
}
