import 'package:flutter/material.dart';
import 'package:shoplist/app/infra/models/category_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../domain/enums/categories.dart';

Map<Categories, CategoryModel> categoriesMock = {
  Categories.fruitAndVegetables: CategoryModel(
    Symbols.nutrition,
    null,
    name: 'Frutas & Vegetais',
    color: const Color.fromARGB(199, 255, 0, 0),
  ),
  Categories.meat: CategoryModel(
    Symbols.kebab_dining,
    null,
    name: 'Carnes',
    color: const Color.fromARGB(199, 255, 255, 0),
  ),
  Categories.drinks: CategoryModel(
    Symbols.local_bar,
    null,
    name: 'Bebidas',
    color: const Color.fromARGB(199, 0, 255, 0),
  ),
  Categories.spices: CategoryModel(
    Symbols.grocery,
    null,
    name: 'Temperos',
    color: const Color.fromARGB(199, 255, 0, 255),
  ),
  Categories.food: CategoryModel(
    Symbols.lunch_dining,
    null,
    name: 'Comidas',
    color: const Color.fromARGB(199, 0, 255, 255),
  ),
  Categories.fastFood: CategoryModel(
    Symbols.fastfood,
    null,
    name: 'Comidas Rápidas',
    color: const Color.fromARGB(199, 255, 0, 255),
  ),
  Categories.dairy: CategoryModel(
    Symbols.water_full,
    null,
    name: 'Laticínios',
    color: const Color.fromARGB(199, 255, 255, 0),
  ),
  Categories.carbs: CategoryModel(
    Symbols.ramen_dining,
    null,
    name: 'Carboidratos',
    color: const Color.fromARGB(199, 0, 255, 255),
  ),
  Categories.grains: CategoryModel(
    Symbols.grain,
    null,
    name: 'Grãos',
    color: const Color.fromARGB(199, 255, 0, 0),
  ),
  Categories.sweets: CategoryModel(
    Symbols.cake,
    null,
    name: 'Doces',
    color: const Color.fromARGB(199, 0, 255, 0),
  ),
  Categories.convenience: CategoryModel(
    Symbols.local_convenience_store,
    null,
    name: 'Conveniência',
    color: const Color.fromARGB(199, 255, 0, 255),
  ),
  Categories.personalHygiene: CategoryModel(
    Symbols.health_and_beauty,
    null,
    name: 'Higiene Pessoal',
    color: const Color.fromARGB(199, 0, 255, 255),
  ),
  Categories.laundry: CategoryModel(
    Symbols.local_laundry_service,
    null,
    name: 'Lavanderia',
    color: const Color.fromARGB(199, 255, 0, 0),
  ),
  Categories.homeHygiene: CategoryModel(
    Symbols.cleaning_services,
    null,
    name: 'Higiene Doméstica',
    color: const Color.fromARGB(199, 0, 255, 0),
  ),
  Categories.others: CategoryModel(
    Symbols.more,
    null,
    name: 'Outros',
    color: const Color.fromARGB(199, 255, 0, 255),
  ),
};
