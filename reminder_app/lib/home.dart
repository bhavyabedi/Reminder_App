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

class _HomeState extends State<Home> {
  String _selectedActivity = 'Go to sleep';
  String _selectedDay = 'Monday';
  TimeOfDay _selectedTime = TimeOfDay.now();
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
                const Text('Choose a day'),
                const Spacer(),
                //DaySelectDropDown
                DropdownButton(
                    value: _selectedDay,
                    items: reminders
                        .map(
                          (ActivityData activityData) => DropdownMenuItem(
                            value: activityData.day,
                            child: Text(activityData.day),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedDay = value;
                      });
                    }),
                const Spacer(),
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
                  },
                  icon: const Icon(Icons.more_time_sharp),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Choose Event'),
                  const SizedBox(
                    width: 20,
                  ),
                  DropdownButton(
                    hint: const Text('Select Activity'),
                    value: _selectedActivity,
                    items: reminders
                        .map((ActivityData activityData) => DropdownMenuItem(
                              value: activityData.activities,
                              child: Text(activityData.activities[1]),
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
              ),
            ),
            const Text('Completed Tasks:'),
            Remind_List(reminderData: reminders),
          ],
        ),
      ),
    );
  }
}
