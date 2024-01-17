import 'package:flutter/material.dart';
import 'package:reminder_app/data/data.dart';
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
int _selectedEventIndex = 0;

timeSelected(int index) {
  times[index] = _selectedTime;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remind Me'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined),
          ),
        ],
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
                    DropdownButton(
                      value: _selectedDay,
                      items: days
                          .map(
                            (day) => DropdownMenuItem(
                              value: day,
                              child: Text(day),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _selectedDay = value;
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
                    DropdownButton(
                      value: _selectedActivity,
                      items: activitiesOut
                          .map((activity) => DropdownMenuItem(
                                value: activity,
                                child: Text(activity),
                              ))
                          .toList(),
                      onChanged: (selectedValue) {
                        setState(() {
                          _selectedActivity = selectedValue as String;
                          _selectedEventIndex =
                              activitiesOut.indexOf(selectedValue);
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

                  const Text('Time'),
                  const Spacer(),
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
                      timeSelected(_selectedEventIndex);
                    },
                    icon: const Icon(Icons.more_time_sharp),
                  ),
                ],
              ),
            ),
            const Text('Completed Tasks:'),
            Expanded(
              child: RemindList(
                reminderData: reminders,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
