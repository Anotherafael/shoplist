import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmDeleteAlertDialog extends ConsumerWidget {
  const ConfirmDeleteAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text(
        'Remover',
      ),
      content: const Text(
        'Tem certeza que deseja remover o item?',
      ),
      actions: [
        TextButton(
          child: const Text(
            'Não',
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text(
            'Sim',
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        )
      ],
    );
  }
}
