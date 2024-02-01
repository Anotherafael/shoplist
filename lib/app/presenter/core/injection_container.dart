import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shoplist/app/presenter/modules/list/controllers/list_page_controller.dart';

import '../../domain/usecases/add_shop_item.dart';
import '../../infra/datasources/add_shop_item_source.dart';
import '../../infra/repositories/shop_item_repository_impl.dart';
import '../../providers/shop_item_provider.dart';
import 'navigation_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => NavigationService());

  //Controllers
  getIt.registerFactory(() => ListPageController());

  //Usecases
  getIt.registerLazySingleton(() => AddItemShop(getIt()));

  //Repositories
  getIt.registerLazySingleton(
    () => ShopItemRepository(addShopItemSource: getIt()),
  );

  //Datasources
  getIt.registerLazySingleton(() => ShopItemSource());
}
