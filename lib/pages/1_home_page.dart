import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:carepulse/pages/2_Insights.dart';
import 'package:carepulse/pages/3_today.dart';
import 'package:carepulse/pages/4_messages.dart';
import 'package:carepulse/pages/schedule_medication.dart';
import 'package:carepulse/pages/todo_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '5_faqs_page.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () => AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((_) => Navigator.pop(context)),
                child: Text(
                  'Allow',
                  style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    AwesomeNotifications().cancelAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "CarePulse",
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _tabs[_currentIndex],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.red[900],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildMenuSection(),
            const SizedBox(height: 40),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }


  Widget _buildMenuSection() {
    return Column(
      
      children: [
        const SizedBox(height: 40,),
        const Text(
          "Menu",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'serif'
          ),
        ),
        SizedBox(height: 40,),

        _buildMenuItem(
          icon: FontAwesomeIcons.truckMedical,
          title: "SOS",
          onTap: () async {
            const String emergencyNumber = '112';     // emergency number in Uganda

            Uri url = Uri.parse('tel:$emergencyNumber');


            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              print('Could not launch $url. Please dial the emergency number manually.');
            }
          },
        ),
        Divider(height: 10,),

        _buildMenuItem(
          icon: Icons.timelapse_outlined,
          title: "Schedule Medication",
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Medication(),
              ),
            );
          },
        ),
        Divider(height: 10,),

        _buildMenuItem(
          icon: Icons.question_mark_rounded,
          title: "FAQs",
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FaqPage(),
              ),
            );
          },
        ),
        Divider(height: 10,),

        _buildMenuItem(
                icon: Icons.list,
                title: "ToDo List",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Todo(),
                    ),
                  );
                },
              ),
        Divider(height: 10,),


      ],
    );
  }

  Widget _buildMenuItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return  Column(
      children: [
        Divider(height: 10,),
        ListTile(
          onTap: (){
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
                  (route) => false,
            );
          },
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: const Text(
            "Log Out",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
        Divider(height: 10,),

      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_outlined),
          label: 'Insights',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Today',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger),
          label: 'Messages',
          backgroundColor: Colors.red,
        ),
      ],
      backgroundColor: Colors.white,
      iconSize: 30,
      selectedFontSize: 20,
      selectedIconTheme:  IconThemeData(
        color: Colors.red[900],
      ),
      selectedLabelStyle:  TextStyle(
        fontWeight: FontWeight.w500,
        decorationColor: Colors.red[900],
        color: Colors.black,
      ),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  final List<Widget> _tabs = const [
    Insights(),
    Today(),
    Messages(),
  ];
  int _currentIndex = 1;
}
