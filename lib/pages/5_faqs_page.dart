import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/faqTile.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs',
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FaqTile(

        ),
      ),
    );
  }
}
