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
            backgroundColor: shopItem.category.color.withOpacity(0.6),
            child: Icon(
              shopItem.category.icon,
              color: Colors.black,
            ),
          ),
          title: Text(shopItem.name),
          subtitle: Text(shopItem.category.name),
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
