import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/shared/theme/app_theme.dart';
import 'package:shoplist/modules/auth/components/buttons/forgot_pwd_button.dart';
import 'package:shoplist/modules/auth/components/buttons/login_button.dart';

import 'form_fields/email_form_field.dart';
import 'form_fields/pwd_form_field.dart';

class LoginFormWidget extends ConsumerWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        decoration: AppTheme().loginFormDecoration,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  Container(
                    decoration: AppTheme().loginFormContainerDecoration,
                    child: const Column(
                      children: [
                        EmailFormFieldWidget(),
                        PasswordFormFieldWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const ForgotPasswordButtonWidget(),
              const SizedBox(height: 10),
              const LoginButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
