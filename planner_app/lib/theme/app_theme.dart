import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF8F6FB),
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD8CFF3)),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );
}
