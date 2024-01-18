import 'package:flutter/material.dart';
import 'package:reminder_app/home.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.cyanAccent);
void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: ThemeData().textTheme.copyWith(
              bodyMedium: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
        appBarTheme: AppBarTheme(
          color: Colors.purple[200],
        ),
        scaffoldBackgroundColor: Colors.purple[100],
        cardTheme: ThemeData().cardTheme.copyWith(
              color: Colors.deepPurple[200],
            ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          textStyle: TextStyle(
            color: Colors.blueGrey[900],
          ),
        ),
      ),
      home: const Home(),
    ),
  );
}
