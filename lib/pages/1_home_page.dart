import 'package:carepulse/pages/2_Insights.dart';
import 'package:carepulse/pages/3_today.dart';
import 'package:carepulse/pages/4_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //to store the pages to be displayed in the bottom nav bar
  final List <Widget> _tabs =[
    const Insights(),
    const Today(),
    const Messages()
  ];
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:  Text("CarePulse",
          style: TextStyle(
              color: Colors.red[900],
              fontWeight: FontWeight.w900,
              fontSize: 30,

          ),

        ),
        backgroundColor: Colors.transparent,
      ),

      //drawer menu
      drawer: Drawer(
        backgroundColor: Colors.red[900],
        child:  Padding(
          padding: const EdgeInsets.all(12.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //circular shape for profile photo
              const CircleAvatar(
                radius: 90,
                backgroundColor: Colors.white,
              ),


              const Column(

                children: [

                  Text("Options",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.notifications,
                      color: Colors.white,
                    ),
                    title: Text("Notifications",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.app_registration_outlined,
                      color: Colors.white,
                    ),
                    title: Text("Appointment",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.local_shipping_rounded,
                      color: Colors.white,
                    ),
                    title: Text("Place Order",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.question_mark_rounded,
                      color: Colors.white,
                    ),
                    title: Text("FAQs",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              GestureDetector(
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>const Login()), (route) => false);
                },
                child: const ListTile(
                  leading: Icon(Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text("Log Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
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
            backgroundColor: Colors.red

          ),

        ],
        backgroundColor: Colors.white,// color for the navigation bars
        iconSize: 30,// size of the icons
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(
          color: Colors.red[900],
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          decorationColor: Colors.red[900],
          color: Colors.black
        ),

        //to enalbe switchin on the bottom nav
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      //display the pages selected in the bottom navigation bar
      body: _tabs[_currentIndex],

      );
  }
}
