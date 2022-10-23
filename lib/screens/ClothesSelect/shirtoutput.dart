import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:native_video_view/native_video_view.dart';

// void main() => runApp(const VideoPlayerScreen());

class VideoPlayerScreen extends StatefulWidget {
  // const VideoPlayerScreen({Key? key}) : super(key: key);
  String vs;
  int num;
  VideoPlayerScreen(this.vs, this.num);
  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState(vs, num);
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final FlutterTts fluttertts = FlutterTts();
  speak(String vtext) async {
    debugPrint('Received Hello');
    await fluttertts.speak(vtext);
  }

  String vsd;
  int snum;
  VideoPlayerScreenState(@required this.vsd, @required this.snum);
  // String v1 = "This cloth is too tight for you";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elegant FitOn'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: NativeVideoView(
          keepAspectRatio: true,
          showMediaController: true,
          onCreated: (controller) {
            String path = "assets/videos/Shirt" + snum.toString() + "Out.mp4";
            controller.setVideoSource(
              // 'assets/videos/video.mp4',
              path,
              sourceType: VideoSourceType.asset,
            );
            print(path);
            speak(vsd);
          },
          onPrepared: (controller, info) {
            controller.play();
          },
          onError: (controller, what, extra, message) {
            print('Player Error ($what | $extra | $message)');
          },
          onCompletion: (controller) {
            print('Video completed');
          },
          onProgress: (progress, duration) {
            print('$progress | $duration');
          },
        ),
      ),
    );
  }
}
