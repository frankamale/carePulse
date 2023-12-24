import 'package:carepulse/models/tile.dart';
import 'package:flutter/cupertino.dart';

class Items {

  List <Tile> tileItem =[
    Tile(
        title: 'Meditation',
        description: 'Focus your attention on a single object',
        imagePath: 'lib/assets/meditation2.jpg'
    ),
    Tile(
        title: 'Progressive muscle relaxation',
        description: 'Tensing and relaxing different muscle groups in your body',
        imagePath: 'lib/assets/stretching.jpg'
    ),
    Tile(
        title: 'Deep breathing',
        description: 'Taking slow and deep breaths, filling your lungs with air, and exhaling slowly.',
        imagePath: 'lib/assets/breathe2.jpg'
    ),
    Tile(
        title: 'Exercise',
        description: 'Physical activity that gets your heart pumping.',
        imagePath: 'lib/assets/exercise2.jpg'
    ),
  ];
}