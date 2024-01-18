import 'package:flutter/material.dart';

class ActivityData {
  ActivityData({
    required this.day,
    required this.pendingActivity,
    required this.completedActivity,
    required this.pendingTime,
    required this.completedTime,
  });

  final String day;
  final List<String> pendingActivity;
  final List<String> completedActivity;
  final List<TimeOfDay> pendingTime;
  final List<TimeOfDay> completedTime;
}
