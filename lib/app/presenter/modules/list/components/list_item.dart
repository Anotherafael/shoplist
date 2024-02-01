import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../infra/models/shop_item_model.dart';

class ListItemWidget extends ConsumerWidget {
  const ListItemWidget({
    super.key,
    required this.shopItem,
  });

  final ShopItemModel shopItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      title: Text(shopItem.name),
      subtitle: const Text('Categoria'),
      iconColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      trailing: Text(
        '${shopItem.quantity} unidades',
        style: Theme.of(context).textTheme.labelMedium!,
      ),
    );
  }
}
