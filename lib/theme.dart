import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final seedColor = const Color(0xFFCC0000); // Rouge RTS
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    scaffoldBackgroundColor: const Color(0xFFF7F7F7),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor:
          seedColor, // ou Colors.transparent si tu veux un effet M3
      foregroundColor: Colors.white, // texte/icônes en blanc
    ),
  );
}
