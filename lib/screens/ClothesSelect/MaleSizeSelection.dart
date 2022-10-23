import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ssh/ssh.dart';
import 'shirt.dart';
import 'short.dart';
import 'pants.dart';
// void main() {
//   runApp(new msizeselector());
// }

class msizeselector extends StatelessWidget {
  String clothType;
  int myshoulderwidth;
  int myhip;
  int myleglength;
  msizeselector(@required this.clothType, @required this.myshoulderwidth,
      @required this.myhip, @required this.myleglength);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elegant FitOn',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Sizer(clothType, myshoulderwidth, myhip, myleglength),
      )),
    );
  }
}

class Sizer extends StatefulWidget {
  String clothType;
  int myshoulderwidth;
  int myhip;
  int myleglength;
  Sizer(@required this.clothType, @required this.myshoulderwidth,
      @required this.myhip, @required this.myleglength);

  @override
  MyHomePage createState() =>
      MyHomePage(clothType, myshoulderwidth, myhip, myleglength);
}

class MyHomePage extends State {
  String ChoisedSize = 'S';
  String RecommendedSize = 'S';
  int id = 1;
  String clothType;
  int myshoulderwidth;
  int myhip;
  int myleglength;
  String smallsize = 'tshirtMale1small';
  String mediumsize = 'tshirtMale2medium';
  String largesize = 'tshirtMale3large';
  MyHomePage(@required this.clothType, @required this.myshoulderwidth,
      @required this.myhip, @required this.myleglength);

  // void set rv(String val) {
  //   RecommendedSize = val;
  // }
  final FlutterTts fluttertts = FlutterTts();
  speak(String vtext) async {
    debugPrint('Received Hello');
    await fluttertts.speak(vtext);
  }

  void avatarretrv() async {
    print("Connecting to backend...");
    var client = SSHClient(
      host: "192.168.8.158",
      port: 22,
      username: "sliit",
      passwordOrKey: "1994",
    );
    String result;
    try {
      result = await client.connect();
      if (result == "session_connected") {
        result = await client.execute(
            "sshpass -p 'research@12' scp -r /homw/sliit/VIBE/output/sample/meshes/0001/000000.obj 192.168.8.124:D:/Lectures/SLIIT/Y4S1/ELEGANT-FRONTEND/assets/avatar");
      }
      client.disconnect();
    } on PlatformException catch (e) {
      print('Error: ${e.code}\nError Message: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Widget child;
    if (clothType == 'shirts') {
      if (myshoulderwidth >= 14 && myshoulderwidth <= 15) {
        RecommendedSize = 'S';
        smallsize = 'tshirtMale2medium';
        mediumsize = 'tshirtMale3large';
        largesize = 'tshirtMale4xlarge';
      } else if (myshoulderwidth >= 16 && myshoulderwidth <= 17) {
        RecommendedSize = 'M';
        smallsize = 'tshirtMale1small';
        mediumsize = 'tshirtMale2medium';
        largesize = 'tshirtMale3large';
      } else if (myshoulderwidth >= 18 && myshoulderwidth <= 20) {
        RecommendedSize = 'L';
        smallsize = 'tshirtMale0xsmall';
        mediumsize = 'tshirtMale1small';
        largesize = 'tshirtMale2medium';
      } else {}
    } else if (clothType == 'shorts') {
      if (myhip >= 27 && myhip <= 29) {
        RecommendedSize = 'S';
        smallsize = 'shortpantMale2medium';
        mediumsize = 'shortpantMale3large';
        largesize = 'shortpantMale4xlarge';
      } else if (myhip >= 30 && myhip <= 32) {
        RecommendedSize = 'M';
        smallsize = 'shortpantMale1small';
        mediumsize = 'shortpantMale2medium';
        largesize = 'shortpantMale3large';
      } else if (myhip >= 33 && myhip <= 36) {
        RecommendedSize = 'L';
        smallsize = 'shortpantMale0xsmall';
        mediumsize = 'shortpantMale1small';
        largesize = 'shortpantMale2medium';
      } else {}
    } else if (clothType == 'pants') {
      if (myhip >= 27 && myhip <= 29) {
        RecommendedSize = 'S';
        smallsize = 'pantMale2medium';
        mediumsize = 'pantMale3large';
        largesize = 'pantMale4xlarge';
      } else if (myhip >= 30 && myhip <= 32) {
        RecommendedSize = 'M';
        smallsize = 'pantMale1small';
        mediumsize = 'pantMale2medium';
        largesize = 'pantMale3large';
      } else if (myhip >= 33 && myhip <= 36) {
        RecommendedSize = 'L';
        smallsize = 'pantMale0xsmall';
        mediumsize = 'pantMale1small';
        largesize = 'pantMale2medium';
      } else {}
    } else {}
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elegant FitOn"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Size Selection",
                    style: TextStyle(
                        fontSize: 24,
                        // color: Color.fromARGB(255, 247, 50, 240),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'League Gothic',
                        letterSpacing: 0.7,
                        foreground: Paint()..shader = linearGradient),
                  ),
                ),
              ),
              SizedBox(
                height: 390,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Cube(
                    onSceneCreated: (Scene scene) {
                      scene.world.add(Object(
                          position: Vector3(0, 2.0, 0),
                          scale: Vector3(6.0, 6.0, 6.0),
                          // fileName: 'assets/avatar/000000.obj'));
                          fileName: 'assets/cube/body_2.obj'));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  'Our Recommended Size is : ' + '$RecommendedSize',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'League Gothic',
                      letterSpacing: 0.7,
                      foreground: Paint()..shader = linearGradient),
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 50),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 181, 10, 224),
                                (Color.fromARGB(255, 9, 24, 230)),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              (BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color.fromARGB(255, 46, 14, 226),
                              ))
                            ]),
                        height: 40.0,
                        width: 80.0,
                        child: RaisedButton(
                          child: Text(
                            'S',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromARGB(255, 46, 14, 226)
                              .withOpacity(0.05),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _small(context),
                            );
                            if (RecommendedSize == 'S') {
                              String v1 = "This cloth is perfectly fit for you";
                              speak(v1);
                            } else if (RecommendedSize == 'M') {
                              String v1 = "This cloth is too tight for you";
                              speak(v1);
                            } else if (RecommendedSize == 'L') {
                              String v1 = "This cloth is too tight for you";
                              speak(v1);
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 181, 10, 224),
                                (Color.fromARGB(255, 9, 24, 230)),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              (BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color.fromARGB(255, 46, 14, 226),
                              ))
                            ]),
                        height: 40.0,
                        width: 80.0,
                        child: RaisedButton(
                          child: Text(
                            'M',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromARGB(255, 46, 14, 226)
                              .withOpacity(0.05),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _medium(context),
                            );
                            if (RecommendedSize == 'S') {
                              String v1 = "This cloth is too large for you";
                              speak(v1);
                            } else if (RecommendedSize == 'M') {
                              String v1 = "This cloth is perfectly fit for you";
                              speak(v1);
                            } else if (RecommendedSize == 'L') {
                              String v1 = "This cloth is too tight for you";
                              speak(v1);
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 181, 10, 224),
                                (Color.fromARGB(255, 9, 24, 230)),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              (BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color.fromARGB(255, 46, 14, 226),
                              ))
                            ]),
                        height: 40.0,
                        width: 80.0,
                        child: RaisedButton(
                          child: Text(
                            'L',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromARGB(255, 46, 14, 226)
                              .withOpacity(0.01),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _large(context),
                            );
                            if (RecommendedSize == 'S') {
                              String v1 = "This cloth is too large for you";
                              speak(v1);
                            } else if (RecommendedSize == 'M') {
                              String v1 = "This cloth is too large for you";
                              speak(v1);
                            } else if (RecommendedSize == 'L') {
                              String v1 = "This cloth is perfectly fit for you";
                              speak(v1);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 65),
                      child: Radio(
                        value: 1,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            ChoisedSize = 'S';
                            id = 1;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 63),
                      child: Radio(
                        value: 2,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            ChoisedSize = 'M';
                            id = 2;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 62),
                      child: Radio(
                        value: 3,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            ChoisedSize = 'L';
                            id = 3;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  'Preferred Size : ' + '$ChoisedSize',
                  style: TextStyle(
                      fontSize: 18,
                      // color: Color.fromARGB(255, 247, 50, 240),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'League Gothic',
                      letterSpacing: 0.7,
                      foreground: Paint()..shader = linearGradient),
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 305),
                      child: Expanded(
                          child: InkWell(
                        onTap: () {
                          if (clothType == 'shirts') {
                            print(clothType);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => shirts(clothType, myshoulderwidth, myhip, myleglength)),
                            );
                          } else if (clothType == 'shorts') {
                            print(clothType);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => shorts()),
                            );
                          } else if (clothType == 'pants') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => pants()),
                            );
                          }
                        },
                        child: Image.asset(
                          'assets/images/next.png',
                          width: 60.0,
                          height: 50.0,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 8, 12, 240),
      Color.fromARGB(255, 189, 8, 235)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget _small(BuildContext context) {
    String sml = smallsize;
    return AlertDialog(
      title: const Text('Preview'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/sizes/' + '$sml' + '.png',
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _medium(BuildContext context) {
    String mdr = mediumsize;
    return AlertDialog(
      title: const Text('Preview'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/sizes/' + '$mdr' + '.png',
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _large(BuildContext context) {
    String lrg = largesize;
    return AlertDialog(
      title: const Text('Preview'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/sizes/' + '$lrg' + '.png',
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}
