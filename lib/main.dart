import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:carepulse/components/splash_screen.dart';
import 'package:carepulse/pages/1_home_page.dart';
import 'package:carepulse/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase first
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  // Initialize Awesome Notifications
  AwesomeNotifications().initialize(
    'resource://drawable/res_ic_pulse',
    [
      NotificationChannel(
        channelKey: 'Schedule_notification',
        channelName: 'Schedule notification',
        channelDescription: 'basic',
        defaultColor: Colors.red[900],
        importance: NotificationImportance.High,
        channelShowBadge: true,
      )
    ],
  );

  final isAuthenticated = await isUserAuthenticated();

  runApp(MaterialApp(
    home: MyApp(isAuthenticated: isAuthenticated),
  ));
}

class MyApp extends StatefulWidget {
  final bool isAuthenticated;

  MyApp({Key? key, required this.isAuthenticated}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close(); // Close Hive boxes when they are no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.red[900], // Set your desired primary color here
        scaffoldBackgroundColor: Colors.red[50],
        // accentColor, fontFamily, etc.
      ),
      home: Splash(
        child: widget.isAuthenticated ? HomePage() : Login(),
      ),
    );
  }
}

Future<bool> isUserAuthenticated() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString('userId');
  return userId != null;
}
