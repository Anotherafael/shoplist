import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';

import '../../../../providers/shop_item_provider.dart';
import '../../../core/injection_container.dart';
import '../../../core/navigation_service.dart';
import '../../../core/routes/route_strings.dart';

final isLoadingOnAddShopItem = StateProvider<bool>((ref) => false);

class AddShopItemPageController {
  final _navigationService = getIt<NavigationService>();
  static late String name;
  static late int quantity;

  Future<void> add(WidgetRef ref, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      if (!ref.watch(isLoadingOnAddShopItem)) {
        ref.read(isLoadingOnAddShopItem.notifier).state = true;
      }
      formKey.currentState!.save();
      final shopItem = createModel(name, quantity);
      ref.read(shopItemProvider).add(shopItem);
      Future.delayed(Durations.extralong4);
      ref.read(isLoadingOnAddShopItem.notifier).state = false;
      _navigationService.replacementToNamed(RouteStrings.list);
    }
  }

  ShopItemModel createModel(String name, int quantity) {
    final shopItem = ShopItemModel(name: name, quantity: quantity);
    return shopItem;
  }

  void clearInputs(GlobalKey<FormState> formKey) {
    formKey.currentState!.reset();
    _navigationService.toNamed(RouteStrings.list);
  }

  void setName(String name) {
    AddShopItemPageController.name = name;
  }

  void setQuantity(int quantity) {
    AddShopItemPageController.quantity = quantity;
  }
}
