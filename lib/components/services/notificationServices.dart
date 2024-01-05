

import 'package:awesome_notifications/awesome_notifications.dart';

import '../../main.dart';


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

      ));
}

