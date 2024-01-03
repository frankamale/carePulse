import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset('lib/assets/vitamins.png'),
          const Column(
            children: [
              Text('title'),
              Text('Body'),
            ],
          ),
         const Icon(
           Icons.chevron_right
         )
        ],
      ),
    );
  }
}
