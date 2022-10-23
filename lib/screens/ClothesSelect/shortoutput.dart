// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:native_video_view/native_video_view.dart';

import 'short.dart';

// void main() => runApp(const VideoPlayerScreen());

class VideoPlayerScreen extends StatefulWidget {
  // const VideoPlayerScreen({Key? key}) : super(key: key);
 String clothType;
  int myshoulderwidth;
  int myhip;
  int myleglength;
  String vs;
  int num;
  VideoPlayerScreen(this.vs, this.num, @required this.clothType, @required this.myshoulderwidth,
      @required this.myhip, @required this.myleglength);
  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState(vs, num, clothType, myshoulderwidth, myhip, myleglength);
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final FlutterTts fluttertts = FlutterTts();
  speak(String vtext) async {
    debugPrint('Received Hello');
    await fluttertts.speak(vtext);
  }

  String clothType;
  int myshoulderwidth;
  int myhip;
  int myleglength;
  String vsd;
  int snum;
  VideoPlayerScreenState(@required this.vsd, @required this.snum, @required this.clothType, @required this.myshoulderwidth,
      @required this.myhip, @required this.myleglength);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text("ELEGANT FIT ON",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 195, 32, 221))),
        ),
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Container(
              //  alignment: Alignment.topRight,
              width: 80,
              child: Image.asset(
                'assets/images/Picture1.png',
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                // 'assets/images/Picture1.png',
                'assets/images/bk.jpg',
              ),
              fit: BoxFit.cover,
              opacity: 0.12,
              // child: Center(child: FlutterLogo(size: 300)),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, top: 10),
                  child: SizedBox(
                    height: 590,
                    width: 400,
                    // alignment: Alignment.center,
                    child: NativeVideoView(
                      keepAspectRatio: true,
                      showMediaController: true,
                      onCreated: (controller) {
                        String path =
                            "assets/videos/Short" + snum.toString() + "Out.mp4";
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
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 250, top: 0),
                  child: Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => shorts(
                                clothType,
                                myshoulderwidth,
                                myhip,
                                myleglength)),
                      );
                      },
                      child: Image.asset(
                        'assets/images/previous.png',
                        width: 60.0,
                        height: 50.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
