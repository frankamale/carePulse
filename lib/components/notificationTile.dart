import 'package:carepulse/models/notify.dart';
import 'package:flutter/cupertino.dart';

class NotificationTile extends StatelessWidget {
   NotificationTile({super.key});

  Notify notify = Notify(title: '', notificationContent: '', dose: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (
      Column(
        children: [
          Text(notify.dose),
        ],
      )
      ),
    );
  }
}