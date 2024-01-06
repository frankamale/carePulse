

import 'package:awesome_notifications/awesome_notifications.dart';

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
        locked: true,
          id: createUniqueId(),
          channelKey: 'Schedule_notification',
          title: "${Emojis.medical_pill} Invest in your health" ,
          body: "Is it time for your medicine buddy? We've got your back!${Emojis.emotion_red_heart}",
          notificationLayout: NotificationLayout.BigText
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

