import 'package:carepulse/components/scrollTile.dart';
import 'package:carepulse/models/items.dart';
import 'package:carepulse/models/tile.dart';
import 'package:flutter/material.dart';

class Insights extends StatefulWidget {
  const Insights({super.key});

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  Items item = Items();
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Insights',
          style: TextStyle(

              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
      ),

      body:  Padding(
        //title
      padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nutrition', style: TextStyle(
          fontSize: 20,
              fontWeight: FontWeight.bold,
            )
        ),

            Container(
              height: 120,
            ),

            const Text('Stress Relief Techniques', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
            ),

            //list view for stress relief techniques
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: item.tileItem.length,
                  scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ScrollTile(
                  tile: Tile(title: item.tileItem[index].title, description: item.tileItem[index].description, imagePath: item.tileItem[index].imagePath),
                  );
                },
               ),
            ),


             // title for recommendations

             const Text('Recommendations', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
            ),

            //list view for recommendations
            Container(
              height: 120,
            ),
          ],
        ),
      )
    );
  }
}