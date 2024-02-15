import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/shop_item_model.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';
import 'package:shoplist/app/providers/shop_item_provider.dart';
import 'package:shoplist/modules/list/components/list_item.dart';

import '../../../app/presenter/core/navigation_service.dart';
import '../../../app/presenter/core/routes/route_strings.dart';

class ListShopItemsPage extends ConsumerStatefulWidget {
  const ListShopItemsPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListShopItemsPage> {
  final _navigationService = getIt<NavigationService>();
  late Future<List<ShopItemModel>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _loadedItems = ref.read(shopItemStateNotifierProvider.notifier).fetch();
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
                      return ListItemWidget(
                        shopItem: snapshot.data![index],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
