import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:carepulse/components/splash_screen.dart';
import 'package:carepulse/models/items.dart';
import 'package:carepulse/pages/1_home_page.dart';
import 'package:carepulse/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AwesomeNotifications().initialize("resource://drawable/res_ic_pulse", [
    NotificationChannel(
        channelKey: 'Schedule_notification',
        channelName: 'Schedule notification',
        channelDescription: 'basic',
      defaultColor: Colors.red[900],
      importance: NotificationImportance.High,
      channelShowBadge: true
    )
  ]);

  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      )
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          primaryColor: Colors.red[900], // Set your desired primary color here
          // You can also customize other theme properties as needed
          scaffoldBackgroundColor: Colors.red[50]
          // accentColor, scaffoldBackgroundColor, fontFamily, etc.
          ),
      home: const Splash(
        child: HomePage(),
      ),
    );
  }
}
