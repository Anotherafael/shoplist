import 'package:shoplist/app/domain/datasources/category_source.dart';
import 'package:shoplist/app/domain/entities/category_entity.dart';
import 'package:shoplist/app/infra/mocked_data/categories_mock.dart';
import 'package:shoplist/app/infra/models/enums/categories.dart';

class CategorySource implements ICategorySource {
  Map<Categories, CategoryEntity> categoryMap = categoriesMock;

  @override
  Future<Map<Categories, CategoryEntity>> fetch() {
    return Future.value(categoryMap);
  }
}
