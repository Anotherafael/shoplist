import 'package:dartz/dartz.dart';
import 'package:shoplist/app/domain/core/error/failures.dart';
import 'package:shoplist/app/domain/entities/category_entity.dart';
import 'package:shoplist/app/domain/repositories/category_repository.dart';
import 'package:shoplist/app/infra/datasources/category_source_impl.dart';

import '../models/enums/categories.dart';

class CategoryRepository implements ICategoryRepository {
  CategoryRepository({
    required CategorySource categorySource,
  }) : _categorySource = categorySource;

  final CategorySource _categorySource;

  @override
  Future<Either<Failure, Map<Categories, CategoryEntity>>> fetch() async {
    try {
      Map<Categories, CategoryEntity> categoryMap =
          await _categorySource.fetch();
      return right(categoryMap);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
