import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssh/ssh.dart';

import 'pantoutput.dart';

void reassemble() {}

class pants extends StatelessWidget {
  const pants({Key? key}) : super(key: key);

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
            "sh /home/pavithra/Documents/nimesha/pantgenerator.sh $num");
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
            "sshpass -p 'songul' scp -r /opt/nimz/pix2surf/video.mp4 192.168.8.109:D:/Research/sizer/assets/videos/");
        print("Loaded");
      }
      client.disconnect();
    } on PlatformException catch (e) {
      print('Error: ${e.code}\nError Message: ${e.message}');
    }

    // Restart.restartApp(webOrigin: 'http://127.0.0.1:42311/zfE5lVkRixU=/#/vm');
    // var result6 = await Process.runSync('flutter', ['arguments']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        print('Adding the pant...');
                        imageprocess(0);
                      },
                      child: Image.asset(
                        'assets/images/pant0.jpg',
                        width: 180.0,
                        height: 180.0,
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        print('Adding the pant...');
                        imageprocess(1);
                      },
                      child: Image.asset(
                        'assets/images/pant1.jpg',
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
                    onTap: () {
                      print('Adding the pant...');
                      imageprocess(2);
                    },
                    child: Image.asset(
                      'assets/images/pant2.jpg',
                      width: 180.0,
                      height: 180.0,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      print('Adding the pant...');
                      imageprocess(3);
                    },
                    child: Image.asset(
                      'assets/images/pant3.jpg',
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
                    onTap: () {
                      print('Adding the pant...');
                      imageprocess(4);
                    },
                    child: Image.asset(
                      'assets/images/pant4.jpg',
                      width: 180.0,
                      height: 180.0,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      print('Adding the pant...');
                      imageprocess(5);
                    },
                    child: Image.asset(
                      'assets/images/pant5.jpg',
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
                    // OutlinedButton(
                    //   onPressed: videoretrieve,
                    //   child: const Text('Process'),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 50),
                      child: Container(
                        height: 50.0,
                        // decoration: BoxDecoration(
                        //   boxShadow: <BoxShadow>[
                        //     BoxShadow(
                        //       color: Colors.blue.withOpacity(0.1),
                        //       blurRadius: 1,
                        //       offset: Offset(10, 10),
                        //     ),
                        //   ],
                        // ),
                        child: GestureDetector(
                          onTap: videoretrieve,
                          child: Container(
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            alignment: Alignment.center,
                            height: 30,
                            width: 120,
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
                              "Process".toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // RaisedButton(
                        //   elevation: 30,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(0.0),
                        //       side: BorderSide(
                        //           color: Color.fromRGBO(0, 160, 227, 1))),
                        //   onPressed: videoretrieve,
                        //   padding: EdgeInsets.all(10.0),
                        //   color: Color.fromRGBO(0, 160, 227, 1),
                        //   textColor: Colors.white,
                        //   child: Text("Process".toUpperCase(),
                        //       style: TextStyle(fontSize: 15)),
                        // ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 150),
                    //   child: OutlinedButton(
                    //     onPressed: () {
                    //       // debugPrint('Received Process');
                    //       reassemble();
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => VideoPlayerApp()));
                    //     },
                    //     child: const Text('View'),
                    //   ),
                    // )
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 60),
                      child: Container(
                        height: 50.0,
                        // decoration: BoxDecoration(
                        //   boxShadow: <BoxShadow>[
                        //     BoxShadow(
                        //       color: Colors.blue.withOpacity(0.1),
                        //       blurRadius: 1,
                        //       offset: Offset(10, 10),
                        //     ),
                        //   ],
                        // ),
                        child: GestureDetector(
                          onTap: () {
                            // debugPrint('Received Process');
                            reassemble();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayerScreen()));
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
}
