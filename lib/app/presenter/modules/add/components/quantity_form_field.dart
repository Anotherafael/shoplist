import 'package:flutter/material.dart';

import '../../../core/injection_container.dart';
import '../controllers/add_shop_item_page_controller.dart';

class QuantityFormField extends StatelessWidget {
  QuantityFormField({
    super.key,
  });

  final controller = getIt<AddShopItemPageController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Quantidade',
        labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
        hintText: 'Quantidade',
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
          return 'Por favor, informe a quantidade';
        } else if (int.parse(value) <= 0) {
          return 'Por favor, informe uma quantidade maior que 0';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      onSaved: (value) => controller.setQuantity(int.parse(value!)),
    );
  }
}
