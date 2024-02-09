import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/infra/models/category_model.dart';

import '../../../core/injection_container.dart';
import '../controllers/add_shop_item_page_controller.dart';

class CategoryFormFieldWidget extends ConsumerWidget {
  CategoryFormFieldWidget({super.key});

  final _controller = getIt<AddShopItemPageController>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField(
      hint: Text(
        'Selecione a categoria',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: _controller.fetch(ref),
      onChanged: (value) {},
      onSaved: (value) => _controller.setCategory(value! as CategoryModel),
    );
  }
}
