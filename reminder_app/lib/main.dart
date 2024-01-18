import 'package:flutter/material.dart';
import 'package:reminder_app/home.dart';

String _selectedActivity = 'Go to sleep';
String _selectedDay = 'Monday';
TimeOfDay _selectedTime = TimeOfDay.now();
int _selectedEventIndex = 0;
int dayIndex = 0;
void main() {
  return runApp(
    const MaterialApp(
      home: Home(),
    ),
  );
}
