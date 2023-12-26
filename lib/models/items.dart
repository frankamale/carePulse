import 'package:carepulse/models/mythTile.dart';
import 'package:carepulse/models/tile.dart';
class Items {

  List <Tile> tileItem =[
    Tile(
        title: 'Meditation',
        description: 'Focus your attention on a single object',
        imagePath: 'lib/assets/meditation2.jpg'
    ),
    Tile(
        title: 'Muscle relaxation',
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

  List <Tile> nutrition =[
    Tile(
        title: 'Balanced Diet',
        description: 'Variety of fruits, vegetables, whole grains, lean proteins, and healthy fats.',
        imagePath: 'lib/assets/diet.jpg'
    ),
    Tile(
        title: 'Adequate Protein',
        description: 'Include sources of lean protein in the diet',
        imagePath: 'lib/assets/protein.png'
    ),
    Tile(
        title: 'Healthy Fats',
        description: 'Choose sources of healthy fats, such as avocados, nuts, seeds, and olive oil.',
        imagePath: 'lib/assets/fats.png'
    ),
    Tile(
        title: 'Vitamins and Minerals',
        description: 'Adequate intake of vitamins A, C, D, and E, as well as zinc and selenium',
        imagePath: 'lib/assets/vitamins.png'
    ),
    Tile(
        title: 'Hydration',
        description: 'Take plenty of fluids',
        imagePath: 'lib/assets/hydrate.png'
    ),
    Tile(
        title: 'Limit Processed Foods',
        description: 'Minimize the consumption of processed and sugary foods',
        imagePath: 'lib/assets/processedFood.png'
    ),
    Tile(
        title: 'Small, Frequent Meals',
        description: 'Eat small, more frequent meals throughout the day',
        imagePath: 'lib/assets/meals.png'
    ),
    Tile(
        title: 'Manage Side Effects',
        description: 'Address nutritional challenges or side effects of medications',
        imagePath: 'lib/assets/sideEffects.png'
    ),
    Tile(
        title: 'Supplements',
        description: 'Discuss with professionals the need for supplements',
        imagePath: 'lib/assets/suplements.png'
    ),

  ];

  List<Tile> recommendation = [
    Tile(
        title: 'Medical Care',
        description: 'Regular medical check-ups with a healthcare provider',
        imagePath: 'lib/assets/medicare.png'
    ),
    Tile(
        title: 'Exercise',
        description: 'Physical activity that gets your heart pumping.',
        imagePath: 'lib/assets/exercise2.jpg'
    ),
    Tile(
        title: 'Healthy Lifestyle',
        description: 'Maintain a healthy and balanced diet to support overall well-being',
        imagePath: 'lib/assets/lifestyle.png'
    ),
    Tile(
        title: 'Mental Health',
        description: 'Seek support from mental health professionals to address emotional well-being.',
        imagePath: 'lib/assets/mental.png'
    ),
    Tile(
        title: 'Safe Sex',
        description: 'Use condoms to reduce HIV spread',
        imagePath: 'lib/assets/breathe2.jpg'
    ),
    Tile(
        title: 'Community Support',
        description: 'Connect with local or online HIV support groups to share experiences and gain support ',
        imagePath: 'lib/assets/community.png'
    ),
    Tile(
        title: 'Education and Awareness',
        description: 'Stay aware of the latest developments on HIV',
        imagePath: 'lib/assets/awareness.png'
    ),
    Tile(
        title: 'Legal and Social Support',
        description: 'Be aware of legal rights and protections for individuals living with HIV.',
        imagePath: 'lib/assets/legal.png'
    ),
  ];

  List <Tile> tips =[

    Tile(
        title: 'Balanced Diet',
        description: 'Variety of fruits, vegetables, whole grains, lean proteins, and healthy fats.',
        imagePath: 'lib/assets/diet.jpg'
    ),
    Tile(
        title: 'Manage Side Effects',
        description: 'Address nutritional challenges or side effects of medications',
        imagePath: 'lib/assets/sideEffects.png'
    ),
    Tile(
        title: 'Safe Sex',
        description: 'Use condoms to reduce HIV spread',
        imagePath: 'lib/assets/breathe2.jpg'
    ),

    Tile(
        title: 'Legal and Social Support',
        description: 'Be aware of legal rights and protections for individuals living with HIV.',
        imagePath: 'lib/assets/legal.png'
    ),
  ];

  List <MythTile> myths = [
    MythTile(
        imagePath: 'lib/assets/fact1.jpg',
        fact: 'AIDS is the final, chronic form of HIV, which can result if HIV is left untreated for long',
        myth: 'HIV ALWAYS LEADS TO AIDS'
    ),
    MythTile(
        imagePath: 'lib/assets/fact2.jpg',
        fact: 'People living with HIV are still at risk of other STDs and STIs',
        myth: 'If both partners are HIV positive there is no need for condoms'
    ),
    MythTile(
        imagePath: 'lib/assets/fact3.jpg',
        fact: 'HIV does not affect child birth and fertility, especially for women receiving treatment',
        myth: 'HIV affects child birth and fertility'
    ),
    MythTile(
        imagePath: 'lib/assets/fact4.jpg',
        fact: 'HIV positive people can have children but risk passing it on to their children',
        myth: 'HIV positive cant have children'
    ),
    MythTile(
        imagePath: 'lib/assets/fact5.jpg',
        fact: 'It is never too late to get tested for HIV. A general practitioner will recommend a regular STD testing',
        myth: 'It is too late to get tested for Hiv'
    ),
    MythTile(
        imagePath: 'lib/assets/fact6.jpg',
        fact: 'There is a pill youcan take that reduces the risk of getting infected with HIV',
        myth: 'There is no way to prevent HIV'
    ),
    MythTile(
        imagePath: 'lib/assets/fact7.jpg',
        fact: " It doesn't cure HIV but if taken as prescribed, it can reduce the amouont of virus in the body",
        myth: 'HIV medication can cure HIV'
    ),
    MythTile(
        imagePath: 'lib/assets/fact1.jpg',
        fact: 'With early diagnosis those living with the virus can live ling purposeful lives',
        myth: 'HIV means that your life is over'
    ),

  ];
}