import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/domain/entities/shop_item_entity.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/infra/repositories/shop_item_repository_impl.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';
import 'package:shoplist/app/providers/shop_item_provider.dart';

import '../../../core/navigation_service.dart';

class ListPageController {
  ListPageController();

  final _navigationService = getIt<NavigationService>();
  final _repository = getIt<ShopItemRepository>();

  List<ShopItemModel> fetch(WidgetRef ref) {
    return ref.watch(shopItemProvider) as List<ShopItemModel>;
  }
}
