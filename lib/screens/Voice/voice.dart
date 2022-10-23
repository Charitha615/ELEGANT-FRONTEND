import 'package:elegant_fit_on/components/coustom_bottom_nav_bar.dart';
import 'package:elegant_fit_on/components/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:elegant_fit_on/screens/ClothesSelect/ShoppingItems.dart';

import '../3DAvatar/avatar.dart';

void main() => runApp(VoicePage());

class VoicePage extends StatelessWidget {
  // const VoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Color(0xffAB8EE4),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 70),
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
        body: MyApps(),
        // bottomNavigationBar:
        //     CustomBottomNavBar(selectedMenu: MenuState.message),
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
                "assets/images/img.jpeg",
              ),
              height: 600,
              content: Padding(
                padding: const EdgeInsets.only(top: 190),
                child: Text(
                  "Photograph Instructions: \n\n" +
                      "1. A front facing photograph taken of you from head to toe visible. \n\n" +
                      "2. Within 6 to 7 feets away from the camera.\n\n" +
                      "3. Wearing clothes that shows the body size as much as possible. \n\n" +
                      "4. Have a white or plane background in the photograph.\n\n" +
                      "Would be the most suitable for the 3D avatar cretaion to get the most accurate results.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              buttonBar: GFButtonBar(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 190),
                    child: GFButton(
                      // onPressed: () => sitems('Male', 16, 32, 32),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          // builder: (context) => sitems('Male', 16, 32, 32),
                          // builder: (context) => sitems('Male', 16, 32, 32),//myshoulderwidth, myhip, myleglength
                          // builder: (context) => sitems('Male', 14, 34, 34),//myshoulderwidth, myhip, myleglength
                          // builder: (context) => sitems('Male', 20, 36, 36),//myshoulderwidth, myhip, myleglength
                          // builder: (context) => sitems('Female', 14, 32, 32),//myshoulderwidth, myhip, myleglength
                          builder: (context) => Avatar(),
                        ),
                      ),

                      color: Color.fromARGB(255, 20, 80, 234),
                      text: "Next",
                      // icon: Icon(Icons.record_voice_over_outlined),
                      // icon: Lottie.network(
                      //   'https://assets4.lottiefiles.com/packages/lf20_tcvb4fef.json',
                      //   height: 200,
                      // ),
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
