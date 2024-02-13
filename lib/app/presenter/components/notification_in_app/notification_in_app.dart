import 'package:flutter/material.dart';

class NotificationInApp {
  const NotificationInApp();

  static void show({
    required String title,
    IconData? icon,
    required BuildContext context,
  }) {
    if (icon == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: 10),
              Icon(
                icon ?? Icons.add_alert,
                size: 16,
              ),
            ],
          ),
        ),
      );
    }
  }
}
