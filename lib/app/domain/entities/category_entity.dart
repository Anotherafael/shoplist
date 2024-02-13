import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
