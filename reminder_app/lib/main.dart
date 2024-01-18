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
        scaffoldBackgroundColor: Colors.blueGrey[100],
      ),
      home: const Home(),
    ),
  );
}
