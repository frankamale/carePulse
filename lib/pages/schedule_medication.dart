import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationHourAndMinute {
  final int hour;
  final int minute;

  NotificationHourAndMinute({required this.hour, required this.minute});
}

class MedicationSchedule {
  List<String> times = [];


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

  Future<void> showPrompt(BuildContext context) async {
    NotificationHourAndMinute? selectedTime = await medicationSchedule.pickSchedule(context);

    if (selectedTime != null) {
      setState(() {
        medicationSchedule.times.add(
          '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}',
        );
      });
      Fluttertoast.showToast(msg: 'Medication time added');
    } else {
      Fluttertoast.showToast(msg: 'Medication time not set');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        itemCount: medicationSchedule.times.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medicationSchedule.times[index]),
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
