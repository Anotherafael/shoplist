import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/category_entity.dart';

class CategoryModel implements CategoryEntity {
  @override
  String id;
  @override
  String name;
  @override
  IconData icon;
  @override
  Color color;

  CategoryModel(
    icon, {
    required this.name,
    required this.color,
  })  : id = const Uuid().v4(),
        icon = icon ?? Icons.shopping_cart;
}
