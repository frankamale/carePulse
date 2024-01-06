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
        body: SingleChildScrollView(
         child: Padding(
        //title
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nutrition',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),

            //listview for nutrition
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: item.nutrition.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ScrollTile(
                    tile: Tile(
                        title: item.nutrition[index].title,
                        description: item.nutrition[index].description,
                        imagePath: item.nutrition[index].imagePath,
                        link: item.nutrition[index].link),
                  );
                },
              ),
            ),

            //title for stress relief techniques
            const Text('Stress Relief Techniques',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),

            //list view for stress relief techniques
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: item.tileItem.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ScrollTile(
                    tile: Tile(
                        title: item.tileItem[index].title,
                        description: item.tileItem[index].description,
                        imagePath: item.tileItem[index].imagePath,
                        link: item.tileItem[index].link),
                  );
                },
              ),
            ),

            // title for recommendations

            const Text('Recommendations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),

            //list view for recommendations
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: item.recommendation.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ScrollTile(
                    tile: Tile(
                        title: item.recommendation[index].title,
                        description: item.recommendation[index].description,
                        imagePath: item.recommendation[index].imagePath,
                        link: item.recommendation[index].link),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
