import 'package:carepulse/models/items.dart';
import 'package:carepulse/pages/1_home_page.dart';
import 'package:flutter/material.dart';

void main() {
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
      theme: ThemeData(
          primaryColor: Colors.red[900], // Set your desired primary color here
          // You can also customize other theme properties as needed
          scaffoldBackgroundColor: Colors.red[50]
        // accentColor, scaffoldBackgroundColor, fontFamily, etc.
      ),
      home: const HomePage(),
    );
  }
}
