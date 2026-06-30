import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 234, 220, 255),
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 247, 244, 255)),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14),
    ),
  );
}
