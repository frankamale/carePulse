import 'dart:ffi';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:carepulse/components/services/notificationServices.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import '../components/data/database.dart';

class MedicationSchedule {
  Future<NotificationHourAndMinute?> pickSchedule(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      return NotificationHourAndMinute(
        hour: selectedTime.hour,
        minute: selectedTime.minute,
      );
    } else {
      // User canceled the time picker
      return null;
    }
  }
}

class Medication extends StatefulWidget {
  const Medication({Key? key}) : super(key: key);

  @override
  State<Medication> createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  final MedicationSchedule medicationSchedule = MedicationSchedule();
  late final MedicationDb db;
  late final Box _myBox;

  _MedicationState()
      : _myBox = Hive.box('myBox'),
        db = MedicationDb(Hive.box('myBox'));

  //set initial state to initialise box and notification listeners
  @override
  void initState() {
    if (_myBox.get('TIME') == null) {
      db.initData();
    } else {
      db.loadData();
    }
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod:
            onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            onDismissActionReceivedMethod);

    super.initState();
  }

  Future<void> showPrompt(BuildContext context) async {
    NotificationHourAndMinute? selectedTime =
        await medicationSchedule.pickSchedule(context);

    if (selectedTime != null) {
      setState(() {
        db.times.add(
          '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}',
        );
      });

      // Show the notification
      createNotification(selectedTime);

      Fluttertoast.showToast(msg: 'Medication time added');
      db.update();
    } else {
      Fluttertoast.showToast(msg: 'Medication time not set');
    }
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here

  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    if (receivedAction.buttonKeyPressed == 'MARK_DONE') {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Schedule Medication',
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.w900,
            fontSize: 23,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.times.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(db.times[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                db.times.removeAt(index);
                db.update();
              });
            },
            background: Container(
              color: Colors.red,
              alignment: AlignmentDirectional.centerEnd,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                selectedTileColor: Colors.red[200],
                title: Text('Reminder ${index + 1}'),
                subtitle: Text('Reminder set at ${db.times[index]}'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton.icon(
          onPressed: () {
            showPrompt(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: const Text(
            'Add medication time',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
