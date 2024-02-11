import 'package:flutter/material.dart';

import '../../../app/presenter/core/injection_container.dart';
import '../controllers/add_shop_item_page_controller.dart';

class NameFormField extends StatelessWidget {
  NameFormField({
    super.key,
  });

  final controller = getIt<AddShopItemPageController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nome',
        labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        hintText: 'Nome do item',
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, informe o nome do item';
        }
        return null;
      },
      keyboardType: TextInputType.name,
      onSaved: (value) => controller.setName(value!),
    );
  }
}
