import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';
import 'package:shoplist/modules/list/components/list_item.dart';

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
  late Future<List<ShopItemModel>?> _loadedItems;

  @override
  void initState() {
    _loadedItems = _controller.fetch(ref);
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
          future: _loadedItems,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }

            if (_controller.getShopItems(ref).isEmpty) {
              return const Center(
                child: Text("Nenhum item adicionado"),
              );
            }

            return ListView.builder(
              itemCount: _controller.getShopItems(ref).length,
              itemBuilder: (_, index) {
                final shopItem = _controller.getShopItems(ref)[index];
                return ListItemWidget(shopItem: shopItem);
              },
            );
          },
        ),
      ),
    );
  }
}
