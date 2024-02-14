import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';
import 'package:shoplist/modules/list/components/list_item.dart';

import '../../../app/presenter/core/navigation_service.dart';
import '../../../app/presenter/core/routes/route_strings.dart';
import '../../../app/presenter/notifiers/shop_item_notifier.dart';

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
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }

            if (ref.watch(shopItemProvider).isEmpty) {
              return const Center(
                child: Text("Nenhum item adicionado"),
              );
            }

            return ListView.builder(
              itemCount: ref.watch(shopItemProvider).length,
              itemBuilder: (_, index) {
                final shopItem = ref.watch(shopItemProvider)[index];
                return ListItemWidget(shopItem: shopItem);
              },
            );
          },
        ),
      ),
    );
  }
}
