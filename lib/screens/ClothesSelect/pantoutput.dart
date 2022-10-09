import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:native_video_view/native_video_view.dart';

// void main() => runApp(const VideoPlayerScreen());

class VideoPlayerScreen extends StatefulWidget {
  // const VideoPlayerScreen({Key? key}) : super(key: key);
  String vs;
  VideoPlayerScreen(this.vs);
  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState(vs);
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final FlutterTts fluttertts = FlutterTts();
  speak(String vtext) async {
    debugPrint('Received Hello');
    await fluttertts.speak(vtext);
  }

  String vsd;
  VideoPlayerScreenState(@required this.vsd);
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
            controller.setVideoSource(
              'assets/videos/video.mp4',
              sourceType: VideoSourceType.asset,
            );
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
