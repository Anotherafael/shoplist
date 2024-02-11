import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/category_entity.dart';
import '../domain/enums/categories.dart';
import '../presenter/notifiers/categories_notifier.dart';

final categoriesProvider =
    StateNotifierProvider<CategoryNotifier, Map<Categories, CategoryEntity>>(
  (ref) => CategoryNotifier(),
);
