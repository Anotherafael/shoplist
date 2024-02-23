import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordFormFieldWidget extends ConsumerWidget {
  const PasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Senha',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
