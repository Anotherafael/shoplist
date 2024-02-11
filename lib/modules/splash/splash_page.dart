import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shoplist/app/presenter/core/injection_container.dart';

import '../../app/presenter/core/navigation_service.dart';
import '../../app/presenter/core/routes/route_strings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static final _navigationService = getIt<NavigationService>();

  @override
  void initState() {
    super.initState();
    Future<dynamic>.delayed(
      const Duration(seconds: 5),
      () => _navigationService.replacementToNamed(RouteStrings.list),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _loadAnimation(),
          ],
        ),
      ),
    );
  }

  LottieBuilder _loadAnimation() {
    return Lottie.asset(
      'assets/animations/splash.json',
    );
  }
}
