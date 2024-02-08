import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../infra/models/shop_item_model.dart';
import '../../../core/injection_container.dart';
import '../controllers/list_shop_items_page_controller.dart';

class ListItemWidget extends ConsumerWidget {
  ListItemWidget({
    super.key,
    required this.shopItem,
  });

  final ShopItemModel shopItem;
  final controller = getIt<ListPageController>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(shopItem.id),
      onDismissed: (_) {
        controller.delete(ref, shopItem);
      },
      child: InkWell(
        onTap: () {
          controller.pushToDetails(shopItem);
        },
        child: ListTile(
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
        ),
      ),
    );
  }
}
