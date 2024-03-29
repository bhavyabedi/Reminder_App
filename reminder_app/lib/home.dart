import 'package:flutter/material.dart';
import 'package:reminder_app/data/data.dart';
import 'package:reminder_app/models/data.dart';
import 'package:reminder_app/remind_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

String _selectedActivity = 'Go to sleep';
String _selectedDay = 'Monday';
TimeOfDay _selectedTime = TimeOfDay.now();
int eventIndex = 0;
int dayIndex = 0;

class _HomeState extends State<Home> {
  void onRemoveTask(int index) {
    setState(() {
      reminders[index].pendingActivity.removeAt(index);
      reminders[index].pendingTime.removeAt(index);
    });
  }

  void onCompleteEvent(int index) {
    setState(() {
      reminders[index].completedActivity[index] =
          reminders[index].pendingActivity[index];
      reminders[index].completedTime[index] =
          reminders[index].pendingTime[index];
      reminders[index].pendingActivity.removeAt(index);
      reminders[index].pendingTime.removeAt(index);
    });
  }

  void timeSelected() {
    setState(() {
      reminders[dayIndex].pendingTime[eventIndex] = _selectedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remind Me'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Choose a day'),
                    //DaySelectDropDown
                    DropdownButton<String>(
                      value: _selectedDay,
                      items: days
                          .map(
                            (day) => DropdownMenuItem(
                              value: day,
                              child: Text(
                                day,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _selectedDay = value;
                          dayIndex = days.indexOf(value);
                        });
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Choose Event'),
                    //EventSelectButton
                    DropdownButton<String>(
                      value: _selectedActivity,
                      items: reminders[dayIndex]
                          .pendingActivity
                          .map((activity) => DropdownMenuItem(
                                value: activity,
                                child: Text(
                                  activity,
                                ),
                                onTap: () {
                                  setState(() {
                                    eventIndex = reminders[dayIndex]
                                        .pendingActivity
                                        .indexOf(activity);
                                  });
                                },
                              ))
                          .toList(),
                      onChanged: (selectedValue) {
                        setState(() {
                          _selectedActivity = selectedValue as String;
                        });
                        return;
                      },
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),

                  const Text('Pick Time:'),
                  //TimePickerButton
                  IconButton(
                    onPressed: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      setState(() {
                        _selectedTime = time!;
                      });
                      timeSelected();
                    },
                    icon: const Icon(Icons.more_time_sharp),
                  ),
                ],
              ),
            ),
            const Text('Tasks:'),
            Expanded(
              child: RemindList(
                reminderData: reminders[dayIndex],
                onRemoveEvent: onRemoveTask,
                onCompleteEvent: onCompleteEvent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
