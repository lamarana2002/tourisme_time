import 'package:tourisme_time/screens/expense/expenses.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

var kColorSheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

var kColorShemeDark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.blue,
);

void main() async {
  // Intl.defaultLocale = 'pt_BR';
  // await initializeDateFormatting('fr', '');
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kColorShemeDark,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorShemeDark.onSecondaryContainer,
        foregroundColor: kColorShemeDark.secondary,
      ),
      cardTheme: CardTheme().copyWith(
        color: kColorShemeDark.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorShemeDark.primaryContainer),
      ),
      textTheme: TextTheme().copyWith(
        titleLarge: TextStyle().copyWith(
          fontWeight: FontWeight.bold,
          color: kColorShemeDark.onSecondaryContainer,
          fontSize: 16,
        ),
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorSheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorSheme.onPrimaryContainer,
        foregroundColor: kColorSheme.primary,
      ),
      cardTheme: CardTheme().copyWith(
        color: kColorSheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorSheme.primaryContainer),
      ),
      textTheme: TextTheme().copyWith(
        titleLarge: TextStyle().copyWith(
          fontWeight: FontWeight.bold,
          color: kColorSheme.onSecondaryContainer,
          fontSize: 16,
        ),
      ),
    ),
    themeMode: ThemeMode.system,
    home: Expenses(),
  ));
}
