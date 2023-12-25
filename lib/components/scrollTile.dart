import 'package:carepulse/models/tile.dart';
import 'package:flutter/material.dart';

class ScrollTile extends StatelessWidget {
  ScrollTile({super.key, required this.tile});

  Tile tile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        child: Container(
            width: 150,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Text(tile.title,
                    style: const TextStyle(
                      fontSize: 17,
                          fontWeight: FontWeight.bold
                    ),
                  ),

                  //image
                  Center(
                    child: Image.asset(tile.imagePath,
                    height: 120,
                    ),
                  ),

                  //description

                  Text(tile.description,
                    style: TextStyle(
                      color: Colors.grey[700]
                    ),
                  )

                ],
              ),
            )
        ),
      ),
    );
  }
}
