
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController speechController=TextEditingController();
  FlutterTts flutterTts=FlutterTts();
  double volume=1;
  double rate=1.0;
  double pitch=1.0;
  void textToSpeech(String text){
    flutterTts.setLanguage('ar-US');
    flutterTts.setVolume(volume);
    flutterTts.setSpeechRate(rate);
    flutterTts.setPitch(pitch);
    flutterTts.speak(text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text To Sound'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
                controller: speechController,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'write your text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                )
            ),
            Row(
              children: [
                const Text('Volume'),
                Expanded(
                  child: Slider(
                      max: 1,
                      value: volume,
                      onChanged: (value){
                        setState(() {
                          volume=value;
                        });
                      }
                  ),
                ),
                Text(volume.toStringAsFixed(2)),
              ],
            ),
            Row(
              children: [
                const Text('Rate'),
                Expanded(
                  child: Slider(
                      max: 2,
                      value: rate,
                      onChanged: (value){
                        setState(() {
                          rate=value;
                        });
                      }
                  ),
                ),
                Text(rate.toStringAsFixed(2)),
              ],
            ),
            Row(
              children: [
                const Text('Pitch'),
                Expanded(
                  child: Slider(
                      max: 2,
                      value: pitch,
                      onChanged: (value){
                        setState(() {
                          pitch=value;
                        });
                      }
                  ),
                ),
                Text(pitch.toStringAsFixed(2)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: ()async{
                      textToSpeech(speechController.text);
                    },
                    child: const Text('Play',style: TextStyle(fontSize: 15),)
                ),
                const SizedBox(width: 50,),
                ElevatedButton(
                    onPressed: ()async{
                      flutterTts.stop();
                    },
                    child: const Text('Stop',style: TextStyle(fontSize: 15),)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
