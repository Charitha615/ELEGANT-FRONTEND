import 'dart:io';

import 'package:elegant_fit_on/components/Navibar.dart';
import 'package:elegant_fit_on/screens/ClothesSelect/spnr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssh/ssh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'shirtoutput.dart';

void reassemble() {}

class shirts extends StatelessWidget {
  const shirts({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elegant FitOn',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Elegant FitOn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _result = '';
  String backendip = "192.168.8.129";
  bool isLoadingspnr = false;
  int shirtnum = 5;

  Future<void> testtimer(int num) async {}

  Future<void> imageprocess(int num) async {
    print("Connecting to backend...");
    var client = SSHClient(
      host: backendip,
      port: 22,
      username: "root",
      passwordOrKey: "Lucky",
    );

    String result;
    try {
      result = await client.connect();
      if (result == "session_connected") {
        result = await client.execute(
            "sh /home/pavithra/Documents/nimesha/shirtgenerator.sh $num");
      }
      print('Shirt Added');
      print(result);
      client.disconnect();
    } on PlatformException catch (e) {
      // print('Error: ${e.code}\nError Message: ${e.message}');
      print("Connection Failed");
    }
  }

  void videoretrieve() async {
    print("Connecting to backend...");
    var client = SSHClient(
      host: backendip,
      port: 22,
      username: "pavithra",
      passwordOrKey: "Lucky",
    );

    String result;
    try {
      result = await client.connect();
      if (result == "session_connected") {
        // result = await client.execute(
        //     "sshpass -p 'Lucky' scp -r /opt/nimz/pix2surf/video.mp4 192.168.8.101:d:/Temp/Nimz_Proj/flutter/Elegeant_FitOn/assets/videos");
        result = await client.execute(
            "sshpass -p 'research@12' scp -r /opt/nimz/pix2surf/video.mp4 192.168.8.124:D:/Lectures/SLIIT/Y4S1/ELEGANT-FRONTEND/assets/videos");
        print("Loaded");
      }
      client.disconnect();
    } on PlatformException catch (e) {
      print('Error: ${e.code}\nError Message: ${e.message}');
    }
  }

  String color = "Printed t-shirts";

  @override
  Widget build(BuildContext context) => isLoadingspnr
      ? spnr()
      : Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Container(
              color: Color.fromARGB(255, 247, 247, 247),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () async {
                            print('Adding the Shirt...');
                            imageprocess(0);
                            shirtnum = 0;
                            setState(() => isLoadingspnr = true);
                            await Future.delayed(const Duration(seconds: 3));
                            setState(() => isLoadingspnr = false);
                          },
                          child: Image.asset(
                            'assets/images/shirt0.jpg',
                            width: 180.0,
                            height: 180.0,
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () async {
                            print('Adding the Shirt...');
                            imageprocess(1);
                            shirtnum = 1;
                            setState(() => isLoadingspnr = true);
                            await Future.delayed(const Duration(seconds: 3));
                            setState(() => isLoadingspnr = false);
                          },
                          child: Image.asset(
                            'assets/images/shirt1.jpg',
                            width: 180.0,
                            height: 180.0,
                          ),
                        )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          print('Adding the Shirt...');
                          imageprocess(2);
                          shirtnum = 2;
                          setState(() => isLoadingspnr = true);
                          await Future.delayed(const Duration(seconds: 3));
                          setState(() => isLoadingspnr = false);
                        },
                        child: Image.asset(
                          'assets/images/shirt2.jpg',
                          width: 180.0,
                          height: 180.0,
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          print('Adding the Shirt...');
                          imageprocess(3);
                          shirtnum = 3;
                          setState(() => isLoadingspnr = true);
                          await Future.delayed(const Duration(seconds: 3));
                          setState(() => isLoadingspnr = false);
                        },
                        child: Image.asset(
                          'assets/images/shirt3.jpg',
                          width: 180.0,
                          height: 180.0,
                        ),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          // print('Adding the Shirt...');
                          // imageprocess(4);
                          shirtnum = 4;
                          setState(() => isLoadingspnr = true);
                          await Future.delayed(const Duration(seconds: 3));
                          setState(() => isLoadingspnr = false);
                        },
                        child: Image.asset(
                          'assets/images/shirt4.jpg',
                          width: 180.0,
                          height: 180.0,
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () async {
                          color = "white color t-shirt";
                          // print('Adding the Shirt...');
                          // imageprocess(5);
                          shirtnum = 5;
                          setState(() => isLoadingspnr = true);
                          await Future.delayed(const Duration(seconds: 3));
                          setState(() => isLoadingspnr = false);
                        },
                        child: Image.asset(
                          'assets/images/shirt5.jpg',
                          width: 180.0,
                          height: 180.0,
                        ),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 10, left: 50),
                        //   child: Container(
                        //     height: 50.0,
                        //     child: GestureDetector(
                        //       onTap: videoretrieve,
                        //       child: Container(
                        //         margin: EdgeInsets.only(top: 0),
                        //         padding: EdgeInsets.only(left: 20, right: 20),
                        //         alignment: Alignment.center,
                        //         height: 30,
                        //         width: 120,
                        //         decoration: BoxDecoration(
                        //             gradient: LinearGradient(
                        //               colors: [
                        //                 Color.fromARGB(255, 220, 84, 254),
                        //                 Color.fromRGBO(36, 110, 233, 1),
                        //               ],
                        //               begin: Alignment.centerLeft,
                        //               end: Alignment.centerRight,
                        //             ),
                        //             borderRadius: BorderRadius.circular(50),
                        //             boxShadow: [
                        //               (BoxShadow(
                        //                 offset: Offset(0, 10),
                        //                 blurRadius: 50,
                        //                 color: Color(0xffEEEEEE),
                        //               ))
                        //             ]),
                        //         child: Text(
                        //           "Process".toUpperCase(),
                        //           style: TextStyle(
                        //             fontSize: 15,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 60),
                          child: Container(
                            height: 50.0,
                            child: GestureDetector(
                              onTap: () {
                                String vs = "You have selected a " +
                                    color +
                                    " and it perfectly fits for you.";
                                // debugPrint('Received Process');
                                reassemble();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VideoPlayerScreen(vs, shirtnum)));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 0),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                alignment: Alignment.center,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        new Color(0xFFDC54FE),
                                        (new Color(0xFF246EE9)),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      (BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE),
                                      ))
                                    ]),
                                child: Text(
                                  "View".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // child: RaisedButton(
                            //   elevation: 30,
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(0.0),
                            //       side: BorderSide(
                            //           color: Color.fromRGBO(0, 160, 227, 1))),
                            //   onPressed: () {
                            //     // debugPrint('Received Process');
                            //     reassemble();
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => VideoPlayerScreen()));
                            //   },
                            //   padding: EdgeInsets.all(10.0),
                            //   color: Color.fromRGBO(0, 160, 227, 1),
                            //   textColor: Colors.white,
                            //   child: Text("View".toUpperCase(),
                            //       style: TextStyle(fontSize: 15)),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
}
