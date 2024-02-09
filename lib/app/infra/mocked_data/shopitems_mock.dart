import '../models/enums/categories.dart';
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
];
