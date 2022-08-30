import 'package:elegant_fit_on/components/coustom_bottom_nav_bar.dart';
import 'package:elegant_fit_on/components/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(VoicePage());

class VoicePage extends StatelessWidget {
  // const VoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Color(0xffAB8EE4),
        appBar: AppBar(
          title: Text("Voice Generator"),
        ),
        body: MyApps(),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.message),
      ),
    );
  }
}

class MyApps extends StatelessWidget {
  final FlutterTts fluttertts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          // Container(
          //   child: Lottie.network(
          //       'https://assets1.lottiefiles.com/packages/lf20_9p4kck7t.json'),
          //   height: 200,
          //   width: 200,
          // ),
          Container(
            child: GFCard(
              boxFit: BoxFit.cover,
              titlePosition: GFPosition.start,
              showOverlayImage: true,
              imageOverlay: AssetImage(
                "assets/images/MicrosoftTeams-image.png",
              ),
              height: 260,
              content: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  "Hello, You have selected a really nice dress. It is too tight to your body. Please try an another one",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              buttonBar: GFButtonBar(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: GFButton(
                      onPressed: () => speak(),
                      color: Color(0xFF111F41),
                      text: "Tap to speech",
                      // icon: Icon(Icons.record_voice_over_outlined),
                      icon: Lottie.network(
                        'https://assets4.lottiefiles.com/packages/lf20_tcvb4fef.json',
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  speak() async {
 
    debugPrint('Received Hello');
    await fluttertts.speak(
        "Hello, You have selected a really nice dress. It is too tight to your body. Please try an another one");
  }
}
