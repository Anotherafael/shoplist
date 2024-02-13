import 'dart:convert';

import 'package:shoplist/app/infra/models/category_model.dart';

import '../../domain/entities/shop_item_entity.dart';

class ShopItemModel implements ShopItemEntity {
  ShopItemModel({
    this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  @override
  final String? id;

  @override
  final String name;

  @override
  final int quantity;

  @override
  final CategoryModel category;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'category': category.toMap(),
    };
  }

  factory ShopItemModel.fromMap(Map<String, dynamic> map) {
    return ShopItemModel(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      category: CategoryModel.fromMap(map['category']),
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory ShopItemModel.fromJson(String source) {
    return ShopItemModel.fromMap(jsonDecode(source));
  }

  factory ShopItemModel.fromEntity(ShopItemEntity entity) {
    return ShopItemModel(
      id: entity.id,
      name: entity.name,
      quantity: entity.quantity,
      category: CategoryModel.fromEntity(entity.category),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        quantity,
        category,
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}
