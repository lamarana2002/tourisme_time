import 'package:flutter/material.dart';
import 'package:tourisme_time/home.dart';
// import 'package:tourisme_time/constantes.dart';
// import 'package:tourisme_time/home.dart';
import 'package:tourisme_time/screens/expense/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(231, 193, 8, 152));
// var kColorScheme = ColorScheme.fromSeed(
//   seedColor: const Color.fromARGB(255, 5, 99, 125),
// );
// var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
var kColorSchemeDark = ColorScheme.fromSeed(seedColor: Colors.blue,brightness: Brightness.dark);


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kColorSchemeDark,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorSchemeDark.onPrimaryContainer,
        foregroundColor: kColorSchemeDark.onPrimary,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorSchemeDark.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10),
        shadowColor: kColorScheme.primaryContainer,
        elevation: 10.0
      ),
      textTheme: const TextTheme().copyWith(
        titleLarge: const TextStyle().copyWith(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: kColorSchemeDark.secondary
        ),
        titleMedium: const TextStyle().copyWith(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: kColorSchemeDark.secondary
        ),
      ),
    ),
    theme: ThemeData(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.onPrimary,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10),
        shadowColor: Colors.black,
        elevation: 10.0
      ),
      textTheme: const TextTheme().copyWith(
        titleLarge: const TextStyle().copyWith(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: kColorScheme.secondary
        ),
        titleMedium: const TextStyle().copyWith(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: kColorScheme.secondary
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        selectedItemColor: kColorScheme.onPrimary,
        unselectedItemColor: kColorScheme.primary,
      ),
    ),
    themeMode: ThemeMode.light, // ThemeMode.system == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light,
    home: const Home(),
  ));
}

