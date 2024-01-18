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

Map<String, dynamic> toJson() => {
      "days": [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ],
    };

//days list
final List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

final List<String> activities = [
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
    day: days[0],
    pendingActivity: [
      "Wake up",
      'Go to gym',
      "Breakfast",
      "Meetings",
      "Lunch",
      "Quick nap",
      "Go to library",
      "Dinner",
      "Go to sleep"
    ],
    completedActivity: [],
    pendingTime: [
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
    completedTime: [],
  ),
  ActivityData(
    day: days[1],
    pendingActivity: [
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
    ],
    completedActivity: [],
    pendingTime: [
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
    completedTime: [],
  ),
  ActivityData(
    day: days[2],
    pendingActivity: [
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
    ],
    completedActivity: [],
    pendingTime: [
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
    completedTime: [],
  ),
  ActivityData(
    day: days[3],
    pendingActivity: [
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
    ],
    completedActivity: [],
    pendingTime: [
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
    completedTime: [],
  ),
  ActivityData(
    day: days[4],
    pendingActivity: [
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
    ],
    completedActivity: [],
    pendingTime: [
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
    completedTime: [],
  ),
  ActivityData(
    day: days[5],
    pendingActivity: [
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
    ],
    completedActivity: [],
    pendingTime: [
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
    completedTime: [],
  ),
  ActivityData(
    day: days[6],
    pendingActivity: [
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
    ],
    completedActivity: [
      "Wake up",
    ],
    pendingTime: [
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
    completedTime: [],
  )
];
