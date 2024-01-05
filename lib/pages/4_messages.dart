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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.headset_mic_rounded,
              size: 150,
              color: Colors.red[900],
            ),
            Text(
              'Welcome to the support center ..',
              style: TextStyle(fontSize: 17, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[900],

        ),
          onPressed: (){
            chatScreen();
          },
          icon: const Icon(Icons.message_sharp, color: Colors.white,),
          label: const Text('Tap to talk to Doctor',
            style: TextStyle(
              color: Colors.white
            ),
          )),
    );
  }

  void chatScreen() {
    dynamic conversationObject = {
      'appId': '3af0c77918ba484a5317c22e930e4196d',
      // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
    };

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((clientConversationId) {
      print(
          "Conversation builder success : " + clientConversationId.toString());
    }).catchError((error) {
      print("Conversation builder error : " + error.toString());
    });
  }
}
