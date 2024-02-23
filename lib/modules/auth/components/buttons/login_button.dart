import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButtonWidget extends ConsumerWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(),
        onPressed: () {},
        child: const Text('Entrar'),
      ),
    );
  }
}
