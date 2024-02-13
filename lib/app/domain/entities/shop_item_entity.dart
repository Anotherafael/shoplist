import 'package:equatable/equatable.dart';

import 'category_entity.dart';

abstract class ShopItemEntity extends Equatable {
  final String? id;
  final String name;
  final int quantity;
  final CategoryEntity category;

  const ShopItemEntity({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
}
