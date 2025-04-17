import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const seedColor = Color(0xFF6200EE);

class AppTheme {

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,

    appBarTheme: const AppBarTheme(
      color: seedColor,
    ),

    listTileTheme: const ListTileThemeData(
      iconColor: seedColor
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserratAlternates(),
      titleMedium: GoogleFonts.russoOne(),
    ),
  );
}