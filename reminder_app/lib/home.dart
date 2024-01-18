import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reminder_app/models/data.dart';
import 'package:reminder_app/remind_list.dart';
import 'package:flutter/services.dart';

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
// List<ActivityData> readRemindersFromJsonFile(String filePath) {
//   try {
//     // Read the JSON file content as a string
//     String jsonString = File(filePath).readAsStringSync();

//     // Parse the JSON string into a List<Map<String, dynamic>>
//     List<dynamic> jsonDataList = json.decode(jsonString);

//     // Create a List of Reminders from the parsed JSON data
//     List<ActivityData> remindersList =
//         jsonDataList.map((json) => ActivityData.fromJson(json)).toList();

//     return remindersList;
//   } catch (e) {
//     // Handle errors
//     print('Error reading JSON file: $e');
//     return [];
//   }
// }

class _HomeState extends State<Home> {
  late String jsonString;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<ActivityData> loadJson() async {
    try {
      jsonString = await rootBundle.loadString('assets/data.json');
      // Do something with the JSON string
      List<dynamic> jsonDataList = json.decode(jsonString);

      // Create a List of Reminders from the parsed JSON data
      List<ActivityData> remindersList =
          jsonDataList.map((json) => ActivityData.fromJson(json)).toList();
      print(jsonString);
      return remindersList;
    } catch (error) {
      // Handle errors
      print('Error loading JSON: $error');
      return null;
    }
  }

  void onRemoveTask(int index, String event) {
    setState(() {
      _reminders[index].pendingActivity.remove(event);
      modifyjson();
    });
  }

  final List<ActivityData> _reminders =
      readRemindersFromJsonFile('reminder_app/data.json');
  void modifyjson() {
    // Convert the modified list of MyData objects back to JSON
    List<Map<String, dynamic>> updatedJsonDataList =
        _reminders.map((data) => data.toJson()).toList();
    String updatedJsonString = json.encode(updatedJsonDataList);

    // Write the updated JSON content back to the file
    File('data/data.dart').writeAsStringSync(updatedJsonString);
  }

  void onCompleteEvent(int index, String event) {
    setState(() {
      _reminders[dayIndex].completedActivity.add(event);
      _reminders[dayIndex].pendingActivity.remove(event);
      modifyjson();
    });
  }

  void timeSelected(int index) {
    setState(() {
      _reminders[dayIndex].time[index] = _selectedTime;
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
                      items: _reminders[dayIndex]
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
                          _selectedEventIndex = _reminders[dayIndex]
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
                reminderData: _reminders[dayIndex],
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
