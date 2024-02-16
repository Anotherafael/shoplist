import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';
import 'package:shoplist/app/providers/shop_item_provider.dart';
import 'package:shoplist/modules/list/components/list_item.dart';

import '../../../app/presenter/core/navigation_service.dart';
import '../../../app/presenter/core/routes/route_strings.dart';
import '../components/confirm_delete_dialog_.dart';
import '../controllers/list_shop_items_page_controller.dart';

class ListShopItemsPage extends ConsumerStatefulWidget {
  const ListShopItemsPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListShopItemsPage> {
  final _navigationService = getIt<NavigationService>();
  final _controller = getIt<ListPageController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Compras à realizar',
        ),
        actions: [
          IconButton(
            onPressed: () => _navigationService.toNamed(RouteStrings.add),
            icon: const Icon(
              Icons.add_shopping_cart,
            ),
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: FutureBuilder(
          future: ref.watch(shopItemStateNotifierProvider.notifier).fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError == true) {
              return Text(
                snapshot.error.toString(),
              );
            }
            return ref.watch(shopItemStateNotifierProvider).isEmpty
                ? const Center(
                    child: Text("Lista vazia"),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: ValueKey(
                          snapshot.data![index].id,
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            _controller.delete(
                              ref,
                              snapshot.data![index],
                            );
                          }
                        },
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            return await showDialog(
                              context: context,
                              builder: (context) {
                                return const ConfirmDeleteAlertDialog();
                              },
                            );
                          } else {
                            return false;
                          }
                        },
                        child: ListItemWidget(
                          shopItem: snapshot.data![index],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
