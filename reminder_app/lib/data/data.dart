import 'package:flutter/material.dart';
import 'package:reminder_app/models/data.dart';

TimeOfDay timeconvert(String normtime) {
  int hour;
  int minute;
  String ampm = normtime.substring(normtime.length - 2);
  String result = normtime.substring(0, normtime.indexOf(' '));
  if (ampm == 'am' && int.parse(result.split(":")[1]) != 12) {
    hour = int.parse(result.split(':')[0]);
    if (hour == 12) hour = 0;
    minute = int.parse(result.split(":")[1]);
  } else {
    hour = int.parse(result.split(':')[0]) - 12;
    if (hour <= 0) {
      hour = 24 + hour;
    }
    minute = int.parse(result.split(":")[1]);
  }
  return TimeOfDay(hour: hour, minute: minute);
}

final List<String> activitiesOut = [
  //out as in outsourced
  "Wake up",
  'Go to gym',
  "Breakfast",
  "Meetings",
  "Lunch",
  "Quick nap",
  "Go to library",
  "Dinner",
  "Go to sleep"
];

final List<ActivityData> reminders = [
  ActivityData(
    day: 'Monday',
    activities: activitiesOut,
    time: [
      timeconvert('8:00 AM'),
      timeconvert('8:00 AM'),
      timeconvert('9:00 AM'),
      timeconvert('10:00 AM'),
      timeconvert('12:00 PM'),
      timeconvert('2:00 PM'),
      timeconvert('4:00 PM'),
      timeconvert('7:00 PM'),
      timeconvert('10:00 PM'),
    ],
  ),
  ActivityData(
    day: 'Tuesday',
    activities: activitiesOut,
    time: [
      timeconvert('8:00 AM'),
      timeconvert('8:00 AM'),
      timeconvert('9:00 AM'),
      timeconvert('10:00 AM'),
      timeconvert('12:00 PM'),
      timeconvert('2:00 PM'),
      timeconvert('4:00 PM'),
      timeconvert('7:00 PM'),
      timeconvert('10:00 PM'),
    ],
  ),
  ActivityData(
    day: 'Wednesday',
    activities: activitiesOut,
    time: [
      timeconvert('8:00 AM'),
      timeconvert('8:00 AM'),
      timeconvert('9:00 AM'),
      timeconvert('10:00 AM'),
      timeconvert('12:00 PM'),
      timeconvert('2:00 PM'),
      timeconvert('4:00 PM'),
      timeconvert('7:00 PM'),
      timeconvert('10:00 PM'),
    ],
  ),
  ActivityData(
    day: 'Thursday',
    activities: activitiesOut,
    time: [
      timeconvert('8:00 AM'),
      timeconvert('8:00 AM'),
      timeconvert('9:00 AM'),
      timeconvert('10:00 AM'),
      timeconvert('12:00 PM'),
      timeconvert('2:00 PM'),
      timeconvert('4:00 PM'),
      timeconvert('7:00 PM'),
      timeconvert('10:00 PM'),
    ],
  ),
  ActivityData(
    day: 'Friday',
    activities: activitiesOut,
    time: [
      timeconvert('8:00 AM'),
      timeconvert('8:00 AM'),
      timeconvert('9:00 AM'),
      timeconvert('10:00 AM'),
      timeconvert('12:00 PM'),
      timeconvert('2:00 PM'),
      timeconvert('4:00 PM'),
      timeconvert('7:00 PM'),
      timeconvert('10:00 PM'),
    ],
  ),
  ActivityData(
    day: 'Saturday',
    activities: activitiesOut,
    time: [
      timeconvert('8:00 AM'),
      timeconvert('8:00 AM'),
      timeconvert('9:00 AM'),
      timeconvert('10:00 AM'),
      timeconvert('12:00 PM'),
      timeconvert('2:00 PM'),
      timeconvert('4:00 PM'),
      timeconvert('7:00 PM'),
      timeconvert('10:00 PM'),
    ],
  ),
  ActivityData(
    day: 'Sunday',
    activities: activitiesOut,
    time: [
      timeconvert('8:00 AM'),
      timeconvert('8:00 AM'),
      timeconvert('9:00 AM'),
      timeconvert('10:00 AM'),
      timeconvert('12:00 PM'),
      timeconvert('2:00 PM'),
      timeconvert('4:00 PM'),
      timeconvert('7:00 PM'),
      timeconvert('10:00 PM'),
    ],
  )
];
