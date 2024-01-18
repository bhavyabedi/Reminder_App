import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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
int _selectedEventIndex = 0;
int dayIndex = 0;
List<ActivityData> readRemindersFromJsonFile(String filePath) {
  try {
    // Read the JSON file content as a string
    String jsonString = File(filePath).readAsStringSync();

    // Parse the JSON string into a List<Map<String, dynamic>>
    List<dynamic> jsonDataList = json.decode(jsonString);

    // Create a List of Reminders from the parsed JSON data
    List<ActivityData> remindersList =
        jsonDataList.map((json) => ActivityData.fromJson(json)).toList();

    return remindersList;
  } catch (e) {
    // Handle errors
    print('Error reading JSON file: $e');
    return [];
  }
}

class _HomeState extends State<Home> {
  void onRemoveTask(int index, String event) {
    setState(() {
      Reminders[index].pendingActivity.remove(event);
      modifyjson();
    });
  }

  List<ActivityData> Reminders =
      readRemindersFromJsonFile('reminder_app/lib/data.json');
  void modifyjson() {
    // Convert the modified list of MyData objects back to JSON
    List<Map<String, dynamic>> updatedJsonDataList =
        Reminders.map((data) => data.toJson()).toList();
    String updatedJsonString = json.encode(updatedJsonDataList);

    // Write the updated JSON content back to the file
    File('data/data.dart').writeAsStringSync(updatedJsonString);
  }

  void onCompleteEvent(int index, String event) {
    setState(() {
      Reminders[dayIndex].completedActivity.add(event);
      Reminders[dayIndex].pendingActivity.remove(event);
      modifyjson();
    });
  }

  void timeSelected(int index) {
    setState(() {
      Reminders[dayIndex].time[index] = _selectedTime;
      modifyjson();
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
                      items: Reminders[dayIndex]
                          .pendingActivity
                          .map((activity) => DropdownMenuItem(
                                value: activity,
                                child: Text(
                                  activity,
                                ),
                              ))
                          .toList(),
                      onChanged: (selectedValue) {
                        setState(() {
                          _selectedActivity = selectedValue as String;
                          _selectedEventIndex = Reminders[dayIndex]
                              .pendingActivity
                              .indexOf(selectedValue);
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
                      timeSelected(_selectedEventIndex);
                    },
                    icon: const Icon(Icons.more_time_sharp),
                  ),
                ],
              ),
            ),
            const Text('Tasks:'),
            Expanded(
              child: RemindList(
                reminderData: Reminders[dayIndex],
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
