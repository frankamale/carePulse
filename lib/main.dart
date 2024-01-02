import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:carepulse/components/splash_screen.dart';
import 'package:carepulse/models/items.dart';
import 'package:carepulse/pages/1_home_page.dart';
import 'package:carepulse/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AndroidAlarmManager.initialize();
  runApp( const MaterialApp(
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red[900], // Set your desired primary color here
          // You can also customize other theme properties as needed
          scaffoldBackgroundColor: Colors.red[50]
        // accentColor, scaffoldBackgroundColor, fontFamily, etc.
      ),
      home: const Splash(
        child: Login(),
      ),
    );
  }
}
