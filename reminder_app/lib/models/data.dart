import 'package:flutter/material.dart';

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

final List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class ActivityData {
  ActivityData({
    required this.day,
    required this.activities,
    required this.time,
  });

  final String day;
  final List<String> activities;
  final List<TimeOfDay> time;

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'activities': activities,
      'time': time,
    };
  }

  factory ActivityData.fromJson(Map<String, dynamic> json) {
    return ActivityData(
      day: json['day'] as String,
      activities: (json['activities'] as List).cast<String>(),
      time: (json['time'] as List).cast<TimeOfDay>(),
    );
  }

//days list

  final List<String> activity = [
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
      activities: [
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
      day: days[1],
      activities: [
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
      day: days[2],
      activities: [
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
      day: days[3],
      activities: [
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
      day: days[4],
      activities: [
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
      day: days[5],
      activities: [
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
      day: days[6],
      activities: [
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
}
