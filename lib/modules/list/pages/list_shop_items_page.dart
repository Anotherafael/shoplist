import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';
import 'package:shoplist/modules/list/components/list_item.dart';
import 'package:shoplist/app/presenter/notifiers/shop_item_notifier.dart';

import '../../../app/presenter/core/navigation_service.dart';
import '../../../app/presenter/core/routes/route_strings.dart';
import '../controllers/list_shop_items_page_controller.dart';

class ListShopItemsPage extends ConsumerStatefulWidget {
  const ListShopItemsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListShopItemsPage> {
  final _controller = getIt<ListPageController>();
  final _navigationService = getIt<NavigationService>();

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
            future: ref.watch(shopItemProvider.notifier).fetch(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: _controller.fetch(ref).length,
                  itemBuilder: (_, index) {
                    final shopItem = _controller.fetch(ref)[index];
                    return ListItemWidget(shopItem: shopItem);
                  },
                );
              }
            }),
      ),
    );
  }
}
