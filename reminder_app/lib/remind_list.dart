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
  final Function(int index) onRemoveEvent;
  final Function(int index) onCompleteEvent;

  @override
  State<RemindList> createState() => _RemindListState();
}

class _RemindListState extends State<RemindList> {
  @override
  Widget build(BuildContext context) {
    Color dismissedColor = Colors.blueGrey[800]!;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
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
                      Text({widget.reminderData.pendingTime[index]}
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
                      widget.onCompleteEvent(index);
                    });

                    break;
                  case DismissDirection.endToStart:
                    setState(() {
                      widget.onRemoveEvent(index);
                    });

                    break;
                  default:
                    print('Nothing');
                }
              },
            ),
          ),
        ),
        const Text('Completed Tasks: '),
        Expanded(
          child: ListView.builder(
            itemCount: widget.reminderData.completedActivity.length,
            itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(
                widget.reminderData.completedActivity[index],
              ),
              background: Card(
                color: dismissedColor,
              ),
              child: Card(
                key: ValueKey(
                  widget.reminderData.completedActivity[index],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(widget.reminderData.completedActivity[index]),
                      const Spacer(),
                      Text({widget.reminderData.completedTime[index]}
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
                      widget.onCompleteEvent(index);
                    });

                    break;
                  case DismissDirection.endToStart:
                    setState(() {
                      widget.onRemoveEvent(index);
                    });

                    break;
                  default:
                    print('Nothing');
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
