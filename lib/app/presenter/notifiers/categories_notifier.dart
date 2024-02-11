import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/domain/entities/category_entity.dart';
import 'package:shoplist/app/infra/repositories/category_repository_impl.dart';

import '../core/injection_container.dart';
import '../../domain/enums/categories.dart';

class CategoryNotifier extends StateNotifier<Map<Categories, CategoryEntity>> {
  CategoryNotifier() : super({});

  final _repository = getIt<CategoryRepository>();

  Future<void> fetch() async {
    final response = await _repository.fetch();
    response.fold(
      (l) => null,
      (r) => state = r,
    );
  }
}
