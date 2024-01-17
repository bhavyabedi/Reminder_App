import 'package:flutter/material.dart';
import 'package:reminder_app/models/data.dart';

class RemindList extends StatelessWidget {
  const RemindList({super.key, required this.reminderData});

  final List<ActivityData> reminderData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reminderData.length,
      itemBuilder: (ctx, index) => Card(
        key: ValueKey(
          reminderData[index],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(reminderData[index].activities[index]),
              const Spacer(),
              Text({reminderData[index].time[index]}.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
