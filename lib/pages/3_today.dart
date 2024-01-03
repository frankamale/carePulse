
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:carepulse/components/mythTile.dart';
import 'package:carepulse/models/items.dart';
import 'package:carepulse/models/mythTile.dart';
import 'package:flutter/material.dart';

import '../components/scrollTile.dart';
import '../components/services/notificationServices.dart';
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
    return  SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.all(12.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //circle for displaying time
                const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 150,
                  ),
                ),

              //title for tips
             const Text('Tips',
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
               ),
             ),

              //List View for Tips

              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: item.tips.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ScrollTile(
                      tile: Tile(title: item.tips[index].title, description: item.tips[index].description, imagePath: item.tips[index].imagePath),
                    );
                  },
                ),
              ),

              const Text('Myths and facts about HIV',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
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
}
