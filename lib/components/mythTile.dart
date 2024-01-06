import 'package:flutter/material.dart';

import '../models/mythTile.dart';

class MythScrollTile extends StatelessWidget {
  MythScrollTile({super.key, required this.mythTile});

  MythTile mythTile;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //title
                  const Text('Myth',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(mythTile.myth,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,

                    ),
                  ),

                  //image
                  Center(
                    child: Image.asset(
                      mythTile.imagePath,
                      height: 100,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      children: [


                        //description

                        const Text('Fact',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(mythTile.fact,
                          style: TextStyle(
                              color: Colors.grey[700],
                            fontSize: 12

                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
