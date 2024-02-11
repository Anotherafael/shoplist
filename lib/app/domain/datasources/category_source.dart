import 'package:shoplist/app/domain/entities/category_entity.dart';

import '../enums/categories.dart';

abstract class ICategorySource {
  Future<Map<Categories, CategoryEntity>> fetch();
}
