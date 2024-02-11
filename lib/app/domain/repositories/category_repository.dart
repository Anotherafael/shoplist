import 'package:dartz/dartz.dart';

import '../enums/categories.dart';
import '../core/error/failures.dart';
import '../entities/category_entity.dart';

abstract class ICategoryRepository {
  Future<Either<Failure, Map<Categories, CategoryEntity>>> fetch();
}
