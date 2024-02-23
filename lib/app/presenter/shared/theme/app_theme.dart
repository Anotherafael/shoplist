import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._internal();

  static final AppTheme instance = AppTheme._internal();

  factory AppTheme() {
    return instance;
  }

  Color get primaryColor => const Color.fromARGB(255, 95, 12, 190);

  ThemeData get defaultTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      );

  LinearGradient get loginTitleBackground => LinearGradient(
        colors: [
          defaultTheme.colorScheme.primary,
          defaultTheme.colorScheme.primary.withOpacity(0.9),
          defaultTheme.colorScheme.primary.withOpacity(0.8),
        ],
      );

  BoxDecoration get loginFormDecoration => const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      );

  BoxDecoration get loginFormContainerDecoration => BoxDecoration(
        color: defaultTheme.colorScheme.background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: defaultTheme.colorScheme.primary,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      );
}
