import 'package:carepulse/components/mythTile.dart';
import 'package:carepulse/models/items.dart';
import 'package:carepulse/models/mythTile.dart';
import 'package:carepulse/pages/schedule_medication.dart';
import 'package:flutter/material.dart';

import '../components/scrollTile.dart';
import '../models/tile.dart';

class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  Items item = Items();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //circle for displaying time
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.red[900],
                radius: 150,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 140,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getCurrentDate(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          _getCurrentTime(),
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Medication()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Add reminder',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //title for tips
            const Text(
              'Tips',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            //List View for Tips

            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: item.tips.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ScrollTile(
                    tile: Tile(
                        title: item.tips[index].title,
                        description: item.tips[index].description,
                        imagePath: item.tips[index].imagePath,
                      link: item.tips[index].link
                    ),
                  );
                },
              ),
            ),

            const Text(
              'Myths and facts about HIV',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 270,
              child: ListView.builder(
                itemCount: item.myths.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MythScrollTile(
                    mythTile: MythTile(
                      fact: item.myths[index].fact,
                      myth: item.myths[index].myth,
                      imagePath: item.myths[index].imagePath,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)}";
    return formattedDate;
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = "${_twoDigits(now.hour)}:${_twoDigits(now.minute)}";
    return formattedTime;
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    } else {
      return "0$n";
    }
  }
}
