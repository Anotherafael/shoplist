import '../../domain/enums/categories.dart';
import '../models/shop_item_model.dart';
import 'categories_mock.dart';

final shopItemsMock = [
  ShopItemModel(
    name: 'Banana',
    quantity: 8,
    category: categoriesMock[Categories.fruitAndVegetables]!,
  ),
];
