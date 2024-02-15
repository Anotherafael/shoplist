import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';

class DetailShopItemPage extends ConsumerWidget {
  const DetailShopItemPage({
    super.key,
    required this.shopItem,
  });

  final ShopItemModel shopItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes: ${shopItem.name}",
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              shopItem.id!,
              textAlign: TextAlign.center,
            ),
            Text(
              shopItem.name,
              textAlign: TextAlign.center,
            ),
            Text(
              "${shopItem.quantity.toString()} unidades",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
