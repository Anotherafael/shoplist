import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailFormFieldWidget extends ConsumerWidget {
  const EmailFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
