import 'package:flutter/material.dart';
import 'package:shoplist/app/infra/models/category_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../models/enums/categories.dart';

Map<Categories, CategoryModel> categoriesMock = {
  Categories.fruitAndVegetables: CategoryModel(
    Symbols.nutrition,
    name: 'Frutas & Vegetais',
    color: const Color.fromARGB(199, 255, 0, 0),
  ),
  Categories.meat: CategoryModel(
    Symbols.kebab_dining,
    name: 'Carnes',
    color: const Color.fromARGB(199, 255, 255, 0),
  ),
  Categories.drinks: CategoryModel(
    Symbols.local_bar,
    name: 'Bebidas',
    color: const Color.fromARGB(199, 0, 255, 0),
  ),
  Categories.spices: CategoryModel(
    Symbols.grocery,
    name: 'Temperos',
    color: const Color.fromARGB(199, 255, 0, 255),
  ),
  Categories.food: CategoryModel(
    Symbols.lunch_dining,
    name: 'Comidas',
    color: const Color.fromARGB(199, 0, 255, 255),
  ),
  Categories.fastFood: CategoryModel(
    Symbols.fastfood,
    name: 'Comidas Rápidas',
    color: const Color.fromARGB(199, 255, 0, 255),
  ),
  Categories.dairy: CategoryModel(
    Symbols.water_full,
    name: 'Laticínios',
    color: const Color.fromARGB(199, 255, 255, 0),
  ),
  Categories.carbs: CategoryModel(
    Symbols.ramen_dining,
    name: 'Carboidratos',
    color: const Color.fromARGB(199, 0, 255, 255),
  ),
  Categories.grains: CategoryModel(
    Symbols.grain,
    name: 'Grãos',
    color: const Color.fromARGB(199, 255, 0, 0),
  ),
  Categories.sweets: CategoryModel(
    Symbols.cake,
    name: 'Doces',
    color: const Color.fromARGB(199, 0, 255, 0),
  ),
  Categories.convenience: CategoryModel(
    Symbols.local_convenience_store,
    name: 'Conveniência',
    color: const Color.fromARGB(199, 255, 0, 255),
  ),
  Categories.personalHygiene: CategoryModel(
    Symbols.health_and_beauty,
    name: 'Higiene Pessoal',
    color: const Color.fromARGB(199, 0, 255, 255),
  ),
  Categories.laundry: CategoryModel(
    Symbols.local_laundry_service,
    name: 'Lavanderia',
    color: const Color.fromARGB(199, 255, 0, 0),
  ),
  Categories.homeHygiene: CategoryModel(
    Symbols.cleaning_services,
    name: 'Higiene Doméstica',
    color: const Color.fromARGB(199, 0, 255, 0),
  ),
  Categories.others: CategoryModel(
    Symbols.more,
    name: 'Outros',
    color: const Color.fromARGB(199, 255, 0, 255),
  ),
};
