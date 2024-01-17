import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
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
Future<void> readJson() async{
  final String response=await rootBundle.loadString(key)
}
class _RemindListState extends State<RemindList> {
  @override
  Widget build(BuildContext context) {
    // Read the JSON file content

    print(Reminders);
    Color dismissedColor = Colors.orange;
    return ListView.builder(
      itemCount: Reminders[1].pendingActivity.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          Reminders[index].pendingActivity[index],
        ),
        background: Card(
          color: dismissedColor,
        ),
        child: Card(
          key: ValueKey(
            Reminders[index].pendingActivity[index],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(Reminders[index].pendingActivity[index]),
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
                  index, widget.reminderData.pendingActivity[index]);
              break;
            case DismissDirection.endToStart:
              widget.onRemoveEvent(
                  index, widget.reminderData.pendingActivity[index]);
              break;
            default:
              print('Nothing');
          }
        },
      ),
    );
  }
}
