import 'package:get_it/get_it.dart';
import 'package:shoplist/app/infra/datasources/category_source_impl.dart';
import 'package:shoplist/app/infra/repositories/category_repository_impl.dart';
import 'package:shoplist/app/presenter/modules/list/controllers/list_shop_items_page_controller.dart';

import '../../infra/datasources/shop_item_source_impl.dart';
import '../../infra/repositories/shop_item_repository_impl.dart';
import '../modules/add/controllers/add_shop_item_page_controller.dart';
import 'navigation_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => NavigationService());

  //Controllers
  getIt.registerFactory(() => ListPageController());
  getIt.registerFactory(() => AddShopItemPageController());

  //Repositories
  getIt.registerLazySingleton(
    () => ShopItemRepository(shopItemSource: getIt()),
  );
  getIt.registerLazySingleton(
    () => CategoryRepository(categorySource: getIt()),
  );

  //Datasources
  getIt.registerLazySingleton(() => ShopItemSource());
  getIt.registerLazySingleton(() => CategorySource());
}
