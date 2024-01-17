import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reminder_app/models/data.dart';

class RemindList extends StatefulWidget {
  const RemindList({
    super.key,
    required this.reminderData,
    required this.onRemoveEvent,
    required this.onCompleteEvent,
  });

  final ActivityData reminderData;
  final Function(int index, String event) onRemoveEvent;
  final Function(int index, String event) onCompleteEvent;

  @override
  State<RemindList> createState() => _RemindListState();
}

String jsonString = File('data.json').readAsStringSync();

// Parse the JSON string into a list of MyData objects
List<ActivityData> Reminders = (json.decode(jsonString) as List)
    .map((json) => ActivityData.fromJson(json))
    .toList();

class _RemindListState extends State<RemindList> {
  @override
  Widget build(BuildContext context) {
    // Read the JSON file content

    print(Reminders);
    Color dismissedColor = Colors.orange;
    return ListView.builder(
      itemCount: Reminders[1].activities.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          Reminders[index].activities[index],
        ),
        background: Card(
          color: dismissedColor,
        ),
        child: Card(
          key: ValueKey(
            Reminders[index].activities[index],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(Reminders[index].activities[index]),
                const Spacer(),
                Text({Reminders[index].time[index]}
                    .toString()
                    .substring(11, 16)),
              ],
            ),
          ),
        ),
        onDismissed: (direction) {
          switch (direction) {
            case DismissDirection.startToEnd:
              setState(() {
                dismissedColor = Colors.green;
              });
              widget.onCompleteEvent(
                  index, widget.reminderData.activities[index]);
              break;
            case DismissDirection.endToStart:
              widget.onRemoveEvent(
                  index, widget.reminderData.activities[index]);
              break;
            default:
              print('Nothing');
          }
        },
      ),
    );
  }
}
