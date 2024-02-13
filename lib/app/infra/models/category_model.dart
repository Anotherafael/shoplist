import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/category_entity.dart';

class CategoryModel implements CategoryEntity {
  @override
  final String id;
  @override
  final String name;
  @override
  final IconData icon;
  @override
  final Color color;

  CategoryModel(
    icon,
    id, {
    required this.name,
    required this.color,
  })  : id = id ?? const Uuid().v4(),
        icon = icon ?? Icons.shopping_cart;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon.codePoint,
      'color': color.value,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      IconDataOutlined(map['icon']),
      map['id'],
      name: map['name'],
      color: Color(map['color']),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory CategoryModel.fromJson(String source) {
    return CategoryModel.fromMap(jsonDecode(source));
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      entity.icon,
      entity.id,
      name: entity.name,
      color: entity.color,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        color,
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}
