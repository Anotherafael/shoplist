import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/infra/models/shop_item_model.dart';
import '../../../app/presenter/core/injection_container.dart';
import '../controllers/list_shop_items_page_controller.dart';

class ListItemWidget extends ConsumerStatefulWidget {
  const ListItemWidget({
    super.key,
    required this.shopItem,
  });

  final ShopItemModel shopItem;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends ConsumerState<ListItemWidget> {
  final _controller = getIt<ListPageController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.pushToDetails(widget.shopItem);
      },
      child: Dismissible(
        key: ObjectKey(widget.shopItem),
        onDismissed: (direction) async {
          if (direction == DismissDirection.endToStart) {
            await _controller.delete(ref, widget.shopItem);
          }
        },
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            return await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Remover',
                  ),
                  content: const Text(
                    'Tem certeza que deseja remover o item?',
                  ),
                  actions: [
                    TextButton(
                      child: const Text(
                        'Não',
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: const Text(
                        'Sim',
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                );
              },
            );
          } else {
            return false;
          }
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: widget.shopItem.category.color.withOpacity(0.6),
            child: Icon(
              widget.shopItem.category.icon,
              color: Colors.black,
            ),
          ),
          title: Text(widget.shopItem.name),
          subtitle: Text(widget.shopItem.category.name),
          iconColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          trailing: Text(
            '${widget.shopItem.quantity} unidades',
            style: Theme.of(context).textTheme.labelMedium!,
          ),
        ),
      ),
    );
  }
}
