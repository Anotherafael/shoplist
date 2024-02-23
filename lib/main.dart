import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/core/routes/route_generator.dart';
import 'package:shoplist/app/presenter/shared/theme/app_theme.dart';
import 'app/presenter/core/injection_container.dart' as di;
import 'app/presenter/core/navigation_service.dart';
import 'env.dart';
import 'modules/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Env.init();
  runApp(
    ProviderScope(
      child: MaterialApp(
        initialRoute: '/',
        home: const SplashPage(),
        theme: AppTheme().defaultTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: di.getIt<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
