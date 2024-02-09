import 'package:flutter/material.dart';

abstract class CategoryEntity {
  String id;
  String name;
  IconData icon;
  Color color;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
