import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MusicWidget());
}

class MusicWidget extends StatelessWidget {
  const MusicWidget({super.key});

  Future<void> playMusic(int musicNum) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('music-$musicNum.mp3'));
    player.play(AssetSource('music-$musicNum.mp3'));
  }

  Expanded myButton(
      {required int musicNum,
      required Color buttonColor,
      required String buttonText}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            )
          ),
          
          onPressed: () async {
            await playMusic(musicNum);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(Icons.music_note, color: buttonColor,),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Ringtones'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myButton(
                buttonColor: Colors.red,
                buttonText: 'Samsung Galaxy',
                musicNum: 1), 
            myButton(
              musicNum: 2,
              buttonColor: Colors.blue,
              buttonText: 'Samsung Note',
            ),
            myButton(
              musicNum: 3,
              buttonColor: Colors.green,
              buttonText: 'Nokia',
            ),
            myButton(
              musicNum: 4,
              buttonColor: Colors.orange,
              buttonText: 'iPhone 11',
            ),
            myButton(
              musicNum: 5,
              buttonColor: Colors.cyan,
              buttonText: 'Whatsapp',
            ),
            myButton(
              musicNum: 6,
              buttonColor: Colors.purple,
              buttonText: 'Samsung S7',
            ),
            myButton(
              musicNum: 7,
              buttonColor: Colors.grey,
              buttonText: 'iPhone 6',
            ),
          ],
        ),
      ),
    );
  }
}
