import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  Widget build(BuildContext context) {
    final shopItems = ref.watch(shopItemStateNotifierProvider.notifier).fetch();

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
          future: shopItems,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isEmpty
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
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Text(
                snapshot.error.toString(),
              );
            }
          },
        ),
      ),
    );
  }
}
