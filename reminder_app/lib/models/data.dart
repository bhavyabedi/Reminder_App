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
    required this.pendingActivity,
    required this.completedActivity,
    required this.time,
  });

  final String day;
  final List<String> pendingActivity;
  final List<String> completedActivity;
  final List<TimeOfDay> time;

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'activities': pendingActivity,
      'time': time,
    };
  }

  factory ActivityData.fromJson(Map<String, dynamic> json) {
    return ActivityData(
      day: json['day'] as String,
      pendingActivity: (json['completedActivities'] as List).cast<String>(),
      completedActivity: (json['pendingActivities'] as List).cast<String>(),
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
  final List<ActivityData> remindersDart = [
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
      completedActivity: List.empty(),
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
      completedActivity: List.empty(),
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
      completedActivity: List.empty(),
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
      completedActivity: List.empty(),
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
      completedActivity: List.empty(),
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
      completedActivity: List.empty(),
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
      completedActivity: List.empty(),
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
