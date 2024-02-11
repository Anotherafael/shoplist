import '../../domain/enums/categories.dart';
import '../models/shop_item_model.dart';
import 'categories_mock.dart';

final shopItemsMock = [
  ShopItemModel(
    name: 'Banana',
    quantity: 8,
    category: categoriesMock[Categories.fruitAndVegetables]!,
  ),
  ShopItemModel(
    name: 'Alface',
    quantity: 3,
    category: categoriesMock[Categories.fruitAndVegetables]!,
  ),
  ShopItemModel(
    name: 'Leite Integral',
    quantity: 5,
    category: categoriesMock[Categories.dairy]!,
  ),
  ShopItemModel(
    name: 'Bolacha',
    quantity: 4,
    category: categoriesMock[Categories.sweets]!,
  ),
  ShopItemModel(
    name: 'Chimichurri',
    quantity: 10,
    category: categoriesMock[Categories.spices]!,
  ),
  ShopItemModel(
    name: 'Pão',
    quantity: 10,
    category: categoriesMock[Categories.carbs]!,
  ),
  ShopItemModel(
    name: 'Sabão em Pó',
    quantity: 10,
    category: categoriesMock[Categories.homeHygiene]!,
  ),
  ShopItemModel(
    name: 'Amaciante',
    quantity: 10,
    category: categoriesMock[Categories.homeHygiene]!,
  ),
  ShopItemModel(
    name: 'Sabonete',
    quantity: 10,
    category: categoriesMock[Categories.personalHygiene]!,
  ),
  ShopItemModel(
    name: 'Feijão',
    quantity: 10,
    category: categoriesMock[Categories.grains]!,
  ),
  ShopItemModel(
    name: 'Arroz',
    quantity: 10,
    category: categoriesMock[Categories.carbs]!,
  ),
  ShopItemModel(
    name: 'Macarrão',
    quantity: 10,
    category: categoriesMock[Categories.carbs]!,
  ),
  ShopItemModel(
    name: 'Suco de Uva',
    quantity: 10,
    category: categoriesMock[Categories.drinks]!,
  ),
];
