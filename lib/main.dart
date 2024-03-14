import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; //enabling text-to-speech capabilities in the app

void main() {
  runApp(const MyApp()); // runs the app by calling runApp, passing an instance of MyApp as the argument.
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: TextToSpeech()),
      ),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts(); //to interact with the text-to-speech functionalities
  final TextEditingController textEditingController = TextEditingController(); //to control the text field.

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); // 0.5 to 1.5
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: textEditingController,
            ),
            ElevatedButton(
                child: Text("Text To Speech"),
              onPressed: () => speak(textEditingController.text),
            )
          ],
        ),
      ),
    );
  }
}
