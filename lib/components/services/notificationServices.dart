import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:carepulse/pages/schedule_medication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:fluttertoast/fluttertoast.dart';

int createUniqueId() {
  return DateTime
      .now()
      .millisecondsSinceEpoch
      .remainder(1000);
}

class NotificationHourAndMinute {
  final hour;
  final minute;

  NotificationHourAndMinute({this.hour, this.minute});
}



Future<void> createNotification(
    NotificationHourAndMinute notificationSchedule) async {
  String timeZoneName = await AwesomeNotifications()
      .getLocalTimeZoneIdentifier();

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'Schedule_notification',
          title: '${Emojis.medical_pill} Morning Dose',
          body: "Time for medication. please take your pills",
          notificationLayout: NotificationLayout.Default
      ),
      actionButtons: [
        NotificationActionButton(key: 'MARK_DONE', label: 'Mark Done'),
      ],
      schedule: NotificationCalendar(
        repeats: true,
        hour: notificationSchedule.hour,
        minute: notificationSchedule.minute,
        second: 0,
        millisecond: 0,
        timeZone: timeZoneName,

      ));
}
