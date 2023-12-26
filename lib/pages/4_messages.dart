import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';


class Messages extends StatefulWidget {
  const Messages({super.key});


  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
      body: Container(

        child: Column(
          children: [
            SizedBox(height: 150,),

            Icon(
              Icons.headset_mic_rounded,
              size: 250,
              color: Colors.red[900],
            ),
            Text('Welcome to the support center ..',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700]
              ),
            ),
            SizedBox(height: 120,),
            Center(
              child: GestureDetector(
                onTap: ()async {
                  chatScreen();
                },
                child: Container(
                  width: 350,
                  height: 60,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Colors.red.shade900)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Tap to continue',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );

  }
  void chatScreen(){

    dynamic conversationObject = {
      'appId': '3af0c77918ba484a5317c22e930e4196d',
      // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
    };

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((clientConversationId) {
      print("Conversation builder success : " +
          clientConversationId.toString());
    }).catchError((error) {
      print("Conversation builder error : " + error.toString());
    });
  }
}
