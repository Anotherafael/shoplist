import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/shared/theme/app_theme.dart';
import 'package:shoplist/modules/auth/components/login_form.dart';
import 'package:shoplist/modules/auth/components/title.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppTheme().loginTitleBackground,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80),
              TitleWidget(),
              LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
