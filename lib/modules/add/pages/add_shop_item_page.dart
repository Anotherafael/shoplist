import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/modules/add/components/category_form_field.dart';
import 'package:shoplist/modules/add/components/form_buttons.dart';
import 'package:shoplist/modules/add/components/quantity_form_field.dart';
import '../components/name_form_field.dart';

class AddShopItemPage extends ConsumerStatefulWidget {
  const AddShopItemPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddShopItemPageState();
}

class _AddShopItemPageState extends ConsumerState<AddShopItemPage> {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adicionar item',
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
          child: Column(
            children: [
              NameFormField(),
              const SizedBox(height: 16),
              QuantityFormField(),
              const SizedBox(height: 16),
              CategoryFormFieldWidget(),
              const SizedBox(height: 12),
              FormButtonsWidget(
                formKey: formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
