import 'package:carepulse/models/tile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScrollTile extends StatelessWidget {
  ScrollTile({super.key, required this.tile});

  Tile tile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: (){
          _launchURL(Uri.parse(tile.link));
        },
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
  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

