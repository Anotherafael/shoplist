import 'package:shoplist/app/domain/entities/category_entity.dart';

import '../../infra/models/enums/categories.dart';

abstract class ICategorySource {
  Future<Map<Categories, CategoryEntity>> fetch();
}
