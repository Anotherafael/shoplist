import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/presenter/core/injection_container.dart';
import '../controllers/add_shop_item_page_controller.dart';

// ignore: must_be_immutable
class FormButtonsWidget extends ConsumerStatefulWidget {
  const FormButtonsWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FormButtonsWidgetState();
}

class _FormButtonsWidgetState extends ConsumerState<FormButtonsWidget> {
  final _controller = getIt<AddShopItemPageController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: ref.watch(isLoadingOnAddShopItem)
              ? null
              : () => _controller.clearInputs(widget.formKey),
          child: Text(
            'Cancelar',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => ref.watch(isLoadingOnAddShopItem)
              ? null
              : _controller.add(ref, widget.formKey, context),
          child: ref.watch(isLoadingOnAddShopItem)
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  'Adicionar',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
        ),
      ],
    );
  }
}
