import 'package:flutter/material.dart';
import 'package:reminder_app/models/data.dart';
import 'package:reminder_app/home.dart';

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

class _RemindListState extends State<RemindList> {
  @override
  Widget build(BuildContext context) {
    print(widget.reminderData);
    Color dismissedColor = Colors.orange;
    return ListView.builder(
      itemCount: widget.reminderData.pendingActivity.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          widget.reminderData.pendingActivity[index],
        ),
        background: Card(
          color: dismissedColor,
        ),
        child: Card(
          key: ValueKey(
            widget.reminderData.pendingActivity[index],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(widget.reminderData.pendingActivity[index]),
                const Spacer(),
                Text({widget.reminderData.time[index]}
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
