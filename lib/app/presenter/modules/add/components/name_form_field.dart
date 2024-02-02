import 'package:flutter/material.dart';

import '../../../core/injection_container.dart';
import '../controllers/add_shop_item_page_controller.dart';

class NameFormField extends StatelessWidget {
  NameFormField({
    super.key,
  });

  final controller = getIt<AddShopItemPageController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome',
        hintText: 'Nome do item',
        border: OutlineInputBorder(
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
