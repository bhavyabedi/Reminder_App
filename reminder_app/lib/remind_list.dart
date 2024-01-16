import 'package:flutter/material.dart';
import 'package:reminder_app/models/data.dart';

class Remind_List extends StatelessWidget {
  Remind_List({super.key, required this.reminderData});

  final List<ActivityData> reminderData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reminderData.length,
      itemBuilder: (ctx, index) => Card(
        key: ValueKey(
          reminderData[index],
        ),
        child: Text(reminderData[index].activities[index]),
      ),
    );
  }
}
