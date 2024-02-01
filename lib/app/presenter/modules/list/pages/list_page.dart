import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';
import 'package:shoplist/app/presenter/modules/list/components/list_item.dart';
import 'package:shoplist/app/providers/shop_item_provider.dart';

import '../../../../infra/models/shop_item_model.dart';
import '../controllers/list_page_controller.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  final _controller = getIt<ListPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Compras à realizar',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_shopping_cart,
              color: Theme.of(context).colorScheme.onPrimary,
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
