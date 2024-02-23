import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordButtonWidget extends ConsumerWidget {
  const ForgotPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Esqueceu a senha?',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
