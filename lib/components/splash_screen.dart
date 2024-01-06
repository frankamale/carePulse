import 'package:flutter/material.dart';


class Splash extends StatefulWidget {

  final Widget child;
  const Splash({super.key, required this.child});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget.child), (route) => false);
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade200,
              Colors.red.shade100
            ]
          )
        ),
        child:  Center(
          child: Image.asset(
            'lib/assets/pulse.png',
            color: Colors.red[900],
          ),
        ),

      ),
    );
  }
}
