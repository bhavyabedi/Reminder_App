import 'package:flutter/material.dart';

class ActivityData {
  ActivityData({
    required this.day,
    required this.activities,
    required this.time,
  });

  final String day;
  final List<String> activities;
  final List<TimeOfDay> time;
}
