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
            width: 250,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Image.asset(
                      tile.imagePath,
                    height: 120,
                    ),
                  ),

                  //description

                  Expanded(
                    child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[100]
                      ),
                      child: Center(
                        child: Text(tile.description,
                          style: TextStyle(
                            color: Colors.grey[800]
                          ),
                        ),
                      ),
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
