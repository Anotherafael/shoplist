import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplist/app/presenter/core/routes/route_generator.dart';
import 'package:shoplist/app/presenter/modules/splash/splash_page.dart';
import 'package:shoplist/app/presenter/shared/theme/app_theme.dart';
import 'app/presenter/core/injection_container.dart' as di;
import 'app/presenter/core/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    ProviderScope(
      child: MaterialApp(
        initialRoute: '/',
        theme: AppTheme.defaultTheme,
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
        navigatorKey: di.getIt<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
